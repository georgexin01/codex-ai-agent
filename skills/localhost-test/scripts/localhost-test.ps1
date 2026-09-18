[CmdletBinding()]
param(
  [string]$StartPath = (Get-Location).Path,
  [int]$MaxSearchDepth = 2,
  [int]$StartupTimeoutSeconds = 20,
  [int]$HttpTimeoutSeconds = 3,
  [string[]]$SmokePath = @('/'),
  [switch]$NoStart
)

$ErrorActionPreference = 'Stop'
$excludedNames = @('.git', 'node_modules', 'dist', 'build', 'vendor', 'sample', 'archive', 'archives', 'backup', 'backups')
$reservedPorts = @(3000)
$fallbackPorts = @(3001, 5173, 6006, 8080, 4173)

function Test-ExcludedDirectory([string]$Name) {
  return $excludedNames -contains $Name.ToLowerInvariant()
}

function Get-CandidateDirectories([string]$Root, [int]$Depth) {
  $queue = New-Object System.Collections.Queue
  $queue.Enqueue([pscustomobject]@{ Path = $Root; Level = 0 })

  while ($queue.Count -gt 0) {
    $item = $queue.Dequeue()
    Write-Output $item.Path
    if ($item.Level -ge $Depth) { continue }

    foreach ($child in @(Get-ChildItem -LiteralPath $item.Path -Directory -Force -ErrorAction SilentlyContinue)) {
      if (-not (Test-ExcludedDirectory $child.Name)) {
        $queue.Enqueue([pscustomobject]@{ Path = $child.FullName; Level = $item.Level + 1 })
      }
    }
  }
}

function Get-ProjectScore([string]$Root) {
  $score = 0
  $packagePath = Join-Path $Root 'package.json'
  if (Test-Path -LiteralPath $packagePath) {
    $score += 10
    if (Test-Path -LiteralPath (Join-Path $Root 'pnpm-lock.yaml')) { $score += 2 }
    if (Test-Path -LiteralPath (Join-Path $Root 'package-lock.json')) { $score += 2 }
    if (@(Get-ChildItem -LiteralPath $Root -Filter 'vite.config.*' -File -ErrorAction SilentlyContinue).Count -gt 0) { $score += 4 }
  }
  if (Test-Path -LiteralPath (Join-Path $Root 'index.php')) { $score += 8 }
  if (Test-Path -LiteralPath (Join-Path $Root 'composer.json')) { $score += 3 }
  if (Test-Path -LiteralPath (Join-Path $Root 'index.html')) { $score += 4 }
  return $score
}

function Get-ContextApplicationRoot([string]$Root) {
  $contextPath = Join-Path $Root 'PROJECT_CONTEXT.md'
  if (-not (Test-Path -LiteralPath $contextPath)) { return $null }
  $match = Select-String -LiteralPath $contextPath -Pattern '^\s*application_root:\s*["'']?([^"'']+)["'']?\s*$' -ErrorAction SilentlyContinue | Select-Object -First 1
  if (-not $match) { return $null }
  $relative = $match.Matches[0].Groups[1].Value.Trim()
  $resolved = if ([IO.Path]::IsPathRooted($relative)) { $relative } else { Join-Path $Root $relative }
  if (Test-Path -LiteralPath $resolved -PathType Container) { return (Resolve-Path -LiteralPath $resolved).Path }
  return $null
}

function Get-PortHints([string]$Root, [string]$ScriptText) {
  $ports = New-Object System.Collections.Generic.List[int]
  foreach ($port in $fallbackPorts) { $ports.Add($port) }
  foreach ($text in @($ScriptText, [string]::Join("`n", @(Get-ChildItem -LiteralPath $Root -Filter 'vite.config.*' -File -ErrorAction SilentlyContinue | ForEach-Object { Get-Content -LiteralPath $_.FullName -Raw })))) {
    foreach ($match in [regex]::Matches([string]$text, '(?i)(?:--port\s*[= ]\s*|\bport\s*:\s*)(\d{2,5})')) {
      $port = [int]$match.Groups[1].Value
      if (-not $reservedPorts.Contains($port) -and -not $ports.Contains($port)) { $ports.Add($port) }
    }
  }
  return @($ports)
}

function Invoke-HttpProbe([string]$Url) {
  try {
    $response = Invoke-WebRequest -Uri $Url -UseBasicParsing -MaximumRedirection 5 -TimeoutSec $HttpTimeoutSeconds
    return [pscustomobject]@{ Status = [int]$response.StatusCode; Body = [string]$response.Content }
  } catch {
    return $null
  }
}

$resolvedStart = (Resolve-Path -LiteralPath $StartPath).Path
$contextRoot = Get-ContextApplicationRoot $resolvedStart
$candidates = @()
foreach ($candidate in @(Get-CandidateDirectories $resolvedStart $MaxSearchDepth)) {
  $score = Get-ProjectScore $candidate
  if ($score -gt 0) {
    $candidates += [pscustomobject]@{ Path = (Resolve-Path -LiteralPath $candidate).Path; Score = $score }
  }
}
if ($contextRoot) {
  $candidates += [pscustomobject]@{ Path = $contextRoot; Score = 100 }
}

if ($candidates.Count -eq 0) {
  Write-Output 'STATUS=NO_RUNNABLE_PROJECT'
  exit 2
}

$bestScore = ($candidates | Measure-Object -Property Score -Maximum).Maximum
$best = @($candidates | Where-Object Score -eq $bestScore | Sort-Object Path -Unique)
if ($best.Count -ne 1) {
  Write-Output 'STATUS=AMBIGUOUS_PROJECT'
  $best | ForEach-Object { Write-Output ("CANDIDATE={0} SCORE={1}" -f $_.Path, $_.Score) }
  exit 2
}

$projectRoot = $best[0].Path
$packagePath = Join-Path $projectRoot 'package.json'
$runtime = $null
$command = $null
$arguments = @()
$scriptText = ''

if (Test-Path -LiteralPath $packagePath) {
  $package = Get-Content -LiteralPath $packagePath -Raw | ConvertFrom-Json
  $scriptName = @('dev:local', 'dev', 'start') | Where-Object { $package.scripts.PSObject.Properties.Name -contains $_ } | Select-Object -First 1
  if (-not $scriptName) {
    Write-Output 'STATUS=NO_DEV_SCRIPT'
    Write-Output ("PROJECT_ROOT={0}" -f $projectRoot)
    exit 3
  }
  $scriptText = [string]$package.scripts.$scriptName
  $runtime = "package:$scriptName"
  if (Test-Path -LiteralPath (Join-Path $projectRoot 'pnpm-lock.yaml')) {
    $command = 'pnpm.cmd'; $arguments = @('run', $scriptName)
  } elseif (Test-Path -LiteralPath (Join-Path $projectRoot 'yarn.lock')) {
    $command = 'yarn.cmd'; $arguments = @($scriptName)
  } elseif (Test-Path -LiteralPath (Join-Path $projectRoot 'bun.lockb')) {
    $command = 'bun.exe'; $arguments = @('run', $scriptName)
  } else {
    $command = 'npm.cmd'; $arguments = @('run', $scriptName)
  }
  if ($scriptText -match '(?i)\bvite\b') { $arguments += @('--', '--host', '127.0.0.1', '--port', '3001') }
  if ($scriptText -match '(?i)\bvite\b' -and -not (Test-Path -LiteralPath (Join-Path $projectRoot 'node_modules\vite\bin\vite.js'))) {
    Write-Output 'STATUS=DEPENDENCIES_MISSING'
    Write-Output ("PROJECT_ROOT={0}" -f $projectRoot)
    exit 3
  }
} elseif (Test-Path -LiteralPath (Join-Path $projectRoot 'index.php')) {
  $runtime = 'php-built-in'
  $command = 'php.exe'
  $arguments = @('-S', '127.0.0.1:8080', '-t', $projectRoot)
} elseif (Test-Path -LiteralPath (Join-Path $projectRoot 'index.html')) {
  $runtime = 'python-http'
  $command = 'python.exe'
  $arguments = @('-m', 'http.server', '8080', '--bind', '127.0.0.1')
} else {
  Write-Output 'STATUS=UNSUPPORTED_PROJECT'
  exit 3
}

$ports = Get-PortHints $projectRoot $scriptText
$serverUrl = $null
$state = 'reused'
foreach ($port in $ports) {
  $probe = Invoke-HttpProbe ("http://127.0.0.1:{0}/" -f $port)
  if ($probe -and $probe.Status -ge 200 -and $probe.Status -lt 400) {
    $serverUrl = "http://127.0.0.1:$port"
    break
  }
}

if (-not $serverUrl -and -not $NoStart) {
  $state = 'started'
  $logStem = Join-Path ([IO.Path]::GetTempPath()) ('codex-localhost-' + [guid]::NewGuid().ToString('N'))
  $stdoutPath = "$logStem.stdout.log"
  $stderrPath = "$logStem.stderr.log"
  try {
    Start-Process -FilePath $command -ArgumentList $arguments -WorkingDirectory $projectRoot -WindowStyle Hidden -RedirectStandardOutput $stdoutPath -RedirectStandardError $stderrPath | Out-Null
  } catch {
    Write-Output 'STATUS=START_FAILED'
    Write-Output ("ERROR={0}" -f $_.Exception.Message)
    exit 4
  }

  $deadline = (Get-Date).AddSeconds($StartupTimeoutSeconds)
  while ((Get-Date) -lt $deadline -and -not $serverUrl) {
    $logText = ''
    if (Test-Path -LiteralPath $stdoutPath) { $logText = [string](Get-Content -LiteralPath $stdoutPath -Raw -ErrorAction SilentlyContinue) }
    foreach ($match in [regex]::Matches($logText, '(?i)https?://(?:localhost|127\.0\.0\.1):([0-9]+)')) {
      $port = [int]$match.Groups[1].Value
      if (-not $reservedPorts.Contains($port) -and -not $ports.Contains($port)) { $ports += $port }
    }
    foreach ($port in $ports) {
      $probe = Invoke-HttpProbe ("http://127.0.0.1:{0}/" -f $port)
      if ($probe -and $probe.Status -ge 200 -and $probe.Status -lt 400) {
        $serverUrl = "http://127.0.0.1:$port"
        break
      }
    }
    if (-not $serverUrl) { Start-Sleep -Milliseconds 500 }
  }
}

if (-not $serverUrl) {
  Write-Output 'STATUS=NO_HTTP_RESPONSE'
  Write-Output ("PROJECT_ROOT={0}" -f $projectRoot)
  Write-Output ("RUNTIME={0}" -f $runtime)
  exit 5
}

$failures = 0
Write-Output ("PROJECT_ROOT={0}" -f $projectRoot)
Write-Output ("RUNTIME={0}" -f $runtime)
Write-Output ("STATE={0}" -f $state)
foreach ($path in @($SmokePath | Select-Object -First 4)) {
  if ([string]::IsNullOrWhiteSpace($path)) { continue }
  $normalized = if ($path.StartsWith('/')) { $path } else { "/$path" }
  $probe = Invoke-HttpProbe ($serverUrl + $normalized)
  if ($probe -and $probe.Status -ge 200 -and $probe.Status -lt 400) {
    Write-Output ("SMOKE={0} STATUS={1}" -f ($serverUrl + $normalized), $probe.Status)
    Write-Output ($serverUrl + $normalized)
  } else {
    $failures++
    Write-Output ("SMOKE={0} STATUS=FAIL" -f ($serverUrl + $normalized))
  }
}
if ($failures -eq 0) {
  Write-Output 'STATUS=PASS'
  exit 0
}
Write-Output 'STATUS=PARTIAL'
exit 6

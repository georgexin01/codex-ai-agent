[CmdletBinding()]
param(
  [string]$AppRoot = (Get-Location).Path,
  [string]$ExpectedSchema,
  [string]$ExpectedUrl,
  [string]$ExpectedModePattern
)

$ErrorActionPreference = 'Stop'
$results = [System.Collections.Generic.List[object]]::new()

function Add-Check {
  param(
    [string]$Name,
    [ValidateSet('PASS', 'WARN', 'BLOCK')]
    [string]$Status,
    [string]$Detail
  )

  $results.Add([pscustomobject]@{
      status = $Status
      check  = $Name
      detail = $Detail
    })
}

if (-not (Test-Path -LiteralPath $AppRoot -PathType Container)) {
  Add-Check 'application root' 'BLOCK' "Directory not found: $AppRoot"
} else {
  Add-Check 'application root' 'PASS' (Resolve-Path -LiteralPath $AppRoot).Path
}

$packageFiles = @('package.json', 'pnpm-lock.yaml', 'yarn.lock', 'package-lock.json') |
  Where-Object { Test-Path -LiteralPath (Join-Path $AppRoot $_) }
if ($packageFiles.Count -gt 0) {
  Add-Check 'package manifest' 'PASS' ($packageFiles -join ', ')
} else {
  Add-Check 'package manifest' 'WARN' 'No supported package manifest found at the application root'
}

$git = Get-Command git -ErrorAction SilentlyContinue
if ($git) {
  $branch = (& git -C $AppRoot branch --show-current 2>$null)
  if ($LASTEXITCODE -eq 0) {
    Add-Check 'git context' 'PASS' ($(if ([string]::IsNullOrWhiteSpace($branch)) { 'detached or unnamed branch' } else { $branch.Trim() }))
  } else {
    Add-Check 'git context' 'WARN' 'Application root is not a readable Git worktree'
  }
} else {
  Add-Check 'git context' 'WARN' 'git executable not found'
}

$docker = Get-Command docker -ErrorAction SilentlyContinue
if ($docker) {
  $context = (& docker context show 2>$null)
  if ($LASTEXITCODE -eq 0) {
    Add-Check 'Docker context' 'PASS' $context.Trim()
  } else {
    Add-Check 'Docker context' 'WARN' 'Docker is installed but the daemon/context is unavailable'
  }
} else {
  Add-Check 'Docker context' 'WARN' 'Docker executable not found; required only for local container work'
}

if ($ExpectedSchema) {
  $rg = Get-Command rg -ErrorAction SilentlyContinue
  if ($rg) {
    & rg --quiet --hidden --glob '!node_modules/**' --glob '!.git/**' --glob '!dist/**' --glob '!build/**' --glob '*.sql' --glob '*.toml' --glob '*.json' --glob '*.ts' --glob '*.tsx' --glob '*.vue' -- $ExpectedSchema $AppRoot 2>$null
    $schemaFound = ($LASTEXITCODE -eq 0)
  } else {
    $schemaFound = $false
  }
  if ($schemaFound) {
    Add-Check 'expected schema reference' 'PASS' $ExpectedSchema
  } elseif (-not $rg) {
    Add-Check 'expected schema reference' 'WARN' "rg is unavailable; skipped bounded search for schema '$ExpectedSchema'"
  } else {
    Add-Check 'expected schema reference' 'WARN' "No source/config reference found for schema '$ExpectedSchema'"
  }
}

if ($ExpectedUrl) {
  try {
    $response = Invoke-WebRequest -Uri $ExpectedUrl -Method Head -TimeoutSec 8 -UseBasicParsing
    Add-Check 'expected URL' 'PASS' "$ExpectedUrl ($([int]$response.StatusCode))"
  } catch {
    Add-Check 'expected URL' 'WARN' "$ExpectedUrl is not reachable"
  }
}

if ($ExpectedModePattern) {
  $rg = Get-Command rg -ErrorAction SilentlyContinue
  if ($rg) {
    & rg --quiet --hidden --glob '!node_modules/**' --glob '!.git/**' --glob '!dist/**' --glob '!build/**' --glob '*.json' --glob '*.ts' --glob '*.js' --glob '*.mjs' --glob '*.cjs' --glob '*.vue' -- $ExpectedModePattern $AppRoot 2>$null
    $modeFound = ($LASTEXITCODE -eq 0)
  } else {
    $modeFound = $false
  }
  if ($modeFound) {
    Add-Check 'expected mode reference' 'PASS' $ExpectedModePattern
  } elseif (-not $rg) {
    Add-Check 'expected mode reference' 'WARN' "rg is unavailable; skipped bounded search for mode pattern '$ExpectedModePattern'"
  } else {
    Add-Check 'expected mode reference' 'WARN' "No source reference found for mode pattern '$ExpectedModePattern'"
  }
}

$results | Format-Table -AutoSize
if ($results.status -contains 'BLOCK') {
  exit 2
}
if ($results.status -contains 'WARN') {
  exit 1
}
exit 0

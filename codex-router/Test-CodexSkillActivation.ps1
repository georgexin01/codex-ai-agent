param(
  [switch]$Json
)

$ErrorActionPreference = "Stop"

$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$codexRoot = Split-Path -Parent $scriptDir
$casesPath = Join-Path $scriptDir "skill-activation-cases.json"
$pulsePath = Join-Path $codexRoot "00_PULSE.md"
$semanticRouterPath = Join-Path $codexRoot "memories\2_governance\artifacts\skill_path_router.md"

function Add-Route([System.Collections.Generic.List[object]]$Routes, [string]$Phrase, [string]$Target, [string]$Source) {
  if ([string]::IsNullOrWhiteSpace($Phrase) -or [string]::IsNullOrWhiteSpace($Target)) { return }
  $Routes.Add([pscustomobject]@{
    trigger = $Phrase.Trim().ToLowerInvariant()
    target = $Target.Trim()
    source = $Source
  })
}

if (-not (Test-Path -LiteralPath $casesPath -PathType Leaf)) {
  throw "Missing activation cases: $casesPath"
}

$routes = New-Object System.Collections.Generic.List[object]
foreach ($hit in (Select-String -LiteralPath $pulsePath -Pattern '^\s*"([^"]+)"\s*:\s*"([^"]+)"')) {
  Add-Route $routes $hit.Matches[0].Groups[1].Value $hit.Matches[0].Groups[2].Value "00_PULSE.md"
}
foreach ($line in (Get-Content -LiteralPath $semanticRouterPath)) {
  $rowMatch = [regex]::Match($line, '^\s*\|\s*(?<triggers>.+?)\s*\|\s*`(?<target>[^`]+)`\s*\|')
  if (-not $rowMatch.Success) { continue }
  foreach ($aliasMatch in [regex]::Matches($rowMatch.Groups["triggers"].Value, '`([^`]+)`')) {
    Add-Route $routes $aliasMatch.Groups[1].Value $rowMatch.Groups["target"].Value "skill_path_router.md"
  }
}

$uniqueRoutes = @($routes |
  Group-Object { "$($_.trigger)|$($_.target)" } |
  ForEach-Object { $_.Group[0] })
$caseConfig = Get-Content -LiteralPath $casesPath -Raw | ConvertFrom-Json
$results = foreach ($case in @($caseConfig.cases)) {
  $normalizedPrompt = ([string]$case.prompt).Trim().ToLowerInvariant()
  $matched = $uniqueRoutes |
    Where-Object { $normalizedPrompt.Contains($_.trigger) } |
    Sort-Object { $_.trigger.Length } -Descending |
    Select-Object -First 1
  $actualTarget = if ($null -ne $matched) { [string]$matched.target } else { $null }
  [pscustomobject]@{
    id = [string]$case.id
    passed = $actualTarget -eq [string]$case.expected_target
    expected_target = [string]$case.expected_target
    actual_target = $actualTarget
    matched_trigger = if ($null -ne $matched) { [string]$matched.trigger } else { $null }
  }
}

$passed = @($results | Where-Object passed).Count
$failed = @($results | Where-Object { -not $_.passed }).Count
$summary = [pscustomobject]@{
  version = [string]$caseConfig.version
  route_count = $uniqueRoutes.Count
  case_count = @($results).Count
  passed = $passed
  failed = $failed
  results = @($results)
}

if ($Json) {
  $summary | ConvertTo-Json -Depth 6
} else {
  "Codex Skill Activation Tests"
  "Routes: $($summary.route_count)"
  "Cases: $($summary.case_count)"
  "Passed: $passed"
  "Failed: $failed"
  foreach ($result in $results) {
    $mark = if ($result.passed) { "PASS" } else { "FAIL" }
    "$mark $($result.id) - $($result.matched_trigger) -> $($result.actual_target)"
  }
}

if ($failed -gt 0) { exit 1 }

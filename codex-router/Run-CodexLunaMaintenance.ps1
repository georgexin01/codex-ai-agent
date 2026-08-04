[CmdletBinding()]
param(
  [switch]$ApplySafe,
  [switch]$Json
)

$ErrorActionPreference = 'Stop'
$codexRoot = Split-Path -Parent $PSScriptRoot
Set-Location -LiteralPath $codexRoot

function Invoke-JsonScript([string]$Path, [string[]]$Arguments = @()) {
  $raw = @(& powershell -NoProfile -ExecutionPolicy Bypass -File $Path @Arguments 2>&1 | ForEach-Object { $_.ToString() })
  $exitCode = if ($LASTEXITCODE -is [int]) { [int]$LASTEXITCODE } else { 0 }
  $parsed = $null
  try { $parsed = ($raw -join "`n") | ConvertFrom-Json } catch { }
  [pscustomobject]@{ path = $Path; exit_code = $exitCode; parsed = $parsed; output = $raw }
}

$manifestPath = Join-Path $PSScriptRoot 'Build-CodexLunaActivationManifest.ps1'
$truthPath = Join-Path $PSScriptRoot 'Detect-CodexProjectTruth.ps1'
$results = @()

$results += Invoke-JsonScript $manifestPath
$results += Invoke-JsonScript $truthPath @('-Json')

if ($ApplySafe) {
  $updatePath = Join-Path $PSScriptRoot 'Update-CodexRouting.ps1'
  $results += Invoke-JsonScript $updatePath @('-Quiet')
}

$results += Invoke-JsonScript (Join-Path $PSScriptRoot 'Measure-CodexRouteTelemetry.ps1') @('-Json')
$results += Invoke-JsonScript (Join-Path $PSScriptRoot 'Audit-CodexRouting.ps1')
$results += Invoke-JsonScript (Join-Path $PSScriptRoot 'Test-CodexPerfBenchmark.ps1') @('-Json')

$report = [pscustomobject]@{
  generated_utc = [DateTime]::UtcNow.ToString('o')
  model_profile = 'luna-5.6-medium'
  reasoning_levels = @('medium', 'high')
  apply_safe = [bool]$ApplySafe
  checks = @($results)
  failed_checks = @($results | Where-Object { $_.exit_code -ne 0 }).Count
}

if ($Json) { $report | ConvertTo-Json -Depth 12 } else {
  $report | Select-Object generated_utc, model_profile, reasoning_levels, apply_safe, failed_checks | Format-List
  $results | Select-Object path, exit_code | Format-Table -AutoSize
}

if ($report.failed_checks -gt 0) { exit 1 }

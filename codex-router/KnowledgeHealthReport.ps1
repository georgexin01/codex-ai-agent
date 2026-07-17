[CmdletBinding()]
param(
  [switch]$Json
)

$ErrorActionPreference = 'Continue'
$codexRoot = Split-Path -Parent $PSScriptRoot
$checks = @(
  [pscustomobject]@{ Name = 'large-knowledge-detector'; Script = (Join-Path $PSScriptRoot 'Find-LargeKnowledge.ps1'); Json = $true },
  [pscustomobject]@{ Name = 'knowledge-validator'; Script = (Join-Path $PSScriptRoot 'Validate-CodexKnowledge.ps1'); Json = $false },
  [pscustomobject]@{ Name = 'routing-audit'; Script = (Join-Path $PSScriptRoot 'Audit-CodexRouting.ps1'); Json = $false },
  [pscustomobject]@{ Name = 'performance-benchmark'; Script = (Join-Path $PSScriptRoot 'Test-CodexPerfBenchmark.ps1'); Json = $true }
)

$results = foreach ($check in $checks) {
  if ($check.Json) {
    $output = @(& $check.Script -Json 2>&1 | ForEach-Object { $_.ToString() })
  } else {
    $output = @(& $check.Script 2>&1 | ForEach-Object { $_.ToString() })
  }
  $exitCode = if ($LASTEXITCODE -is [int]) { [int]$LASTEXITCODE } else { 0 }
  [pscustomobject]@{
    check = $check.Name
    exit_code = $exitCode
    status = if ($exitCode -eq 0) { 'PASS' } else { 'FAIL_OR_REVIEW' }
    output = $output
  }
}

$report = [pscustomobject]@{
  report = 'KnowledgeHealthReport.ps1'
  codex_root = $codexRoot
  skill_markdown_edit_policy = 'excluded'
  checks = @($results)
  overall = if (@($results | Where-Object exit_code -ne 0).Count -eq 0) { 'PASS' } else { 'REVIEW' }
}

if ($Json) {
  $report | ConvertTo-Json -Depth 8
} else {
  $report.checks | Select-Object check, exit_code, status | Format-Table -AutoSize
  Write-Output "Overall: $($report.overall)"
  foreach ($result in $report.checks) {
    Write-Output "--- $($result.check) ---"
    $result.output
  }
}

if ($report.overall -ne 'PASS') { exit 1 }

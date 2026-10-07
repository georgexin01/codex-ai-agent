[CmdletBinding()]
param([switch]$Json)

$ErrorActionPreference = 'Stop'
$codexRoot = Split-Path -Parent $PSScriptRoot
$contractPath = Join-Path $codexRoot 'memories\2_governance\artifacts\intent_action_contracts.md'
$routerPath = Join-Path $codexRoot 'memories\2_governance\artifacts\skill_path_router.md'

if (-not (Test-Path -LiteralPath $contractPath -PathType Leaf)) { throw "Missing intent contract file: $contractPath" }
if (-not (Test-Path -LiteralPath $routerPath -PathType Leaf)) { throw "Missing semantic router: $routerPath" }

$contractText = Get-Content -LiteralPath $contractPath -Raw
$routerText = Get-Content -LiteralPath $routerPath -Raw
$rows = New-Object System.Collections.Generic.List[object]

foreach ($line in (Get-Content -LiteralPath $contractPath)) {
  if ($line -notmatch '^\|\s*[^-].*\|\s*$' -or $line -match '^\|\s*project/type\s*\|') { continue }
  $parts = @($line.Trim() -split '\|') | ForEach-Object { $_.Trim() }
  if ($parts.Count -lt 8) { continue }
  $rows.Add([pscustomobject]@{
    project = $parts[1]
    keywords = $parts[2]
    meaning = $parts[3]
    confidence = $parts[4]
    next_action = $parts[5]
    verification = $parts[6]
    risk_gate = $parts[7]
  })
}

$requiredFields = @('confidence', 'next action', 'verification', 'risk gate')
$header = ($contractText -split '\r?\n' | Where-Object { $_ -match '^\|\s*project/type\s*\|' } | Select-Object -First 1)
$headerCoverage = @($requiredFields | Where-Object { $header -and $header.ToLowerInvariant().Contains($_) }).Count
$completeRows = @($rows | Where-Object {
  $_.project -and $_.keywords -and $_.meaning -and $_.confidence -and $_.next_action -and $_.verification -and $_.risk_gate
}).Count
$phraseCount = @($rows | ForEach-Object { [regex]::Matches($_.keywords, '`[^`]+`').Count } | Measure-Object -Sum).Sum
$projectTypes = @($rows | Select-Object -ExpandProperty project -Unique)
$destructiveRows = @($rows | Where-Object { $_.project -match 'Destructive' })
$destructiveGated = @($destructiveRows | Where-Object { $_.risk_gate -match '(?i)explicit confirmation|required' }).Count
$routeReachable = $routerText.Contains('memories/2_governance/artifacts/intent_action_contracts.md')
$contentStorage = 'none'
$checks = [ordered]@{
  contract_file = (Test-Path -LiteralPath $contractPath -PathType Leaf)
  router_reachability = $routeReachable
  contract_count = ($rows.Count -ge 1)
  field_header_coverage = ($headerCoverage -eq $requiredFields.Count)
  complete_contract_rows = ($completeRows -eq $rows.Count -and $rows.Count -gt 0)
  destructive_confirmation_gate = ($destructiveRows.Count -gt 0 -and $destructiveGated -eq $destructiveRows.Count)
  content_storage = ($contentStorage -eq 'none')
}
$failedChecks = @($checks.GetEnumerator() | Where-Object { $_.Value -is [bool] -and -not $_.Value }).Count
$summary = [pscustomobject]@{
  audit = 'Measure-CodexIntentCoverage.ps1'
  generated_utc = [DateTime]::UtcNow.ToString('o')
  contract_rows = $rows.Count
  phrase_count = [int]$phraseCount
  project_type_count = $projectTypes.Count
  complete_contract_rows = $completeRows
  required_header_fields = $requiredFields.Count
  covered_header_fields = $headerCoverage
  destructive_rows = $destructiveRows.Count
  destructive_gated_rows = $destructiveGated
  content_storage = $contentStorage
  checks = $checks
  failed_check_count = $failedChecks
  status = if ($failedChecks -eq 0) { 'PASS' } else { 'REVIEW' }
}
if ($Json) { $summary | ConvertTo-Json -Depth 8 } else { $summary | Format-List }
if ($failedChecks -gt 0) { exit 1 }
exit 0

[CmdletBinding()]
param(
  [switch]$Json
)

$ErrorActionPreference = 'Stop'
$codexRoot = Split-Path -Parent $PSScriptRoot
$contractPath = Join-Path $codexRoot 'memories\2_governance\artifacts\intent_action_contracts.md'
$routerPath = Join-Path $codexRoot 'memories\2_governance\artifacts\skill_path_router.md'
$intentPath = Join-Path $codexRoot 'memories\2_governance\artifacts\trigger_intent_index.md'

$cases = @(
  [pscustomobject]@{ phrase = 'popup modal'; meaning = 'visibility layer'; action = 'Locate component'; verify = 'Source event/state trace'; gate = 'Confirm exact component' },
  [pscustomobject]@{ phrase = 'click center + button'; meaning = 'visible add/create control'; action = 'Resolve the exact button'; verify = 'Source caller chain'; gate = 'Do not activate a real button' },
  [pscustomobject]@{ phrase = 'close button'; meaning = 'dismissal or visibility transition'; action = 'Find close handler'; verify = 'State transition'; gate = 'Preserve unsaved-data protection' },
  [pscustomobject]@{ phrase = 'trigger'; meaning = 'Trace event'; action = 'Follow event'; verify = 'Caller/callee trace'; gate = 'Do not infer a mutation' },
  [pscustomobject]@{ phrase = 'localhost test'; meaning = 'Runnable local app readiness'; action = 'Detect project root'; verify = 'Raw URLs and HTTP status'; gate = 'Do not mutate source/config' },
  [pscustomobject]@{ phrase = 'same design'; meaning = 'Canonical visual structure'; action = 'Find source DOM/CSS/component'; verify = 'Build plus visual/browser check'; gate = 'Do not approximate' }
)

$results = New-Object System.Collections.Generic.List[object]
function Add-Result([string]$Id, [bool]$Passed, [string]$Detail) {
  $results.Add([pscustomobject]@{ id = $Id; passed = $Passed; detail = $Detail })
}

foreach ($path in @($contractPath, $routerPath, $intentPath)) {
  Add-Result "exists-$([IO.Path]::GetFileName($path))" (Test-Path -LiteralPath $path -PathType Leaf) $path
}

$contract = if (Test-Path -LiteralPath $contractPath) { Get-Content -LiteralPath $contractPath -Raw } else { '' }
$router = if (Test-Path -LiteralPath $routerPath) { Get-Content -LiteralPath $routerPath -Raw } else { '' }
$intent = if (Test-Path -LiteralPath $intentPath) { Get-Content -LiteralPath $intentPath -Raw } else { '' }

Add-Result 'contract-frontmatter' ($contract -match '(?m)^name:\s*intent-action-contracts\s*$' -and $contract -match '(?m)^triggers:\s*' -and $contract -match '(?m)^related:\s*$') 'name, triggers, and related fields'
Add-Result 'router-target' ($router -match [regex]::Escape('memories/2_governance/artifacts/intent_action_contracts.md')) 'skill_path_router target exists'
Add-Result 'intent-relation' ($intent -match [regex]::Escape('memories/2_governance/artifacts/intent_action_contracts.md')) 'trigger_intent_index relation exists'
Add-Result 'confidence-gate' ($contract -match 'Confidence rule:' -and $contract -match 'medium') 'ambiguous medium-confidence phrases stop before mutation'
Add-Result 'destructive-confirmation-gate' ($contract -match 'Explicit confirmation required for material destruction') 'destructive intent retains confirmation'
Add-Result 'broad-context-boundary' ($contract -match 'never authorizes an unsafe click' -and $intent -match 'too broad to invoke a workflow alone') 'broad phrases remain retrieval context only'

foreach ($case in $cases) {
  $passed = $true
  foreach ($value in @($case.phrase, $case.meaning, $case.action, $case.verify, $case.gate)) {
    if ($contract -notmatch [regex]::Escape([string]$value)) { $passed = $false; break }
  }
  Add-Result "contract-$($case.phrase -replace '[^a-z0-9]+','-')" $passed "phrase=$($case.phrase); action=$($case.action); verification=$($case.verify)"
}

$passedCount = @($results | Where-Object passed).Count
$failedCount = @($results | Where-Object { -not $_.passed }).Count
$status = if ($failedCount -eq 0) { 'PASS' } else { 'FAIL' }
$report = [pscustomobject]@{
  validator = 'Test-CodexIntentContracts.ps1'
  contract_count = $cases.Count
  passed = $passedCount
  failed = $failedCount
  status = $status
  results = $results.ToArray()
}

if ($Json) { $report | ConvertTo-Json -Depth 6 } else { $report | Format-List }
if ($failedCount -gt 0) { exit 1 }
exit 0

param(
  [switch]$Json
)

$ErrorActionPreference = "Stop"

$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$codexRoot = Split-Path -Parent $scriptDir
$benchmarkPath = Join-Path $scriptDir "perf-benchmark.json"
$dynamicPath = Join-Path $codexRoot "CODEX_DYNAMIC_ROUTING.md"
$manifestPath = Join-Path $scriptDir "codex-manifest.json"
$auditPath = Join-Path $scriptDir "Audit-CodexRouting.ps1"
$pulsePath = Join-Path $codexRoot "00_PULSE.md"
$memoryPath = Join-Path $codexRoot "memories\MEMORY.md"
$activationPath = Join-Path $scriptDir "Test-CodexSkillActivation.ps1"

function Read-Text([string]$Path) {
  if (-not (Test-Path -LiteralPath $Path)) { throw "Missing file: $Path" }
  Get-Content -LiteralPath $Path -Raw
}

function Add-Result([System.Collections.Generic.List[object]]$Results, [string]$Id, [bool]$Passed, [string]$Detail) {
  $Results.Add([pscustomobject]@{
    id = $Id
    passed = $Passed
    detail = $Detail
  })
}

if (-not (Test-Path -LiteralPath $benchmarkPath)) {
  throw "Missing benchmark config: $benchmarkPath"
}

$benchmark = Read-Text $benchmarkPath | ConvertFrom-Json
$dynamic = Read-Text $dynamicPath
$manifest = Read-Text $manifestPath | ConvertFrom-Json
$pulseText = Read-Text $pulsePath
$results = New-Object System.Collections.Generic.List[object]

$safeIndexed = 0
if ($dynamic -match "Safe indexed files:\s*(\d+)") { $safeIndexed = [int]$Matches[1] }
$knowledgeRoutes = 0
if ($dynamic -match "knowledge:\s*(\d+)\s+files") { $knowledgeRoutes = [int]$Matches[1] }

Add-Result $results "target-safe-indexed-files" ($safeIndexed -le [int]$benchmark.targets.max_safe_indexed_files) "safe_indexed=$safeIndexed max=$($benchmark.targets.max_safe_indexed_files)"
Add-Result $results "target-knowledge-routes" ($knowledgeRoutes -le [int]$benchmark.targets.max_knowledge_routes) "knowledge_routes=$knowledgeRoutes max=$($benchmark.targets.max_knowledge_routes)"
$manifestPortableViolations = @($manifest.entries | Where-Object {
  $_.PSObject.Properties.Name -contains "full_path" -or
  $_.PSObject.Properties.Name -contains "root" -or
  $_.PSObject.Properties.Name -contains "last_write_utc"
}).Count
Add-Result $results "manifest-schema-v2" ([int]$manifest.schema_version -eq 2) "schema_version=$($manifest.schema_version)"
Add-Result $results "manifest-portable-fields" ($manifestPortableViolations -eq 0) "portable_field_violations=$manifestPortableViolations"
Add-Result $results "knowledge-route-preservation" ($knowledgeRoutes -ge [int]$benchmark.targets.min_knowledge_routes) "knowledge_routes=$knowledgeRoutes min=$($benchmark.targets.min_knowledge_routes)"
Add-Result $results "pulse-byte-budget" ((Get-Item -LiteralPath $pulsePath).Length -le [int]$benchmark.targets.max_pulse_bytes) "pulse_bytes=$((Get-Item -LiteralPath $pulsePath).Length) max=$($benchmark.targets.max_pulse_bytes)"
Add-Result $results "memory-hot-byte-budget" ((Get-Item -LiteralPath $memoryPath).Length -le [int]$benchmark.targets.max_memory_hot_bytes) "memory_bytes=$((Get-Item -LiteralPath $memoryPath).Length) max=$($benchmark.targets.max_memory_hot_bytes)"
$pulseTriggerCount = [regex]::Matches($pulseText, '(?m)^\s*"[^"]+"\s*:\s*"').Count
Add-Result $results "pulse-trigger-preservation" ($pulseTriggerCount -ge [int]$benchmark.targets.min_pulse_exact_triggers) "pulse_triggers=$pulseTriggerCount min=$($benchmark.targets.min_pulse_exact_triggers)"

$auditJson = & powershell -ExecutionPolicy Bypass -File $auditPath | ConvertFrom-Json
$missingTotal = [int]$auditJson.missing_mandatory_count + [int]$auditJson.missing_fallback_count + [int]$auditJson.missing_roots_count
Add-Result $results "audit-missing-entries" ($missingTotal -le [int]$benchmark.targets.max_missing_entries) "missing_total=$missingTotal"
Add-Result $results "audit-legacy-refs-budget" ([int]$auditJson.legacy_ref_count -le [int]$benchmark.targets.max_legacy_refs) "legacy_refs=$($auditJson.legacy_ref_count) max=$($benchmark.targets.max_legacy_refs)"
Add-Result $results "trigger-conflict-budget" ([int]$auditJson.trigger_conflict_count -le [int]$benchmark.targets.max_trigger_conflicts) "trigger_conflicts=$($auditJson.trigger_conflict_count) max=$($benchmark.targets.max_trigger_conflicts)"
Add-Result $results "standalone-ai-trigger-budget" ([int]$auditJson.standalone_ai_trigger_count -le [int]$benchmark.targets.max_standalone_ai_triggers) "standalone_ai=$($auditJson.standalone_ai_trigger_count) max=$($benchmark.targets.max_standalone_ai_triggers)"
Add-Result $results "missing-trigger-target-budget" ([int]$auditJson.missing_trigger_target_count -le [int]$benchmark.targets.max_missing_trigger_targets) "missing_trigger_targets=$($auditJson.missing_trigger_target_count) max=$($benchmark.targets.max_missing_trigger_targets)"
Add-Result $results "semantic-alias-audit-coverage" ([int]$auditJson.semantic_router_alias_count -ge [int]$benchmark.targets.min_semantic_router_aliases) "semantic_aliases=$($auditJson.semantic_router_alias_count) min=$($benchmark.targets.min_semantic_router_aliases)"
Add-Result $results "missing-manifest-path-budget" ([int]$auditJson.missing_manifest_path_count -le [int]$benchmark.targets.max_missing_manifest_paths) "missing_manifest_paths=$($auditJson.missing_manifest_path_count) max=$($benchmark.targets.max_missing_manifest_paths)"
Add-Result $results "excluded-manifest-path-budget" ([int]$auditJson.excluded_manifest_path_count -le [int]$benchmark.targets.max_excluded_manifest_paths) "excluded_manifest_paths=$($auditJson.excluded_manifest_path_count) max=$($benchmark.targets.max_excluded_manifest_paths)"
Add-Result $results "unclassified-native-skill-budget" ([int]$auditJson.unclassified_invalid_native_skill_count -le [int]$benchmark.targets.max_unclassified_invalid_native_skills) "unclassified_native_skills=$($auditJson.unclassified_invalid_native_skill_count) max=$($benchmark.targets.max_unclassified_invalid_native_skills)"
Add-Result $results "duplicate-trigger-budget" ([int]$auditJson.duplicate_same_target_trigger_count -le [int]$benchmark.targets.max_duplicate_same_target_triggers) "duplicate_same_target=$($auditJson.duplicate_same_target_trigger_count) max=$($benchmark.targets.max_duplicate_same_target_triggers)"

$activationOutput = @(& powershell -ExecutionPolicy Bypass -File $activationPath -Json 2>&1 | ForEach-Object { $_.ToString() })
$activationExit = if ($LASTEXITCODE -is [int]) { [int]$LASTEXITCODE } else { 0 }
$activationSummary = if ($activationOutput.Count -gt 0) {
  try { ($activationOutput -join "`n") | ConvertFrom-Json } catch { $null }
} else {
  $null
}
$activationDetail = if ($null -ne $activationSummary) {
  "cases=$($activationSummary.case_count) passed=$($activationSummary.passed) failed=$($activationSummary.failed)"
} else {
  "activation output was not valid JSON"
}
Add-Result $results "skill-activation-cases" ($activationExit -eq 0 -and $null -ne $activationSummary) $activationDetail

foreach ($case in $benchmark.cases) {
  $caseText = $dynamic
  if ($case.file) {
    $casePath = Join-Path $codexRoot ([string]$case.file)
    $caseText = Read-Text $casePath
  }

  $failures = New-Object System.Collections.Generic.List[string]

  if ($case.PSObject.Properties.Name -contains "expect_contains") {
    foreach ($needle in @($case.expect_contains)) {
      if ([string]::IsNullOrWhiteSpace([string]$needle)) { continue }
      if (-not $caseText.Contains([string]$needle)) { $failures.Add("missing: $needle") }
    }
  }

  if ($case.PSObject.Properties.Name -contains "expect_not_contains") {
    foreach ($needle in @($case.expect_not_contains)) {
      if ([string]::IsNullOrWhiteSpace([string]$needle)) { continue }
      if ($caseText.Contains([string]$needle)) { $failures.Add("unexpected: $needle") }
    }
  }

  if ($case.PSObject.Properties.Name -contains "manifest_forbidden_paths") {
    foreach ($forbidden in @($case.manifest_forbidden_paths)) {
      if ([string]::IsNullOrWhiteSpace([string]$forbidden)) { continue }
      $hit = $false
      foreach ($entry in @($manifest.entries)) {
        if ([string]$entry.relative_path -like "*$forbidden*") {
          $hit = $true
          break
        }
      }
      if ($hit) { $failures.Add("manifest still indexes: $forbidden") }
    }
  }

  Add-Result $results ([string]$case.id) ($failures.Count -eq 0) ($(if ($failures.Count -eq 0) { "ok" } else { $failures -join "; " }))
}

$passed = @($results | Where-Object passed).Count
$failed = @($results | Where-Object { -not $_.passed }).Count
$score = if (($passed + $failed) -gt 0) { [math]::Round(($passed / ($passed + $failed)) * 10, 1) } else { 0 }

$summary = [pscustomobject]@{
  generated_utc = [DateTime]::UtcNow.ToString("o")
  safe_indexed_files = $safeIndexed
  knowledge_routes = $knowledgeRoutes
  passed = $passed
  failed = $failed
  rating_10 = $score
  results = $results
}

if ($Json) {
  $summary | ConvertTo-Json -Depth 8
} else {
  "Codex Performance Benchmark"
  "Rating: $score/10"
  "Passed: $passed"
  "Failed: $failed"
  "Safe indexed files: $safeIndexed"
  "Knowledge routes: $knowledgeRoutes"
  ""
  foreach ($r in $results) {
    $mark = if ($r.passed) { "PASS" } else { "FAIL" }
    "{0} {1} - {2}" -f $mark, $r.id, $r.detail
  }
}

if ($failed -gt 0) { exit 1 }

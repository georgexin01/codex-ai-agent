param(
  [switch]$Quiet,
  [switch]$Detailed
)

$ErrorActionPreference = "Stop"

$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$codexRoot = Split-Path -Parent $scriptDir
$configPath = Join-Path $scriptDir "router-config.json"
$dynamicPath = Join-Path $codexRoot "CODEX_DYNAMIC_ROUTING.md"
$manifestPath = Join-Path $scriptDir "codex-manifest.json"

if (-not (Test-Path -LiteralPath $configPath)) {
  throw "Missing router config: $configPath"
}

$config = Get-Content -LiteralPath $configPath -Raw | ConvertFrom-Json

function Resolve-RepoPath([string]$relativePath) {
  Join-Path $codexRoot $relativePath
}

function Test-IsExcluded([string]$fullPath) {
  $relative = ($fullPath.Replace($codexRoot, "").TrimStart('\','/')) -replace '\\','/'
  foreach ($pat in @($config.exclude)) {
    if (-not $pat) { continue }
    $normalizedPattern = (([string]$pat) -replace '\\','/') -replace '\*\*','*'
    if ($relative -like $normalizedPattern) { return $true }
  }
  return $false
}

$mandatory = @(
  "00_CODEX_START_HERE.md",
  "00_REASONING_EVOLUTION_PROTOCOL.md",
  "CODEX_DYNAMIC_ROUTING.md"
)
$mandatory += @($config.tier_map.tier_0)
$mandatory += @($config.tier_map.tier_1)
$mandatory += @($config.tier_map.tier_2)
$mandatory = $mandatory | Where-Object { $_ -and $_.Trim().Length -gt 0 } | Select-Object -Unique

$missingMandatory = @()
foreach ($rel in $mandatory) {
  $abs = Resolve-RepoPath $rel
  if (-not (Test-Path -LiteralPath $abs)) { $missingMandatory += $abs }
}

$missingFallback = @()
foreach ($rel in @($config.fallback_chain)) {
  $abs = Resolve-RepoPath $rel
  if (-not (Test-Path -LiteralPath $abs)) { $missingFallback += $abs }
}

$missingRoots = @()
foreach ($root in @($config.roots)) {
  $abs = Resolve-RepoPath $root.path
  if (-not (Test-Path -LiteralPath $abs)) { $missingRoots += $abs }
}

# ROUTER.idx / ATLAS.idx audit retired — codex-router/codex-manifest.json is the index of record.

$scanFiles = @(
  (Join-Path $codexRoot "00_CODEX_START_HERE.md"),
  (Join-Path $codexRoot "AGENTS.md")
)
$scanFiles += (Get-ChildItem -LiteralPath (Join-Path $codexRoot "memories") -Recurse -File -ErrorAction SilentlyContinue |
  Where-Object { @(".md",".yaml",".yml",".json",".ps1",".txt",".idx",".toml") -contains $_.Extension.ToLowerInvariant() -and -not (Test-IsExcluded $_.FullName) }).FullName
$scanFiles += (Get-ChildItem -LiteralPath (Join-Path $codexRoot "skills") -Recurse -File -ErrorAction SilentlyContinue |
  Where-Object { @(".md",".yaml",".yml",".json",".ps1",".txt",".idx",".toml") -contains $_.Extension.ToLowerInvariant() -and $_.FullName -notmatch "\\faucet\\" -and -not (Test-IsExcluded $_.FullName) }).FullName
$scanFiles = $scanFiles | Sort-Object -Unique

# Detect exact trigger collisions across the primary PULSE map and every alias in
# the semantic router's first table cell.
$triggerEntries = New-Object System.Collections.Generic.List[object]
$semanticRouterRowCount = 0
$semanticRouterAliasCount = 0
$pulsePath = Join-Path $codexRoot "00_PULSE.md"
$semanticRouterPath = Join-Path $codexRoot "memories\2_governance\artifacts\skill_path_router.md"
if (Test-Path -LiteralPath $pulsePath) {
  foreach ($hit in (Select-String -LiteralPath $pulsePath -Pattern '^\s*"([^"]+)"\s*:\s*"([^"]+)"')) {
    $triggerEntries.Add([pscustomobject]@{ trigger = $hit.Matches[0].Groups[1].Value.Trim().ToLowerInvariant(); target = $hit.Matches[0].Groups[2].Value.Trim(); source = "00_PULSE.md" })
  }
}
if (Test-Path -LiteralPath $semanticRouterPath) {
  foreach ($line in (Get-Content -LiteralPath $semanticRouterPath)) {
    $rowMatch = [regex]::Match($line, '^\s*\|\s*(?<triggers>.+?)\s*\|\s*`(?<target>[^`]+)`\s*\|')
    if (-not $rowMatch.Success) { continue }
    $aliasMatches = [regex]::Matches($rowMatch.Groups["triggers"].Value, '`([^`]+)`')
    if ($aliasMatches.Count -eq 0) { continue }
    $semanticRouterRowCount++
    $semanticRouterAliasCount += $aliasMatches.Count
    foreach ($aliasMatch in $aliasMatches) {
      $triggerEntries.Add([pscustomobject]@{
        trigger = $aliasMatch.Groups[1].Value.Trim().ToLowerInvariant()
        target = $rowMatch.Groups["target"].Value.Trim()
        source = "skill_path_router.md"
      })
    }
  }
}
$triggerConflicts = New-Object System.Collections.Generic.List[object]
$duplicateSameTargetTriggers = New-Object System.Collections.Generic.List[object]
foreach ($group in ($triggerEntries | Group-Object trigger)) {
  $targets = @($group.Group | Select-Object -ExpandProperty target -Unique)
  if ($targets.Count -gt 1) {
    $triggerConflicts.Add([pscustomobject]@{ trigger = $group.Name; targets = $targets; sources = @($group.Group | Select-Object -ExpandProperty source -Unique) })
  } elseif ($group.Count -gt 1) {
    $duplicateSameTargetTriggers.Add([pscustomobject]@{
      trigger = $group.Name
      target = $targets[0]
      occurrences = $group.Count
      sources = @($group.Group | Select-Object -ExpandProperty source -Unique)
    })
  }
}
$standaloneAiTriggers = @($triggerEntries | Where-Object { $_.trigger -eq "ai" })
$pathTriggerTargets = @($triggerEntries | Where-Object { $_.target -match '^(00_[^/\\]+\.md|CODEX_[^/\\]+\.md|skills[/\\]|memories[/\\]|codex-router[/\\])' })
$missingTriggerTargets = New-Object System.Collections.Generic.List[object]
foreach ($entry in $pathTriggerTargets) {
  $targetPath = Resolve-RepoPath $entry.target
  if (-not (Test-Path -LiteralPath $targetPath -PathType Leaf)) {
    $missingTriggerTargets.Add([pscustomobject]@{ trigger = $entry.trigger; target = $entry.target; source = $entry.source })
  }
}

# Validate every generated manifest entry, not only configured mandatory routes.
$manifestEntryCount = 0
$missingManifestPaths = New-Object System.Collections.Generic.List[string]
$excludedManifestPaths = New-Object System.Collections.Generic.List[string]
if (Test-Path -LiteralPath $manifestPath) {
  try {
    $manifest = Get-Content -LiteralPath $manifestPath -Raw | ConvertFrom-Json
    foreach ($entry in @($manifest.entries)) {
      $manifestEntryCount++
      $entryPath = [string]$entry.full_path
      if (-not $entryPath) {
        $entryRoot = Join-Path $codexRoot ([string]$entry.root_relative)
        $entryPath = Join-Path $entryRoot ([string]$entry.relative_path)
      }
      if (-not (Test-Path -LiteralPath $entryPath -PathType Leaf)) {
        $missingManifestPaths.Add($entryPath)
      } elseif (Test-IsExcluded $entryPath) {
        $excludedManifestPaths.Add($entryPath)
      }
    }
  } catch {
    $missingManifestPaths.Add("MANIFEST_PARSE_ERROR: $($_.Exception.Message)")
  }
} else {
  $missingManifestPaths.Add("MANIFEST_MISSING: $manifestPath")
}

# Distinguish native skill entry points from internal/reference Markdown.
$invalidNativeSkills = New-Object System.Collections.Generic.List[string]
$unclassifiedInvalidNativeSkills = New-Object System.Collections.Generic.List[string]
$skillsRoot = Join-Path $codexRoot "skills"
if (Test-Path -LiteralPath $skillsRoot) {
  foreach ($skillFile in (Get-ChildItem -LiteralPath $skillsRoot -Recurse -File -ErrorAction SilentlyContinue |
    Where-Object { $_.Name -ceq "SKILL.md" -and -not (Test-IsExcluded $_.FullName) })) {
    $skillText = Get-Content -LiteralPath $skillFile.FullName -Raw
    $hasName = $skillText -match '(?m)^name:\s*\S+'
    $hasDescription = $skillText -match '(?m)^description:\s*\S+'
    if (-not ($hasName -and $hasDescription)) {
      $invalidNativeSkills.Add($skillFile.FullName.Substring($codexRoot.Length).TrimStart('\','/'))
    }
  }
}
if ($invalidNativeSkills.Count -gt 0) {
  $semanticRouterText = if (Test-Path -LiteralPath $semanticRouterPath) {
    Get-Content -LiteralPath $semanticRouterPath -Raw
  } else {
    ""
  }
  foreach ($invalidSkill in $invalidNativeSkills) {
    $normalizedInvalidSkill = $invalidSkill -replace '\\','/'
    if (-not $semanticRouterText.Contains("``$normalizedInvalidSkill``")) {
      $unclassifiedInvalidNativeSkills.Add($invalidSkill)
    }
  }
}

# Frontmatter fields have distinct routing semantics. These counts are
# informational so legacy retrieval hints do not become false validation errors.
$frontmatterTriggerFiles = 0
$frontmatterAliasFiles = 0
$frontmatterContainsFiles = 0
foreach ($f in ($scanFiles | Where-Object { [System.IO.Path]::GetExtension($_).ToLowerInvariant() -eq ".md" })) {
  try {
    $text = Get-Content -LiteralPath $f -Raw
    $frontmatter = [regex]::Match($text, '(?s)\A---\s*\r?\n(?<body>.*?)\r?\n---').Groups["body"].Value
    if (-not $frontmatter) { continue }
    if ($frontmatter -match '(?m)^triggers:\s*') { $frontmatterTriggerFiles++ }
    if ($frontmatter -match '(?m)^aliases:\s*') { $frontmatterAliasFiles++ }
    if ($frontmatter -match '(?m)^contains:\s*') { $frontmatterContainsFiles++ }
  } catch {}
}

$legacyPattern = "\\.gemini|gemini-3-flash|gemini-3-pro|Gemini-3-Flash|Gemini-3-Pro"
$legacyRefs = New-Object System.Collections.Generic.List[string]
foreach ($f in $scanFiles) {
  try {
    $hits = Select-String -LiteralPath $f -Pattern $legacyPattern -ErrorAction SilentlyContinue
    foreach ($h in $hits) {
      $legacyRefs.Add(("{0}:{1}" -f $f, $h.LineNumber))
    }
  } catch {}
}

$summary = [pscustomobject]@{
  generated_utc = [DateTime]::UtcNow.ToString("o")
  codex_root = $codexRoot
  missing_mandatory_count = $missingMandatory.Count
  missing_fallback_count = $missingFallback.Count
  missing_roots_count = $missingRoots.Count
  legacy_ref_count = $legacyRefs.Count
  trigger_count = $triggerEntries.Count
  semantic_router_row_count = $semanticRouterRowCount
  semantic_router_alias_count = $semanticRouterAliasCount
  trigger_conflict_count = $triggerConflicts.Count
  trigger_conflicts = $triggerConflicts
  duplicate_same_target_trigger_count = $duplicateSameTargetTriggers.Count
  duplicate_same_target_trigger_details_truncated = (-not $Detailed -and $duplicateSameTargetTriggers.Count -gt 5)
  duplicate_same_target_triggers = if ($Detailed) {
    $duplicateSameTargetTriggers
  } else {
    @($duplicateSameTargetTriggers | Select-Object -First 5)
  }
  standalone_ai_trigger_count = $standaloneAiTriggers.Count
  missing_trigger_target_count = $missingTriggerTargets.Count
  missing_trigger_targets = $missingTriggerTargets
  manifest_entry_count = $manifestEntryCount
  missing_manifest_path_count = $missingManifestPaths.Count
  missing_manifest_paths = $missingManifestPaths
  excluded_manifest_path_count = $excludedManifestPaths.Count
  excluded_manifest_paths = $excludedManifestPaths
  invalid_native_skill_count = $invalidNativeSkills.Count
  invalid_native_skills = $invalidNativeSkills
  unclassified_invalid_native_skill_count = $unclassifiedInvalidNativeSkills.Count
  unclassified_invalid_native_skills = $unclassifiedInvalidNativeSkills
  frontmatter_trigger_file_count = $frontmatterTriggerFiles
  frontmatter_alias_file_count = $frontmatterAliasFiles
  frontmatter_contains_file_count = $frontmatterContainsFiles
  missing_mandatory = $missingMandatory
  missing_fallback = $missingFallback
  missing_roots = $missingRoots
  legacy_refs = $legacyRefs
}

if (-not $Quiet) {
  $summary | ConvertTo-Json -Depth 6
}

exit 0

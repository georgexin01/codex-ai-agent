param(
  [switch]$Quiet
)

$ErrorActionPreference = "Stop"

$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$codexRoot = Split-Path -Parent $scriptDir
$configPath = Join-Path $scriptDir "router-config.json"
if (-not (Test-Path -LiteralPath $configPath)) {
  throw "Missing router config: $configPath"
}

$config = Get-Content -LiteralPath $configPath -Raw | ConvertFrom-Json
$manifestPath = Join-Path $scriptDir "codex-manifest.json"
$changesPath = Join-Path $scriptDir "last-changes.json"
$dynamicPath = Join-Path $codexRoot "CODEX_DYNAMIC_ROUTING.md"

function Resolve-RepoPath([string]$relativePath) {
  return Join-Path $codexRoot $relativePath
}

function Test-IsExcluded([string]$fullPath) {
  $relative = ($fullPath.Replace($codexRoot, '').TrimStart('\','/')) -replace '\\','/'
  foreach ($pattern in @($config.exclude)) {
    if (-not $pattern) { continue }
    $normalized = ([string]$pattern -replace '\\','/') -replace '\*\*','*'
    if ($relative -like $normalized) { return $true }
  }
  return $false
}

$excludeAbs = @()
foreach ($ex in @($config.exclude)) {
  if ($ex) { $excludeAbs += (Resolve-RepoPath $ex) }
}

$roots = @()
foreach ($r in $config.roots) {
  $abs = Resolve-RepoPath $r.path
  $roots += [pscustomobject]@{ kind = $r.kind; path = $abs; rel = $r.path }
}

$unavailableRoots = @()
foreach ($r in $roots) {
  if (-not (Test-Path -LiteralPath $r.path)) {
    $unavailableRoots += "ROOT_UNAVAILABLE: $($r.path)"
  }
}

$newEntries = @()
foreach ($root in $roots) {
  if (-not (Test-Path -LiteralPath $root.path)) { continue }
  $files = Get-ChildItem -LiteralPath $root.path -Recurse -Force -File -ErrorAction SilentlyContinue | Where-Object { $_.FullName -notmatch "\\skills\\faucet\\" }
  foreach ($f in $files) {
    if (Test-IsExcluded $f.FullName) { continue }
    $rel = $f.FullName.Substring($root.path.Length).TrimStart('\\')
    $relativeId = ("$($root.rel)/$rel").Replace('\','/')
    $entry = [pscustomobject]@{
      kind = $root.kind
      root_relative = $root.rel
      relative_path = $rel
      relative_id = $relativeId
      size = $f.Length
      sha256 = (Get-FileHash -LiteralPath $f.FullName -Algorithm SHA256).Hash
    }
    $newEntries += $entry
  }
}
$newEntries = @($newEntries | Sort-Object root_relative, relative_path)

$newByPath = @{}
foreach ($e in $newEntries) { $newByPath[$e.relative_id] = $e }

$oldByPath = @{}
if (Test-Path -LiteralPath $manifestPath) {
  try {
    $oldManifest = Get-Content -LiteralPath $manifestPath -Raw | ConvertFrom-Json
    foreach ($e in $oldManifest.entries) {
      $oldKey = if ($e.PSObject.Properties.Name -contains "relative_id" -and $e.relative_id) {
        [string]$e.relative_id
      } elseif ($e.root_relative -and $e.relative_path) {
        ("$($e.root_relative)/$($e.relative_path)").Replace('\','/')
      } else {
        [string]$e.full_path
      }
      if ($oldKey) { $oldByPath[$oldKey] = $e }
    }
  } catch {}
}

$added = New-Object System.Collections.Generic.List[string]
$modified = New-Object System.Collections.Generic.List[string]
$removed = New-Object System.Collections.Generic.List[string]

foreach ($k in $newByPath.Keys) {
  if (-not $oldByPath.ContainsKey($k)) {
    $added.Add($k)
    continue
  }
  if ($newByPath[$k].sha256 -ne $oldByPath[$k].sha256) {
    $modified.Add($k)
  }
}
foreach ($k in $oldByPath.Keys) {
  if (-not $newByPath.ContainsKey($k)) { $removed.Add($k) }
}

$manifest = [pscustomobject]@{
  schema_version = 2
  generator = "codex-router/Update-CodexRouting.ps1"
  config = "codex-router/router-config.json"
  boot_profile = $config.boot_profile
  roots = @($config.roots | ForEach-Object {
    [pscustomobject]@{ kind = $_.kind; path = $_.path }
  })
  indexed_files = $newEntries.Count
  entries = $newEntries
}
$manifest | ConvertTo-Json -Depth 9 | Set-Content -LiteralPath $manifestPath -Encoding UTF8

$changes = [pscustomobject]@{
  schema_version = 2
  added_count = $added.Count
  modified_count = $modified.Count
  removed_count = $removed.Count
  added = $added
  modified = $modified
  removed = $removed
}
$changes | ConvertTo-Json -Depth 6 | Set-Content -LiteralPath $changesPath -Encoding UTF8

$kindCounts = $newEntries | Group-Object kind | Sort-Object Name

# Boot read order (lean): PULSE owns the primary boot contract. The exact first-run
# sentinel additionally reads a compact memory summary and conditional route map;
# linked skill bodies and historical notes remain lazy/deferred.
# The two redirect stubs (BRIDGE, FULL_ACCESS_ROUTING) are superseded by PULSE in boot
# and intentionally excluded here. START_HERE + REASONING remain canonical deferred refs.
$startupReadRel = @(
  "00_PULSE.md",
  "memories/memory_summary.md",
  "memories/2_governance/artifacts/boot_connection_map.md",
  "CODEX_DYNAMIC_ROUTING.md"
)
$deferredReadRel = @(
  "00_CODEX_START_HERE.md",
  "00_REASONING_EVOLUTION_PROTOCOL.md"
)
$mandatoryReadRel = @()
$mandatoryReadRel += $startupReadRel
$mandatoryReadRel += @($config.tier_map.tier_0)
$mandatoryReadRel += @($config.tier_map.tier_1)
$mandatoryReadRel += @($config.tier_map.tier_2)
$mandatoryReadRel = $mandatoryReadRel | Where-Object { $_ -and $_.Trim().Length -gt 0 } | Select-Object -Unique

$fallbackRel = @($config.fallback_chain)

$missingEntries = @()
foreach ($rel in $mandatoryReadRel) {
  $abs = Resolve-RepoPath $rel
  if (-not (Test-Path -LiteralPath $abs)) {
    $missingEntries += "MANDATORY_MISSING: $abs"
  }
}
foreach ($rel in $fallbackRel) {
  $abs = Resolve-RepoPath $rel
  if (-not (Test-Path -LiteralPath $abs)) {
    $missingEntries += "FALLBACK_MISSING: $abs"
  }
}
foreach ($missingRoot in $unavailableRoots) {
  $missingEntries += $missingRoot
}
if ($missingEntries.Count -eq 0) { $missingEntries += "None" }

$legacyRefCount = 0
try {
  $legacyRoots = @(
    (Join-Path $codexRoot "00_CODEX_START_HERE.md"),
    (Join-Path $codexRoot "AGENTS.md"),
    (Join-Path $codexRoot "memories"),
    (Join-Path $codexRoot "skills")
  )
  $legacyFiles = New-Object System.Collections.Generic.List[string]
  foreach ($p in $legacyRoots) {
    if (-not (Test-Path -LiteralPath $p)) { continue }
    $item = Get-Item -LiteralPath $p -ErrorAction SilentlyContinue
    if ($null -eq $item) { continue }
    if ($item.PSIsContainer) {
      $files = Get-ChildItem -LiteralPath $p -Recurse -File -ErrorAction SilentlyContinue |
        Where-Object {
          $_.FullName -notmatch "\\\.git\\" -and
          $_.FullName -notmatch "\\plugins\\cache\\" -and
          $_.FullName -notmatch "\\cache\\" -and
          $_.FullName -notmatch "\\memories\\\.gitnexus\\lbug(\.wal)?$" -and
          @(".md", ".yaml", ".yml", ".json", ".ps1", ".toml", ".txt", ".idx", ".mjs") -contains $_.Extension.ToLowerInvariant()
        }
      foreach ($f in $files) { $legacyFiles.Add($f.FullName) }
    } else {
      $legacyFiles.Add($item.FullName)
    }
  }

  $legacyPattern = "\\.gemini|gemini-3-flash|gemini-3-pro|Gemini-3-Flash|Gemini-3-Pro"
  foreach ($f in ($legacyFiles | Sort-Object -Unique)) {
    try {
      $lines = rg -n $legacyPattern -- "$f" 2>$null
      if ($LASTEXITCODE -eq 0 -and $lines) {
        $legacyRefCount += ($lines | Measure-Object -Line).Lines
      }
    } catch {}
  }
} catch {
  $legacyRefCount = -1
}
$legacyStatus = if ($legacyRefCount -ge 0) { "legacy_refs_detected=$legacyRefCount" } else { "legacy_refs_detected=unknown (rg unavailable)" }

$changedPaths = @()
$changedPaths += ($added | ForEach-Object { "ADDED: $_" })
$changedPaths += ($modified | ForEach-Object { "MODIFIED: $_" })
if ($removed.Count -gt 0) {
  $changedPaths += "REMOVED: $($removed.Count) path(s) omitted from generated history"
}
if ($changedPaths.Count -eq 0) { $changedPaths += "No changes detected." }

$dynamic = @()
$dynamic += "# Codex Dynamic Routing"
$dynamic += ""
$dynamic += "Generated by: codex-router/Update-CodexRouting.ps1"
$dynamic += ""
$dynamic += "Safe indexed files: $($newEntries.Count)"
$dynamic += ""
$dynamic += "## Router Contract"
$dynamic += ""
$dynamic += "- Config: codex-router/router-config.json"
$dynamic += "- Boot profile: $($config.boot_profile)"
$dynamic += "- Knowledge root: $($config.knowledge_root)"
$dynamic += ""
$dynamic += "## Change Summary"
$dynamic += ""
$dynamic += "- Added: $($added.Count)"
$dynamic += "- Modified: $($modified.Count)"
$dynamic += "- Removed: $($removed.Count)"
$dynamic += ""
$dynamic += "## Changed Paths"
$dynamic += ""
foreach ($line in $changedPaths) { $dynamic += "- $line" }
$dynamic += ""
$dynamic += "## Mandatory Read Order"
$dynamic += ""
$dynamic += "Primary boot contract = 00_PULSE.md. On the first exact hydration trigger, also load the compact memory summary and ten-pointer boot connection map; do not preload linked skill bodies or history. Other requests load only their matched route and current project evidence."
$dynamic += ""
foreach ($m in $mandatoryReadRel) { $dynamic += "- $m" }
$dynamic += ""
$dynamic += "## Deferred Read Order (load only when PULSE is insufficient)"
$dynamic += ""
foreach ($d in $deferredReadRel) { $dynamic += "- $d" }
$dynamic += ""
$dynamic += "## Tier Map"
$dynamic += ""
$dynamic += "- Tier-0: $((@($config.tier_map.tier_0) -join ', '))"
$dynamic += "- Tier-1: $((@($config.tier_map.tier_1) -join ', '))"
$dynamic += "- Tier-2: $((@($config.tier_map.tier_2) -join ', '))"
$dynamic += "- Tier-3: $((@($config.tier_map.tier_3) -join ', '))"
$dynamic += ""
$dynamic += "## Fallback Chain"
$dynamic += ""
foreach ($f in $fallbackRel) { $dynamic += "- $f" }
$dynamic += ""
$dynamic += "## Missing Entries"
$dynamic += ""
foreach ($m in $missingEntries) { $dynamic += "- $m" }
$dynamic += ""
$dynamic += "## Legacy Rewrite Status"
$dynamic += ""
$dynamic += "- $legacyStatus"
$dynamic += ""
$dynamic += "## Folder Purpose Map"
$dynamic += ""
$dynamic += "- memories: canonical knowledge, kernels, indexes, rules, governance, and principles."
$dynamic += "- skills: skill workflows and operational playbooks."
$dynamic += ""
$dynamic += "## Indexed Kinds"
$dynamic += ""
foreach ($g in $kindCounts) { $dynamic += "- $($g.Name): $($g.Count) files" }
$dynamic += ""
$dynamic += "## Routing Rules"
$dynamic += ""
$dynamic += "- PRIMARY: resolve every request from 00_PULSE.md trigger map first; stop at first match."
$dynamic += "- For knowledge requests, map user term 'knowledge' to $($config.knowledge_root)."
$dynamic += "- On route-miss: skills -> skill_path_router.md (semantic skill index); knowledge -> grep memories/ by filename + frontmatter."
$dynamic += "- codex-manifest.json is a path/hash integrity index (no descriptions) — use to confirm existence/detect drift, never full-read at boot."
$dynamic += "- Use skill_path_router.md to map intent to skill families."
$dynamic += "- Read only required files; do not hydrate entire trees."
$dynamic += "- Prefer current project files over archive context when conflicts exist."
$dynamic += "- Do not read secret/auth/token/cookie files unless explicitly requested and safe."
$dynamic += ""
$dynamic += "## Manifest"
$dynamic += ""
$dynamic += "- codex-router/codex-manifest.json"
$dynamic += "- codex-router/last-changes.json"

$dynamic -join "`r`n" | Set-Content -LiteralPath $dynamicPath -Encoding UTF8

if (-not $Quiet) {
  Write-Output "Routing updated. Indexed files: $($newEntries.Count)"
}

exit 0

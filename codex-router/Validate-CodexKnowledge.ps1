<#
.SYNOPSIS
  Lightweight, read-only validation for the Codex knowledge and skill route.

.DESCRIPTION
  Checks routed target existence, duplicate frontmatter names, obvious broken
  local Markdown references, inline-secret patterns, and oversized knowledge
  files. It complements Audit-CodexRouting.ps1; it does not replace the full
  validate-knowledge skill.
#>

[CmdletBinding()]
param(
  [string]$CodexRoot = ''
)

$ErrorActionPreference = 'Stop'
if ([string]::IsNullOrWhiteSpace($CodexRoot)) {
  $CodexRoot = Split-Path -Parent $PSScriptRoot
}
$knowledgeRoots = @(
  (Join-Path $CodexRoot 'memories'),
  (Join-Path $CodexRoot 'skills')
)
$markdown = Get-ChildItem -LiteralPath $knowledgeRoots -Recurse -File -Filter '*.md'
$issues = [System.Collections.Generic.List[object]]::new()
$warnings = [System.Collections.Generic.List[object]]::new()
$deferredLarge = 0
$deferredLargeNames = @('MEMORY.md', 'MEMORY_DETAILS.md', 'raw_memories.md', 'supabase-rls-rbac-design.md')

function Add-Issue([string]$Check, [string]$Path, [string]$Message) {
  $script:issues.Add([pscustomobject]@{ check = $Check; path = $Path; message = $Message })
}

function Add-Warning([string]$Check, [string]$Path, [string]$Message) {
  $script:warnings.Add([pscustomobject]@{ check = $Check; path = $Path; message = $Message })
}

# Frontmatter names are the safest stable identity for duplicate detection.
$names = @{}
foreach ($file in $markdown) {
  $text = Get-Content -LiteralPath $file.FullName -Raw
  if ($text -match '(?s)^---\s*(.*?)\s*---') {
    if ($Matches[1] -match '(?m)^name:\s*["'']?([^"''\r\n]+)') {
      $name = $Matches[1].Trim()
      if (-not $names.ContainsKey($name)) { $names[$name] = @() }
      $names[$name] += $file.FullName
    }
  }
  if ($file.Length -gt 50KB) {
    if ($deferredLargeNames -contains $file.Name) {
      $deferredLarge++
    } else {
      Add-Warning 'oversized-knowledge' $file.FullName 'Over 50KB; consider a front door plus deferred references.'
    }
  }
}

foreach ($entry in $names.GetEnumerator()) {
  $primaryFiles = @($entry.Value | Where-Object { $_ -notmatch '[\\/]([^\\/]+)_DETAILS\.md$' })
  if ($primaryFiles.Count -gt 1) {
    Add-Warning 'duplicate-frontmatter-name' ($primaryFiles -join '; ') "Review duplicate name: $($entry.Key)"
  }
}

# Validate paths explicitly present in the authoritative boot/router files.
$routeFiles = @(
  (Join-Path $CodexRoot '00_PULSE.md'),
  (Join-Path $CodexRoot 'memories\2_governance\artifacts\skill_path_router.md')
)
$pathPattern = '(?<![A-Za-z0-9_])(?:skills|memories|codex-router)/[A-Za-z0-9_./-]+\.(?:md|ps1|json)'
foreach ($routeFile in $routeFiles) {
  $routeText = Get-Content -LiteralPath $routeFile -Raw
  foreach ($match in [regex]::Matches($routeText, $pathPattern)) {
    $relative = $match.Value -replace '/', '\'
    if (-not (Test-Path -LiteralPath (Join-Path $CodexRoot $relative))) {
      Add-Issue 'missing-routed-target' $routeFile $match.Value
    }
  }
}

# Scan without printing matched content.
$secretPattern = 'sk-[a-zA-Z0-9_-]{20,}|AQ\.[A-Za-z0-9_-]{20,}|Bearer [A-Za-z0-9_-]{20,}|xox[bapr]-[A-Za-z0-9-]{10,}|ghp_[A-Za-z0-9]{30,}'
$scanExtensions = @('.md', '.json', '.toml', '.ps1', '.js', '.mjs')
foreach ($file in Get-ChildItem -LiteralPath $CodexRoot -Recurse -File) {
  if ($scanExtensions -contains $file.Extension.ToLowerInvariant() -and
      $file.FullName -notmatch '\\sessions\\|\\archived_sessions\\|\\.tmp\\|\\cache\\|\\plugins\\') {
    $text = Get-Content -LiteralPath $file.FullName -Raw -ErrorAction SilentlyContinue
    if ($text -and $text -match $secretPattern) {
      if ($file.Extension -eq '.md') {
        Add-Warning 'secret-like-document-example' $file.FullName 'Secret-like pattern in documentation; inspect safely if this is not an example.'
      } else {
        Add-Issue 'inline-secret-pattern' $file.FullName 'Secret-like pattern detected; inspect safely without printing the value.'
      }
    }
  }
}

# Check secret-like files by metadata only; never read or print their contents.
$secretFiles = @('auth.json', 'cap_sid', 'sandbox_users.json')
$ignoreFiles = @('.gitignore', '.codexignore', '.claudeignore', '.openaiignore') |
  ForEach-Object { Join-Path $CodexRoot $_ } |
  Where-Object { Test-Path -LiteralPath $_ }
$protectedSecretFiles = foreach ($name in $secretFiles) {
  $matches = Get-ChildItem -LiteralPath $CodexRoot -Recurse -File -Filter $name -ErrorAction SilentlyContinue |
    Where-Object { $_.FullName -notmatch '\\sessions\\|\\archived_sessions\\|\\.tmp\\|\\cache\\|\\plugins\\' }
  foreach ($file in $matches) {
    $ignored = $false
    foreach ($ignoreFile in $ignoreFiles) {
      if (Select-String -LiteralPath $ignoreFile -Pattern "(^|[/\\])$([regex]::Escape($name))$" -Quiet) { $ignored = $true; break }
    }
    [pscustomobject]@{ path = $file.FullName.Substring($CodexRoot.Length + 1); ignored = $ignored }
    if (-not $ignored) { Add-Issue 'unignored-secret-file' $file.FullName 'Secret-like file is present but not covered by an ignore file; contents were not read.' }
  }
}

$result = [pscustomobject]@{
  validator = 'Validate-CodexKnowledge.ps1'
  codex_root = $CodexRoot
  markdown_files = $markdown.Count
  duplicate_names = @($warnings | Where-Object check -eq 'duplicate-frontmatter-name').Count
  missing_targets = @($issues | Where-Object check -eq 'missing-routed-target').Count
  inline_secret_patterns = @($issues | Where-Object check -eq 'inline-secret-pattern').Count
  unignored_secret_files = @($issues | Where-Object check -eq 'unignored-secret-file').Count
  deferred_large_files = $deferredLarge
  warnings = $warnings.Count
  issue_count = $issues.Count
  status = if ($issues.Count -eq 0) { 'PASS' } else { 'FAIL' }
  issues = @($issues)
  warning_details = @($warnings)
}
$result | ConvertTo-Json -Depth 5
if ($issues.Count -gt 0) { exit 1 }
exit 0

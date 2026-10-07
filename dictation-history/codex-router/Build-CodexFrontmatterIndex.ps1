param(
  [switch]$Json,
  [switch]$WriteIndex,
  [switch]$Quiet
)

$ErrorActionPreference = 'Stop'
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$codexRoot = Split-Path -Parent $scriptDir
$indexPath = Join-Path $scriptDir 'codex-frontmatter-index.json'
$hotIndexPath = Join-Path $scriptDir 'codex-frontmatter-hot.json'

function Get-RelativePath([string]$FullPath) {
  return ($FullPath.Substring($codexRoot.Length + 1)).Replace('\','/')
}

function Get-Field([string]$Header, [string]$Name) {
  $match = [regex]::Match($Header, "(?m)^\s*$([regex]::Escape($Name))\s*:\s*(.+?)\s*$")
  if (-not $match.Success) { return $null }
  return $match.Groups[1].Value.Trim().Trim('"').Trim("'")
}

function Get-RawField([string]$Header, [string]$Name) {
  $match = [regex]::Match($Header, "(?m)^\s*$([regex]::Escape($Name))\s*:\s*(.+?)\s*$")
  if (-not $match.Success) { return $null }
  return $match.Groups[1].Value.Trim()
}

function Get-EditPolicy([string]$RelativePath) {
  if ($RelativePath -match '(^|/)skills(/|$)') { return 'skill-read-only' }
  if ($RelativePath -match '(^|/)(00_PULSE\.md|AGENTS\.md)$') { return 'protected' }
  if ($RelativePath -match '(^|/)(sessions|rollout_summaries|archive|raw_memories\.md|.+_DETAILS\.md)(/|$)') { return 'cold-history' }
  return 'eligible-maintenance'
}

function Test-Excluded([string]$RelativePath) {
  return $RelativePath -match '(^|/)(\.git|\.tmp|attachments|plugins/cache|sessions|memories/archive|memories/rollout_summaries|memories/raw_memories\.md|memories/.+_DETAILS\.md)(/|$)'
}

$files = Get-ChildItem -LiteralPath $codexRoot -Recurse -Force -File -Filter '*.md' | Sort-Object FullName
$entries = foreach ($file in $files) {
  $relative = Get-RelativePath $file.FullName
  if (Test-Excluded $relative) { continue }

  $lines = [System.IO.File]::ReadAllLines($file.FullName)
  $firstIndex = -1
  for ($i = 0; $i -lt $lines.Length; $i++) {
    if (-not [string]::IsNullOrWhiteSpace($lines[$i])) { $firstIndex = $i; break }
  }

  $top = $firstIndex -ge 0 -and $lines[$firstIndex].Trim() -eq '---'
  $closingIndex = -1
  if ($top) {
    for ($i = $firstIndex + 1; $i -lt $lines.Length; $i++) {
      if ($lines[$i].Trim() -eq '---') { $closingIndex = $i; break }
    }
  }

  $state = if (-not $top) { 'missing' } elseif ($closingIndex -lt 0) { 'unclosed' } else { 'valid' }
  $header = if ($state -eq 'valid') { ($lines[($firstIndex + 1)..($closingIndex - 1)] -join "`n") } else { '' }
  $headerMetadata = @{}
  foreach ($fieldName in @('requires','unlocks','related_docs','applies_to','details','related')) {
    $fieldPattern = "(?ms)^$([regex]::Escape($fieldName))\s*:\s*(.*?)(?=^[A-Za-z_][A-Za-z0-9_-]*\s*:|\z)"
    $fieldMatch = [regex]::Match($header, $fieldPattern)
    $headerMetadata[$fieldName] = if ($fieldMatch.Success -and $fieldMatch.Groups[1].Value.Trim()) { $fieldMatch.Groups[1].Value.Trim() } else { $null }
  }
  $heading = ($lines | Where-Object { $_ -match '^\s{0,3}#\s+(.+?)\s*$' } | Select-Object -First 1)
  $heading = if ($heading) { ([regex]::Match($heading, '^\s{0,3}#\s+(.+?)\s*$')).Groups[1].Value.Trim() } else { $null }
  $hash = (Get-FileHash -LiteralPath $file.FullName -Algorithm SHA256).Hash

  [pscustomobject]@{
    path = $relative
    bytes = [int64]$file.Length
    sha256 = $hash
    modified_utc = $file.LastWriteTimeUtc.ToString('o')
    edit_policy = Get-EditPolicy $relative
    frontmatter_state = $state
    frontmatter_lines = if ($state -eq 'valid') { [int]($closingIndex - $firstIndex + 1) } else { 0 }
    name = Get-Field $header 'name'
    description = Get-Field $header 'description'
    triggers = Get-RawField $header 'triggers'
    aliases = Get-RawField $header 'aliases'
    contains = Get-RawField $header 'contains'
    model_hint = Get-Field $header 'model_hint'
    model_profile = Get-Field $header 'model_profile'
    requires = $headerMetadata['requires']
    unlocks = $headerMetadata['unlocks']
    related_docs = $headerMetadata['related_docs']
    applies_to = $headerMetadata['applies_to']
    details = $headerMetadata['details']
    phase = Get-Field $header 'phase'
    version = Get-Field $header 'version'
    status = Get-Field $header 'status'
    date_updated = Get-Field $header 'date_updated'
    related = $headerMetadata['related']
    heading = $heading
  }
}

$entries = @($entries)
$hotEntries = @(
  $entries |
    Where-Object {
      $_.frontmatter_state -eq 'valid' -and
      $_.edit_policy -ne 'skill-read-only' -and
      ($_.triggers -or $_.aliases)
    } |
    ForEach-Object {
      [pscustomobject]@{
        path = $_.path
        triggers = $_.triggers
        aliases = $_.aliases
      }
    }
)
$report = [pscustomobject]@{
  generated_utc = [DateTime]::UtcNow.ToString('o')
  source_root = $codexRoot
  read_mode = 'full frontmatter-and-integrity catalog; bodies remain lazy; hot route catalog is boot-only'
  hot_index_path = 'codex-router/codex-frontmatter-hot.json'
  hot_entry_count = $hotEntries.Count
  file_count = $entries.Count
  counts = [pscustomobject]@{
    valid = @($entries | Where-Object frontmatter_state -eq 'valid').Count
    missing = @($entries | Where-Object frontmatter_state -eq 'missing').Count
    unclosed = @($entries | Where-Object frontmatter_state -eq 'unclosed').Count
    skill_read_only = @($entries | Where-Object edit_policy -eq 'skill-read-only').Count
    protected = @($entries | Where-Object edit_policy -eq 'protected').Count
    cold_history = @($entries | Where-Object edit_policy -eq 'cold-history').Count
  }
  entries = $entries
}
$hotReport = [pscustomobject]@{
  generated_utc = $report.generated_utc
  source_root = $codexRoot
  read_mode = 'compact route metadata only; full catalog and Markdown bodies remain lazy'
  file_count = $hotEntries.Count
  fields = @('path', 'triggers', 'aliases')
  entries = $hotEntries
}

if ($WriteIndex) {
  $report | ConvertTo-Json -Depth 8 | Set-Content -LiteralPath $indexPath -Encoding UTF8
  $hotReport | ConvertTo-Json -Depth 8 | Set-Content -LiteralPath $hotIndexPath -Encoding UTF8
}

if ($Json) {
  $report | ConvertTo-Json -Depth 8
} elseif (-not $Quiet) {
  $report.counts | Format-List
  Write-Output "Index path: $indexPath"
  Write-Output "Markdown files: $($report.file_count)"
}

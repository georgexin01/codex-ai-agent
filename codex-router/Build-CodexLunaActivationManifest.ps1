[CmdletBinding()]
param(
  [string]$OutputPath
)

$ErrorActionPreference = 'Stop'
$codexRoot = Split-Path -Parent $PSScriptRoot
$skillsRoot = Join-Path $codexRoot 'skills'
$OutputPath = if ([string]::IsNullOrWhiteSpace($OutputPath)) {
  Join-Path $PSScriptRoot 'skill-activation-manifest.json'
} else {
  $OutputPath
}
$excluded = @('\\skills\\.system\\', '\\skills\\normal\\', '/skills/.system/', '/skills/normal/')

function Get-FrontmatterValue([string[]]$Lines, [string]$Key) {
  $line = $Lines | Where-Object { $_ -match "^$([regex]::Escape($Key)):\s*(.+)$" } | Select-Object -First 1
  if ($null -eq $line) { return $null }
  return ($line -replace "^$([regex]::Escape($Key)):\s*", '').Trim().Trim('"')
}

$entries = foreach ($file in Get-ChildItem -LiteralPath $skillsRoot -Recurse -File -Filter '*.md') {
  $normalized = $file.FullName.Replace('\', '/')
  $isExcluded = @($excluded | Where-Object { $normalized -like "*$($_.Replace('\','/'))*" })
  if ($isExcluded.Count -gt 0) { continue }
  $lines = Get-Content -LiteralPath $file.FullName
  if ($lines.Count -eq 0) { continue }
  $relative = $file.FullName.Substring($codexRoot.Length + 1).Replace('\', '/')
  $bytes = [int64]$file.Length
  $tokens = [int][math]::Ceiling($bytes / 4)
  $isFrontDoor = $file.Name -in @('SKILL.md', 'README.md', 'WORKING_PROGRESS.md')
  [pscustomobject]@{
    path = $relative
    name = Get-FrontmatterValue $lines 'name'
    description = Get-FrontmatterValue $lines 'description'
    triggers = Get-FrontmatterValue $lines 'triggers'
    bytes = $bytes
    estimated_tokens = $tokens
    role = if ($isFrontDoor) { 'frontdoor' } else { 'executor-or-reference' }
    recommended_reasoning = if ($tokens -gt 5000) { 'high-or-deferred' } else { 'medium' }
    auto_load = [bool]($isFrontDoor -and $tokens -le 3000)
    do_not_auto_load = [bool](!$isFrontDoor -or $tokens -gt 5000)
  }
}

$manifest = [pscustomobject]@{
  generated_utc = [DateTime]::UtcNow.ToString('o')
  model_profile = 'luna-5.6-medium'
  reasoning_levels = @('medium', 'high')
  budgets = [pscustomobject]@{
    medium_frontdoor_tokens = 3000
    high_deferred_tokens = 18000
  }
  entry_count = @($entries).Count
  entries = @($entries | Sort-Object path)
}

$manifest | ConvertTo-Json -Depth 8 | Set-Content -LiteralPath $OutputPath -Encoding utf8
$manifest

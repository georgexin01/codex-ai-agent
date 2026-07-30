param(
  [int]$MaxBytes = 35840,
  [int]$MaxEstimatedTokens = 8000,
  [switch]$Json
)

$ErrorActionPreference = "Stop"
$codexRoot = Split-Path -Parent $PSScriptRoot
$scanRoots = @($codexRoot, (Join-Path $codexRoot 'memories'), (Join-Path $codexRoot 'rules'), $PSScriptRoot) |
  Where-Object { Test-Path -LiteralPath $_ } |
  Select-Object -Unique
$candidateFiles = foreach ($scanRoot in $scanRoots) {
  if ($scanRoot -eq $codexRoot) {
    Get-ChildItem -LiteralPath $scanRoot -File -Filter '*.md'
  } else {
    Get-ChildItem -LiteralPath $scanRoot -Recurse -File -Filter '*.md'
  }
}
$rows = foreach ($file in ($candidateFiles | Sort-Object FullName -Unique)) {
  $relative = $file.FullName.Substring($codexRoot.Length + 1).Replace('\','/')
  $excludedReason = $null
  if ($relative -match '(^|/)skills(/|$)') { $excludedReason = 'skills-path' }
  elseif ($relative -match '(^|/)(sessions|rollout_summaries|archive|raw_memories\.md|.+_DETAILS\.md)(/|$)') { $excludedReason = 'cold-history' }
  elseif ($relative -match '(^|/)(00_PULSE\.md|AGENTS\.md)$') { $excludedReason = 'protected-hot' }
  elseif ($relative -match '(^|/)(\.git|\.sandbox|\.tmp|cache)(/|$)') { $excludedReason = 'runtime' }
  else {
    $detailsPath = Join-Path $file.DirectoryName ("{0}_DETAILS.md" -f $file.BaseName)
    if (Test-Path -LiteralPath $detailsPath -PathType Leaf) {
      $excludedReason = 'hot-index-with-details'
    }
  }

  $text = [System.IO.File]::ReadAllText($file.FullName)
  $estimatedTokens = [math]::Ceiling($text.Length / 4)
  if ($file.Length -gt $MaxBytes -or $estimatedTokens -gt $MaxEstimatedTokens) {
    [pscustomobject]@{
      path = $relative
      bytes = $file.Length
      estimated_tokens = $estimatedTokens
      eligible = [string]::IsNullOrWhiteSpace($excludedReason)
      excluded_reason = $excludedReason
      action = if ([string]::IsNullOrWhiteSpace($excludedReason)) {
        'run knowledge-compression-protocol'
      } elseif ($excludedReason -eq 'hot-index-with-details') {
        'review index only; complete details preserved'
      } else {
        'report only'
      }
    }
  }
}

$rows = @($rows | Sort-Object @{Expression='eligible';Descending=$true}, @{Expression='bytes';Descending=$true})
if ($Json) { $rows | ConvertTo-Json -Depth 4 } else { $rows | Format-Table -AutoSize }

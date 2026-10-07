[CmdletBinding()]
param(
  [int]$MaxAgeDays = 180,
  [switch]$Json
)

$ErrorActionPreference = 'Stop'
$codexRoot = Split-Path -Parent $PSScriptRoot
$cutoff = (Get-Date).ToUniversalTime().Date.AddDays(-$MaxAgeDays)
$candidateRows = New-Object System.Collections.Generic.List[object]
$missingDateCount = 0
$scan = Get-ChildItem -LiteralPath $codexRoot -Recurse -File -Filter '*.md' |
  Where-Object { $_.FullName -notmatch '\\skills\\|\\archive\\|\\rollout_summaries\\|\\sessions\\|\\.tmp\\|\\attachments\\|\\plugins\\|_DETAILS\.md$|raw_memories\.md$' }

$referenceFiles = @(
  (Join-Path $codexRoot '00_PULSE.md'),
  (Join-Path $codexRoot 'AGENTS.md'),
  (Join-Path $codexRoot 'CODEX_DYNAMIC_ROUTING.md'),
  (Join-Path $codexRoot 'codex-router'),
  (Join-Path $codexRoot 'memories\2_governance')
)
$referenceFiles = @($referenceFiles | ForEach-Object {
  if (Test-Path -LiteralPath $_ -PathType Container) {
    Get-ChildItem -LiteralPath $_ -Recurse -File -ErrorAction SilentlyContinue
  } elseif (Test-Path -LiteralPath $_ -PathType Leaf) {
    Get-Item -LiteralPath $_
  }
} | Where-Object { @('.md','.json','.ps1','.yaml','.yml','.txt') -contains $_.Extension.ToLowerInvariant() } | Sort-Object -Property FullName -Unique)

foreach ($file in $scan) {
  $text = Get-Content -LiteralPath $file.FullName -Raw
  $relative = $file.FullName.Substring($codexRoot.Length + 1).Replace('\','/')
  $dateMatch = [regex]::Match($text, '(?m)^date_updated:\s*["'']?(?<date>\d{4}-\d{2}-\d{2})')
  if (-not $dateMatch.Success) { $missingDateCount++; continue }
  try { $date = [datetime]::ParseExact($dateMatch.Groups['date'].Value, 'yyyy-MM-dd', $null).ToUniversalTime().Date } catch { $date = $null }
  $state = if ($null -eq $date) { 'invalid-date' } elseif ($date -lt $cutoff) { 'stale' } else { 'current' }
  if ($state -notin @('stale','invalid-date')) { continue }

  $needleVariants = @($relative, $relative.Replace('/','\\'))
  $refs = New-Object System.Collections.Generic.List[string]
  foreach ($refFile in $referenceFiles) {
    if ($refFile.FullName -eq $file.FullName) { continue }
    $refText = Get-Content -LiteralPath $refFile.FullName -Raw
    if ($needleVariants | Where-Object { $refText.Contains($_) }) {
      $refs.Add($refFile.FullName.Substring($codexRoot.Length + 1).Replace('\','/'))
    }
  }
  $candidateRows.Add([pscustomobject]@{
    path = $relative
    state = $state
    referenced = ($refs.Count -gt 0)
    reference_count = $refs.Count
    references = @($refs)
    action = 'manual-review-only'
  })
}

$summary = [pscustomobject]@{
  audit = 'Propose-CodexStaleQuarantine.ps1'
  generated_utc = [DateTime]::UtcNow.ToString('o')
  max_age_days = $MaxAgeDays
  cutoff_utc = $cutoff.ToString('yyyy-MM-dd')
  scanned_files = $scan.Count
  missing_date_review_count = $missingDateCount
  candidate_count = $candidateRows.Count
  deletion_performed = $false
  move_performed = $false
  action_policy = 'manual-review-only'
  status = if ($candidateRows.Count -eq 0) { 'NO_CANDIDATES' } else { 'REVIEW' }
  candidates = $candidateRows
}
if ($Json) { $summary | ConvertTo-Json -Depth 8 } else { $summary | Format-List }
exit 0

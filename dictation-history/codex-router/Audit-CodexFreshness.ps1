[CmdletBinding()]
param(
  [int]$MaxAgeDays = 180,
  [switch]$Json
)

$ErrorActionPreference = 'Stop'
$codexRoot = Split-Path -Parent $PSScriptRoot
$cutoff = (Get-Date).ToUniversalTime().Date.AddDays(-$MaxAgeDays)
$rows = New-Object System.Collections.Generic.List[object]

$files = Get-ChildItem -LiteralPath $codexRoot -Recurse -File -Filter '*.md' |
  Where-Object {
    $_.FullName -notmatch '\\skills\\|\\archive\\|\\rollout_summaries\\|\\sessions\\|\\.tmp\\|\\attachments\\|\\plugins\\|_DETAILS\.md$|raw_memories\.md$'
  }

foreach ($file in $files) {
  $text = Get-Content -LiteralPath $file.FullName -Raw
  $relative = $file.FullName.Substring($codexRoot.Length + 1).Replace('\','/')
  $dateMatch = [regex]::Match($text, '(?m)^date_updated:\s*["'']?(?<date>\d{4}-\d{2}-\d{2})')
  $state = if (-not $dateMatch.Success) {
    'missing-date'
  } else {
    try {
      $date = [datetime]::ParseExact($dateMatch.Groups['date'].Value, 'yyyy-MM-dd', $null).ToUniversalTime().Date
      if ($date -lt $cutoff) { 'stale' } else { 'current' }
    } catch {
      'invalid-date'
    }
  }
  $rows.Add([pscustomobject]@{ path = $relative; bytes = [int64]$file.Length; state = $state })
}

$summary = [pscustomobject]@{
  audit = 'Audit-CodexFreshness.ps1'
  max_age_days = $MaxAgeDays
  cutoff_utc = $cutoff.ToString('yyyy-MM-dd')
  scanned_files = $rows.Count
  current = @($rows | Where-Object state -eq 'current').Count
  stale = @($rows | Where-Object state -eq 'stale').Count
  missing_date = @($rows | Where-Object state -eq 'missing-date').Count
  invalid_date = @($rows | Where-Object state -eq 'invalid-date').Count
  status = if (@($rows | Where-Object { $_.state -in @('stale','invalid-date') }).Count -eq 0) { 'PASS' } else { 'REVIEW' }
  findings = @($rows | Where-Object { $_.state -in @('stale','invalid-date') } | Sort-Object state,path)
}

if ($Json) { $summary | ConvertTo-Json -Depth 6 } else { $summary | Format-List }
if ($summary.status -eq 'REVIEW') { exit 1 }
exit 0

[CmdletBinding()]
param(
  [ValidateRange(1, 500)]
  [int]$Last = 30,
  [switch]$Json
)

$ErrorActionPreference = 'Stop'
$logPath = Join-Path $PSScriptRoot 'knowledge-usage.jsonl'
if (-not (Test-Path -LiteralPath $logPath)) {
  $report = [pscustomobject]@{ log_path = $logPath; event_count = 0; events = @(); frequent_paths = @() }
} else {
  $records = @(
    Get-Content -LiteralPath $logPath | Where-Object { -not [string]::IsNullOrWhiteSpace($_) } |
      ForEach-Object { try { $_ | ConvertFrom-Json } catch { $null } } |
      Where-Object { $null -ne $_ }
  )
  $frequentPaths = @(
    $records | Where-Object event -eq 'knowledge_resource_access' | ForEach-Object { $_.paths } |
      Group-Object | Sort-Object Count -Descending | Select-Object -First 20 |
      ForEach-Object { [pscustomobject]@{ path = $_.Name; count = $_.Count } }
  )
  $report = [pscustomobject]@{
    log_path = $logPath
    event_count = $records.Count
    event_counts = @($records | Group-Object event | ForEach-Object { [pscustomobject]@{ event = $_.Name; count = $_.Count } })
    frequent_paths = $frequentPaths
    events = @($records | Select-Object -Last $Last)
    privacy = 'No raw prompts, tool results, or session identifiers are stored.'
  }
}

if ($Json) {
  $report | ConvertTo-Json -Depth 6
} else {
  $report | Format-List log_path, event_count, privacy
  if ($report.event_counts) { $report.event_counts | Format-Table -AutoSize }
  if ($report.frequent_paths) { $report.frequent_paths | Format-Table -AutoSize }
  if ($report.events) { $report.events | Format-List }
}

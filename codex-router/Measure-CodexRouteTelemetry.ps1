param(
  [string]$Trigger,
  [switch]$Json
)

$ErrorActionPreference = "Stop"

$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$codexRoot = Split-Path -Parent $scriptDir
$pulsePath = Join-Path $codexRoot "00_PULSE.md"
$semanticRouterPath = Join-Path $codexRoot "memories\2_governance\artifacts\skill_path_router.md"

function Add-Route([System.Collections.Generic.List[object]]$Routes, [string]$Phrase, [string]$Target, [string]$Source) {
  if ([string]::IsNullOrWhiteSpace($Phrase) -or [string]::IsNullOrWhiteSpace($Target)) { return }
  $Routes.Add([pscustomobject]@{
    trigger = $Phrase.Trim().ToLowerInvariant()
    target = $Target.Trim()
    source = $Source
  })
}

$routes = New-Object System.Collections.Generic.List[object]
foreach ($hit in (Select-String -LiteralPath $pulsePath -Pattern '^\s*"([^"]+)"\s*:\s*"([^"]+)"')) {
  Add-Route $routes $hit.Matches[0].Groups[1].Value $hit.Matches[0].Groups[2].Value "00_PULSE.md"
}
foreach ($hit in (Select-String -LiteralPath $semanticRouterPath -Pattern '^\s*\|\s*`([^`]+)`\s*\|\s*`([^`]+)`')) {
  Add-Route $routes $hit.Matches[0].Groups[1].Value $hit.Matches[0].Groups[2].Value "skill_path_router.md"
}

# The knowledge sentinel is an instruction, but its real read target is PULSE.
Add-Route $routes "ai read .codex knowledge" "00_PULSE.md" "sentinel"

$pathRoutes = @($routes | Where-Object { $_.target -match '^(00_[^/\\]+\.md|CODEX_[^/\\]+\.md|skills[/\\]|memories[/\\]|codex-router[/\\])' })
$uniqueRoutes = @($pathRoutes | Group-Object { "$($_.trigger)|$($_.target)" } | ForEach-Object { $_.Group[0] })
$routeRows = New-Object System.Collections.Generic.List[object]
foreach ($route in $uniqueRoutes) {
  $targetPath = Join-Path $codexRoot $route.target
  $exists = Test-Path -LiteralPath $targetPath -PathType Leaf
  $bytes = if ($exists) { (Get-Item -LiteralPath $targetPath).Length } else { 0 }
  $lines = if ($exists) { (Get-Content -LiteralPath $targetPath).Count } else { 0 }
  $routeRows.Add([pscustomobject]@{
    trigger = $route.trigger
    target = $route.target
    source = $route.source
    exists = $exists
    bytes = [int64]$bytes
    lines = [int]$lines
    estimated_tokens = [int][math]::Ceiling($bytes / 4)
  })
}

$allRows = @($routeRows.ToArray())
$selected = $null
if (-not [string]::IsNullOrWhiteSpace($Trigger)) {
  $selected = $allRows | Sort-Object { $_.trigger.Length } -Descending | Where-Object { $_.trigger -eq $Trigger.Trim().ToLowerInvariant() } | Select-Object -First 1
}

$rows = if ($null -ne $selected) { @($selected) } else { $allRows }
$summary = [pscustomobject]@{
  generated_utc = [DateTime]::UtcNow.ToString("o")
  model_profile = "luna-5.6-medium"
  selected_trigger = if ($Trigger) { $Trigger.Trim() } else { $null }
  route_count = $rows.Count
  missing_target_count = @($rows | Where-Object { -not $_.exists }).Count
  total_bytes = [int64](($rows | Measure-Object -Property bytes -Sum).Sum)
  estimated_tokens = [int](($rows | Measure-Object -Property estimated_tokens -Sum).Sum)
  routes = $rows
}

if ($Json) {
  $summary | ConvertTo-Json -Depth 8
} else {
  "Codex Route Telemetry ($($summary.model_profile))"
  "Routes: $($summary.route_count)"
  "Missing targets: $($summary.missing_target_count)"
  "Bytes: $($summary.total_bytes)"
  "Estimated tokens: $($summary.estimated_tokens)"
  if ($Trigger) {
    foreach ($row in $rows) { "$($row.trigger) -> $($row.target) | $($row.bytes) bytes | ~$($row.estimated_tokens) tokens" }
  }
}

if ($summary.missing_target_count -gt 0) { exit 1 }

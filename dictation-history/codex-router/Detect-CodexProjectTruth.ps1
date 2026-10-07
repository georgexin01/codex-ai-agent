[CmdletBinding()]
param(
  [string]$StartPath = (Get-Location).Path,
  [switch]$Json
)

$ErrorActionPreference = 'Stop'
$truthFiles = @('PROJECT_CONTEXT.md', 'AI_START_HERE.md', 'BLUEPRINT.md', 'AGENTS.md', 'DESIGN.md', 'DATABASE.md')
$resolved = (Resolve-Path -LiteralPath $StartPath).Path
$roots = New-Object System.Collections.Generic.List[string]
$cursor = Get-Item -LiteralPath $resolved
while ($null -ne $cursor) {
  $roots.Add($cursor.FullName)
  $cursor = $cursor.Parent
}

$found = foreach ($root in $roots) {
  foreach ($name in $truthFiles) {
    $path = Join-Path $root $name
    if (Test-Path -LiteralPath $path -PathType Leaf) {
      $item = Get-Item -LiteralPath $path
      [pscustomobject]@{
        path = $item.FullName
        file = $name
        priority = [array]::IndexOf($truthFiles, $name)
        bytes = [int64]$item.Length
        estimated_tokens = [int][math]::Ceiling($item.Length / 4)
      }
    }
  }
}

$result = [pscustomobject]@{
  generated_utc = [DateTime]::UtcNow.ToString('o')
  start_path = $resolved
  project_root_candidates = @($roots)
  found = @($found)
  selected_project_context = @($found | Where-Object { $_.file -eq 'PROJECT_CONTEXT.md' } | Select-Object -First 1).path
  status = if (@($found).Count -gt 0) { 'FOUND' } else { 'MISSING' }
}

if ($Json) { $result | ConvertTo-Json -Depth 8 } else { $result | Format-List }

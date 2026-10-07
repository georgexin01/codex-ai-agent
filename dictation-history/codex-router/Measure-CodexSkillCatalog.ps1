param(
  [int]$ReferenceDescriptionBudget = 8000,
  [switch]$Json
)

$ErrorActionPreference = "Stop"

$codexRoot = Split-Path -Parent $PSScriptRoot
$userRoot = Split-Path -Parent $codexRoot
$scanRoots = @(
  [pscustomobject]@{ scope = "local"; path = (Join-Path $codexRoot "skills") },
  [pscustomobject]@{ scope = "user"; path = (Join-Path $userRoot ".agents\skills") },
  [pscustomobject]@{ scope = "plugin"; path = (Join-Path $codexRoot "plugins\cache") }
)

$rows = New-Object System.Collections.Generic.List[object]
foreach ($scanRoot in $scanRoots) {
  if (-not (Test-Path -LiteralPath $scanRoot.path -PathType Container)) { continue }
  foreach ($file in (Get-ChildItem -LiteralPath $scanRoot.path -Recurse -File -ErrorAction SilentlyContinue |
    Where-Object { $_.Name -ceq "SKILL.md" })) {
    $normalizedPath = $file.FullName.Replace('\','/')
    if ($scanRoot.scope -eq "local" -and $normalizedPath -match '/skills/normal/') { continue }
    $text = Get-Content -LiteralPath $file.FullName -Raw
    $frontmatter = [regex]::Match($text, '(?s)\A---\s*\r?\n(?<body>.*?)\r?\n---').Groups["body"].Value
    $nameMatch = [regex]::Match($frontmatter, '(?m)^name:\s*["'']?(?<value>[^\r\n"'']+)')
    $descriptionMatch = [regex]::Match($frontmatter, '(?m)^description:\s*["'']?(?<value>[^\r\n]+)')
    $name = if ($nameMatch.Success) { $nameMatch.Groups["value"].Value.Trim().TrimEnd('"','''') } else { $null }
    $description = if ($descriptionMatch.Success) { $descriptionMatch.Groups["value"].Value.Trim().TrimEnd('"','''') } else { $null }
    $rows.Add([pscustomobject]@{
      scope = $scanRoot.scope
      path = $file.FullName
      name = $name
      description = $description
      description_chars = if ($description) { $description.Length } else { 0 }
      valid_native = -not [string]::IsNullOrWhiteSpace($name) -and -not [string]::IsNullOrWhiteSpace($description)
      has_openai_yaml = Test-Path -LiteralPath (Join-Path $file.DirectoryName "agents\openai.yaml") -PathType Leaf
    })
  }
}

$validRows = @($rows | Where-Object valid_native)
$uniqueRows = @($validRows |
  Group-Object { ([string]$_.name).ToLowerInvariant() } |
  ForEach-Object { $_.Group[0] })
$summary = [pscustomobject]@{
  reference_description_budget = $ReferenceDescriptionBudget
  runtime_exposure = "unknown; installed inventory is not the per-session initial skill list"
  scanned_skill_files = $rows.Count
  valid_skill_files = $validRows.Count
  unique_skill_names = $uniqueRows.Count
  installed_unique_description_chars = [int](($uniqueRows | Measure-Object -Property description_chars -Sum).Sum)
  files_with_openai_yaml = @($validRows | Where-Object has_openai_yaml).Count
  invalid_native_candidate_count = @($rows | Where-Object { -not $_.valid_native }).Count
  invalid_native_candidates = @($rows |
    Where-Object { -not $_.valid_native } |
    Select-Object scope, path)
  scope_counts = @($validRows | Group-Object scope | Sort-Object Name | ForEach-Object {
    [pscustomobject]@{ scope = $_.Name; count = $_.Count }
  })
}

if ($Json) {
  $summary | ConvertTo-Json -Depth 6
} else {
  "Codex Skill Catalog Telemetry"
  "Valid skill files: $($summary.valid_skill_files)"
  "Unique skill names: $($summary.unique_skill_names)"
  "Installed unique description chars: $($summary.installed_unique_description_chars)"
  "Reference initial-list budget: $ReferenceDescriptionBudget"
  "Invalid native candidates: $($summary.invalid_native_candidate_count)"
  "Note: $($summary.runtime_exposure)"
}

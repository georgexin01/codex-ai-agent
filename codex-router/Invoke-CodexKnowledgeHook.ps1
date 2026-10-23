[CmdletBinding()]
param(
  [Parameter(Mandatory)]
  [ValidateSet('UserPromptSubmit', 'PostToolUse')]
  [string]$Event,
  [switch]$DryRun,
  [string]$InputJson
)

$ErrorActionPreference = 'Stop'
[Console]::InputEncoding = [System.Text.UTF8Encoding]::new($false)
[Console]::OutputEncoding = [System.Text.UTF8Encoding]::new($false)

$codexRoot = Split-Path -Parent $PSScriptRoot
$usageLog = Join-Path $PSScriptRoot 'knowledge-usage.jsonl'

function Write-UsageEvent([hashtable]$Record) {
  $Record['timestamp_utc'] = [DateTime]::UtcNow.ToString('o')
  $line = $Record | ConvertTo-Json -Depth 5 -Compress
  if ($DryRun) {
    [Console]::Error.WriteLine("DRY_RUN_USAGE_EVENT $line")
    return
  }
  [System.IO.File]::AppendAllText($usageLog, $line + [Environment]::NewLine, [System.Text.UTF8Encoding]::new($false))
}

function Write-HookContext([string]$Context) {
  $payload = @{
    hookSpecificOutput = @{
      hookEventName = $Event
      additionalContext = $Context
    }
  }
  Write-Output ($payload | ConvertTo-Json -Depth 5 -Compress)
}

function Get-TriggerContext {
  $agentsPath = Join-Path $codexRoot 'AGENTS.md'
  $principlesPath = Join-Path $codexRoot 'memories/extensions/ad_hoc/notes/2026-07-01T18-14-43-5-point-ai-principles.md'
  $summaryPath = Join-Path $codexRoot 'memories/memory_summary.md'
  $mapPath = Join-Path $codexRoot 'memories/2_governance/artifacts/boot_connection_map.md'
  foreach ($path in @($agentsPath, $principlesPath, $summaryPath, $mapPath)) {
    if (-not (Test-Path -LiteralPath $path)) { throw "Required hydration source is missing: $path" }
  }

  $utf8 = [System.Text.UTF8Encoding]::new($false)
  $agents = [System.IO.File]::ReadAllText($agentsPath, $utf8)
  $principles = [System.IO.File]::ReadAllText($principlesPath, $utf8)
  $summary = [System.IO.File]::ReadAllText($summaryPath, $utf8)
  $map = [System.IO.File]::ReadAllText($mapPath, $utf8)
  $priority = [regex]::Match($agents, '(?ms)^## 2\. Priority order\s*\r?\n(.*?)(?=^##\s|\z)')
  $taskClass = [regex]::Match($agents, '(?ms)^## 3\. Task classification\s*\r?\n(.*?)(?=^##\s|\z)')
  $evidence = [regex]::Match($agents, '(?ms)^## 5\. Evidence and verification\s*\r?\n(.*?)(?=^##\s|\z)')
  if (-not $priority.Success -or -not $taskClass.Success -or -not $evidence.Success) {
    throw 'Required AGENTS.md principle sections are missing.'
  }
  $match = [regex]::Match(
    $map,
    '(?ms)^## Ten second-stage recommendations\s*\r?\n(.*?)(?=^##?\s|\z)'
  )
  if (-not $match.Success) { throw 'The second-stage recommendation section is missing.' }

  return @"
Compact .codex context is hydrated for this conversation. Treat memories as retrieval pointers; verify current project truth before acting. Do not bulk-load linked memories or skill bodies. For later .codex exploration, follow the canonical skill path router and knowledge relation router, then open only matching files. After substantial work, review verified outcomes and relevant usage paths for a reusable lesson; update a memory only when it adds durable evidence, and create or revise a skill only for a proven repeatable workflow.

## Governing principles from global AGENTS.md
Apply the following authoritative sections to every task: Priority order, Task classification, and Evidence and verification. The global AGENTS.md remains the source of truth; this excerpt is a trigger-time reminder.
$($priority.Groups[1].Value.Trim())
$($taskClass.Groups[1].Value.Trim())
$($evidence.Groups[1].Value.Trim())

## Personal five-point principles
$principles.Trim()

## Compact memory summary
$summary

## Ten second-stage recommendations
$($match.Groups[1].Value.Trim())

Directory previews: codex-router/codex-frontmatter-hot.json and codex-router/codex-frontmatter-index.json. Skill activation catalog: codex-router/skill-activation-manifest.json. Use them to locate candidates; read a target body only when relevant.

Keep the exact visible trigger reply defined in 00_PULSE.md. This hook adds hidden context only.
"@.Trim()
}

$rawInput = if ($PSBoundParameters.ContainsKey('InputJson')) { $InputJson } else { [Console]::In.ReadToEnd() }
if ([string]::IsNullOrWhiteSpace($rawInput)) { exit 0 }

try { $hookInput = $rawInput | ConvertFrom-Json } catch { exit 0 }

if ($Event -eq 'UserPromptSubmit') {
  $prompt = [string]$hookInput.prompt
  if ($prompt.Trim() -match '^(?i:ai read \.codex knowledge)$') {
    $sources = @(
      'AGENTS.md#Priority order, Task classification, Evidence and verification',
      'memories/extensions/ad_hoc/notes/2026-07-01T18-14-43-5-point-ai-principles.md',
      'memories/memory_summary.md',
      'memories/2_governance/artifacts/boot_connection_map.md#Ten second-stage recommendations',
      'codex-router/codex-frontmatter-hot.json',
      'codex-router/skill-activation-manifest.json'
    )
    $context = Get-TriggerContext
    Write-UsageEvent @{ event = 'knowledge_hydration'; sources = $sources }
    Write-HookContext $context
    exit 0
  }

  if ($prompt -match '(?i)(\.codex|memories|skills|knowledge|记忆|技能|知识库|路由)') {
    $topics = [System.Collections.Generic.List[string]]::new()
    foreach ($pair in @(
      @('memory', '(?i)(memory|memories|记忆)'),
      @('skills', '(?i)(skill|skills|技能)'),
      @('routing', '(?i)(router|routing|路由)'),
      @('history', '(?i)(history|rollout|历史|记录)'),
      @('maintenance', '(?i)(maintenance|health|维护|优化|知识库)')
    )) {
      if ($prompt -match $pair[1]) { $topics.Add($pair[0]) }
    }
    Write-UsageEvent @{ event = 'knowledge_request'; topics = @($topics | Select-Object -Unique) }
  }
  exit 0
}

$toolName = [string]$hookInput.tool_name
if ($toolName -notmatch '^(Read|exec_command|Bash)$') { exit 0 }
$toolInput = $hookInput.tool_input | ConvertTo-Json -Depth 12 -Compress
if ($toolName -ne 'Read' -and $toolInput -notmatch '(?i)(Get-Content|Select-String|rg\s|\btype\s|\bcat\s)') { exit 0 }

$cwd = [string]$hookInput.cwd
$relativePaths = [System.Collections.Generic.HashSet[string]]::new([System.StringComparer]::OrdinalIgnoreCase)
$candidatePattern = '(?i)(?:[A-Z]:[\\/][^"''<>|\r\n]*?\.codex[\\/](?:memories|skills|codex-router)[\\/][^"''<>|\r\n ]+|(?:memories|skills|codex-router)[\\/][^"''<>|\r\n ]+\.(?:md|json|ps1))'
foreach ($match in [regex]::Matches($toolInput, $candidatePattern)) {
  $candidate = $match.Value.Trim().TrimEnd('.', ',', ';', ')', ']')
  if ([IO.Path]::IsPathRooted($candidate)) {
    $fullPath = [IO.Path]::GetFullPath($candidate)
    $rootPrefix = [IO.Path]::GetFullPath($codexRoot).TrimEnd('\') + '\'
    if (-not $fullPath.StartsWith($rootPrefix, [StringComparison]::OrdinalIgnoreCase)) { continue }
    $relative = $fullPath.Substring($rootPrefix.Length).Replace('\', '/')
  } else {
    if ([string]::IsNullOrWhiteSpace($cwd)) { continue }
    $cwdFull = [IO.Path]::GetFullPath($cwd).TrimEnd('\') + '\'
    $rootFull = [IO.Path]::GetFullPath($codexRoot).TrimEnd('\') + '\'
    if (-not $cwdFull.StartsWith($rootFull, [StringComparison]::OrdinalIgnoreCase) -and
        -not $rootFull.StartsWith($cwdFull, [StringComparison]::OrdinalIgnoreCase)) { continue }
    $relative = $candidate.Replace('\', '/')
  }
  if ($relative -match '^(memories|skills|codex-router)/') { [void]$relativePaths.Add($relative) }
}

if ($relativePaths.Count -gt 0) {
  Write-UsageEvent @{ event = 'knowledge_resource_access'; tool = $toolName; paths = @($relativePaths | Sort-Object) }
}

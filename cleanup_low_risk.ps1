param(
    [switch]$Execute
)

$ErrorActionPreference = 'Stop'
$root = [System.IO.Path]::GetFullPath((Split-Path -Parent $MyInvocation.MyCommand.Path))

# These user-maintained and runtime folders must never be cleanup targets.
$protectedRelPaths = @(
    'automations',
    'codex-router',
    'mcp-oauth-locks',
    'memories',
    'rules',
    'skills',
    'tasks',
    'thread-writer-locks',
    'sessions',
    'rollout-migrations',
    '.claude',
    '.github',
    '.githooks'
)

# Only transient caches remain eligible, and only with the explicit -Execute switch.
$relPaths = @(
    '.tmp',
    'tmp',
    'cache',
    'models_cache.json'
)

$rootPrefix = $root.TrimEnd('\') + '\'
$fullPaths = foreach ($rel in $relPaths) {
    $candidate = [System.IO.Path]::GetFullPath((Join-Path $root $rel))
    if (-not $candidate.StartsWith($rootPrefix, [System.StringComparison]::OrdinalIgnoreCase)) {
        throw "Refusing path outside .codex root: $candidate"
    }

    foreach ($protectedRel in $protectedRelPaths) {
        $protected = [System.IO.Path]::GetFullPath((Join-Path $root $protectedRel)).TrimEnd('\')
        $target = $candidate.TrimEnd('\')
        $overlapsProtected =
            ($target -eq $protected) -or
            $target.StartsWith(($protected + '\'), [System.StringComparison]::OrdinalIgnoreCase) -or
            $protected.StartsWith(($target + '\'), [System.StringComparison]::OrdinalIgnoreCase)

        if ($overlapsProtected) {
            throw "Refusing cleanup target that overlaps protected path '$protectedRel': $candidate"
        }
    }

    $candidate
}

$existing = @($fullPaths | Where-Object { Test-Path -LiteralPath $_ })
if ($existing.Count -eq 0) {
    Write-Output 'No eligible cache files or folders found.'
    return 0
}

Write-Output 'Eligible transient items:'
$existing | ForEach-Object { Write-Output " - $_" }

if (-not $Execute) {
    Write-Output 'DRY RUN: no changes made. Use -Execute only when removal of these cache paths is intended.'
    return 0
}

# Keep recovery archives outside .codex and outside every cleanup target.
$archiveDir = Join-Path $env:LOCALAPPDATA 'CodexDataRecovery\LowRiskCleanup'
New-Item -Path $archiveDir -ItemType Directory -Force | Out-Null
$ts = Get-Date -Format 'yyyyMMdd-HHmmss'
$archivePath = Join-Path $archiveDir "cleanup-archive-$ts.zip"

try {
    Compress-Archive -LiteralPath $existing -DestinationPath $archivePath -ErrorAction Stop
    $archive = Get-Item -LiteralPath $archivePath -ErrorAction Stop
    if ($archive.Length -le 0) {
        throw 'The recovery archive is empty.'
    }
}
catch {
    Write-Error "Archive verification failed; originals were not removed. $($_.Exception.Message)"
    exit 1
}

Write-Output "Verified recovery archive: $archivePath"
foreach ($path in $existing) {
    Remove-Item -LiteralPath $path -Recurse -Force -ErrorAction Stop
    Write-Output "Removed transient cache: $path"
}

Write-Output 'Cleanup complete. Protected folders were excluded and the verified archive is outside .codex.'

$ErrorActionPreference = 'Stop'

$codexRoot = 'C:\Users\user\.codex'
$recoveryRoot = Join-Path $env:LOCALAPPDATA 'CodexDataRecovery'
$snapshotRoot = Join-Path $recoveryRoot 'Snapshots'
$logPath = Join-Path $recoveryRoot 'backup.log'
$fingerprintPath = Join-Path $recoveryRoot 'latest-fingerprint.txt'

# Durable content to version outside .codex. Runtime/auth state is deliberately excluded.
$protectedDirs = @(
    'automations',
    'codex-router',
    'memories',
    'rules',
    'skills',
    'tasks',
    'rollout-migrations',
    '.claude',
    '.github',
    '.githooks'
)
$protectedFiles = @(
    '00_PULSE.md',
    'AGENTS.md',
    'NO_DELETE.txt',
    'config.toml',
    '.codexignore',
    '.gitignore',
    'cleanup_low_risk.ps1'
)
$runtimeLockDirs = @('mcp-oauth-locks', 'thread-writer-locks')
$excludedFileName = '(?i)^(auth\.json|cap_sid|.*\.sqlite(?:-.*)?|.*\.lock|\.env(?:\..*)?)$'

New-Item -ItemType Directory -Path $recoveryRoot,$snapshotRoot -Force | Out-Null

function Write-BackupLog([string]$Message) {
    Add-Content -LiteralPath $logPath -Value "$(Get-Date -Format 'yyyy-MM-dd HH:mm:ss') $Message" -Encoding UTF8
}

$missingDirs = @($protectedDirs | Where-Object { -not (Test-Path -LiteralPath (Join-Path $codexRoot $_) -PathType Container) })
if ($missingDirs.Count -gt 0) {
    Write-BackupLog "ERROR protected directories missing; kept previous snapshot; no snapshot written: $($missingDirs -join ', ')"
    exit 2
}

$sourceFiles = @()
foreach ($relDir in $protectedDirs) {
    $baseDir = Join-Path $codexRoot $relDir
    $files = Get-ChildItem -LiteralPath $baseDir -Force -Recurse -File -ErrorAction Stop
    foreach ($file in $files) {
        $relative = $file.FullName.Substring($codexRoot.Length + 1)
        if ($relative -match '(?i)(^|\\)\.git(\\|$)' -or $file.Name -match $excludedFileName) {
            continue
        }
        $hash = (Get-FileHash -LiteralPath $file.FullName -Algorithm SHA256).Hash
        $sourceFiles += [pscustomobject]@{ RelativePath = $relative; Length = $file.Length; SHA256 = $hash }
    }
}

foreach ($relFile in $protectedFiles) {
    $path = Join-Path $codexRoot $relFile
    if (Test-Path -LiteralPath $path -PathType Leaf) {
        $item = Get-Item -LiteralPath $path
        $hash = (Get-FileHash -LiteralPath $path -Algorithm SHA256).Hash
        $sourceFiles += [pscustomobject]@{ RelativePath = $relFile; Length = $item.Length; SHA256 = $hash }
    }
}

$emptyCoreDirs = @('automations','codex-router','memories','rules','skills','tasks' | Where-Object {
    $dir = Join-Path $codexRoot $_
    -not (Get-ChildItem -LiteralPath $dir -Force -Recurse -File -ErrorAction Stop | Where-Object { $_.Name -notmatch $excludedFileName } | Select-Object -First 1)
})
if ($emptyCoreDirs.Count -gt 0) {
    Write-BackupLog "ERROR core directories are empty; kept previous snapshot; no snapshot written: $($emptyCoreDirs -join ', ')"
    exit 3
}

$sourceFiles = @($sourceFiles | Sort-Object RelativePath)
$manifestText = ($sourceFiles | ForEach-Object { '{0}|{1}|{2}' -f $_.RelativePath,$_.Length,$_.SHA256 }) -join "`n"
$sha256 = [System.Security.Cryptography.SHA256]::Create()
try {
    $fingerprintBytes = $sha256.ComputeHash([System.Text.Encoding]::UTF8.GetBytes($manifestText))
}
finally {
    $sha256.Dispose()
}
$fingerprint = ([System.BitConverter]::ToString($fingerprintBytes) -replace '-', '').ToLowerInvariant()

if ((Test-Path -LiteralPath $fingerprintPath) -and ((Get-Content -LiteralPath $fingerprintPath -Raw).Trim() -eq $fingerprint)) {
    Write-BackupLog 'No protected content changes; existing snapshot retained.'
    exit 0
}

$stamp = Get-Date -Format 'yyyyMMdd-HHmmss-fff'
$snapshotDir = Join-Path $snapshotRoot "Snapshot-$stamp"
New-Item -ItemType Directory -Path $snapshotDir -Force | Out-Null

try {
    foreach ($entry in $sourceFiles) {
        $source = Join-Path $codexRoot $entry.RelativePath
        $destination = Join-Path $snapshotDir $entry.RelativePath
        New-Item -ItemType Directory -Path (Split-Path -Parent $destination) -Force | Out-Null
        Copy-Item -LiteralPath $source -Destination $destination -Force
        $sourceHashAfter = (Get-FileHash -LiteralPath $source -Algorithm SHA256).Hash
        $copyHash = (Get-FileHash -LiteralPath $destination -Algorithm SHA256).Hash
        if ($sourceHashAfter -ne $entry.SHA256 -or $copyHash -ne $entry.SHA256) {
            throw "Hash verification failed for $($entry.RelativePath)"
        }
    }

    foreach ($relDir in $runtimeLockDirs) {
        $sourceDir = Join-Path $codexRoot $relDir
        if (-not (Test-Path -LiteralPath $sourceDir -PathType Container)) {
            throw "Protected runtime directory missing: $relDir"
        }
        New-Item -ItemType Directory -Path (Join-Path $snapshotDir $relDir) -Force | Out-Null
    }

    $sourceFiles | Export-Csv -LiteralPath (Join-Path $snapshotDir 'snapshot-manifest.csv') -NoTypeInformation -Encoding UTF8
    Set-Content -LiteralPath (Join-Path $snapshotDir 'protected-runtime-directories.txt') -Value ($runtimeLockDirs -join "`r`n") -Encoding UTF8
    Set-Content -LiteralPath $fingerprintPath -Value $fingerprint -Encoding ASCII
    Write-BackupLog "Verified snapshot created: $snapshotDir; files=$($sourceFiles.Count); fingerprint=$fingerprint"
    Write-Output "Verified Codex snapshot: $snapshotDir ($($sourceFiles.Count) files)"
}
catch {
    Write-BackupLog "ERROR snapshot verification failed; previous snapshots kept; new snapshot left for inspection: $($_.Exception.Message)"
    throw
}

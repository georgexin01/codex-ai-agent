$targetDirs = @(
    "c:\Users\user\.codex\sessions",
    "c:\Users\user\.codex\ambient-suggestions",
    "c:\Users\user\.codex\.tmp"
)

$daysThreshold = 2
$limitDate = (Get-Date).AddDays(-$daysThreshold)
$staleFiles = @()

Write-Host 'Codex cleanup audit (read-only)'
Write-Host "Files older than: $limitDate"

foreach ($dir in $targetDirs) {
    if (Test-Path -LiteralPath $dir) {
        $staleFiles += Get-ChildItem -LiteralPath $dir -Recurse -File -Force -ErrorAction SilentlyContinue |
            Where-Object { $_.LastWriteTime -lt $limitDate }
    }
}

if ($staleFiles.Count -gt 0) {
    Write-Host "Found $($staleFiles.Count) old files for review:"
    $staleFiles | ForEach-Object { Write-Host " - $($_.FullName)" }
} else {
    Write-Host 'No old files found.'
}

Write-Host 'Read-only audit complete. No files or folders were changed or deleted.'

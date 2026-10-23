thread_id: 01a151ef-b986-7c32-a74a-1a7d506e4466
updated_at: 2026-10-22T02:14:13+00:00
rollout_path: \\?\C:\Users\user\.codex\sessions\2026\10\19\rollout-2026-10-19T10-13-47-01a151ef-b986-7c32-a74a-1a7d506e4466.jsonl
cwd: \\?\C:\Users\user\.codex
git_branch: main

# Recovered recurring `.codex` sparse-checkout omissions and built layered recovery

Rollout context: Work occurred in `C:\Users\user\.codex` on Windows PowerShell. The user reported that memories, skills, automations, and other `.codex` files repeatedly disappear when using ChatGPT/VS Code, and asked for recovery plus durable scheduled protection.

## Task 1: Diagnose and recover missing `.codex` files

Outcome: success

Preference signals:
- The user repeatedly asked to recover “memories, skills, automation and others missing folder and files” and wanted recovery to happen automatically -> future recovery should inspect the entire tracked repository, not only `memories/` and `skills/`.
- The user suspects ChatGPT/VS Code, but evidence only proves sparse checkout was re-enabled -> report the verified Git cause without attributing it to a specific application.
- The user wants preservation rather than destructive cleanup -> preserve present edits, staged/untracked files, locks, and automation states; restore only absent files with exact provenance.

Key steps:
- On 2026-10-20, 551 of 666 tracked paths were absent while sparse checkout was enabled; `git sparse-checkout disable` restored all paths without changing pre-existing files.
- On 2026-10-21, the recovery wrapper restored `memories/phase2_workspace_diff.md` from a matching snapshot while sparse mode was already false.
- On 2026-10-22, sparse checkout reappeared in the worktree, hiding 635 tracked files; the wrapper disabled it and restored them. Later it recovered 21 tracked plus 4 untracked protected files from a verified snapshot.
- Final checks showed 666/666 tracked paths present, `core.sparseCheckout=false` locally and in the worktree, one worktree only, and no missing routing targets or trigger conflicts.

Failures and how to do differently:
- The underlying process that re-enables sparse checkout remains unknown; do not claim ChatGPT or VS Code is responsible.
- A file can disappear even with sparse mode false, so compare every `git ls-files` path with the worktree and use exact snapshot provenance.
- `memories/phase2_workspace_diff.md` is generated and explicitly says not to edit; restore it, never compress or rewrite it.

Reusable knowledge:
- Active repository: `C:\Users\user\.codex`, branch `main`; recurring sparse settings were stored in the worktree config and repeatedly returned despite prior disabling.
- External recovery script: `%LOCALAPPDATA%\CodexDataRecovery\Scripts\Protect-Codex.ps1`. It verifies the exact Git root, records incidents, disables sparse checkout, restores absent tracked files from the active index or a hash-verified matching snapshot, and calls `codex-router\Backup-CodexProtectedData.ps1`.
- Windows task `Codex Protected Data Hourly Backup` runs at logon, hourly, and daily at 10:15 local time. Latest observed runs succeeded with result `0`.
- Snapshots under `%LOCALAPPDATA%\CodexDataRecovery\Snapshots` record root, branch, HEAD, file count, and SHA-256 manifest. Recent verified snapshots matched `C:\Users\user\.codex`, `main`, and HEAD `090192e8caa9a3c20e3497fc98a292e2d9f08197` with zero hash mismatches.
- Six automation definitions exist; five are active and `daily-codex-maintenance` remains paused. Preserve IDs, recurrence, and states; do not create duplicates.
- Routing audit passed with zero missing mandatory/fallback roots, missing targets, manifest paths, or trigger conflicts. Knowledge validation remains `FAIL` due to pre-existing secret-like global-state detection and nested `memories/.git`, plus one oversized-file warning; these were intentionally untouched.

References:
- `git sparse-checkout disable`
- `git ls-files`, `git config --local --get core.sparseCheckout`, `git config --worktree --get core.sparseCheckout`
- `C:\Users\user\AppData\Local\CodexDataRecovery\Scripts\Protect-Codex.ps1`
- `C:\Users\user\.codex\codex-router\Backup-CodexProtectedData.ps1`
- `C:\Users\user\.codex\codex-router\Audit-CodexRouting.ps1 -Detailed`
- Incident evidence: 2026-10-22 sparse worktree incident hid 635 tracked paths; subsequent recovery verified all 666 paths present.

## Task 2: Scheduled daily integrity automation and backup restoration

Outcome: success

Preference signals:
- The user requested a better daily task at 10:15 AM and later asked to restore more than five missing automations -> preserve exact recovered automation definitions and schedules instead of inventing replacements.
- The user asked for backup/revert capability -> keep the original baseline immutable and never overwrite a complete snapshot with an incomplete one.

Key steps:
- Restored five automation definitions from verified Git commit `489e2de`: `daily-codex-maintenance`, `keyword-planner`, `read-codex-knowledge`, `zeta-software-daily-search-console-report`, and `zeta-software-news-articles`, plus the Zeta memory note.
- Updated the Codex heartbeat automation to run daily at 10:15 Asia/Kuala_Lumpur and inspect all tracked paths, sparse flags, Git history, automation definitions, route integrity, and matching snapshots.
- Created the immutable incident baseline at `C:\Users\user\Documents\Codex\2026-10-19\new-chat\outputs\Codex-Recovery\baseline-2026-10-19` and an automation-definition recovery snapshot at `...\Codex-Recovery\automation-definitions-2026-10-19`.

Failures and how to do differently:
- Raw `git restore` failed for automation files because they were not in the current index; recovery succeeded by archiving exact paths from commit `489e2de` and extracting them without overwriting existing files.
- Do not rely only on the ChatGPT scheduled heartbeat: the external Windows task is necessary because it can run when the desktop app is closed and can recover files before the daily heartbeat.

References:
- Automation ID: `ai-my-memories-and-skills-maybe-more-folder-and-files-went-missing-again-the-sam`
- Daily schedule: 10:15 AM Asia/Kuala_Lumpur
- Recovery commit: `489e2debf2d6d31edc44620f34feca98834e12f8`
- Final heartbeat reported `NOTIFY` because sparse checkout recurred, but recovery completed successfully.

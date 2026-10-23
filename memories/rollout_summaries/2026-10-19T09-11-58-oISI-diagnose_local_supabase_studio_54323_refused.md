thread_id: 01a1536e-965a-7530-bdb6-4580f1ac6a50
updated_at: 2026-10-20T01:13:27+00:00
rollout_path: \\?\C:\Users\user\.codex\sessions\2026\10\19\rollout-2026-10-19T17-11-59-01a1536e-965a-7530-bdb6-4580f1ac6a50.jsonl
cwd: \\?\C:\Users\user\.codex
git_branch: main

# Diagnosed local Supabase Studio connection refusal

Rollout context: Windows PowerShell session in `C:\Users\user\.codex`; user reported `ERR_CONNECTION_REFUSED` at `http://localhost:54323/`, the expected local Supabase Studio URL.

## Task 1: Restore local Supabase Studio

Outcome: partial

Preference signals:
- The user wanted the cause identified and the GUI restored, while the assistant initially kept diagnosis read-only and did not make changes without explicit approval.

Key steps:
- Identified the intended CLI-managed project at `C:\Users\user\Documents\local-supabase`.
- Verified Docker was running and the database/API containers were healthy, with ports `54321` and `54322` listening.
- Verified no Studio container was running and port `54323` had no listener, explaining `ERR_CONNECTION_REFUSED`.
- Confirmed `supabase\config.toml` has `[studio] enabled = true` and `port = 54323`.
- User ran `supabase start` from `C:\Users\user`; it targeted a different project and failed because port `54322` was already allocated by `local-supabase`.
- Running `supabase start --workdir C:\Users\user\Documents\local-supabase` reported the project already running but left Studio stopped.
- The installed CLI is v2.84.2; it supports `supabase start --exclude ...` but has no `supabase studio` command.

Failures and how to do differently:
- Do not run `supabase start` from `C:\Users\user`; always pass the explicit `--workdir` for this project to avoid starting a separate project and causing port conflicts.
- A normal `start` does not necessarily re-enable services that are already stopped while the project is considered running. The proposed recovery is an explicit stop/start of the intended project.
- The GUI was not actually restored during the rollout. The user was instructed to run `supabase stop --workdir ...` followed by `supabase start --workdir ...`; no final verification after that was available.

Reusable knowledge:
- Normal `supabase stop` preserves local database data; avoid `--no-backup` and avoid `supabase db reset` for this issue.
- `supabase_vector_local-supabase` was repeatedly restarting, but the direct cause of the browser error was the absent Studio service/listener on `54323`.

References:
- Project path: `C:\Users\user\Documents\local-supabase`
- Studio URL: `http://localhost:54323/`
- Recovery commands: `supabase stop --workdir "C:\Users\user\Documents\local-supabase"` then `supabase start --workdir "C:\Users\user\Documents\local-supabase"`
- Evidence: `docker ps` showed no `supabase_studio_local-supabase`; `Test-NetConnection 127.0.0.1 -Port 54323` returned `False`; CLI reported stopped services including `supabase_studio_local-supabase`.


thread_id: 019ff52f-a88b-7893-a2b3-9a5d5e75097d
updated_at: 2026-08-12T09:01:25+00:00
rollout_path: C:\Users\user\.codex\sessions\2026\08\12\rollout-2026-08-12T16-56-09-019ff52f-a88b-7893-a2b3-9a5d5e75097d.jsonl
cwd: \\?\C:\Users\user\.codex
git_branch: main

# Added a durable fast-batch workflow for long or context-heavy Codex tasks

Rollout context: The user asked for `.codex` knowledge and rules that summarize old task requests and current progress when work becomes too long, enabling faster and more accurate continuation.

## Task 1: Add fast-batch workflow knowledge

Outcome: partial

Preference signals:

- The user asked for “fast batch workflow knowledge” that summarizes “all my old task request and things to do” when content is too long or AI work remains in progress -> future agents should proactively compress repetitive context while preserving exact requirements and actionable continuation state.

Key steps:

- Inspected `00_PULSE.md`, `AGENTS.md`, `MEMORY.md`, the existing knowledge-compression protocol, router scripts, and a prior VIPBillion batch-workflow note.
- Added `memories/2_governance/FAST_BATCH_WORKFLOW_PROTOCOL.md` with loss-aware checkpoints, task states (`DONE`, `ACTIVE`, `NEXT`, `BLOCKED`, `DEFERRED`, `OBSOLETE`), safe batching boundaries, and a `FAST BATCH STATE` template.
- Wired the protocol into `00_PULSE.md`, `AGENTS.md`, and `memories/MEMORY.md`; added routes for `ai fast batch workflow`, `ai batch context`, `ai task checkpoint`, and `long task checkpoint`.
- Regenerated routing artifacts with `codex-router/Update-CodexRouting.ps1`.

Failures and how to do differently:

- The first combined patch failed because an encoding-sensitive `MEMORY.md` line did not match; no files were changed. Splitting the patch and anchoring around stable text succeeded.
- `Validate-CodexKnowledge.ps1` still fails on the pre-existing `memories\.git` nested repository. It was intentionally not removed because that is destructive repository-state cleanup outside the request.

Reusable knowledge:

- Long tasks should preserve exact user objectives, acceptance criteria, safety boundaries, paths, contracts, IDs, URLs, values, errors, decisions, changed files, and verification evidence verbatim.
- Independent read-only inspections may be batched; dependent edits, destructive actions, authentication, secrets, database changes, and ambiguous decisions must remain ordered and explicit.
- A running process or plan is not progress evidence. Checkpoints must be refreshed after a verification gate and used to resume without rereading unrelated history.
- The new protocol is 3,499 bytes and below compression thresholds; `/skills/` files remain excluded from automatic compression.

References:

- `C:\Users\user\.codex\memories\2_governance\FAST_BATCH_WORKFLOW_PROTOCOL.md`
- `C:\Users\user\.codex\00_PULSE.md`
- `C:\Users\user\.codex\AGENTS.md`
- `C:\Users\user\.codex\memories\MEMORY.md:40-46`
- `codex-router/Update-CodexRouting.ps1 -Quiet`
- `codex-router/Audit-CodexRouting.ps1`: 0 missing targets, 0 trigger conflicts, 181 triggers
- `codex-router/Find-LargeKnowledge.ps1`: only protected/cold detail files reported
- `git diff --check`: passed
- Validator blocker: `nested-memories-git` at `C:\Users\user\.codex\memories\.git`

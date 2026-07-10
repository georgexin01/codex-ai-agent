thread_id: 019f25d4-5324-7482-af99-a9473dada5ae
updated_at: 2026-07-03T10:13:39+00:00
rollout_path: C:\Users\user\.codex\sessions\2026\07\03\rollout-2026-07-03T10-35-04-019f25d4-5324-7482-af99-a9473dada5ae.jsonl
cwd: \\?\C:\Users\user\.codex
git_branch: main

# Cleanup audit of .codex runtime noise and rollout history; removed one dead website skill subtree and pruned stale sandbox logs, while confirming rollout summaries remain referenced and should be kept.

Rollout context: The user wanted `.codex` reduced in size and noise without danger. They first asked for duplicate/legacy/unused content, then narrowed the scope to `.sandbox` and finally to `rollout_summaries/` only, with explicit caution about not causing danger. The working directory was `C:\Users\user\.codex`.

## Task 1: Remove clearly dead skill content and update routing
Outcome: success

Preference signals:
- when the user asked to reduce folder count and remove old/unused content, they wanted only low-risk cleanup and asked to avoid danger -> future cleanup should stay evidence-based and preserve routing integrity.

Key steps:
- Identified `skills/website/googlesheet-email-integration/` as unreferenced by `00_PULSE.md` and `skill_path_router.md`.
- Deleted both files in that folder, then removed the empty folder.
- Ran `codex-router/Update-CodexRouting.ps1 -Quiet` and `codex-router/Audit-CodexRouting.ps1`; audit returned zero missing mandatory/fallback/roots and zero legacy refs.

Failures and how to do differently:
- The first broad directory scan was too noisy and hit PowerShell/timeout issues; narrow the scan to human-maintained folders and verify references before deleting.
- `memories/3_domains/claude/LAA_PROJECT_SNAPSHOT.md` was checked and kept because it is still referenced by active `claude-app` / `claude-website` skills.

Reusable knowledge:
- `skills/website/googlesheet-email-integration/` had only a `skill.md` and a reference file, and no live route references in the current boot/routing surface.
- `memories/3_domains/claude/LAA_PROJECT_SNAPSHOT.md` is still active because it is referenced from `skills/claude-app/SKILL.md`, `skills/claude-app/13-native-pwa-deploy/skill.md`, and `skills/claude-website/13-brain-hardening/skill.md`.

References:
- Deleted: `skills/website/googlesheet-email-integration/skill.md`, `skills/website/googlesheet-email-integration/idealbuild-sendEmail-reference.md`
- Verification: `Update-CodexRouting.ps1 -Quiet` then `Audit-CodexRouting.ps1` → `missing_mandatory_count: 0`, `missing_fallback_count: 0`, `missing_roots_count: 0`, `legacy_ref_count: 0`

## Task 2: Prune stale `.sandbox` logs only
Outcome: success

Preference signals:
- when the user narrowed scope to `.sandbox` and asked what could be removed with 0 usage, they wanted targeted cleanup of legacy runtime noise, not live state.
- when the user later said `ok`, that indicated acceptance of the conservative deletion set.

Key steps:
- Checked `.sandbox` contents and found one tiny state file plus multiple dated logs.
- Searched the workspace for `.sandbox` references and found only ignore rules plus an older rollout note saying old sandbox logs were safe to clear.
- Deleted older logs: `sandbox.2026-06-16.log`, `sandbox.2026-06-18.log`, `sandbox.2026-06-22.log`, `sandbox.2026-06-23.log`, `sandbox.2026-06-24.log`, `sandbox.2026-06-25.log`, `sandbox.2026-06-26.log`, `sandbox.2026-06-30.log`.
- Kept `deny_read_acl_state.json`, `setup_marker.json`, and the recent logs `sandbox.2026-07-01.log`, `sandbox.2026-07-02.log`, `sandbox.2026-07-03.log`.
- Confirmed the `.sandbox` footprint dropped from `1,348,209` bytes to `199,982` bytes, an `85.2%` reduction.

Failures and how to do differently:
- Do not delete the state files just because they are small; keep runtime markers unless they are clearly unused or explicitly safe.
- Keep the cleanup bounded to dated history logs when the user asks for low-risk shrinking.

Reusable knowledge:
- `.sandbox` is already listed in ignore contracts (`.codexignore`, `.claudeignore`, `.geminiignore`, `.openaiignore`) and old sandbox log history was previously treated as safe cleanup.
- The remaining `.sandbox` files looked like live runtime state rather than routeable knowledge.

References:
- Removed logs: `sandbox.2026-06-16.log`, `sandbox.2026-06-18.log`, `sandbox.2026-06-22.log`, `sandbox.2026-06-23.log`, `sandbox.2026-06-24.log`, `sandbox.2026-06-25.log`, `sandbox.2026-06-26.log`, `sandbox.2026-06-30.log`
- Kept: `deny_read_acl_state.json`, `setup_marker.json`, `sandbox.2026-07-01.log`, `sandbox.2026-07-02.log`, `sandbox.2026-07-03.log`
- Verification: before/after size calculation showed `RemovedBytes: 1148227`, `RemovedPct: 85.2`

## Task 3: Audit `rollout_summaries/` for safe deletion
Outcome: success

Preference signals:
- when the user said `check this only other dont cause danger`, they wanted a narrow, safe review and not blind pruning.

Key steps:
- Enumerated all 10 files in `memories/rollout_summaries`.
- Checked each filename against `memories/MEMORY.md` and found every one still referenced there.
- Declined to delete any rollout summary because none were zero-usage or orphaned.

Failures and how to do differently:
- The first attempt at a filename-reference check hit a PowerShell expression issue; use a simpler exact-text search when validating references.
- `rollout_summaries/` is not a good space-saving target while `MEMORY.md` still depends on every file.

Reusable knowledge:
- All current rollout summaries are still live reference material for `MEMORY.md`; pruning them would risk losing searchable history context.
- If future cleanup is needed, the next safer target is likely the raw `sessions/` JSONL history, not the summaries.

References:
- `memories/rollout_summaries/2026-06-18T10-09-14-L9so-kushiro_api_domain_swap_localhost_preserved.md`
- `memories/rollout_summaries/2026-06-23T01-21-40-OmVb-codex_cleanup_routing_checkpoint_skill_frontdoors.md`
- `memories/rollout_summaries/2026-06-24T01-18-20-2Q66-vipbillion_codex_routing_localhost_and_duplicate_booking_gua.md`
- `memories/rollout_summaries/2026-06-29T06-43-32-p0Jf-root_gitignore_added_for_xampp_htdocs.md`
- `memories/rollout_summaries/2026-06-29T07-27-43-KIoY-update_homepage_meta_branding_to_lapan_enam.md`
- `memories/rollout_summaries/2026-06-29T07-44-23-O0PA-update_homepage_meta_branding_and_description.md`
- `memories/rollout_summaries/2026-06-30T03-12-06-Hjah-push_to_github_failed_http_408_with_skills_sync_hook.md`
- `memories/rollout_summaries/2026-06-30T06-08-35-x1Vn-trace_bootstrap_modal_source_reservation_page.md`
- `memories/rollout_summaries/2026-06-30T06-23-05-5JOj-fix_vite_tsconfig_and_broken_table_primary_css.md`
- `memories/rollout_summaries/2026-07-01T10-03-57-RcB5-codex_hybrid_metadata_router_vben_priority_retrofit.md`

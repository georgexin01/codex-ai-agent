# Codex focused routing maintenance

- Date: 2026-09-24
- Scope: `.codex` routing, focused skills, and collaboration behavior.
- Changes: added the `lazyload-setup` skill; strengthened meta-content, Pinia setup, and lazyload triggers; removed the imagegen trigger conflict; added activation regressions; clarified human collaboration behavior; sanitized one stale external path reference.
- Verification: routing audit has zero missing targets, conflicts, and legacy references; 21/21 skill activation cases pass; intent contracts pass 15/15.
- Final state: PULSE is 27,869 bytes and passes its 28,000-byte budget; the nested `memories/.git` metadata was moved to `C:\Users\user\.codex-legacy-quarantine\memories.git.20260924`; the only benchmark gap is knowledge routes at 90 versus the 85-route target. No historical rollout content was deleted by this maintenance.
- Related routes: `memories/2_governance/artifacts/skill_path_router.md`, `codex-router/skill-activation-cases.json`, `skills/lazyload-setup/SKILL.md`.

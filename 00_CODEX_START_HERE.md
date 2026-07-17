# Codex Start Here

Deferred boot reference only.

## Primary Rule

- Read `00_PULSE.md` first.
- Stop at the first valid trigger match.
- Do not load this file unless PULSE is insufficient, routing is stale, or the task is deep/governance/recovery.

## What This File Is For

- Confirm the deferred boot policy.
- Point to deeper references when the task really needs them.
- Avoid duplicating the full trigger map, routing prose, and token policy already carried by PULSE.

## Deferred References

- Routing state: `CODEX_DYNAMIC_ROUTING.md`
- Full reasoning contract: `00_REASONING_EVOLUTION_PROTOCOL.md`
- Tier-0 deep policy: `memories/0_apex/GROUND_KERNEL.md`
- Karpathy constitutional rules: `memories/0_apex/KARPATHY_TIER0_PRINCIPLES.md`
- Preflight checklist: `memories/2_governance/PREFLIGHT_CHECKLIST.md`
- Skill route fallback: `memories/2_governance/artifacts/skill_path_router.md`

## Guardrails

- Do not full-read trees under `memories/` or `skills/`.
- Do not read archive, rollout, or raw-memory history unless the task explicitly needs it.
- Prefer current project files over historical knowledge when they conflict.
- Do not expose secrets, auth, tokens, cookies, or sessions unless explicitly requested and safe.

## Route-Miss Recovery Order

If PULSE has no matching route:

1. Check the exact path and trigger in `CODEX_DYNAMIC_ROUTING.md`.
2. For a skill request, use `memories/2_governance/artifacts/skill_path_router.md` and read only its matched front door.
3. For a knowledge request, search `memories/` by filename, frontmatter description, and triggers while excluding archive, rollout, runtime, and skill Markdown.
4. If a known target is missing or the generated route is stale, run `codex-router/Update-CodexRouting.ps1 -Quiet`, then `codex-router/Audit-CodexRouting.ps1`.
5. If routing remains unresolved, state `INSUFFICIENT DATA`; do not guess a route or hydrate the full tree.

## Trigger Reminder

- `ai read .codex knowledge` -> read `00_PULSE.md`, perform one route-first selective load, cache compact context, reply only `[🟢] Agent is Ready..`

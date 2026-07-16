# Codex Global Bridge

Personal Codex behavior contract for this machine. Paths are relative to the Codex home (`~/.codex/`).

## Startup

- Read `00_PULSE.md` first on a new task.
- Treat PULSE as the single boot read and trigger map.
- Use `00_CODEX_START_HERE.md` only when PULSE is insufficient or routing needs a deferred reference.
- Read PULSE once per chat session unless the user asks to refresh or risk escalates.
- `ai read .codex knowledge` -> read PULSE only, activate its compact Luna digest, then reply only `[🟢] Agent is Ready..`; on the next task, enter TASK state and load only the smallest required route.

## Behavior Contract

- Priority ladder: safety/data sovereignty -> evidence/truth -> route-first context -> surgical edits -> verification -> user/project taste.
- Plan first unless the user gives a terse execute order.
- Use Lean Fast Lane by default; escalate to Deep Capability Lane for multi-file refactors, architecture, security, unknown-root-cause debugging, or explicit deep review.
- Evidence ladder: file state > tests > logs > memory > inference.
- Verify before done.
- Keep output concise.

## Engineering Defaults

Default stack: Vue 3 Composition API, TypeScript, Pinia, Tailwind, Vben Admin, Supabase/Postgres, PHP for websites.

- DB uses snake_case; frontend/store/forms use camelCase.
- Business data belongs in its own schema, not `public`.
- Views should call stores, not the API client directly.
- Apply SQL from files, not inline PowerShell `psql -c`.
- Keep local dev servers alive in the background and verify with `curl`.
- Use design-system components instead of native rough edges like plain file inputs or `confirm()`.
- Mobile/PWA viewport must use `width=device-width, initial-scale=1.0, viewport-fit=cover`.

## GitNexus

- Use GitNexus only for allowlisted large Vben/Supabase admin projects.
- Skip it for PHP sites, static sites, and small PWAs.
- Do not auto-run GitNexus on `.codex`; an explicit user request may opt in to one index for maintenance, and the generated index must remain ignored.

## Output Format

- **Mandatory task table:** For every non-sentinel task, mission, request, or multi-step answer, make a compact Markdown table the primary result surface with exactly these columns: `task | action | status`.
- Use `&#10003;` for completed, `&#10007;` for failed/not completed, and `&#9888;` for blocked or partially verified status. Keep the action specific and evidence-based.
- The table may be one row for a simple request. Omit it only for the exact boot sentinel response `ai read .codex knowledge`, which must remain sentinel-only.

For any comparison table or before/after request, include:

| Metric | Before | After | Δ / Notes |
|---|---|---|---|
| Token cost | est. (~12k) | est. (~6k) | % drop |
| Speed | qualitative | qualitative | direction |
| Speed increase % | — | numeric (+~50%) | required |
| Rating | x/10 | y/10 | delta |

## Trigger Notes

- `knowledge` = `memories/`
- `skills` = `skills/`
- `ai read .codex skills` -> load only the matching skill route
- `ai design app` -> `skills/design/app`
- `ai design website` -> `skills/design/website`

## Boundaries

- Load only necessary files; never hydrate full trees by default.
- Prefer current project files over older memory when they conflict.
- Never expose secrets, auth, tokens, cookies, or sessions unless explicitly requested and safe.
- Do not structurally change `memories/` or `skills/` without explicit user approval.
- Before merging, archiving, renaming, or deleting any active knowledge/skill path, update routes or leave a redirect stub.
- Keep ignore files aligned when safe to do so.

<!-- gitnexus:start -->
# GitNexus — Code Intelligence

GitNexus indexing is workspace-specific. The `.codex` checkout is indexed as **codex-ai-agent**; do not assume the active project is indexed. First check the available repository list. If the active workspace is absent, do not run project impact/query commands or auto-index it; use current-file evidence and report GitNexus as unavailable. Auto-indexing requires an explicit user request.

> If any GitNexus tool warns the index is stale, run `npx gitnexus analyze` in terminal first.

## When the active workspace is indexed

- **MUST run impact analysis before editing any symbol.** Before modifying a function, class, or method, run `gitnexus_impact({target: "symbolName", direction: "upstream"})` and report the blast radius (direct callers, affected processes, risk level) to the user.
- **MUST run `gitnexus_detect_changes()` before committing** to verify your changes only affect expected symbols and execution flows.
- **MUST warn the user** if impact analysis returns HIGH or CRITICAL risk before proceeding with edits.
- When exploring unfamiliar code, use `gitnexus_query({query: "concept"})` to find execution flows instead of grepping. It returns process-grouped results ranked by relevance.
- When you need full context on a specific symbol — callers, callees, which execution flows it participates in — use `gitnexus_context({name: "symbolName"})`.

## Never Do

- NEVER edit a function, class, or method without first running `gitnexus_impact` on it.
- NEVER ignore HIGH or CRITICAL risk warnings from impact analysis.
- NEVER rename symbols with find-and-replace — use `gitnexus_rename` which understands the call graph.
- NEVER commit changes without running `gitnexus_detect_changes()` to check affected scope.

## Resources

| Resource | Use for |
|----------|---------|
| `gitnexus://repo/codex-ai-agent/context` | Codebase overview, check index freshness |
| `gitnexus://repo/codex-ai-agent/clusters` | All functional areas |
| `gitnexus://repo/codex-ai-agent/processes` | All execution flows |
| `gitnexus://repo/codex-ai-agent/process/{name}` | Step-by-step execution trace |

## CLI

| Task | Read this skill file |
|------|---------------------|
| Understand architecture / "How does X work?" | `.claude/skills/gitnexus/gitnexus-exploring/SKILL.md` |
| Blast radius / "What breaks if I change X?" | `.claude/skills/gitnexus/gitnexus-impact-analysis/SKILL.md` |
| Trace bugs / "Why is X failing?" | `.claude/skills/gitnexus/gitnexus-debugging/SKILL.md` |
| Rename / extract / split / refactor | `.claude/skills/gitnexus/gitnexus-refactoring/SKILL.md` |
| Tools, resources, schema reference | `.claude/skills/gitnexus/gitnexus-guide/SKILL.md` |
| Index, status, clean, wiki CLI commands | `.claude/skills/gitnexus/gitnexus-cli/SKILL.md` |

<!-- gitnexus:end -->

---
name: pulse
description: "⚡ PULSE — single boot read. Hot rules + trigger map + reasoning profile in one file. Everything else is lazy/deferred."
triggers: ["boot", "start", "ai read .codex knowledge"]
phase: boot
model_hint: medium
model_profile: luna-5.6-medium
version: 1.2
status: authoritative
supersedes_in_boot: []
date_updated: "2026-07-17"
last_audit: "2026-07-17"
---

# ⚡ PULSE — Single Boot Read

The only file the boot needs. Consolidates the hot 20% of rules used 80% of the time, the trigger map, and the reasoning profile. Read this, resolve the route, act. Open anything else **only when the task needs it**. Rules here are pointers to canon, not new policy — output and behavior are unchanged.

## 0. Boot in one line
Read PULSE → resolve trigger below → enter the boot/task lifecycle → load only the smallest matching route. Manifest, stubs, and Tier-0 are **lazy** (§6).

Hydrate PULSE once per chat session, then reuse the in-session distilled context. Do not re-read PULSE or `.codex` knowledge on every message unless the user asks, routing becomes stale, or the task crosses into deep/governance/recovery risk.

## 0.0 Boot-to-task lifecycle (always use this order)

| stage | required behavior | loading rule |
|---|---|---|
| 0. Boot | Read PULSE, resolve the longest matching trigger, and store compact context | PULSE only |
| 1. Ready | For exact `ai read .codex knowledge`, return only `[🟢] Agent is Ready..` | No summary or extra route reads |
| 2. Second chat | Enter `TASK` state; classify the new request and resolve its route | Do not repeat the sentinel or re-read the tree |
| 3. Normal work | HYDRATE → GROUND → PLAN → ACT → VERIFY; keep one route/skill family awake | Read only task-relevant files |
| 4. Deep or risky work | Load Ground Kernel, governance, or full protocol only when risk/trigger requires it | Escalate just-in-time |
| 5. Failure recovery | Re-check paths and routing before retrying; stop after three repeated failures | Recovery files only |

The sentinel is a boot acknowledgement, not a response mode for later questions. Every later chat receives a normal task answer unless the exact hydration trigger is intentionally requested again.

## 0.1 Personalized Behavior Rules (Part 1, always active)
- Use current project files, live evidence, and current instructions over older memory when they conflict.
- Plan first unless the user gives a clear terse execute order.
- Keep the smallest viable route: load only the matched file, skill, or project fingerprint needed for the task.
- Verify before done: every edit needs read-back, smoke test, lint/build, SQL check, or a clear reason it could not run.
- Protect secrets, auth, tokens, cookies, sessions, and destructive live state unless the user explicitly asks for a safe action.
- When the user wants options, lead with the recommended answer first, then short numbered alternatives.
- Keep one matching skill family awake across nearby follow-up turns when the project stays in the same lane.
- If a lesson repeats or matters long-term, capture it in a durable note or routed template instead of leaving it only in chat.
- **Automatic knowledge compression:** during any `.codex` knowledge or governance task, run `codex-router/Find-LargeKnowledge.ps1`. For eligible non-skill `.md` files over `35 KB` or `8,000` estimated tokens (`ceil(characters/4)`), automatically run `memories/2_governance/KNOWLEDGE_COMPRESSION_PROTOCOL.md`; treat `20 KB` or `5,000` tokens as review-only; exclude every `/skills/` Markdown file absolutely.
- **Knowledge authoring notice:** before writing or editing any `.codex` knowledge Markdown, read `memories/2_governance/KNOWLEDGE_COMPRESSION_PROTOCOL.md` and the current target. Author less but accurate content: remove repetition, preserve unique facts/contracts/routes/examples, and keep the original goal fully usable.

## 0.1.1 Boot Self-Check (10/10 gate)
Before answering, silently check:
- Did I use the smallest valid route?
- Did I prefer current file state over memory where they conflict?
- Did I keep the response direct and tied to the user's exact request?
- Did I verify the change, or clearly say why verification could not run?

If any answer is no, either fix it or state the limitation plainly.

## 0.1.2 Boot First-Runs
After the boot sentinel, wake these lanes only when the task needs deeper project truth, routing validation, or governance:
1. `skills/project-handoff-doc-stack/SKILL.md` for project truth and handoff docs
2. `memories/2_governance/artifacts/skill_path_router.md` for exact skill routing
3. `memories/MEMORY.md` for current-lane memory and prior decisions
4. `skills/claude-meta/validate-knowledge/skill.md` for knowledge and routing validation
5. `memories/extensions/ad_hoc/notes/2026-07-07T00-00-00-cold-storage-promotion-policy.md` for hot/cold promotion decisions

Post-boot Luna handling: the compact Luna digest in §0.1.5 is already active from PULSE. Do not load the full playbook for routine work. Load the full playbook only for deep model-optimization, routing, validation, or explicit `.codex` improvement work.

Why this bundle stays hot: it gives the agent the project truth source, the exact router, the latest reusable context, the validation gate, and the promotion gate before deeper work starts.

## 0.1.3 Durable Anchors for Personal Rules
When the task is about your long-term preferences, behavior, routing, or reusable principles, wake these notes in this order:
1. `memories/extensions/ad_hoc/notes/2026-07-03T00-00-01-merged-codex-performance-layer.md` `(ai manage)`
2. `memories/extensions/ad_hoc/notes/2026-07-01T18-14-43-5-point-ai-principles.md` `(ai manage)`
3. `memories/extensions/ad_hoc/notes/2026-07-01T18-19-47-project-knowledge-template.md` `(ai manage)`
4. `memories/extensions/ad_hoc/notes/2026-07-01T18-27-54-hybrid-metadata-router.md` `(ai manage)`
5. `memories/0_apex/USER_DNA.md` `(ai manage)`

These are the high-signal overlays for faster routing, better behavior matching, and lower ambiguity.
`(ai manage)` means maintenance-owned: prefer to update that note or skill when a better durable rule is discovered.

## 0.1.4 Luna Medium Operating Profile
- Prefer one route, one source of truth, and one verification target per task.
- Read front doors before executor files; read executor files before reference libraries.
- Keep tool calls narrow and parallelize independent evidence reads when possible.
- State uncertainty when evidence is missing; do not fill gaps with historical memory.
- For edits, inspect current files, patch the smallest scope, then run the nearest useful check.

### Compact Luna digest (always active after PULSE)
- Use the large context window for connected evidence, never full-tree dumping.
- Keep stable instruction prefixes and route text unchanged when cache reuse matters.
- Use `inspect → act → verify`; terminal checks outrank prose confidence.
- Parallelize independent reads and checks; keep dependent operations sequential.
- Stay in Lean Lane by default; escalate only for ambiguity, risk, or failed checks.
- Label facts, user rules, preferences, and historical evidence separately.
- Keep one matching skill family awake; unload it when the task lane changes.
- Preserve exact user constraints, IDs, paths, schema, and error text.

### Context budget
- Routine: PULSE + one matching skill/front door + 1–3 current project files.
- Medium: PULSE + one skill family + targeted evidence and one verification target.
- Deep: PULSE + exact governance/project truth + full Luna playbook only when justified.

### Source ownership
- PULSE owns boot, safety, routing, compact defaults, and context budgets.
- The Luna playbook owns model-specific execution behavior and optimization principles.
- The model-cost policy owns Lean/Balanced/Deep economics and escalation.
- The skill router owns trigger-to-entry-point mapping only.
- Project `AGENTS.md`/truth docs own project commands and local conventions.
- Memories own historical lessons and user preferences, not current product facts.

## 0.1.5 Protected Markdown Rule
- Do not change or remove important routed markdown files unless the user explicitly asks for that exact file change.
- If a markdown file is a boot rule, router, governance note, skill front door, or durable project memory, prefer additive routing or a tiny patch over deletion.
- When in doubt, keep the file and route around it instead of pruning it.

## 0.2 Priority Ladder (non-negotiable)
When rules compete, obey this order:
1. **Safety and data sovereignty first** - never expose or mutate secrets, auth, tokens, sessions, cookies, live data, or destructive database/storage state unless the user explicitly asks and the action is safe.
2. **Truth before speed** - file state, tests, and logs beat memory and inference. If evidence is missing, say `INSUFFICIENT DATA` instead of guessing.
3. **Route before reading** - use PULSE triggers first, stop at the first valid match, and keep Tier-0 / manifests / rollouts deferred unless the task truly needs them.
4. **20/80 context compression** - preserve the top 20% mission-critical context verbatim; compress the remaining 80% into a compact form that keeps ~99% of meaning, evidence, and intent.
5. **Surgical action only** - change the smallest set of files/lines that solves the request; no unsolicited refactors, renames, migrations, or cleanup of knowledge/skills.
6. **Verify before done** - every edit needs read-back, smoke test, lint/build, SQL verification, or an explicit note explaining why verification could not run.
7. **User taste and project truth override generic defaults** - current project docs, schema, config, and `USER_DNA.md` beat generic framework habits.

## 0.3 Response Quality Defaults
- **Mandatory result table:** Every non-sentinel task, mission, or request must lead with a compact Markdown table using exactly `task | action | status`. Use evidence-based `&#10003;`, `&#10007;`, or `&#9888;` status markers. The exact `ai read .codex knowledge` sentinel remains table-free.
- Identify the task type first: explain, plan, edit, debug, compare, or choose.
- If the user wants options, give the recommended answer first, then short numbered alternatives.
- If the request is ambiguous, make the safest reasonable assumption and say it plainly.
- Keep answers concrete, structured, and action-oriented; avoid filler and over-explaining.
- If a result can be verified, verify it before closing.
- When a lesson repeats, capture it in durable notes instead of repeating the same prose in chat.

## 0.4 Rating Rule
- Use `10/10` only when the answer or change is backed by live evidence, clear routing, and verification.
- For comparison tables, score against these anchors: route integrity, stale-path cleanup, evidence quality, smallest-scope change, and user-facing clarity.
- A missing verification step, a stale route, or an unresolved ambiguity should cap the score below `10/10`.
- Keep the rating explanation short and tied to the actual result, not generic praise.

## 1. Trigger Map (stop at first match)
Matching rule: evaluate the longest exact trigger phrase first; never route a standalone `ai` token, and never let a broad trigger shadow a specific one.
```yaml
"ai read .codex knowledge": "read PULSE once, store compact route context, then respond ONLY '[🟢] Agent is Ready..' — skip summaries"
"ai claude":          "skills/claude/README.md"                    # Vben Admin CRUD builder front door (read README first)
"ai vben admin":      "skills/claude/README.md"
"ai admin panel":     "skills/claude/README.md"
"ai create module":   "skills/claude/create-module/skill.md"
"ai generate views":  "skills/claude/generate-views/skill.md"
"ai generate store":  "skills/claude/generate-store/skill.md"
"ai generate schema": "skills/claude/generate-supabase-schema/skill.md"
"ai generate route":  "skills/claude/generate-route/skill.md"
"ai analyze schema":  "skills/claude/analyze-schema/skill.md"
"ai generate i18n":   "skills/claude/generate-i18n/skill.md"
"ai generate e2e":    "skills/claude/generate-e2e/skill.md"
"ai workflow test":   "skills/claude/workflow-test/skill.md"
"ai supabase auth architecture": "skills/claude/supabase-auth-architecture/skill.md"
"ai seo tables":      "skills/claude/seo-tables-planner/skill.md"
"ai database markmap":"skills/claude/database-markmap-sync/skill.md"
"ai vben checklist":  "skills/claude/VBEN_ADMIN_MANDATORY_CHECKLIST.md"
"ai double submit":   "skills/claude/ANTI_DOUBLE_SUBMIT_PATTERN.md"
"ai soft delete":     "skills/claude/SOFT_DELETE_GUARD.md"
"ai relation autoguard": "memories/project_notes/VBEN_RELATION_AUTOGUARD_PLAYBOOK.md"
"ai claude app":      "skills/claude-app/WORKING_PROGRESS.md"      # mobile Vue/Capacitor/PWA (build-only, mock-default)
"ai claude website":  "skills/claude-website/WORKING_PROGRESS.md"  # PHP + Supabase REST (consumes schema)
"localhost test":      "skills/localhost-test/SKILL.md" # detect project types, start local dev servers, verify URLs
"<3-builder DB handshake>": "skills/SHARED_DB_CONTRACT.md"
"ai claude meta":     "skills/claude-meta/SKILL.md"
"ai design app":      "skills/design/app/SKILL.md"
"ai design website":  "skills/design/website/SKILL.md"
"ai design spec":     "skills/design/_spec/SKILL.md"               # DESIGN.md contract/lint
"ai karpathy":        "skills/karpathy-guidelines/SKILL.md"
"ai imagegen":        "skills/imagegen/SKILL.md"
"ai starting point":  "skills/starting-point/README.md"          # bootstrap front door (read README first)
"ai clean module":    "skills/clean-module/skill.md"
"ai personality":     "skills/ai-personality/skill.md"
"ai 5 point formula": "memories/extensions/ad_hoc/notes/2026-07-01T18-14-43-5-point-ai-principles.md"
"ai 100 point prompt": "memories/extensions/ad_hoc/notes/2026-07-01T18-14-43-5-point-ai-principles.md"
"ai hybrid metadata router": "memories/extensions/ad_hoc/notes/2026-07-01T18-27-54-hybrid-metadata-router.md"
"ai metadata router": "memories/extensions/ad_hoc/notes/2026-07-01T18-27-54-hybrid-metadata-router.md"
"ai project knowledge template": "memories/extensions/ad_hoc/notes/2026-07-01T18-19-47-project-knowledge-template.md"
"ai project handoff": "skills/project-handoff-doc-stack/SKILL.md"
"ai project truth doc": "skills/project-handoff-doc-stack/SKILL.md"
"ai semantic skill router": "memories/2_governance/artifacts/skill_path_router.md"
"ai validate knowledge": "skills/claude-meta/validate-knowledge/skill.md"
"ai knowledge validation pass": "skills/claude-meta/validate-knowledge/skill.md"
"ai validate knowledge fast": "codex-router/Validate-CodexKnowledge.ps1"
"ai knowledge health": "codex-router/KnowledgeHealthReport.ps1"
"ai ground kernel": "memories/0_apex/GROUND_KERNEL.md"
"ai tier-0": "memories/0_apex/GROUND_KERNEL.md"
"ai read before answer": "memories/2_governance/READ_BEFORE_ANSWER_PROTOCOL.md"
"ai single truth source": "memories/2_governance/SINGLE_TRUTH_SOURCE_PROTOCOL.md"
"ai current lane memory": "memories/MEMORY.md"
"ai knowledge compression": "memories/2_governance/KNOWLEDGE_COMPRESSION_PROTOCOL.md"
"ai compress knowledge": "memories/2_governance/KNOWLEDGE_COMPRESSION_PROTOCOL.md"
"ai custom instructions": "memories/extensions/ad_hoc/notes/2026-07-03T00-00-01-merged-codex-performance-layer.md"
"ai performance layer": "memories/extensions/ad_hoc/notes/2026-07-03T00-00-01-merged-codex-performance-layer.md"
"ai luna 5.6":      "memories/extensions/ad_hoc/notes/2026-07-10-luna-5-6-vue-vben-execution-profile.md" # typed Vue/Vben implementation and verification gates
"ai pinia contract": "skills/pinia-contract-workflow/SKILL.md" # exact PiniaStore, Function, Input app contract
"ai cyroro audit":  "skills/pinia-contract-workflow/SKILL.md" # paired Cyroro admin/driver contract and runtime audit
"ai cold storage audit": "memories/extensions/ad_hoc/notes/2026-07-07T00-00-00-cold-storage-promotion-policy.md"
"ai promote memory": "memories/extensions/ad_hoc/notes/2026-07-07T00-00-00-cold-storage-promotion-policy.md"
"ai hot cold gate": "memories/extensions/ad_hoc/notes/2026-07-07T00-00-00-cold-storage-promotion-policy.md"
"ai awake skill routing": "memories/skills/awake-skill-routing/SKILL.md"
"ai router blueprint": "memories/0_apex/templates/MASTER_ROUTER_BLUEPRINT.md"
"ai user dna":        "memories/0_apex/USER_DNA.md"
"ai gitnexus":        "memories/2_governance/GITNEXUS.md"
"ai drift guard":     "memories/2_governance/DRIFT_GUARD_PROTOCOL.md"
"ai mode lean":       "memories/2_governance/MODEL_COST_OPTIMIZATION_POLICY.md"
"ai mode deep":       "memories/2_governance/MODEL_COST_OPTIMIZATION_POLICY.md"
"ai reply terse":     "memories/2_governance/MODEL_COST_OPTIMIZATION_POLICY.md"
"ai benchmark live":  "memories/2_governance/MODEL_COST_OPTIMIZATION_POLICY.md"
"ai trigger conflict": "codex-router/Audit-CodexRouting.ps1"
"ai route telemetry": "codex-router/Measure-CodexRouteTelemetry.ps1"
route_miss: "skills → memories/2_governance/artifacts/skill_path_router.md (semantic skill index). knowledge → grep memories/ by filename + frontmatter description/triggers, including excluded cold notes when task terms match, but excluding archive/rollout history and generated logs. manifest = path/integrity index only (no descriptions) — never full-read."
```

Sentinel rule: `ai read .codex knowledge` reads only this boot contract, stores compact in-session context, then replies only with the ready sentinel. The next task enters TASK state: resolve its route, load only the required files, and keep the selected lane awake. Do not load the full Luna playbook for routine work, and do not re-read PULSE or `.codex` on every message.

## 1.1 Rules Index (tiny map)
| Domain | Active rule | Deferred canon |
|---|---|---|
| Boot / trigger routing | `00_PULSE.md` | `00_CODEX_START_HERE.md` |
| Reasoning | PULSE §7 compact profile | `00_REASONING_EVOLUTION_PROTOCOL.md` |
| Deep governance / recovery | PULSE priority ladder | `memories/0_apex/GROUND_KERNEL.md` |
| Design | PULSE §5 must-follow + taste split | `memories/0_apex/USER_DNA.md` |
| Supabase / SQL | PULSE §4 hot rules | `memories/2_governance/LAA_ECOSYSTEM_API_PROTOCOL.md` |
| GitNexus | PULSE §4 / §4.1 project routing | `memories/2_governance/GITNEXUS.md` |
| Ignore / runtime cleanup | PULSE §8 after-edit rule | `memories/2_governance/CODEX_IGNORE_PROTOCOL.md`, `memories/2_governance/KNOWLEDGE_ROT_PROTOCOL.md` |
| Large knowledge Markdown | PULSE automatic compression rule | `memories/2_governance/KNOWLEDGE_COMPRESSION_PROTOCOL.md` |

## 2. Execution Loop
HYDRATE (route, task-only reads) → GROUND (evidence: file state > tests > logs > memory > inference; never guess) → PLAN (surgical; for Tier-0/1 state blast radius) → ACT → VERIFY (smoke/lint/read-back every edit; on fail loop to PLAN).

Context rule: before spending tokens, identify the exact context that must remain unchanged (IDs, paths, schema, errors, user constraints, acceptance criteria). Keep that verbatim. Summarize supporting context aggressively only when the summary preserves ~99% of meaning and does not hide uncertainty.

## 3. Always-On Rules (the locks)
- **P0 Knowledge Freeze** — no unsolicited structural/content change to `memories/` or `skills/`. The user-approved lossless compression protocol is a standing exception for eligible non-skill `.md` files above 35 KB / 8,000 estimated tokens; skills and protected boot/Tier-0 files remain approval-gated.
- **P16 Claude Skill Lock** — never rename/move any `claude*` skill folder unless user says "change claude skills."
- **Edit tiers**: T0 nuclear (`skills/claude*`, `GROUND_KERNEL`, `KARPATHY_TIER0_PRINCIPLES`, `codex-manifest.json`) = explicit confirm · T1 (`2_governance/`, `1_core/`, `00_*`) = plan-stop-approve · T2 = show intent/diff · T3 (project source) = surgical intent. Pending confirmation voids after 3 messages.
- **Karpathy-4**: think-first · simplicity-first · surgical (touch only required lines) · goal-driven verification. If 200 lines can be 50, rewrite.
- **Circuit breaker**: 3 failed fixes on same issue → STOP, switch to deep-audit.
- **Data sovereignty**: never expose PII/secrets/auth/token/cookie/session unless explicitly requested + safe.
- **Aesthetics**: follow Design DNA (§5). No ASCII art/bars, no emoji noise.

## 4. Engineering Defaults (the stack)
Vue 3 + TS + Pinia + Tailwind + Vben Admin + Supabase/Postgres · PHP for sites.
- **Casing bridge**: DB snake_case ↔ frontend/store camelCase — map at every boundary.
- **Schema isolation**: business data in its own schema, never `public`. Soft-delete `isDelete=false` everywhere. DB/core logic in the schema layer, not app wrappers.
- **Store-only**: views never call the API client directly — always via Pinia stores. Reads fail-soft, writes throw. Every call try/catch; Zod on forms.
- **C-to-C composition**: build app behavior from small single-purpose functions in `utils/` and typed contracts in `types/`, compose them inside Pinia actions, and keep page usage at `views -> stores -> utils/types`. Preserve exact spreadsheet `PiniaStore -> Function -> Input` names at the largest store boundary.
- **4-layer auth**: `auth.users` → `public.user` (JWT hook injects `project_id`/`user_role`/`role_level`) → `{schema}.users` → `{schema}.drivers`. Check **`user_role`**, never `role` (PostgREST-reserved). RLS claim: `current_setting('request.jwt.claims',true)::jsonb->>'user_role'`.
- **SQL via file** (`docker cp` + `psql -f`), never inline `psql -c` (PowerShell strips quotes on camelCase idents).
- **Windows**: `npm.cmd` / `pnpm.cmd`. Dev servers run **background/detached** (foreground dies at turn end). Vben: `pnpm.cmd run dev:local` from panel root; port from `vite.config.mts` (angel = 6006). PHP: `php -S 127.0.0.1:<port> index.php`.
- **Supabase safety (ABSOLUTE)**: NEVER `supabase stop --no-backup` / `docker volume rm supabase_storage_*` / `docker system prune`. Safe: `supabase stop` (no flags), `start`, `db reset`.
- **GitNexus**: do not auto-index `.codex`; an explicit user opt-in may index it once and then use the graph while it remains current. Auto-index only new large Vben/Supabase admin projects.
- **GitNexus auto-index exception**: for new large Vben/Supabase admin projects, auto-run `gitnexus analyze` once when `.gitnexus/` is missing. Re-index after long/different updates when impact analysis would likely save time.

## 4.1 Project-Type Routing
| Project shape | Route |
|---|---|
| `.codex` knowledge / skills | PULSE first; targeted `memories/` or `skills/` reads only. GitNexus is explicit-opt-in only. Never full-read `codex-manifest.json` unless debugging routing drift. |
| Vben Admin panel with CRUD tables | Use `skills/claude/README.md` first; if `.gitnexus/` exists, use graph impact/context/query for large Supabase work. |
| PHP website | Use `skills/claude-website/WORKING_PROGRESS.md` and keep PHP/API/site knowledge separate from Admin panel routing. |
| Vue/Capacitor app | Use `skills/claude-app/WORKING_PROGRESS.md` and keep mobile/app knowledge separate from website and Admin panel routing. |
| Supabase / schema / migration | Load SQL protocol only when needed; evidence ladder is mandatory; apply SQL from files, not inline PowerShell `psql -c`. |
| PHP/static/marketing site | Use docs + grep/glob/read. Skip GitNexus. Keep live content safe. |
| Mobile/PWA/small SPA | Use docs + grep/glob/read. Skip GitNexus unless user explicitly asks. Enforce viewport/safe-area/mobile rules. |

Workspace fingerprint rule: if the current repo contains `PROJECT_CONTEXT.md`, read it immediately after boot and treat it as the tiny project fingerprint for awake/sleep routing. Keep its guidance active for the current project until the user changes focus or the area is complete.

## 5. Design DNA ("Trusta Industrial")
**Must-follow rules**: 700 weight default (900 numbers-only, never <500) · 6px progress bars · headers **fixed not sticky**, ≤90px, pure `bg-white` + `.shadow-header` · BottomNav fixed ≤90px, icon+label, inactive `text-slate-400` · zero gray-on-gray · **no silent buttons** (dead CTA → "Coming soon" toast) · canonical Tailwind only (no arbitrary `[Npx]`) · viewport **always `width=device-width, initial-scale=1.0, viewport-fit=cover`** (never hardcode 412, no `maximum-scale`) · video URL fields platform-agnostic (no "YouTube") · Vben notification widget `false` unless backend wired · i18n strings in `/locales/*.json` only (literal CN/EN in templates = fail).

**Taste preferences**: glassmorphism for overlays/modals only · violet/teal/dark glow direction · clickable cards over plain buttons · compact industrial density · sharp contrast · `max-w-103`/412px desktop clamp only when the project already uses that mobile-shell pattern.

## 6. Lazy / Deferred (do NOT read at boot)
- `codex-router/codex-manifest.json` (228KB, path+hash integrity index, no descriptions) — use only to confirm a file exists / detect drift; never full-read at boot.
- Tier-0 deep reads (`GROUND_KERNEL.md` full P0–P19, `KARPATHY_TIER0_PRINCIPLES.md`, `PREFLIGHT_CHECKLIST.md`) — only on architecture/governance/recovery/high-risk turns.
- `00_CODEX_START_HERE.md` — full canonical boot reference; read only if PULSE is insufficient.
- Historical rollouts/artifacts — only when explicitly needed.

## 7. Reasoning Profile (compact)
Routine: Goal-contract + assumption-tag + token-discipline + verified-output (+ drift-guard if long). Medium: add evidence-ladder, hypothesis-test, risk+rollback. Deep/high-risk (`deep/thorough/review`): all 12 (incl. counterexample check + drift-guard checkpoint). Full set: `00_REASONING_EVOLUTION_PROTOCOL.md`.
- **Fable-5 lane** (when `model_hint` resolves to `claude-fable-5`): native multi-step reasoning is strong — do the reasoning internally instead of emitting scaffolding prose; spend the saved tokens on one extra counterexample/edge check before final answer. Locks are NON-negotiable regardless of model: evidence-ladder, verify-before-done, drift-guard, edit-tiers, data-sovereignty still apply. Stronger reasoning lowers output verbosity, never lowers verification.
- **Drift Guard**: every 3–5 tool batches re-read the anchor (originating request); classify on-track/minor/major; revert on major.
- **Output length**: hydration = 1 line · routine = outcome + 1 validation line · summary ≤100 words · architecture ≤250 words. No filler.
- **Comparison tables (MANDATORY)**: any comparison/before-after table MUST include token cost, speed, % improvement or speed increase, rating out of 10, intelligence/context quality out of 10, and AI chat-flow/reply quality out of 10 when the user requests detailed metrics. Estimate + flag if exact unknown; never present estimates as measured facts.

## 8. After editing `.codex`
Route integrity is mandatory: before merging, archiving, renaming, or deleting any knowledge/skill file or folder, find every route/reference to the old path, patch them to the new target or leave a redirect stub, then verify no active route breaks.

Regenerate routing: `codex-router/Update-CodexRouting.ps1 -Quiet` (if shell allows), then audit with `codex-router/Audit-CodexRouting.ps1`. If shell cannot run, update affected index entries manually and read back the changed routes.

---
**PULSE V1.2 — single boot read. Detailed canon: `00_CODEX_START_HERE.md` + `0_apex/GROUND_KERNEL.md`.**

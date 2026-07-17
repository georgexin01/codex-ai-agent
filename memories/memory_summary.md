v1

## User Profile
The user uses Codex for direct implementation, debugging, `.codex` routing/memory maintenance, and Vue/Vben/Pinia work across several local workspaces. They prefer route-first execution: read the smallest correct entrypoint, act directly, and verify against current files, tests, logs, SQL, or browser/HTTP evidence instead of assumptions [ad-hoc note]. They repeatedly preserve boundaries: keep important routed markdown protected, keep secrets out of durable memory, keep localhost verification separate from unsolicited fixes, preserve exact public Store contracts when a spreadsheet or existing module defines them, and keep durable AI-facing guidance in concise English without translating app-layer labels/contracts [ad-hoc note]. In `trash-container-app`, they work across paired admin/driver apps with strict Pinia contract enforcement, Cyroro schema awareness, surgical UI edits, and evidence-backed localhost/workflow verification. They also want durable operating rules captured once and reused, especially for `.codex` boot behavior, reporting format, localhost detection, and contract-sensitive app work.

## User preferences
- In full-access sessions, continue through obvious next steps without repetitive confirmation pauses; stop for destructive actions, hidden risk, or real tradeoffs [ad-hoc note]
- Treat `ai read .codex knowledge` as a strict boot-read trigger: read the smallest routed entrypoint, return the sentinel only, and keep the matched route/skill family awake
- For multi-step work, prefer a compact Markdown table with `task | changes | complete`; use `&#10003;`, `&#10007;`, and `&#9888;` from evidence, not assumptions [ad-hoc note]
- When the user supplies numbered steps or the work splits into several missions, number the task rows; for page-wide updates, enumerate each discovered page as its own row [ad-hoc note]
- When the user asks for comparison, before/after, optimization, or "more info in tables", keep the compact status table and add comparison metrics such as improvement %, estimated token cost, speed increase %, intelligence/context rating, and chat-flow/reply rating; label estimates clearly [ad-hoc note]
- For `.codex` maintenance, keep cleanup narrow, evidence-based, and route-safe; protect important routed `.md` files and report measurable before/after verification
- When writing durable `.codex` knowledge, skill updates, Pinia contract audits, migration summaries, or generated developer guidance for this workspace, keep that guidance in concise English and do not translate application labels, DB values, sheet values, or public contract names [ad-hoc note]
- When the user asks for options or rankings, lead with the recommended answer first, then short numbered options
- For `3+` changes, multi-file work, or DB+code mixed work, list numbered steps first when active coordination will help [ad-hoc note]
- In app-store work, preserve exact `PiniaStore -> Function -> Input` names; in `trash-container-app`, read the live `Trash` -> `Pinia` sheet first and keep intentional spellings like `getAllBinWIthOrder` [ad-hoc note]
- For `trash-container-app` Pinia/Cyroro paired-app work, read the live contract, current schema, files, and callers first; keep the change budget to the affected route/store/util/type/caller set and avoid unrelated refactors [ad-hoc note]
- In Vue/Vben work, keep user-visible text behind `$t('...')`, keep schemas typed, and return complete code instead of placeholders or truncated files [ad-hoc note]
- When the user says exactly `localhost test`, auto-detect real runnable roots from the current workspace, verify HTTP responses, print each working raw URL on its own line, and stay in start/verify mode unless they separately ask for a fix [ad-hoc note]
- For screenshot/design requests, change only the named page/component/property; if the user says `design only`, do not change content, DB mapping, status logic, or navigation behavior [ad-hoc note]

## General Tips
- Route first, then expand only if the trigger is still unclear [ad-hoc note]
- Verify before done: use read-back, type-check/build, SQL/log checks, or browser/HTTP evidence
- For deep `.codex` work in the Luna lane, use `HYDRATE route -> GROUND current evidence -> PLAN -> ACT -> VERIFY -> REPORT` [ad-hoc note]
- After major `.codex` changes, the one-time boot refresh is one fresh chat plus exactly `ai read .codex knowledge`
- If root Git shows `m memories` or mode `160000`, treat it as nested Git metadata: remove the cached gitlink, re-add `memories/`, and verify no nested `.git` remains
- For `trash-container-app` paired-app audits, use bounded `Trash -> Pinia` sheet reads, run `pinia-contract-workflow/scripts/check_paired_pinia_contract.ps1`, inspect the affected store plus direct `utils/types` and one caller per app, then do static contract/env/legacy checks before authenticated reads or builds [ad-hoc note]
- In `trash-container-app`, active implementation targets are `web-admin-app` and `web-driver-app`; `admin-panel-trash` is usually reference-only unless the user explicitly reactivates it [ad-hoc note]
- `trash-container-app` localhost defaults currently route to `admin-panel-trash` on `6006`, `web-admin-app` on `5173`, and `web-driver-app` on `3000`; reuse [skills/localhost-test/SKILL.md](/C:/Users/user/.codex/skills/localhost-test/SKILL.md)

## What's in Memory

### workflow-global

#### 2026-07-16

- Detailed comparison-table metrics on top of the compact status table: detailed tables, comparison table, before/after, optimization, improvement %, token cost, speed increase %, intelligence rating, chat flow rating [ad-hoc note]
  - desc: Search this first when the user wants richer reporting than the base status table, especially for before/after or optimization comparisons across any workspace. See the top reporting block in [MEMORY.md](/C:/Users/user/.codex/memories/MEMORY.md). [ad-hoc note]
  - learnings: keep the compact status table, then add dedicated metrics columns or a second comparison table; treat token/speed/quality figures as estimates unless current evidence measured them. [ad-hoc note]

#### 2026-07-15

- Task-status table response format: task | changes | complete, &#10003;, &#10007;, &#9888;, numbered steps, page-wide updates [ad-hoc note]
  - desc: Search this first when the user gives a multi-step mission and the response format should make progress/completion easy to audit across any workspace. See the top reporting block in [MEMORY.md](/C:/Users/user/.codex/memories/MEMORY.md). [ad-hoc note]
  - learnings: use the compact table as the main status surface, number rows when the request is numbered, enumerate each discovered page for page-wide work, and only mark complete from file/test/SQL/log/browser evidence. [ad-hoc note]

### C:\Users\user\Desktop\trash-container-app

#### 2026-07-15

- Cyroro dual-app Pinia/schema audit and paired-app fast gate: cyroro, VITE_SUPABASE_SCHEMA=cyroro, schema.sql, paymentStatus, cyroro-cartrack-vehicle-status, check_paired_pinia_contract.ps1 [ad-hoc note]
  - desc: Search this first for `cwd=C:\Users\user\Desktop\trash-container-app` when admin/driver work touches shared Supabase schema truth, debt/task semantics, CarTrack behavior, or you need the fastest safe audit path before deep app reads. See the top trash block in [MEMORY.md](/C:/Users/user/.codex/memories/MEMORY.md). [ad-hoc note]
  - learnings: both apps share `VITE_SUPABASE_SCHEMA=cyroro`; keep `schema.sql` reference-only, map legacy public keys at the store/util boundary, treat CarTrack 404 as an undeployed Edge Function warning, and use the bounded sheet-plus-precheck flow before broader code scans. [ad-hoc note]
- `localhost test` verified three runnable apps after one Vben retry: localhost test, admin-panel-trash, web-admin-app, web-driver-app, HTTP 200, Unable to connect to the remote server, 6006, 5173, 3000
  - desc: Search this first for `cwd=C:\Users\user\Desktop\trash-container-app` when the user asks only `localhost test` and you need the real runnable roots, ports, commands, and retry behavior. See the top trash block in [MEMORY.md](/C:/Users/user/.codex/memories/MEMORY.md).
  - learnings: detect the three app roots automatically, verify each URL with HTTP, and give `admin-panel-trash` on `6006` one extra readiness pass before declaring it down.

#### 2026-07-14

- Trash dual-app operating rules, absolute Pinia gate, and Hotpot-style store upgrade: web-admin-app, web-driver-app, Trash sheet, getAllBinWIthOrder, OrderUpdateInput, DriverTaskUpdateInput, design only [ad-hoc note]
  - desc: Search this first for `cwd=C:\Users\user\Desktop\trash-container-app` when the user wants exact Trash-sheet Store/Function/Input names preserved, admin/driver workflow semantics kept aligned, or visual edits kept surgical. See the same trash block in [MEMORY.md](/C:/Users/user/.codex/memories/MEMORY.md). [ad-hoc note]
  - learnings: read the live `Trash -> Pinia` sheet first, preserve object-style `update(input)` and auth-scoped driver reads, reuse Hotpot only as a store-structure guide, and verify workflow changes with type-check/build plus visible-state and persistence-path checks. [ad-hoc note]

### C:\Users\user\.codex

#### 2026-07-15

- Durable `.codex` knowledge stays English while app-layer labels/contracts stay verbatim: durable .codex knowledge, English, Pinia contract audits, migration summaries, do not translate UI labels, PiniaStore, Function, Input [ad-hoc note]
  - desc: Search this first for `cwd=C:\Users\user\.codex` when updating memories, skills, audits, or generated developer guidance and you need the workspace language boundary. See the `.codex routing hygiene, git metadata cleanup, Luna execution, and verification` block in [MEMORY.md](/C:/Users/user/.codex/memories/MEMORY.md). [ad-hoc note]
  - learnings: keep durable AI-facing guidance concise English, but do not translate UI labels, DB/sheet values, or public Store/Function/Input/table/column/status names. [ad-hoc note]

#### 2026-07-10

- `.codex` maintenance with GitNexus, ignore synchronization, route verification, and Luna execution lane: gitnexus, Validate-CodexKnowledge.ps1, Audit-CodexRouting.ps1, codexignore, claudeignore, ai read .codex knowledge, HYDRATE route
  - desc: Search this first for `cwd=C:\Users\user\.codex` when the user wants `.codex` itself faster/smarter, wants a safe cleanup/ignore/routing sweep, or wants the current Luna execution defaults. See the `.codex routing hygiene, git metadata cleanup, Luna execution, and verification` block in [MEMORY.md](/C:/Users/user/.codex/memories/MEMORY.md).
  - learnings: run `.codex` maintenance in phases, verify route-integrity counts instead of guessing from generated noise, and rehydrate once with a fresh-chat `ai read .codex knowledge` after major changes.
- Nested `memories/.git` cleanup: memories/.git, gitlink, 160000, m memories, git rm --cached -r -- memories
  - desc: Search this first for `cwd=C:\Users\user\.codex` when commits fail because `memories/` behaves like a submodule/gitlink instead of normal tracked files.
  - learnings: `m memories` plus mode `160000` means Git metadata, not content; back up the nested `.git`, remove the cached gitlink, re-add `memories/`, then verify root status and filesystem state.

### C:\Users\user\Desktop\VIPBillion

#### 2026-07-10

- VIPBillion `.codex` boot first-runs and sentinel behavior: ai read .codex knowledge, Boot First-Runs, always wake these lanes in order, ai current lane memory, ai hot cold gate
  - desc: Search this first for `cwd=C:\Users\user\Desktop\VIPBillion` when the user repeats the boot-read request or wants `.codex` boot behavior improved without losing the sentinel-only outward response.
  - learnings: keep the visible trigger lean, but the internal boot now always wakes the five first-run lanes in `00_PULSE.md` for stronger follow-up routing.

### Older Memory Topics

#### C:\Users\user\.codex

- `.codex` hybrid metadata router and Vben route graph retrofit: hybrid metadata router, YAML frontmatter, skill_path_router.md, 5-point formula, project knowledge template, Vben Admin
  - desc: Use this for `cwd=C:\Users\user\.codex` when the user wants AI-facing knowledge/skills to be more self-describing, more priority-routed, or easier for future AI runs to discover safely.

#### C:\Users\user\Desktop\angel-interior

- Angel hidden tester-account workflow and local Supabase protection: hidden tester account, local-supabase, role_table_grants, permission denied for table awards, award_date, shared helpers, busy lock state [ad-hoc note]
  - desc: Use this for `cwd=C:\Users\user\Desktop\angel-interior` when Angel work touches hidden tester-account flows, localhost/public data mismatches, or surgical download/request fixes that must preserve unrelated pages. [ad-hoc note]

#### C:\Users\user\Desktop\VIPBillion

- VIPBillion booking-module reuse and Vben table/drawer alignment guardrails: admin-vipbillion, Booking Management, booking-related CRUD modules, Vben table, CRUD drawer, top scroll position, shared scroll reset helper [ad-hoc note]
  - desc: Use this for `cwd=C:\Users\user\Desktop\VIPBillion` when a Booking Management/report view should extend an existing admin CRUD flow, when a cloned drawer reopens in the wrong scroll state, or when a Vben table column shifts summaries/actions/scroll alignment. [ad-hoc note]
- VIPBillion website FIUU routing and booking-data mapping: website-vipbillion, FIUU, htdocs_wiper, pay.fiuu.com/RMS/pay/{merchantId}, returnipn.php?treq=0&sa=..., booking payload [ad-hoc note]
  - desc: Use this for `cwd=C:\Users\user\Desktop\VIPBillion` when website checkout/payment flow work touches FIUU redirects, booking payload translation, or safe placement of merchant credentials. [ad-hoc note]

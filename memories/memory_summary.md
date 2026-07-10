v1

## User Profile
The user uses Codex for hands-on implementation, debugging, memory upkeep, and `.codex` routing improvements across several unrelated local checkouts. They prefer agents that route themselves from project shape, act directly, stay surgical, and verify against current files/tests/logs instead of giving abstract explanations or relying on stale memory [ad-hoc note]. They repeatedly care about preserving boundaries: keep localhost behavior intact when changing public domains, clone an existing module shell before editing internals, avoid visual drift when fixing builds, and preserve unrelated flows while repairing the active Angel behavior [ad-hoc note]. They also treat `.codex` itself as a product: boot-path efficiency, selective skill wake-up, durable notes/templates, and trustworthy memory capture are recurring priorities.

## User preferences
- In full-access sessions, avoid repetitive confirmation pauses; continue through obvious next steps and stop only for destructive actions, hidden risk, or meaningful product tradeoffs [ad-hoc note]
- Treat `ai read .codex knowledge` as a strict boot-read trigger: read the small boot route, return the sentinel only, then keep the matched route/skill family awake across nearby follow-up work [ad-hoc note]
- When the user asks for options, rankings, or choices, lead with the recommended answer first, then give short numbered options
- For `.codex` cleanup or maintenance, keep the review narrow and evidence-based; verify route references before deleting and protect important routed `.md` files by default
- When the user asks for `.codex` improvements like `5 improvement`, `100/100`, or `help me ai performance alot more`, respond with structured/ranked changes and convert accepted rules into durable routed notes/templates
- For `3+` changes, multi-file work, or DB+code mixed work, list numbered steps first when active coordination will help [ad-hoc note]
- For build/debug requests, fix the issue and rerun verification; do not stop at the first explanation or assume the first surfaced error is the only blocker
- When the user worries a fix might `change any design` or break other areas, include regression-safety checks as part of completion
- In VIPBillion admin work, prefer reusing the existing booking-related CRUD modules/drawers when the workflow already exists; only split into a new module when the data flow or UI behavior is genuinely different [ad-hoc note]
- When the user says `copy and paste`, `duplicate`, `clone`, or `same modules`, duplicate the whole source module shell first and only then edit inside content [ad-hoc note]
- In VIPBillion/Vben drawer work, reused or cloned CRUD drawers should reopen at the top scroll position; booking-launched drawers should also clear persisted mount state on close so reopening starts fresh [ad-hoc note]
- For provenance/debug requests like `find this .modal where are they come from`, start from the exact snippet the user highlighted and trace outward through markup, runtime includes, and bundled code
- If the user asks to save code to GitHub and then says `retry`, diagnose the push failure and retry in the same session
- In VIPBillion website work, default localhost to `http://127.0.0.1:8000/` from the `website-vipbillion` root, and if it `suddenly stop`, check whether the PHP process is still alive before assuming a code regression
- In VIPBillion assignment work, enforce duplicate-booking prevention at submit time across both `/drivers/jobs` and `/bookings/list`
- In Kushiro domain work, preserve localhost and change only the published/staging hostnames the user explicitly named
- Protect local Docker / local Supabase state unless the user explicitly permits stack changes in that turn [ad-hoc note]
- For Angel hidden tester-account work, prefer the most recent historically verified credential source, never invent a secret, and only auto-run when the request clearly matches that pattern [ad-hoc note]
- For Angel live debugging, keep the original goal in focus, prefer surgical fixes, verify the visible user flow, and preserve unrelated page flows [ad-hoc note]

## General Tips
- Prefer current file state, tests, logs, and schema over memory when evidence conflicts; truth before speed is the durable default [ad-hoc note]
- Keep edits surgical and verify every meaningful change with read-back, smoke test, lint, build, or SQL validation before calling the task done [ad-hoc note]
- For VIPBillion, route by subtree first: `website-vipbillion` is the PHP site and `admin-vipbillion` is the Vben admin
- In `website-vipbillion`, launch from the site root with `php -S 127.0.0.1:8000 index.php`; wrong working directory/front-controller context can create misleading localhost `500` errors
- For VIPBillion website FIUU work, use the `htdocs_wiper` pattern: redirect through `pay.fiuu.com/RMS/pay/{merchantId}`, map booking payloads server-side, keep `returnipn.php?treq=0&sa=...` only on return/result pages, and keep merchant credentials in project config [ad-hoc note]
- In VIPBillion admin booking assignment, start at the shared `driver-job` store/form path; both booking and driver-job flows depend on it
- In VIPBillion/Vben table edits, update body cells, summary row cells, horizontal scroll width, and action/checkbox offsets together whenever a column is inserted or removed [ad-hoc note]
- In VIPBillion/Vben drawer reuse, reset scroll on open, on opened, and after nested content mount when needed; prefer one shared scroll reset helper over per-screen fixes [ad-hoc note]
- For VIPBillion/Vben soft-delete CRUD, follow the table's real convention: slug modules use active-row partial unique indexes around `deleted_at`, newer business tables usually use `isDelete = false/true`, and RLS-blocked updates may need a `SECURITY DEFINER` RPC [ad-hoc note]
- For Vue/Vben/Supabase work, keep DB columns `snake_case`, frontend/store/form fields `camelCase`, route views through stores, and prefer SQL files over inline `-c` commands [ad-hoc note]
- For Angel localhost/public mismatches, verify env file selection, runtime host detection, and the actual Supabase project URL before chasing frontend rendering bugs [ad-hoc note]
- Use [skills/awake-skill-routing/SKILL.md](/C:/Users/user/.codex/memories/skills/awake-skill-routing/SKILL.md) for compact project fingerprinting and one-skill-family boot routing [ad-hoc note]

## What's in Memory

### C:\Users\user\Desktop\VIPBillion

#### 2026-07-09

- VIPBillion booking-module reuse and Vben table/drawer alignment guardrails: admin-vipbillion, Booking Management, booking-related CRUD modules, shared booking CRUD path, Vben table, CRUD drawer, top scroll position, shared scroll reset helper [ad-hoc note]
  - desc: Search this first for `cwd=C:\Users\user\Desktop\VIPBillion` when a Booking Management/report view should extend an existing admin CRUD flow, when a reused drawer reopens in the wrong scroll state, or when a Vben table column shifts summaries/actions/scroll alignment. [ad-hoc note]
  - learnings: reuse the existing booking module/drawer path unless the workflow is genuinely different, treat every Vben column insert as a full structural update, and reset reused CRUD drawers on open/opened/post-mount so they always reopen at the top. [ad-hoc note]

#### 2026-07-08

- VIPBillion `.codex` boot-read sentinel confirmation: ai read .codex knowledge, 00_PULSE.md, ready sentinel, Get-Content -TotalCount 250, hydrate once per chat session
  - desc: Search this first for `cwd=C:\Users\user\Desktop\VIPBillion` when the user repeats the boot-read request and you need the exact sentinel-only behavior rather than a project explanation.
  - learnings: read `C:\Users\user\.codex\00_PULSE.md`, return only the ready sentinel, and keep the route awake instead of re-reading `.codex` on every follow-up.

### C:\Users\user\.codex

#### 2026-07-07

- `.codex` boot self-check, protected markdown, and cold-storage promotion lane: 00_PULSE.md, boot self-check, 10/10 gate, Protected Markdown Rule, cold storage audit, ai promote memory, 0_apex, 1_core, 2_governance
  - desc: Search this first for `cwd=C:\Users\user\.codex` when the user wants `.codex` itself faster/smarter, wants to know what memory is actually hot, or wants cleanup/promotion without harming important routed markdown.
  - learnings: keep `00_PULSE.md` small but active, use selective promotion and `(ai manage)` for durable anchors, treat direct `00_PULSE.md` references as the hot set, and protect route-critical `.md` files from deletion unless the user explicitly targets them.

### C:\Users\user\Desktop\angel-interior

#### 2026-07-06

- Angel surgical live-debugging and download-flow safeguards: angel-interior, localhost vs cPanel, visible flow, surgical fix, preserve unrelated flows, busy lock state, shared helpers, download routes [ad-hoc note]
  - desc: Search this first for `cwd=C:\Users\user\Desktop\angel-interior` when the task involves a local-vs-published behavior mismatch, a fragile download/request flow, or a fix that should avoid redesigning nearby screens. [ad-hoc note]
  - learnings: keep the original goal in focus, verify what the user actually sees, preserve unrelated flows, use a simple busy/lock state to stop duplicate clicks, and repair the shared helper/download route instead of bypassing it. [ad-hoc note]

### Older Memory Topics

#### C:\Users\user\.codex

- `.codex` safe cleanup audit for route integrity, `.sandbox` logs, and rollout-summary retention: cleanup, sandbox, rollout_summaries, Update-CodexRouting.ps1, Audit-CodexRouting.ps1, zero usage, googlesheet-email-integration
  - desc: Use this for `cwd=C:\Users\user\.codex` when the user wants folder-count reduction or low-risk cleanup without breaking routing or deleting still-live history.
- `.codex` hybrid metadata router, 5-point AI principles, and Vben route-graph retrofit: ai read .codex knowledge, 00_PULSE.md, skill_path_router.md, hybrid metadata router, project knowledge template, Vben Admin, analyze-schema, SOFT_DELETE_GUARD.md
  - desc: Use this for `cwd=C:\Users\user\.codex` when the user wants AI-facing knowledge/skills to be easier to route, more self-describing, or better wired across the Vben doc/skill family.
- `.codex` GitHub push failed with HTTP 408 while `skills-origin` also synced: git push origin main, ahead 1, HTTP 408, RPC failed, send-pack, skills-origin, rules/default.rules
  - desc: Use this for `cwd=C:\Users\user\.codex` when GitHub push output is confusing because network failure and the extra `skills-origin` sync appear together.

#### C:\Users\user\Desktop\VIPBillion

- VIPBillion website localhost startup and PHP front-controller debugging: website-vipbillion, php -S 127.0.0.1:8000 index.php, router.php, localhost:8000, scratch/sessions, homepage 200
  - desc: Use this for `cwd=C:\Users\user\Desktop\VIPBillion` when the PHP site should be restored on `127.0.0.1:8000` quickly or localhost `500` errors may come from bad launch context.
- VIPBillion admin duplicate-booking guards and shared assignment flow: admin-vipbillion, /drivers/jobs, /bookings/list, driver-job.ts, driver-job-form.vue, assertBookingAssignable, uq_driver_jobs_booking
  - desc: Use this for `cwd=C:\Users\user\Desktop\VIPBillion` when duplicate booking assignment must be blocked consistently across booking-side and driver-job-side entry points.
- VIPBillion clone-first module duplication and slug soft-delete guardrails: copy and paste, duplicate, same modules, driver-job list drawer, checkSlugExists, deleted_at, uq_news_project_slug_en, skills/clone-first-module-duplication/SKILL.md
  - desc: Use this for `cwd=C:\Users\user\Desktop\VIPBillion` when the user wants an existing admin module copied with the same shell or when slug validation should ignore soft-deleted rows. [ad-hoc note]
- VIPBillion website FIUU routing and booking-data mapping: website-vipbillion, FIUU, htdocs_wiper, pay.fiuu.com/RMS/pay/{merchantId}, pg.e2pay.co.id, returnipn.php?treq=0&sa=..., booking payload
  - desc: Use this for `cwd=C:\Users\user\Desktop\VIPBillion` when website checkout/payment flow work touches FIUU redirects, booking payload translation, or safe placement of merchant credentials. [ad-hoc note]
- VIPBillion admin `isDelete` soft-delete CRUD rules: admin-vipbillion, isDelete, soft delete, relation lookups, dropdown options, SECURITY DEFINER, RLS, SOFT_DELETE_GUARD.md
  - desc: Use this for `cwd=C:\Users\user\Desktop\VIPBillion` when a new admin CRUD flow should hide deleted rows consistently or when delete/update behavior is failing under Supabase RLS or trigger constraints. [ad-hoc note]

#### C:\Users\user\Desktop\angel-interior

- Angel hidden tester-account workflow: hidden tester account, auth.users, auth.identities, public."user", active_project_id, users table filter, skills/angel-hidden-tester-account/SKILL.md [ad-hoc note]
  - desc: Use this when Angel work clearly matches the internal tester-account create/reset/verify flow and you need the rule set without storing or guessing secrets. [ad-hoc note]
- Angel local Docker / local Supabase protection and env-routing cautions: local-supabase, Docker, Supabase, role_table_grants, permission denied for table awards, award_date [ad-hoc note]
  - desc: Use this when a future Angel task could change local DB stack selection or when localhost data mismatches suggest env, GRANT, or year-field drift. [ad-hoc note]

#### C:\Users\user\Desktop\New folder\admin-panel-Thongthai

- Vite/TypeScript build fix plus `.table-primary` CSS repair: npm run build, moduleResolution bundler, fileURLToPath, __dirname, lightningcss, table-primary, var(--primary-rgb)
  - desc: Use this for `cwd=C:\Users\user\Desktop\New folder\admin-panel-Thongthai` when build errors start in config/type-checking or later surface as CSS minification failures and the user wants the existing design preserved.

#### C:\Users\user\Desktop\New folder\thongthaimassage_v2

- Reservation modal provenance tracing: reservation.js, reservation.php, reservation_vendor.min.js, .modal('show'), open-floor-plan, Bootstrap 4.6.2, jQuery 3.7.1
  - desc: Use this for `cwd=C:\Users\user\Desktop\New folder\thongthaimassage_v2` when the user points at a UI snippet and wants to know where a modal/action really comes from.

#### C:\xampp\htdocs_86cara

- Homepage metadata branding and SEO/social copy sweeps: index.html, assets/favicon/site.webmanifest, LAPAN ENAM Car Accessories, Lapan Enam Car Window Film & Acessories (M) SDN BHD, og:title, twitter:description
  - desc: Use this for `cwd=C:\xampp\htdocs_86cara` when homepage title, description, or brand text must be changed consistently across HTML head metadata and the manifest.

#### C:\xampp\htdocs

- Root `.gitignore` for mixed PHP/static repo layout: .gitignore, git status --short, uploads, vendor, api/logs, assets, composer.phar, node_modules
  - desc: Use this for `cwd=C:\xampp\htdocs` when a root `.gitignore` must be added or tuned without hiding live source in a mixed-content web root.
- Kushiro PHP API domain config and upload endpoint remap: KushiroBBQ, kushiro.my, kushirobbq.com.my, Config.php, Helper.php, upload_receiver.php, RedirectController.php, APP_ENV, localhost
  - desc: Use this for `cwd=C:\xampp\htdocs` when Kushiro public/staging domains need updating without breaking localhost, or when you need the real PHP runtime touchpoints for a hostname swap.

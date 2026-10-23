thread_id: 01a15364-cc37-7c83-b5e5-f8d162e8fceb
updated_at: 2026-10-19T10:04:45+00:00
rollout_path: C:\Users\user\.codex\sessions\2026\10\19\rollout-2026-10-19T17-01-17-01a15364-cc37-7c83-b5e5-f8d162e8fceb.jsonl
cwd: \\?\D:\project\lionrider

# Lion Rider workspace orientation and login preparation

Rollout context: `D:\project\lionrider` contains separate `lionrider-website` (PHP/JSON storefront) and `admin-panel-lionrider` (Vben/Supabase admin). The agent inspected Markdown, routes, fixtures, live Docker Supabase state, and prepared the Admin login without changing code or database state.

## Task 1: Project and data-source orientation

Outcome: partial

Key steps:
- Read `PROJECT_CONTEXT.md`, website/admin guides, database contracts, module docs, and route sources.
- Confirmed the website remains JSON-backed and does not connect to Supabase.
- Confirmed the Admin uses schema `lionrider` in the shared Docker project `local-supabase`; existing schemas must be preserved.
- Inspected the live database read-only. Current notable counts: 1 Admin user, 76 permissions, 1 REAL product, 34 brands, 64 models, 2 product subcategories, 317 mirrored products, 1,364 mirrored variants; all inspected Lion Rider tables have RLS enabled.
- Mapped website routes through `index.php`/`router.php` and Admin routes through `apps/web-antd/src/router/routes/index.ts` and module files.

Failures and how to do differently:
- A broad root `git status` failed because `D:\project\lionrider` is not itself a Git repository; the website is the Git worktree, while the Admin directory was not detected as a Git worktree.
- Some PowerShell quoting caused a failed SQL identifier query. Use safer SQL file/stdin execution for quoted identifiers.
- The rollout did not complete the requested full page/database understanding; many outputs were truncated and browser verification was only partial.

Reusable knowledge:
- Treat current project files and live counts as authoritative over stale `knowledge.md` or older setup notes.
- Website and Admin data boundaries are deliberate: do not migrate the website JSON catalog to Supabase unless explicitly requested.
- Never reset, drop, rename, or replace schemas in the shared `local-supabase` stack.

References:
- `D:\project\lionrider\PROJECT_CONTEXT.md`
- `D:\project\lionrider\lionrider-website\README.md`, `BLUEPRINT.md`, `DUMMY-DATABASE-*.md`
- `D:\project\lionrider\admin-panel-lionrider\README.md`, `SUPABASE.md`, `LIONRIDER_SETUP_PLAN.md`, `AGENTS.md`
- Live Docker DB: `supabase_db_local-supabase`, project label `local-supabase`, schema `lionrider`

## Task 2: Prepare Lion Rider Admin login

Outcome: partial

Preference signals:
- The user asked the agent to understand the project and pages before proceeding, so future work should inspect current project evidence first and avoid destructive changes.
- The user did not provide or authorize exposing a password; the agent correctly left the password blank and did not submit login.

Key steps:
- Found that Vite uses hash routing (`VITE_ROUTER_HISTORY=hash`), so the login URL is `http://127.0.0.1:5173/#/auth/login`, not `/auth/login`.
- Confirmed login uses a phone number as the username, validated by `PHONE_PATTERN = /^6\d{9,11}$/` and `supabase.auth.signInWithPassword({ phone, password })`.
- Read the single active Lion Rider `super_admin` account’s phone identifier from the local database and prefilled it in the browser; the identifier itself is intentionally omitted from durable memory.
- Verified the linked role is level-10 `super_admin` with CRUD coverage across 19 resources.
- Left the browser tab open for handoff; no password was entered and no login attempt was made.

Failures and how to do differently:
- Initial navigation to `http://127.0.0.1:5173/auth/login` showed only the app shell because hash routing was required. Use the hash URL directly.
- An initial SQL query failed due to PowerShell mishandling quoted `public."user"`; the unquoted `public.user` form succeeded.

References:
- `admin-panel-lionrider/apps/web-antd/src/router/routes/core.ts`
- `admin-panel-lionrider/apps/web-antd/src/router/guard.ts`
- `admin-panel-lionrider/apps/web-antd/src/types/user.ts`
- `admin-panel-lionrider/apps/web-antd/src/api/core/supabase-auth.ts`
- Browser handoff URL: `http://127.0.0.1:5173/#/auth/login`


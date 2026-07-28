thread_id: 019fa1bc-28c3-7131-a311-b52649a250bd
updated_at: 2026-07-27T09:36:42+00:00
rollout_path: \\?\C:\Users\user\.codex\sessions\2026\07\27\rollout-2026-07-27T12-01-30-019fa1bc-28c3-7131-a311-b52649a250bd.jsonl
cwd: \\?\C:\Users\user\Desktop\admin-panel-labour-v4
git_branch: main

# Read-only project setup, runtime debugging, and workflow-audit context

Rollout context: Windows PowerShell in `C:\Users\user\Desktop\admin-panel-labour-v4`, a pnpm Vben monorepo with Vue/Vite frontend, Supabase integration, Labour migrations, and PuTTY SSH tunneling.

## Task 1: Project fingerprint and local setup

Outcome: success

Preference signals:
- The user asked for “a fast read of my project” and wanted to know whether `pnpm install` or other installation was needed -> future setup responses should inspect scripts, env files, Docker/Supabase files, and runtime modes before recommending commands.

Key steps:
- Found Node `v25.2.1`, pnpm `10.22.0`, Docker `29.3.1`, and Compose `v5.1.1` installed.
- Root scripts include `pnpm install --frozen-lockfile`, `pnpm dev:local`, and `pnpm dev:vps`.
- Main app is `apps/web-antd`; `dev:local` uses Vite mode `development.localhost`, while `dev:vps` uses `development.supabase`.
- Initial clone had no `.env` files and no Docker Compose file; `node_modules` already existed.

Reusable knowledge:
- This repository’s frontend is not itself a Docker Compose stack. Docker is for external/local Supabase services, while Vite runs the admin frontend.
- Environment files are loaded from the app working directory using `.env`, `.env.local`, `.env.<mode>`, and `.env.<mode>.local`.

## Task 2: Fix Vite `VITE_APP_TITLE` startup failure

Outcome: success

Key steps:
- Error `VITE_APP_TITLE is not defined` came from `apps/web-antd/index.html` and occurred because no mode-specific env file existed.
- Created ignored local file `apps/web-antd/.env.development.localhost` with `VITE_APP_TITLE=Labour Admin`.
- Verified the dev server returned HTTP 200 and rendered `<title>Labour Admin</title>`.

Failures and how to do differently:
- A foreground Vite smoke command timed out because the server is long-running; use a detached/background server and poll its HTTP endpoint instead.

## Task 3: Diagnose Docker/WSL failure

Outcome: partial

Key steps:
- WSL commands such as `wsl --list --verbose` and `wsl --status` hung or timed out.
- `com.docker.service` and `LxssManager` were stopped; `vmcompute` was running; Docker Desktop processes existed but Docker API was unavailable.
- Virtualization was present (`HyperVisorPresent: True`).
- Safe recovery was attempted, but `wsl --shutdown` itself hung. No distro unregister, Docker reset, volume deletion, or destructive cleanup was performed.

Failures and how to do differently:
- The recovery command had an initial PowerShell interpolation syntax error involving `"$svc:"`; use `${svc}` before a colon.
- Since WSL remained stuck, the evidence-supported next step was a Windows restart, not unregistering `docker-desktop` or deleting volumes.

## Task 4: Diagnose Supabase blank page and login failure

Outcome: partial

Key steps:
- Blank page error `supabaseUrl is required` occurred because `src/api/supabase.ts` calls `createClient()` before Vue mounts and the required URL was absent.
- Added local env values including `VITE_NITRO_MOCK`, `VITE_SUPABASE_URL`, `VITE_SUPABASE_ANON_KEY`, and `VITE_SUPABASE_SCHEMA`; later the user’s current env file showed a different real local configuration with `VITE_NITRO_MOCK=false`, port `5888`, and schema `insurancecrm2`.
- The later HTTP 400 `Invalid login credentials` proved Supabase was reachable; it was not an installation problem. Likely causes are wrong credentials, missing seed user, wrong schema/project, or migrations not applied.
- Important mode mismatch: the user initially used port 5173, while the current local env had `VITE_PORT=5888`.

Reusable knowledge:
- Mock mode does not eliminate the need for a syntactically valid Supabase URL because the Supabase module is imported during startup.
- Real Labour login requires a running Supabase instance plus Labour migrations/seed data; `pnpm install` alone cannot create users or database schema.

## Task 5: Identify which env/tunnel serves localhost:3001

Outcome: success

Key steps:
- Port `3001` was owned by `putty.exe`, not Vite.
- `pnpm dev:vps` selects `apps/web-antd/.env.development.supabase`.
- `localhost:3001` is a PuTTY SSH tunnel to the VPS Supabase dashboard/service; the Vue frontend is expected on the Vite port, commonly 5173.
- `pnpm dev:local` selects `.env.development.localhost`; `pnpm dev:vps` selects `.env.development.supabase`.

## Task 6: Requested read-only business workflow audit

Outcome: partial

Preference signals:
- The user explicitly said “do nothing no update, no changes to my project” and requested check/X tables showing what exists, is missing, or is only partial -> future audits should remain strictly read-only, distinguish UI presence from enforced business logic, and report evidence/uncertainty rather than editing.

Key steps:
- Inventory evidence showed routes/views/stores for customers, service items, quotations, companies, contracts, workers, placements, salaries, and slots.
- Strong implementation evidence exists for customer-linked companies, company-linked contracts, contract slot generation, worker assignment/replacement, standby/working state handling, worker-count increases, and replacement reason fields.
- The supplied workflow audit was not completed in the rollout; no final comprehensive check/X matrix was produced.

Reusable knowledge:
- Relevant files include `apps/web-antd/src/router/routes/modules/labour.ts`, stores such as `customers.ts`, `labour-companies.ts`, `labour-contracts.ts`, `labour-worker-placements.ts`, `slots.ts`, and Labour SQL migrations under `apps/web-antd/src/sql/migrations_labour4/`.
- Existing comments/locales indicate replacement reason may be optional in some UI strings (`reasonPlaceholder: ... optional`), which should be verified against the database RPC before claiming the owner requirement is enforced.

References:
- `package.json`: `dev:local`, `dev:vps`, `preinstall: only-allow pnpm`, Node `>=20.12`, pnpm `>=10`.
- `apps/web-antd/package.json`: `dev:local = pnpm vite --mode development.localhost`; `dev:vps = pnpm vite --mode development.supabase`.
- `apps/web-antd/src/api/supabase.ts`: `createClient(import.meta.env.VITE_SUPABASE_URL, ...)`.
- `apps/web-antd/src/api/core/auth.ts`: `VITE_NITRO_MOCK === 'true'` selects mock auth.
- `apps/web-antd/.env.development.localhost`: created during rollout; local-only and Git-ignored.
- Exact errors: `VITE_APP_TITLE is not defined`; `supabaseUrl is required`; `Invalid login credentials`; Docker API pipe unavailable; WSL commands timed out.

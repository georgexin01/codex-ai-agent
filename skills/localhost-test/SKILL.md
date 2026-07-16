---
name: localhost-test
description: Start and verify runnable local web projects when the user says "localhost test" or requests local app readiness checks.
---

# Localhost Test

Use this skill for read/start/verify work. Do not patch source, environment
secrets, database data, or project configuration unless the user separately
asks for a fix.

## Workflow

1. Use the current working directory as the workspace root.
2. Inspect only shallow candidate folders. Skip `node_modules`, `dist`,
   `build`, `.git`, test results, generated output, templates, fixtures,
   archives, and documentation-only folders.
3. Read the smallest relevant `PROJECT_CONTEXT.md`, `STATUS.md`, `README.md`,
   package manifest, Vite config, and env example to identify role and port.
4. Classify runnable projects:
   - Vben monorepo with `apps/web-antd` and `dev:local`: run
     `pnpm.cmd run dev:local` from the monorepo root.
   - Standalone Vue/Vite app with a `dev` script: run `npm.cmd run dev` from
     that app root through `cmd.exe`.
   - PHP front controller: run `php -S 127.0.0.1:<port> <front-controller>`.
5. Check the expected port before starting anything. Reuse a healthy listener;
   never create duplicate servers.
6. Start required servers detached/background so they survive the turn.
7. Wait for readiness, then verify every URL with an HTTP request. A process
   start alone is not success.
8. If a URL returns `500`, inspect application output. If it returns `000` or
   connection refused, inspect ownership/readiness and retry safely.

## Trash-container-app defaults

| Project | Role | Command | URL |
|---|---|---|---|
| `admin-panel-trash` | Vben desktop admin | `pnpm.cmd run dev:local` | `http://127.0.0.1:6006/` |
| `web-admin-app` | Vue mobile admin | `npm.cmd run dev` | `http://127.0.0.1:5173/` |
| `web-driver-app` | Vue driver app | `npm.cmd run dev` | `http://127.0.0.1:3000/` |

There is no PHP website in this workspace. Both mobile apps use the Cyroro
Supabase schema and must be verified against current project docs before any
port assumption is made.

## Validation beyond startup

When the user asks for more than readiness, run the nearest useful checks:

- Vue app: `cmd.exe /d /c npm run type-check`
- Vue app build: `cmd.exe /d /c npm run build`
- Cyroro API: perform read-only representative table requests with the
  correct `Accept-Profile: cyroro` header.
- Authenticated workflow checks require explicit credentials/session access;
  never invent or expose credentials. Verify visible state and persistence
  separately for task/photo/status flows.

## Reporting

Report detected projects, skipped folders with reasons, each verified raw URL
on its own line, HTTP status, server reuse/start state, and exact blockers.

---
name: localhost-test-trigger
description: "Fast local development startup and browser verification for mixed project roots. Detects real Vben admin, Vue app, and PHP website projects; skips templates and reference folders."
triggers: ["localhost test"]
status: authoritative
date_updated: "2026-07-13"
---

# `localhost test` trigger (redirect)

Canonical workflow: `C:\Users\user\.codex\skills\localhost-test\SKILL.md`.
This note remains as a route-safe historical redirect; do not use it as the
primary executor.

When the user says exactly `localhost test`, inspect the current workspace root first and automatically detect runnable project roots. Do not assume every sibling folder is an active product.

## Detection and classification

1. Use the current working directory as the workspace root.
2. Inspect only shallow candidate folders first; exclude `node_modules`, `dist`, `build`, `.git`, test-result folders, generated output, and nested dependency copies.
3. Classify a folder as a Vben admin when it has a pnpm monorepo/package workspace plus an active `apps/web-antd` app and a `dev:local` script. The admin command is `pnpm.cmd run dev:local` from the monorepo root.
4. Classify a folder as a Vue app when it has its own `package.json`, Vite/Vue source, and a `dev` script, but is not the Vben monorepo. The default command is `npm.cmd run dev` from that app root.
5. Classify a folder as a PHP website when it has PHP entry files such as `index.php`, `router.php`, or `composer.json`. Run it from the folder containing the real front controller.
6. Treat folders with only documentation, screenshots, fixtures, examples, archived code, or reference/template markers as non-runnable and report them as skipped with the reason.
7. If a project has an explicit `PROJECT_CONTEXT.md`, `STATUS.md`, `README.md`, or local env file, read the smallest relevant one to confirm its role and port before starting it.

## Current workspace sample

For `trash-container-app`:

| Folder | Type | Command | Current port |
|---|---|---|---:|
| `admin-panel-trash` | Vben admin | `pnpm.cmd run dev:local` | `6006` |
| `web-admin-app` | Vue app | `npm.cmd run dev` | `5173` |
| `web-driver-app` | Vue app | `npm.cmd run dev` | `3000` |

There is no PHP website in this workspace, so website startup is skipped.

## Startup and verification rules

- Check whether the expected port is already listening before launching a server; reuse and verify an existing healthy server instead of starting duplicates.
- Prefer the project’s configured `VITE_PORT`; if absent, read the Vite config, then choose the first free port in the project’s safe range.
- For standalone Vue/Vite apps on Windows, launch through Command Prompt (`cmd.exe`) and run the exact command `npm run dev` from the app root. Do not replace this with a direct Vite command.
- For Vben monorepos, launch through Command Prompt (`cmd.exe`) and run `pnpm.cmd run dev:local` from the monorepo root.
- Start dev servers detached/background so they survive the command turn.
- For PHP, bind IPv4 explicitly with `php -S 127.0.0.1:<port> <front-controller>` and choose the first free port from `8000` through `8003`.
- Wait for the server-ready signal, then verify each URL with an HTTP request. A process start alone is not success.
- For a `500`, inspect the server output/log as an application error. For `000` or connection refused, inspect process/port ownership and restart safely.
- Do not change source code, env secrets, database state, or project configuration as part of a normal localhost test unless the user separately asks for a fix.

## Standalone Vue app rules

- For a standalone Vue/Vite app, use Command Prompt (`cmd.exe`) and run the exact project package script `npm run dev` from that app root.
- Do not launch Vite directly, use PowerShell syntax, or substitute another package manager when the app has a working `dev` script; preserve the project's package-manager contract.
- Read `package.json` and `vite.config.*` to confirm the script and port, check for an existing healthy listener, then verify the root URL with HTTP before reporting success.
- Useful Vue app checks after a code change are `npm run type-check` and `npm run build`; use them when the user asks for validation beyond startup.
- Keep Vue views focused on presentation and call Pinia stores for business/API work; preserve typed Composition API state and map backend `snake_case` fields to frontend `camelCase` explicitly.

## Final response format

Report:

1. detected active projects grouped by type
2. skipped folders and why
3. each verified browser URL as a clickable link
4. HTTP result and server state
5. any blocked project with the exact error and the smallest next action

When a server is verified, always show its URL again as a standalone plain URL on its own line, without requiring the user to extract it from a status sentence.

Use one standalone URL per line for multiple projects:

http://127.0.0.1:<port>/

Keep project labels and HTTP status separately, but never omit this raw URL block.

For this sample, the expected browser links are:

- `http://127.0.0.1:6006/` — desktop Vben admin
- `http://127.0.0.1:5173/` — mobile admin Vue app
- `http://127.0.0.1:3000/` — driver Vue app

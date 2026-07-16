---
name: localhost-test
description: Detect runnable local app roots for the current workspace, start only the real projects, and verify each localhost URL when the user says `localhost test`.
argument-hint: "[workspace-root]"
user-invocable: false
allowed-tools:
  - Read
  - Bash
---

# Localhost Test

## When to use

Use this when the user says exactly `localhost test` or asks to run/check all active local apps in the current workspace.

Do not use this for code fixes, deploy work, or when the user only wants one already-known project started.

## Inputs / context to gather

1. Confirm the current workspace root.
2. Inspect shallow child folders only.
3. Read a minimal local context file (`PROJECT_CONTEXT.md`, `STATUS.md`, `README.md`, env file, or Vite config) only when it helps confirm project role or port.

## Procedure

1. From the workspace root, identify runnable project roots and skip `node_modules`, `dist`, `build`, `.git`, generated output, screenshots, fixtures, docs-only folders, and templates.
2. Classify a Vben admin by monorepo/workspace shape plus `apps/web-antd` and `dev:local`; run `pnpm.cmd run dev:local` from the monorepo root.
3. Classify a standalone Vue app by `package.json`, Vite/Vue source, and a `dev` script; run `npm.cmd run dev` from that app root.
4. Classify a PHP site by a real front controller such as `index.php` or `router.php`; run `php -S 127.0.0.1:<port> <front-controller>` from the front-controller folder.
5. Before starting anything, check whether the expected port is already listening and reuse a healthy server instead of launching duplicates.
6. Start servers detached/background so they survive the command turn.
7. Verify every URL with an HTTP request after startup. Report `500` as an app error and `000`/connection-refused as a process/port problem.
8. If a Vben admin or other monorepo app is still booting, wait and run one more readiness pass before reporting failure.
9. Print each verified raw URL on its own line.

## Efficiency plan

1. Detect roots shallowly before reading code.
2. Read only the smallest file needed to confirm a role or port.
3. Reuse already-running healthy servers.
4. Stop after startup plus HTTP verification unless the user separately asks for a fix.

## Pitfalls and fixes

- Symptom: a docs or template folder is treated like a runnable app.
  Fix: require package/front-controller evidence before classifying it as active.

- Symptom: a dev server process exists but the site is still unusable.
  Fix: verify with HTTP; process start alone is not success.

- Symptom: the first HTTP check for a Vben app fails even though the process started.
  Fix: wait longer and run a second readiness pass before declaring the app down.

- Symptom: multiple copies of the same app are started.
  Fix: check listening ports first and reuse a healthy existing server.

## Verification checklist

1. Each detected project has a concrete command and working directory.
2. Skipped folders are reported with a reason.
3. Each started or reused project has an HTTP result.
4. Slower monorepo/Vben apps get a second readiness pass before being marked failed.
5. Each verified URL is printed again as a standalone raw URL line.

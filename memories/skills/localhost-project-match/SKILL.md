---
name: localhost-project-match
description: Verify that a local website or app is served by its intended checkout when the user asks for a localhost test or a port may belong to another project.
argument-hint: "[project-root] [routes]"
user-invocable: false
allowed-tools:
  - Read
  - Grep
  - Bash
---

# Localhost Project Match

## When to use

Use for “localhost test”, local smoke testing, or a request to start and verify a web project. Do not treat it as browser visual QA, Apache production behavior, or deployment verification.

## Inputs / context to gather

1. Resolve `$0` (or the actual app root) and requested routes.
2. Inspect shallow runtime evidence: supported package scripts, PHP/static entry files, README/status, and existing listeners.
3. Identify whether the worktree has a project-specific local mode or an existing listener that is demonstrably the intended app.

## Procedure

1. Choose runtime from project evidence. A `package.json` without `dev`, `start`, or `dev:local` is not proof the package runtime serves the app; continue checking PHP/static entry points.
2. Reuse a listener only after `/` and every requested path return HTTP 2xx/3xx from the intended project. A root 200 or an open port alone is not a match.
3. If needed, start the smallest supported server in the actual app root. On Windows, use a short `Start-Process` command with explicit working directory rather than a compound quoting-heavy command.
4. Request the base URL plus representative requested routes. Run appropriate syntax checks: `php -l` for PHP, `node --check` for standalone JavaScript, or the project’s build/type check.
5. Report root, runtime, URL/port, route statuses, and boundaries not tested.

## Efficiency plan

1. Do shallow discovery before starting anything.
2. Batch route checks after one runtime decision.
3. Stop and report mismatch as soon as a listener cannot prove all requested routes; do not claim success from a different checkout.

## Pitfalls and fixes

- `NO_DEV_SCRIPT` with PHP/static entry points -> use the PHP/static runtime instead of stopping at package metadata.
- Existing port serves another checkout -> use a different port or seek authority before stopping another process.
- `Error: supabaseUrl is required.` in Used-Car default SSG -> use `--mode development.localhost`; never print environment values.
- Static PHP server succeeds -> distinguish HTTP smoke success from `.htaccess`, browser, cache/compression, and production checks.

## Verification checklist

1. Actual app root and runtime were evidenced.
2. Every requested route returned 2xx/3xx from that project.
3. Suitable syntax/build check passed or was precisely reported.
4. Browser, production, destructive, or external-service gates remain explicitly separate.

---
name: localhost-readiness
description: Detect a local web project's runtime, start only the required server, and verify real localhost URLs when the user says "localhost test".
argument-hint: "[project-root] [expected-url-or-route]"
allowed-tools: Read, Grep, Glob, Bash
---

# Localhost readiness

## When to use

Use for `localhost test`, local-server readiness, or a request to run and verify a web project. Do not use from a configuration-only directory when the actual application root is unknown.

## Inputs / context

1. Use `$0` as the root when supplied. Otherwise identify the actual application root before starting anything.
2. Inspect a shallow inventory plus runtime markers: package manifests, Vite/framework config, README/status, static entry files, and existing listeners.
3. Record the expected base URL and a small set of representative routes.

## Procedure

1. Reuse an existing healthy listener when it serves the intended project; do not start a duplicate server.
2. Choose the smallest project-supported command. For a static PHP-served site, use `php -S 127.0.0.1:8080 -t <workspace>`. For the Used-Car checkout, work in `template/` and use `pnpm.cmd run dev:local`.
3. Start detached only when needed. On Windows, prefer a simple `Start-Process` invocation over a quoting-heavy compound command.
4. Make HTTP requests to the base route and representative requested routes. Record status and content type.
5. Report the served URL, routes verified, and any boundary: browser visual QA, Apache `.htaccess`, production deployment, or missing runtime.

## Efficiency plan

- Do shallow discovery first; stop early and ask for the project root when no runnable app can be identified.
- Cache the detected root/runtime/routes during the task.
- Do not treat a process ID or open port alone as success; HTTP verification is the stop condition.

## Pitfalls and fixes

- No project found -> the current directory may be a tools/config checkout; locate the application root before scanning ports or starting servers.
- Complex PowerShell start command fails -> use a short `Start-Process` command with explicit working directory.
- Static local test lacks cache/compression results -> PHP/http-server does not apply Apache `.htaccess`; call that a production-only check.
- Default Used-Car SSG fails with `Error: supabaseUrl is required.` -> use local mode (`--mode development.localhost`) and do not print environment values.

## Verification checklist

- Confirmed actual app root and chosen runtime.
- Confirmed HTTP response for base URL and representative routes.
- Did not claim production/browser/Apache behavior from a local static-server result.
- Reported any unresolved runtime/configuration blocker precisely.

---
name: localhost-project-match
description: Verify a requested local website is served by the correct project when a port may be occupied or runtime detection is ambiguous.
argument-hint: "[project-root] [paths]"
user-invocable: false
allowed-tools:
  - Read
  - Grep
  - Bash
---

# Localhost Project Match

## When to use

Use for “localhost test”, local smoke tests, or when an existing listener might belong to a different checkout. Do not use as evidence of browser visual QA or deployment success.

## Inputs / context to gather

1. Resolve the intended project root and requested paths from $ARGUMENTS.
2. Inspect package scripts. If there is no supported `dev`, `start`, or `dev:local` script, continue checking for `index.php` or `index.html`.
3. Check relevant listeners and identify whether their routes match the requested project.

## Procedure

1. Choose runtime from actual project evidence: supported package script, PHP entry point, or static HTML.
2. Reuse a listener only after every requested smoke path returns HTTP 2xx/3xx and its response is attributable to the intended project.
3. If no suitable listener exists, start the smallest appropriate server in the resolved project root; record port and command.
4. Request `/` plus all requested paths. For PHP, run `php -l` on changed/requested PHP; for JavaScript, run `node --check` when applicable.
5. Report project root, selected runtime, port, each checked route/status, and unperformed browser/deployment checks.

## Efficiency plan

1. Do shallow runtime detection before starting anything.
2. Batch HTTP checks after one server decision.
3. Stop once a listener fails a requested path: it is not a reusable project match.

## Pitfalls and fixes

- `package.json` exists but has no app dev script -> do not stop at `NO_DEV_SCRIPT`; check PHP/static entry points.
- Port root returns 200 for another project -> choose another port or stop that project only with authority; a root response alone is not proof.
- Server starts but requested routes fail -> report blocked/failed, not pass.

## Verification checklist

1. Runtime was chosen from project evidence.
2. Every requested path returns 2xx/3xx from the intended project.
3. Syntax checks appropriate to the runtime passed or are reported as not run.
4. Browser visual and production verification are explicitly distinguished from HTTP smoke success.

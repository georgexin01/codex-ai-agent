---
name: local-supabase-protection
description: Use before any local Docker or Supabase command that might change the active stack, schema, routing, startup target, or state.
argument-hint: "[project-or-command]"
disable-model-invocation: true
user-invocable: false
allowed-tools:
  - Read
  - Grep
  - Bash
---

# Local Supabase Protection

## When to use

Use when work touches local Docker, Supabase CLI, stack selection, environment routing, schemas, or database state. This is especially important for Angel local work.

Do not use for read-only source inspection that cannot affect a running stack.

## Inputs / context to gather

1. Identify the active project and the exact proposed command.
2. Determine whether it is read-only or can change container, database, schema, environment, routing, startup target, or data state.
3. For Angel, treat `C:\Users\user\Documents\local-supabase` as the protected canonical local stack unless the user explicitly selects another one. [ad-hoc note]

## Procedure

1. Start with read-only checks: current directory, configured URLs, running containers, and the app's selected env file.
2. If the operation can rename, stop, reset, prune, recreate, migrate, relabel, repoint, or modify a local Docker/Supabase stack, stop and request explicit permission in the current turn. [ad-hoc note]
3. Do not assume a similarly named checkout or stack is the target.
4. For an Angel "empty website" symptom, verify env selection, runtime host detection, and actual Supabase URL before changing frontend code; admin and website can point at different projects. [ad-hoc note]
5. For an admin table that has correct RLS but returns `permission denied`, check `information_schema.role_table_grants` before changing policies. [ad-hoc note]

## Efficiency plan

1. Use one small read-only evidence chain before considering any state change.
2. Stop at the permission boundary; do not explore alternate stacks or repair commands without approval.
3. Keep application configuration changes separate from stack-management decisions.

## Pitfalls and fixes

- Symptom: Docker opens a different project than expected. Fix: stop and ask; do not switch stacks by inference. [ad-hoc note]
- Symptom: website is empty while admin has data. Fix: compare the two apps' env/runtime URLs before treating it as a rendering bug. [ad-hoc note]
- Symptom: schema/RLS appears correct but CRUD fails. Fix: inspect PostgreSQL grants, not only RLS. [ad-hoc note]

## Verification checklist

1. The actual stack and app env target are identified.
2. Any state-changing action has explicit same-turn permission.
3. Read-only evidence distinguishes stack, schema/RLS/grant, and frontend problems.

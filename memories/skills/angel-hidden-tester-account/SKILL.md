---
name: angel-hidden-tester-account
description: Handle Angel Interior hidden tester-account requests when the user wants an admin/test login created, reset, or kept out of the visible Users table.
argument-hint: "[create|reset|verify]"
disable-model-invocation: true
user-invocable: false
allowed-tools:
  - Read
  - Bash
---

# Angel Hidden Tester Account

## When to use

Use this when work is in the Angel Interior stack and the request clearly matches the hidden tester-account workflow: create, reset, verify, or debug the special internal login used for company testing.

Do not use this for ordinary user creation, production auth changes without confirmation, or any request where the hidden-account pattern is not clearly the right match.

## Inputs / context to gather

1. Confirm the workspace is the Angel Interior project family.
2. Confirm the user is asking for the hidden tester/admin account workflow, not a normal customer account.
3. Find the most recent historically verified credential source supplied by the user or preserved in project history.
4. Identify the current Angel project id that the tester account should open into.
5. Locate the admin-panel Users query/store path that controls whether the hidden tester appears in the visible Users table.

## Procedure

1. Start from history, not guesswork:
   - Prefer the most recent historically verified credential source.
   - Do not invent a new secret when an earlier verified one exists.
   - Do not write the secret into memory, skills, or broad documentation.
2. Confirm the account-shape requirement before editing:
   - the auth identity row
   - the auth user row
   - the mirrored `public."user"` row
   - the business-schema `users` row used by the app
3. Prepare or update the SQL so those rows stay aligned for the same tester account identity.
4. Persist the project pointer in `auth.users.raw_user_meta_data.active_project_id` so login resolves to the intended Angel project.
5. Keep the account hidden from the admin-panel Users table by excluding that tester identity in the store/query layer, not only in seed data.
6. Only auto-run the workflow when the request clearly matches the Angel hidden tester-account pattern; otherwise pause and verify intent.

## Efficiency plan

1. Check project history and current auth/query paths before drafting new SQL.
2. Reuse the established hidden-account workflow rather than rediscovering the auth table set each time.
3. Avoid broad repo exploration once the auth rows and Users query/store path are identified.
4. Stop once the account rows are aligned, the project pointer is set, and the hidden-account filter path is confirmed.

## Pitfalls and fixes

- Symptom: the tester can log in but lands in the wrong project.
  Fix: verify `auth.users.raw_user_meta_data.active_project_id` matches the intended Angel project id.

- Symptom: the tester account keeps showing up in the admin Users table.
  Fix: hide it in the admin-panel store/query path as well as any seed/reset SQL.

- Symptom: one table updates but login or profile sync still fails.
  Fix: re-check that `auth.users`, `auth.identities`, `public."user"`, and the business-schema `users` row all describe the same account identity.

- Symptom: someone proposes a fresh password because the old one is unknown.
  Fix: search for the latest user-verified credential source first; history wins over guesswork.

## Verification checklist

1. The request truly matches the hidden tester-account workflow.
2. The chosen credential source is historically verified rather than newly guessed.
3. `auth.users`, `auth.identities`, `public."user"`, and the business-schema `users` row are aligned for the same account.
4. `raw_user_meta_data.active_project_id` points at the intended Angel project.
5. The admin-panel Users query/store hides the tester account from the visible list.

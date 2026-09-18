---
name: claude
description: Use for Vue/Vben Admin, Pinia, Docker-local Supabase/Postgres, Auth/RBAC/RLS/Storage, safe migrations, and CRUD delivery from project discovery through verified local handoff. Derive names and identifiers from the active project contract; never copy historical example SQL into a target project.
metadata:
  short-description: Focused Vben and Supabase project workflow
---

# Vben + Supabase project workflow

Use this skill for Vben Admin or Vue applications using Pinia, TypeScript,
Supabase/Postgres, Docker-local services, Auth, RBAC, RLS, Storage, migrations,
or CRUD modules.

This skill is reusable. It must not be bound to a repository path, project UUID,
Auth UUID, row count, schema-local user ID, VPS hostname, or historical table name.
Read the active project's contract and current source before deriving any such
value.

## Fast routing

Choose the narrowest route before reading files:

| Request | Read and verify |
| --- | --- |
| UI/i18n copy | target component, locale file, nearest typecheck |
| Vben CRUD | current contract, Vben patterns, target store/view/route |
| Auth/debugging | exact error, Auth client, identity bridge, live rows |
| Database/schema | contract, migration lane, live catalog, grants/RLS |
| Storage | bucket/path contract, policies, upload component, object lifecycle |
| Localhost | environment mode, Docker health, existing server, HTTP routes |
| Project-wide setup | end-to-end runbook, preflight script, contract audit, benchmark |

Do not load every reference for a narrow task. Do not skip the active contract for
a schema or CRUD task.

For recurring table and CRUD preferences, read
references/recurring-crud-defaults.md. Apply compatible low-risk defaults
automatically, but let the active project contract override this baseline.

## Evidence and naming rules

Evidence precedence:

1. fresh live database/runtime inspection;
2. current project contract and status documents;
3. current source, migrations, tests, and build output;
4. official product documentation;
5. historical examples and memory.

When sources disagree, record INSUFFICIENT DATA, perform a read-only inspection,
and reconcile before changing data or schema.

For entity, table, field, role, and module names:

- Use the exact name supplied by the owner or current contract.
- Do not reuse names from historical examples, archived projects, or templates.
- If the contract is silent, propose a clear singular snake_case database name and
  matching camelCase UI name; state the assumption and obtain approval before a
  schema mutation.
- Never preserve a historical name merely because an old migration or document
  used it. Mark it historical and use the current contract name.
- Never invent project IDs, role IDs, Auth IDs, credentials, rows, or counts.

## Safety boundaries

- Never print or store passwords, password hashes, keys, tokens, cookies, private
  response bodies, or authenticated row data.
- Identify the exact target environment before any mutation: local, staging,
  linked remote, or production.
- Apply SQL from a reviewed file through the project's approved migration runner.
  Do not use improvised inline mutation SQL.
- Back up before destructive, identity-changing, or difficult-to-recover work.
- Do not drop shared Auth/public infrastructure just because a project module is
  being converted.
- Do not use a secret/service key in Vite or browser code.
- Keep local development isolated from remote environments and verify the URL and
  mode before starting a browser or applying SQL.
- Diagnosis is read-only unless the owner explicitly requests the fix.
- A localhost HTTP 200 proves reachability only; it does not prove login, grants,
  RLS, CRUD, Storage, or production readiness.

## End-to-end delivery

For a new project, major change, or unfamiliar repository, follow the detailed
reference references/end-to-end-runbook.md. The gates are:

1. hydrate project instructions and classify the request;
2. inspect Git status and preserve unrelated changes;
3. prove Docker, Supabase, environment, schema, and target boundary;
4. choose and verify the migration authority;
5. verify the database contract, dependencies, grants, RLS, policies, and Storage;
6. establish and test the Auth-to-project identity bridge;
7. connect the typed Supabase client and local Vite mode;
8. implement one Vben module completely;
9. verify SQL, Auth, RLS, Storage, typecheck, build, HTTP, and browser behavior;
10. hand off completed, blocked, deferred, unchanged, and next-safe work.

## Database and Auth contract

Keep these identity layers distinct:

~~~text
auth.users.id
-> public user bridge auth_id
-> project and role scope
-> schema-local business-user foreign key to the public bridge
~~~

A phone-login application uses the Auth phone field in the sign-in call. A
schema-local profile phone is not automatically the Auth login phone. Resolve the
project bridge by Auth ID plus project scope before loading a profile. A PostgREST
406 with PGRST116 after successful Auth commonly means the single-row bridge query
found zero rows; check identity, project, role, and foreign-key links before
changing the password or RLS.

The managed Auth email column is not removed for phone-only login. Phone-only
means the selected Auth row has a null email value. A profile email field is a
separate contract decision and must not be used to infer the Auth identity.

Check grants before policies, and check schema exposure before diagnosing an empty
REST result. Test anonymous, authenticated, admin, wrong-project, and no-session
behavior separately.

## Vben, Vue, TypeScript, and Pinia contract

- Views call Pinia stores; views do not call Supabase directly.
- Stores own database row types, mapping functions, pagination, sorting, form
  payloads, validation, and error handling.
- Keep database fields snake_case and UI/store fields camelCase.
- Keep UUID identifiers as string unless the current contract says otherwise.
- Preserve public Store, Function, and Input names that are existing contracts.
- Use typed entity, form, and page-query interfaces.
- Use storeToRefs when destructuring reactive Pinia state.
- Keep local component state out of stores unless it is shared or persistent.
- Keep user-visible labels behind the existing i18n system.
- For every paginated VXE grid, preserve the shared global sequence configuration
  and verify page-offset numbering.
- Every list requires an approved View Details path plus appropriate Edit/Delete
  behavior.
- Relation labels should use the project's shared relation renderer; real status
  values should use the project's status renderer.
- Long text and JSON columns need bounded widths and overflow handling.

For each new module use:

~~~text
contract
-> migration and policy
-> typed model/form/query
-> Pinia store and row mapping
-> refresh/cache registration
-> list/search/grid
-> create/edit validation
-> detail surface
-> route/menu/permissions
-> i18n
-> workflow test
-> typecheck/build
-> authenticated browser evidence
~~~

For file-backed JSONB fields, keep upload state separate from scalar form state,
block submit while files are uploading, store approved Storage paths, and remove
old objects only after the database mutation succeeds.

## Verification and handoff

Use the smallest check that proves the changed boundary, then run the full project
verification for a project-wide task:

- migration read-back and contract audit;
- schema exposure, columns, constraints, indexes, foreign keys, triggers, grants,
  RLS, policies, and Storage checks;
- Auth login/profile/role/sign-out/wrong-project tests;
- Storage upload/read/update/delete tests;
- typecheck, build, formatting, and diff checks;
- HTTP checks for each required local URL;
- authenticated browser CRUD, detail, relationship, pagination, image, and upload
  smoke tests when credentials and browser state are available.

Report evidence, not assumptions. Never claim remote, production, browser,
Storage, or website synchronization was verified without current evidence.

## Supporting references

Read only the reference needed for the current route:

- references/end-to-end-runbook.md - complete staged delivery.
- references/local-supabase-playbook.md - Docker, migrations, backups, and
  local/remote separation.
- references/vben-supabase-patterns.md - generic Vben, Pinia, Supabase, Storage,
  relation, pagination, and module patterns.
- references/research-and-benchmark.md - source research, state drift, benchmark
  tasks, and measurable performance checks.
- references/recurring-crud-defaults.md - repeated table, CRUD, Auth, media,
  route, i18n, and verification defaults.
- scripts/project-preflight.ps1 - read-only environment and boundary checks.
- scripts/panel-check.ps1 - optional typecheck, build, and HTTP checks.

## Maintenance

When improving this skill:

1. research current official behavior and current project source;
2. compare the proposed rule against the active contract;
3. prefer a small reference or deterministic script over duplicated prose;
4. validate frontmatter, links, syntax, and scripts;
5. run the benchmark tasks before claiming improved accuracy or speed.

Do not place project-specific IDs, credentials, row counts, or historical entity
names into this reusable skill.

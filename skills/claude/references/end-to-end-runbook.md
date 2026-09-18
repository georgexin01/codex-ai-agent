# End-to-end project runbook

Use this reference for a project-wide Vben + Supabase/Postgres delivery. Replace
the bracketed terms from the active project contract; do not copy identifiers or
entity names from this document.

## Gate 0 — scope

- Identify repository root, application root, database target, schema target,
  environment mode, and requested mutation.
- Read the repository instructions, current status, database contract, migration
  README, Auth notes, and the affected source files.
- Inspect Git status and preserve unrelated changes.
- If a target, owner decision, field name, or security boundary is missing, state
  INSUFFICIENT DATA before mutation.
- Treat external examples as patterns only, never as project truth.

## Gate 1 — read-only preflight

Run the generic preflight script when available. Otherwise check:

~~~text
Docker context and service status
Supabase/local stack status
database gateway, Auth, REST, and Storage health
active environment filename and target URL
browser schema and project context without printing secrets
migration directories and migration history
current Git status
~~~

A healthy listener is not proof of a working login or CRUD path. Keep health,
schema exposure, grants, RLS, Auth, and browser checks separate.

## Gate 2 — migration authority

Choose one authoritative migration mechanism for the project:

- a tracked Supabase migration directory;
- a tracked project migration lane with a verified runner;
- a reviewed declarative schema plus generated migrations.

Record the choice. Do not mix direct Studio/SQL changes with a claim of
reproducibility. Direct changes must be captured before a clean rebuild is
considered valid.

For any schema change:

1. review the contract and dependencies;
2. create a reviewed SQL file;
3. back up when data or identity could be affected;
4. apply only to the explicitly selected target;
5. read back columns, constraints, indexes, triggers, grants, RLS, policies, and
   foreign keys;
6. run the nearest reusable verification;
7. test a disposable clean replay when reproducibility is part of the request.

Never reset a remote or delete local volumes without explicit scope and recovery
evidence.

## Gate 3 — schema and identity

Derive the exact table and field names from the active contract. Keep the shared
identity layers distinct:

~~~text
Auth login identity
-> shared project-membership bridge
-> project and role scope
-> schema-local business profile
~~~

For Auth:

- use the configured identifier type, such as phone or email;
- keep the managed Auth columns intact;
- verify the selected row's provider, identifier, confirmation state, and
  password presence without exposing secrets;
- resolve membership by Auth ID plus project scope;
- verify role and profile foreign keys;
- test valid login, invalid login, missing bridge, wrong project, role denial,
  refresh, and sign-out.

For security, inspect grants before policies and schema exposure before empty
REST results. Test anonymous, authenticated, admin, wrong-project, and no-session
paths independently.

## Gate 4 — frontend contract

Confirm the client:

- uses the intended URL and environment mode;
- selects the intended database schema;
- exposes only a low-privilege browser key;
- cannot silently fall back to mock data or another schema;
- maps database snake_case to UI camelCase in a single typed boundary.

Implement one module at a time:

~~~text
contract
-> migration/policy
-> entity/form/query types
-> Pinia store
-> row mapping and pagination
-> grid/search/sort
-> create/edit validation
-> detail surface
-> route/menu/permissions
-> i18n
-> workflow test
-> typecheck/build
-> authenticated browser test
~~~

Views call stores. Stores own Supabase operations, mapping, validation payloads,
cache refresh, and error handling. Use the project's existing Vben/VXE adapters
and preserve global sequence/pagination behavior.

## Gate 5 — media and relationships

For file-backed fields:

- define bucket, path prefix, MIME, size, and visibility in the contract;
- use the Storage API, not direct metadata writes;
- keep UploadFile state separate from scalar form state;
- block submit during upload;
- store approved paths or typed JSONB;
- remove old objects only after a successful database update/delete;
- test upload, preview, update cleanup, delete cleanup, and wrong-role denial.

For relations:

- inspect actual foreign keys;
- use explicit PostgREST relationship names when ambiguous;
- render relation labels through the shared relation component;
- preserve composite keys and UUIDs;
- add parent-child actions only when the contract defines the relationship.

## Gate 6 — verification and handoff

Run the smallest relevant checks, then the full set when requested:

- contract and migration read-back;
- schema, grants, RLS, policies, Auth, and Storage audits;
- transactional CRUD tests with rollback;
- typecheck, build, formatting, and diff check;
- local HTTP route checks;
- authenticated browser CRUD, detail, relation, pagination, and upload smoke tests.

Report:

- completed and verified;
- partially verified or blocked;
- intentionally unchanged;
- exact files/targets changed;
- raw evidence;
- next safest action.

Never call a task complete from source inspection alone.

## Failure routing

| Symptom | Likely layer | First check |
| --- | --- | --- |
| Invalid credentials | Auth identifier/provider/password | Auth row, provider configuration, login payload |
| Auth succeeds, profile fails | Membership bridge | Auth ID, project ID, role, profile FK |
| 406/PGRST116 | Single-row query returned zero rows | Query filters and bridge rows |
| 406 with multiple rows | Duplicate membership rows | Uniqueness and duplicate data |
| 401/403 or empty list | Schema/grant/RLS/session | Schema exposure, grants, JWT, policy |
| Relation ambiguity | Multiple matching foreign keys | Explicit relationship name |
| Upload failure | Storage path/policy/type/size | Bucket, object policy, file constraints |
| Reset loses changes | Untracked direct state | Migration authority and clean replay |
| Dashboard shows an email field | Managed schema/profile field | Row value and contract; never drop managed columns |

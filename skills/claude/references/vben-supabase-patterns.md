# Vben, Vue, Pinia, and Supabase patterns

Use the active project's current components and contract as the source of truth.
These are reusable boundaries, not a replacement for project-specific types.

## Layered module boundary

~~~text
Vue view
-> Pinia store
-> typed database adapter
-> schema-scoped Supabase client
-> Postgres/Auth/Storage
~~~

Views should coordinate UI state and call stores. Stores should own remote
queries, row conversion, validation payloads, cache refresh, and error handling.
Keep database rows private to the store when the project has no generated types;
expose typed UI entities to views.

## Naming and mapping

- Database fields: snake_case.
- UI/store fields: camelCase.
- UUID primary keys: string unless the contract says otherwise.
- Nullable database values: normalize at the store boundary.
- JSONB: use typed shapes or a validated editor; do not silently treat arbitrary
  JSON as a string.
- Preserve public store/action names already used by callers.
- Use the exact contract entity name. Do not carry a historical table name into a
  current route, store, or migration.

## Pinia

Use defineStore with explicit state, getters, and actions. Use storeToRefs when
extracting reactive state. Keep page-local state in the component; keep shared or
persistent state in the store. Do not duplicate the same remote cache in every
view.

A store normally owns:

- list/detail/create/update/delete actions;
- query and form types;
- row-to-entity and entity-to-row mapping;
- pagination and remote sort;
- related-option loading;
- invalidation/refresh after mutations;
- user-safe error translation.

## Vben/VXE grids

Use the project's shared Vben/VXE adapter. Preserve global remote pagination and
sequence behavior. A module list should normally contain:

- search fields;
- fixed Actions and No. columns;
- remote pagination and sort;
- View Details action;
- Edit/Delete actions allowed by permissions;
- bounded long-text columns with tooltip overflow;
- relation labels through the shared relation renderer;
- status values through the shared status renderer;
- image preview group for image arrays.

Verify page one, page two, a middle page, and the final page when pagination is
part of the module.

## Forms and details

Use one shared create/edit form where the project's patterns support it. Validate
required fields, enums, URLs, JSON, uniqueness-sensitive values, file state, and
parent-child context. A detail drawer/page should show the complete approved
record, relationships, images, JSONB, and timestamps, with the permitted
Edit/Delete actions.

## Storage-backed fields

Keep UploadFile[] outside scalar form state. Submit only completed uploads.
Store approved object paths, not browser blobs or signed URLs. Do not delete a
previous object before the database mutation succeeds. After success, remove
unreferenced objects best-effort and report cleanup failures separately.

## Relationship modules

Inspect foreign keys and composite keys from the current contract. Use explicit
relationship names for ambiguous PostgREST queries. Parent-child drawers should
pass parent IDs into the store query and create payload. Composite relation
tables need dedicated add/remove flows and must not be forced into an id-based
generic drawer.

## Verification

For each module, verify:

~~~text
contract -> migration/policy -> types -> store -> list -> form -> detail
-> route/menu -> permissions -> i18n -> transactional SQL -> typecheck/build
-> authenticated browser CRUD
~~~

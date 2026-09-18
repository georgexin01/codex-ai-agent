# Recurring CRUD and database defaults

This is a reusable preference baseline distilled from repeated Vben Admin,
Vue/Pinia, Supabase/Postgres, Docker-local, Auth, Storage, table, and CRUD work.
Apply a low-risk rule automatically when the active project contract supports it.
Do not force a rule across projects, invent identifiers, or override an explicit
contract. If the contract conflicts, report the conflict and follow the contract.

## A. Contract and database defaults

1. Read the project contract, current status, migration lane, and relevant source
   before creating or changing a table, field, route, or CRUD module.
2. Use the exact owner-provided or contract-provided entity and table name.
3. Never reuse a historical, archived, example, or competitor table name.
4. If no name is provided, propose a clear singular `snake_case` database name
   and matching `camelCase` UI name before a schema mutation.
5. Never invent project IDs, Auth IDs, role IDs, credentials, row counts, or
   seed data.
6. Keep database columns in the contract's naming convention, normally
   `snake_case`; map to `camelCase` only at the frontend/store boundary.
7. Confirm the target environment, API URL, schema exposure, and active mode
   before applying SQL or opening the application.
8. Use a reviewed migration or SQL file through the approved runner; do not use
   improvised inline mutation SQL.
9. Before reuse or alteration, inspect columns, types, defaults, constraints,
   indexes, foreign keys, triggers, grants, RLS, policies, and Storage rules.
10. Preserve existing data and unrelated work. Back up before destructive,
    identity-changing, or difficult-to-recover operations.
11. Do not add generic tenancy, audit, soft-delete, bilingual, or permission
    columns when the active contract does not contain them.
12. Use `created_at` and `updated_at` only according to the contract; when
    `updated_at` is trigger-managed, verify the trigger rather than simulating it
    in every frontend update.

## B. Phone-first Auth defaults

Apply these only when the owner or current contract says phone is the login
identity:

13. Treat `auth.users.phone` as the login identifier and make the profile phone
    required where the contract requires it.
14. Keep phone/password login separate from phone OTP login; do not silently
    substitute one flow for the other.
15. New phone-only Auth identities use a null email by default.
16. Do not use a profile email field to infer the Auth identity.
17. Do not remove the managed Auth email column merely because the application
    does not use email login.
18. Omit email from the phone-first User CRUD form, payload, validation, and
    user-facing table when the project contract excludes it.
19. Validate phone format, required state, uniqueness, and change behavior at the
    correct boundary; do not rely on a visual input rule alone.
20. Verify the full identity bridge before changing passwords or RLS:
    `auth.users.id` -> public bridge -> project/role scope -> local profile.
21. Treat a successful Auth session followed by PostgREST `406/PGRST116` as a
    likely missing or mismatched bridge row and inspect identity, scope, role,
    foreign keys, grants, and RLS in that order.
22. Never copy a reference environment's Auth identity, active project, password,
    or row values into another environment unless the owner explicitly provides a
    safe migration requirement.

## C. Store and CRUD module defaults

23. Implement modules in this order: contract -> migration/policy -> types ->
    Pinia store -> mapping -> refresh/cache -> list -> form -> detail -> route
    and permissions -> i18n -> workflow test -> typecheck/build/runtime test.
24. Keep views free of direct Supabase calls; views call Pinia stores.
25. Define typed database rows, UI models, form values, page parameters, and
    response shapes instead of spreading untyped objects across the module.
26. Keep a single explicit mapping boundary between database fields and UI fields.
27. Include search filters that match the contract's meaningful fields, with
    trimmed input and safe empty-state behavior.
28. Implement count-aware pagination with the correct inclusive range formula and
    verify page changes against the returned total.
29. Use an approved default sort and a deterministic tie-breaker when equal values
    are possible; do not depend on unspecified database order.
30. Preserve the project's shared table sequence/row-number behavior, including
    page offsets, instead of recalculating it differently per module.
31. Include a clear View Details path for every list; use the existing page or
    drawer pattern consistently for that project.
32. Include create, edit, and delete/restore behavior only when allowed by the
    contract, with loading state and error handling for each action.
33. Prevent double-submit and duplicate requests during create, update, upload,
    and delete actions.
34. Refresh relation options and dependent lists after mutations through the
    shared refresh/cache mechanism; do not rely on a manual page reload.
35. Use relation selectors that show the approved display label and stable ID,
    filter invalid/deleted relations, and preserve the real foreign key.
36. Render status, role, relation, and date values through shared renderers and
    i18n labels rather than repeating ad-hoc text in each view.
37. Show required-field markers, validate before submit, and map known database
    constraint errors into useful user-facing messages.
38. Normalize slugs or other derived identifiers in one shared utility and check
    uniqueness before or during the database mutation as appropriate.
39. Bound long text, HTML, JSON, and URL columns in grids; provide a readable
    detail surface instead of forcing large content into a table cell.
40. Keep public Store, Function, Input, route, and field names unchanged when
    they are already part of the project contract.

## D. Media, video, and attachment defaults

41. For a `Video URL` CRUD field, use this owner-approved helper text when the
    project has not supplied replacement copy:
    `Custom video preview, upload a new video or select any others video to used.`
42. A video field should support the contract-approved combination of custom
    preview, new upload, and selecting an existing attachment; do not assume a
    URL is always an external URL.
43. Keep upload state separate from scalar form state and block submit while an
    upload is still active or failed.
44. Store approved Storage paths or contract-approved URLs, not browser object
    URLs or temporary local paths.
45. Preview the actual current value and distinguish external URLs from managed
    Storage objects before deciding whether cleanup is allowed.
46. After a successful database update, remove replaced managed Storage objects;
    never delete the old object before the database mutation succeeds.
47. Before deleting an attachment, verify that no business row still references
    it. Use soft delete/restore and permanent purge only according to the
    attachment contract.
48. Keep image, video, HTML, and JSON upload rules separate; do not reuse an image
    validator or bucket path for video without checking MIME, size, and policy.
49. For HTML content with embedded media, preserve the approved sanitization and
    Storage-reference boundary; never silently rewrite or expose unsafe HTML.
50. Verify upload, preview/read, replacement, reference protection, and cleanup
    through the actual local Storage and application path when available.

## E. Routes, language, and verification defaults

51. Register the list, form/detail surfaces, route, menu, permission, and i18n
    keys together; leave no dead menu link or stale import.
52. Keep user-visible labels and helper text behind the existing i18n system when
    the project uses i18n; preserve owner-approved wording exactly when requested.
53. Do not add a second language or duplicate content fields unless the owner and
    current contract explicitly require it.
54. Verify the changed boundary with the smallest useful check, then run the
    project-wide typecheck/build and formatting checks for a broad CRUD change.
55. Verify the real local URL, schema endpoint, authenticated login, profile/role
    loading, list, create, edit, detail, relation, pagination, and delete flow;
    HTTP 200 alone is not CRUD proof.
56. Report completed, partially verified, blocked, intentionally unchanged, and
    next-safe work separately. Never claim browser, remote, production, Storage,
    or synchronization verification without current evidence.

## Automatic application rule

When a future request says “create a table”, “add a CRUD module”, “fix Auth”,
“update a form”, or “test localhost”, check this list before asking for details.
Apply compatible low-risk defaults automatically. Ask or stop only when there is
missing contract data, a naming conflict, a destructive choice, a security
boundary, or an external/live mutation that needs explicit direction.

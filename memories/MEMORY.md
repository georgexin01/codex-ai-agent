# Task Group: cross-workspace progress reporting and task-status tables
scope: Use when the user asks for multi-step implementation status, page-wide update coverage, or clearer completion reporting across any workspace.
applies_to: cwd=workflow-global; reuse_rule=safe across workspaces for user-facing progress/result reporting unless the user asks for a different output format for that specific task

## Task 1: Use a compact `task | changes | complete` table for multi-step status and completion reporting, extension-backed

### rollout_summary_files

- extensions/ad_hoc/notes/2026-07-15-task-status-table-format.md (cwd=workflow-global, rollout_path=C:\Users\user\.codex\memories\extensions\ad_hoc\notes\2026-07-15-task-status-table-format.md, updated_at=2026-07-15T00:00:00, thread_id=extension-ad-hoc-task-status-table-format, authoritative extension note) [ad-hoc note]

### keywords

- task | changes | complete, task-status table, &#10003;, &#10007;, &#9888;, numbered steps, page-wide updates, evidence-marked completion

## User preferences

- when work has multiple steps or distinct missions, the user requested a compact Markdown table with `task | changes | complete` -> use that table automatically when it materially improves clarity instead of falling back to loose prose [Task 1] [ad-hoc note]
- when the user supplies numbered steps or the work breaks into several missions, number the task rows so progress lines up with the requested sequence [Task 1] [ad-hoc note]
- when a request touches a whole page set, enumerate every discovered page in the target project folder as its own row before or while reporting the work [Task 1] [ad-hoc note]

## Reusable knowledge

- The preferred status symbols are `&#10003;` for completed, `&#10007;` for failed/not completed, and `&#9888;` for blocked or only partially verified; keep the `changes` column concise but specific [Task 1] [ad-hoc note]
- Use short prose only for context that does not fit the table; keep the table as the primary progress/result surface for multi-step work [Task 1] [ad-hoc note]

## Failures and how to do differently

- Do not mark `&#10003;` from assumptions. Completion status should come from current file, test, SQL, log, or browser evidence [Task 1] [ad-hoc note]

# Task Group: trash-container-app dual-app operating rules, Pinia contract workflow, and localhost startup
scope: Use when work is in `C:\Users\user\Desktop\trash-container-app` and the user wants exact Pinia store contracts preserved, strict Vue/Vben implementation rules applied, admin/driver workflow semantics kept aligned, or the active local apps detected and verified quickly.
applies_to: cwd=\\?\C:\Users\user\Desktop\trash-container-app; reuse_rule=safe for this workspace while the user's Google Sheet `Trash` tab `Pinia`, the referenced hotpot app, the runnable roots `admin-panel-trash`, `web-admin-app`, and `web-driver-app`, and the current Cyroro dual-app workflow remain the truth sources

## Task 1: Preserve exact `PiniaStore -> Function -> Input` contracts and store-package boundaries, extension-backed

### rollout_summary_files

- extensions/ad_hoc/notes/2026-07-10-pinia-store-contract-reference.md (cwd=\\?\C:\Users\user\Desktop\trash-container-app, rollout_path=C:\Users\user\.codex\memories\extensions\ad_hoc\notes\2026-07-10-pinia-store-contract-reference.md, updated_at=2026-07-10T00:00:00, thread_id=extension-ad-hoc-pinia-store-contract-reference, authoritative extension note) [ad-hoc note]
- extensions/ad_hoc/notes/2026-07-10-pinia-c-to-c-quality-principles.md (cwd=\\?\C:\Users\user\Desktop\trash-container-app, rollout_path=C:\Users\user\.codex\memories\extensions\ad_hoc\notes\2026-07-10-pinia-c-to-c-quality-principles.md, updated_at=2026-07-10T00:00:00, thread_id=extension-ad-hoc-pinia-c-to-c-quality-principles, authoritative extension note) [ad-hoc note]
- extensions/ad_hoc/notes/2026-07-10-pinia-store-relation-binding.md (cwd=\\?\C:\Users\user\Desktop\trash-container-app, rollout_path=C:\Users\user\.codex\memories\extensions\ad_hoc\notes\2026-07-10-pinia-store-relation-binding.md, updated_at=2026-07-10T00:00:00, thread_id=extension-ad-hoc-pinia-store-relation-binding, authoritative extension note) [ad-hoc note]
- extensions/ad_hoc/notes/2026-07-10-portable-pinia-store-package.md (cwd=\\?\C:\Users\user\Desktop\trash-container-app, rollout_path=C:\Users\user\.codex\memories\extensions\ad_hoc\notes\2026-07-10-portable-pinia-store-package.md, updated_at=2026-07-10T00:00:00, thread_id=extension-ad-hoc-portable-pinia-store-package, authoritative extension note) [ad-hoc note]

### keywords

- trash, PiniaStore, Function, Input, useOrderStore, c-to-c, defineStore, views -> stores -> utils/types -> API/Supabase, web-driver-app, useMerchantStore, useMemberStore, authStore

## Task 2: Apply Luna 5.6 Vue/Vben and paired-app execution gates with evidence-first, minimal-context verification, extension-backed

### rollout_summary_files

- extensions/ad_hoc/notes/2026-07-15-luna-56-pinia-execution-profile.md (cwd=\\?\C:\Users\user\Desktop\trash-container-app, rollout_path=C:\Users\user\.codex\memories\extensions\ad_hoc\notes\2026-07-15-luna-56-pinia-execution-profile.md, updated_at=2026-07-15T00:00:00, thread_id=extension-ad-hoc-luna-56-pinia-execution-profile, authoritative extension note) [ad-hoc note]
- extensions/ad_hoc/notes/2026-07-10-luna-5-6-vue-vben-execution-profile.md (cwd=\\?\C:\Users\user\Desktop\trash-container-app, rollout_path=C:\Users\user\.codex\memories\extensions\ad_hoc\notes\2026-07-10-luna-5-6-vue-vben-execution-profile.md, updated_at=2026-07-10T00:00:00, thread_id=extension-ad-hoc-luna-5-6-vue-vben-execution-profile, authoritative extension note) [ad-hoc note]

### keywords

- ai luna 5.6, GPT-5.6 Luna, Vue 3, script setup lang ts, Composition API, strict TypeScript, snake_case, camelCase, FormSchema[], computed<FormSchema[]>, useEntityForm, $t(), locale parity, anti-double-submit, evidence before implementation, minimal-context change budget, route -> ground current evidence -> verify

## Task 3: Run `localhost test` by detecting real runnable roots and verifying browser URLs, extension-backed

### rollout_summary_files

- rollout_summaries/2026-07-15T01-26-23-lv7P-codex_boot_read_and_localhost_test_verified_three_apps.md (cwd=\\?\C:\Users\user\Desktop\trash-container-app, rollout_path=C:\Users\user\.codex\sessions\2026\07\15\rollout-2026-07-15T09-26-27-019f6361-d5ad-7da2-a6b1-ef6d37cabda9.jsonl, updated_at=2026-07-15T01:29:03+00:00, thread_id=019f6361-d5ad-7da2-a6b1-ef6d37cabda9, verified `admin-panel-trash`, `web-admin-app`, and `web-driver-app` after one slow-start retry on `6006`)
- extensions/ad_hoc/notes/2026-07-10-localhost-test-trigger.md (cwd=\\?\C:\Users\user\Desktop\trash-container-app, rollout_path=C:\Users\user\.codex\memories\extensions\ad_hoc\notes\2026-07-10-localhost-test-trigger.md, updated_at=2026-07-10T00:00:00, thread_id=extension-ad-hoc-localhost-test-trigger, authoritative extension note) [ad-hoc note]

### keywords

- localhost test, trash-container-app, admin-panel-trash, web-admin-app, web-driver-app, pnpm.cmd run dev:local, npm.cmd run dev, 6006, 5173, 3000, HTTP 200, Unable to connect to the remote server, 127.0.0.1

## Task 4: Migrate trash admin to the exact five-store Pinia contract and reusable C+C store packages, extension-backed

### rollout_summary_files

- extensions/ad_hoc/notes/2026-07-13-trash-admin-pinia-contract-migration.md (cwd=\\?\C:\Users\user\Desktop\trash-container-app, rollout_path=C:\Users\user\.codex\memories\extensions\ad_hoc\notes\2026-07-13-trash-admin-pinia-contract-migration.md, updated_at=2026-07-13T00:00:00, thread_id=extension-ad-hoc-trash-admin-pinia-contract-migration, authoritative extension note) [ad-hoc note]

### keywords

- trash admin, Pinia tab, useOrderStore, useDriverTaskStore, useBinStore, useDriverStore, useHelperStore, getAllBinWIthOrder, OrderCreateInput, OrderUpdateInput, StatementInput, OrderDateRangeInput, DriverTaskUpdateInput, src/utils/*-store.ts, npm run type-check, npm run build

## Task 5: Upgrade trash Pinia stores to the Hotpot Options API pattern without changing the Trash contract, extension-backed

### rollout_summary_files

- extensions/ad_hoc/notes/2026-07-14-pinia-hotpot-contract-upgrade.md (cwd=\\?\C:\Users\user\Desktop\trash-container-app, rollout_path=C:\Users\user\.codex\memories\extensions\ad_hoc\notes\2026-07-14-pinia-hotpot-contract-upgrade.md, updated_at=2026-07-14T00:00:00, thread_id=extension-ad-hoc-pinia-hotpot-contract-upgrade, authoritative extension note) [ad-hoc note]

### keywords

- pinia-hotpot-contract-upgrade, admin-panel-hotpot, defineStore, Options API, OrderUpdateInput, DriverTaskUpdateInput, getAllBinWIthOrder, buildOrderUpdatePayload, buildDriverTaskUpdatePayload, views -> stores -> utils/types -> API/Supabase

## Task 6: Enforce the absolute Trash Pinia contract gate across admin and driver apps, extension-backed

### rollout_summary_files

- extensions/ad_hoc/notes/2026-07-14-pinia-contract-absolute-gate.md (cwd=\\?\C:\Users\user\Desktop\trash-container-app, rollout_path=C:\Users\user\.codex\memories\extensions\ad_hoc\notes\2026-07-14-pinia-contract-absolute-gate.md, updated_at=2026-07-14T00:00:00, thread_id=extension-ad-hoc-pinia-contract-absolute-gate, authoritative extension note) [ad-hoc note]

### keywords

- pinia-contract-absolute-gate, Trash sheet, Google Sheet, exact function input name, getAllBinWIthOrder, update(input), DriverTaskUpdateInput, getLists(), getDetail(taskId), cmd.exe /d /c npm run type-check

## Task 7: Preserve trash dual-app UI, workflow, and verification boundaries, extension-backed

### rollout_summary_files

- extensions/ad_hoc/notes/2026-07-14-trash-dual-app-operating-rules.md (cwd=\\?\C:\Users\user\Desktop\trash-container-app, rollout_path=C:\Users\user\.codex\memories\extensions\ad_hoc\notes\2026-07-14-trash-dual-app-operating-rules.md, updated_at=2026-07-14T00:00:00, thread_id=extension-ad-hoc-trash-dual-app-operating-rules, authoritative extension note) [ad-hoc note]

### keywords

- trash-dual-app-operating-rules, web-driver-app, web-admin-app, admin-panel-trash, design only, order timeline, departure photo, completion photo, customer debt, localhost test, modal close

## Task 8: Audit Cyroro admin and driver apps against the shared Pinia contract, schema, and verification gate, extension-backed

### rollout_summary_files

- extensions/ad_hoc/notes/2026-07-15-cyroro-dual-app-pinia-audit.md (cwd=\\?\C:\Users\user\Desktop\trash-container-app, rollout_path=C:\Users\user\.codex\memories\extensions\ad_hoc\notes\2026-07-15-cyroro-dual-app-pinia-audit.md, updated_at=2026-07-15T00:00:00, thread_id=extension-ad-hoc-cyroro-dual-app-pinia-audit, authoritative extension note) [ad-hoc note]

### keywords

- cyroro, VITE_SUPABASE_SCHEMA=cyroro, schema.sql, users, customers, orders, drivers, driver_tasks, bins, attachments, paymentStatus, totalAmount, latitude, longitude, cyroro-cartrack-vehicle-status, Edge Function, authenticated representative Cyroro reads

## Task 9: Speed up trash paired-app Pinia audits with bounded contract reads and precheck gates, extension-backed

### rollout_summary_files

- extensions/ad_hoc/notes/2026-07-15-pinia-audit-speed-improvements.md (cwd=\\?\C:\Users\user\Desktop\trash-container-app, rollout_path=C:\Users\user\.codex\memories\extensions\ad_hoc\notes\2026-07-15-pinia-audit-speed-improvements.md, updated_at=2026-07-15T00:00:00, thread_id=extension-ad-hoc-pinia-audit-speed-improvements, authoritative extension note) [ad-hoc note]

### keywords

- bounded Google Sheet metadata, Pinia range read, check_paired_pinia_contract.ps1, affected store, direct utils/types package, one caller per paired app, static contract/env/legacy checks, change budget, missing external services separately

## User preferences

- when app-store work is driven by the user's `PiniaStore -> Function -> Input` sheet contract, preserve the exact spelling and casing; do not rename, alias, or silently reinterpret those public cards during implementation [Task 1] [ad-hoc note]
- when Vue/Vben form work is requested, keep user-visible text behind `$t('...')`, keep schemas typed, and return complete code instead of placeholders or truncated files [Task 2] [ad-hoc note]
- when trash Pinia, Cyroro, or paired-app work is requested, read the live contract, current schema, files, and callers before implementation, load only the affected route/store/util/type/caller set, and avoid unrelated refactors [Task 2] [Task 8] [Task 9] [ad-hoc note]
- when the user says exactly `localhost test`, inspect the current workspace root, skip template/reference folders, verify HTTP responses, and print each working raw URL on its own line instead of only reporting a process start [Task 3] [ad-hoc note]
- when the user asks only `localhost test`, stay in read/start/verify mode and do not start patching apps unless they separately ask for a fix [Task 3]
- when trash admin work follows the `Trash` sheet `Pinia` tab, preserve the exact five-store contract and even the typo `getAllBinWIthOrder` -> exact public cards win over cleanup/refactor impulses in admin callers too [Task 4] [ad-hoc note]
- when any trash Pinia work is requested, read the live Google Sheet `Trash` -> `Pinia` tab before editing or reviewing Store code and treat its `PiniaStore`, `Function`, and `Input` columns as the public contract [Task 5] [Task 6] [ad-hoc note]
- when the user asks for screenshot/design work in `trash-container-app`, change only the named page, component, section, or design property; if they say `design only`, do not change content, database mapping, status logic, or navigation behavior [Task 7] [ad-hoc note]
- when the user asks for exact label corrections in the trash apps, search both `web-driver-app` and `web-admin-app` plus related modal/timeline/card views so old label sources are actually gone [Task 7] [ad-hoc note]

## Reusable knowledge

- The user's Google Sheet `Trash`, tab `Pinia`, is the public app-store contract: `PiniaStore -> Function -> Input` names are how teammates find and call actions, so exact names win over refactoring taste [Task 1] [ad-hoc note]
- The hotpot reference roots to inspect before designing a new app store are `D:\project\hotpot\app-cashier-hotpot`, `D:\project\hotpot\admin-panel-hotpot`, and `D:\project\hotpot\webApp-hotpot`; use them for structure, not for renaming the user's contract [Task 1] [ad-hoc note]
- Keep the c-to-c direction `views -> stores -> utils/types -> API/Supabase`; Pinia actions are the largest page-facing compositions, while small functions stay pure, typed, and explicitly composed [Task 1] [ad-hoc note]
- Treat each store as a bound package: store implementation, `src/types/<store>.ts`, `src/utils/*-store.ts` c-to-c helpers, barrel exports, view/table/drawer callers, composables, tests, mocks, route loaders, and docs should be inventoried together before removal or reuse [Task 1] [ad-hoc note]
- When another app in the same product family needs the same behavior, copying the complete `stores/` plus related `utils/` and `types/` package from `web-driver-app` is allowed only after comparing schema, auth, env, response shape, route inputs, and current callers [Task 1] [ad-hoc note]
- In Vue/Vben work, map database `snake_case` to frontend/store/form `camelCase` explicitly, keep `useEntityForm` for scalar form state, move uploads/rich text/repeatable arrays into separate dynamic state, and verify through `vue-tsc --noEmit`, project type-check, lint, build, or browser smoke tests [Task 2] [ad-hoc note]
- Dynamic relation/select options belong in `computed<FormSchema[]>(...)`; do not freeze reactive options into a static schema array [Task 2] [ad-hoc note]
- The active paired-app execution profile is Luna 5.6 with `route -> ground current evidence -> make the smallest compatible change -> verify -> report warnings separately`; for Pinia/Cyroro work, evidence before implementation and automated verification are part of the contract, not optional polish [Task 2] [ad-hoc note]
- For `trash-container-app`, the current runnable roots are `admin-panel-trash` via `pnpm.cmd run dev:local` on `6006`, `web-admin-app` via `npm.cmd run dev` on `5173`, and `web-driver-app` via `npm.cmd run dev` on `3000`; verify an existing listener before launching duplicates [Task 3] [ad-hoc note]
- A real `localhost test` verification in this workspace succeeded with HTTP 200 on `http://127.0.0.1:6006/`, `http://127.0.0.1:5173/`, and `http://127.0.0.1:3000/` after starting detached servers from the three app roots [Task 3]
- `admin-panel-trash` is the Vben monorepo, and its actual app lives under `apps/web-antd`; `dev:local` delegates to `pnpm vite --mode development.localhost` and can take longer than the two standalone Vite apps to become reachable [Task 3]
- The current trash admin Pinia contract is exactly five stores: `useOrderStore`, `useDriverTaskStore`, `useBinStore`, `useDriverStore`, and `useHelperStore`; the admin-facing functions include `create`, `update`, `getDetail`, `redirectWhatsapp`, `getOrderByCustomerIdForStatement`, `getAllByDate`, `getLists`, `getDetail`, `update`, `getAllBinWIthOrder`, `getCarTrackApi`, and `convertStringToDates` [Task 4] [ad-hoc note]
- Admin order inputs are `OrderCreateInput`, `OrderUpdateInput`, `StatementInput`, and `OrderDateRangeInput`; driver-task updates use `DriverTaskUpdateInput` [Task 4] [ad-hoc note]
- The proven admin C+C split is: pure payload/date/merge helpers in `src/utils/*-store.ts`, stores own Supabase/RPC access, and views call stores; reusable admin store/type/util modules were added without changing the Supabase schema [Task 4] [ad-hoc note]
- Verification for the admin contract migration was: admin `npm run type-check`, admin `npm run build`, driver `npm run type-check`, and HTTP 200 from localhost `5173` and `3000`; `src` no longer contains old admin contract names [Task 4] [ad-hoc note]
- `D:\project\hotpot\admin-panel-hotpot` is a structure/style guide only: reuse its Pinia Options API store organization, explicit state, action-level `try/catch/finally`, local refresh/invalidation after writes, and small `src/utils/` helpers, but never copy its PHP endpoints, API paths, auth assumptions, or business schema into the trash Supabase apps [Task 5] [ad-hoc note]
- The exact Trash contract currently enforced is: admin `useOrderStore.create(input: OrderCreateInput)`, `update(input: OrderUpdateInput)`, `getDetail(id)`, `redirectWhatsapp(customerPhoneNumber, orderNumber)`, `getOrderByCustomerIdForStatement(input: StatementInput)`, `getAllByDate(input: OrderDateRangeInput)`; admin `useBinStore.getAllBinWIthOrder()`; admin `useDriverStore.getCarTrackApi(vehicleNo)`; admin `useHelperStore.convertStringToDates(month)`; driver `useDriverTaskStore.getLists()`, `getDetail(taskId)`, and `update(input: DriverTaskUpdateInput)` [Task 5] [Task 6] [ad-hoc note]
- `OrderUpdateInput` is one object containing the target `id`; the store strips `id` before sending the update payload to Supabase. Preserve object-style updates and do not reintroduce `(id, data)` or compatibility unions such as `StatementInput | string` [Task 5] [Task 6] [ad-hoc note]
- Driver task reads are auth-scoped inside the store: `getLists()` and `getDetail(taskId)` must derive the current driver from the authenticated user rather than allowing a page-supplied driver identity [Task 5] [Task 6] [ad-hoc note]
- Active implementation targets are `web-driver-app` and `web-admin-app`; `admin-panel-trash` is reference-only for schema, migrations, RPCs, permissions, and business behavior unless the user explicitly reactivates it [Task 7] [ad-hoc note]
- For visual/page requests in the trash apps, do not change Supabase schema, migrations, or local Docker data; if requested display data is absent, use a scoped UI fallback only after checking the current relation path [Task 7] [ad-hoc note]
- Shared task workflow truth is `created -> task started -> departure photo uploaded/confirmed -> transporting -> arrival photo uploaded/confirmed -> task completed`; uploading a photo and confirming it are separate persisted states, and admin order modals should reuse the same timeline meaning and proof states [Task 7] [ad-hoc note]
- Completed tasks keep visible disabled start/finish buttons for timeline context, the latest timeline status gets the active border/highlight, and earlier completed or future pending steps keep distinct styling instead of disappearing [Task 7] [ad-hoc note]
- Resolve customer name and phone from the order's `customerId` relation before showing `未知客户`; keep the current Chinese bin fallback text consistent across home cards, order detail, history, and modals; debt totals should show unpaid balance as a positive red amount or `RM 0.00` when nothing is due [Task 7] [ad-hoc note]
- For `localhost test`, current standalone app ports are driver `3000` and admin `5173`; the Vben reference app uses `6006` with `pnpm.cmd run dev:local` [Task 7] [ad-hoc note]
- Both `web-admin-app` and `web-driver-app` use the same local Supabase project and `VITE_SUPABASE_SCHEMA=cyroro`; the immutable root `schema.sql` is reference-only and must not be edited [Task 8] [ad-hoc note]
- Shared public Inputs stay stable even if Cyroro column names differ: map legacy keys such as `driverId` and `binSizeId` to Cyroro `deliveryDriverId` and `binSizeType` at the store/util boundary [Task 8] [ad-hoc note]
- Cyroro business tables for the paired apps are `users`, `customers`, `orders`, `drivers`, `driver_tasks`, `bins`, and `attachments`; Cyroro does not have `bin_sizes`, `customer_transactions`, `driver_withdrawals`, or driver bank-account tables, so legacy page designs must not issue those queries or pretend they persist [Task 8] [ad-hoc note]
- Driver task state is Cyroro `pending -> inProgress -> completed/cancelled`; order execution `status=completed` and financial `paymentStatus=paid` are different signals, and debt uses unpaid `paymentStatus` orders with `totalAmount` while excluding paid/cancelled orders [Task 8] [ad-hoc note]
- Map markers should prefer order `latitude/longitude` and fall back to related bin coordinates only when the order coordinates are null; this is a display fallback, not a data mutation [Task 8] [ad-hoc note]
- The required CarTrack action calls external Edge Function `cyroro-cartrack-vehicle-status` with `{ vehicleNo }`; a local 404 means the Edge Function is not deployed, not that a Cyroro table is missing [Task 8] [ad-hoc note]
- Final paired-app verification is: read the live `Trash -> Pinia` sheet, inspect both apps plus current schema, run authenticated representative Cyroro reads, run `npm.cmd run type-check` and `npm.cmd run build` in both apps, and verify each localhost root returns HTTP 200; report external/backend warnings separately [Task 8] [ad-hoc note]
- The fast paired-app audit path is: bounded Google Sheet metadata plus `Pinia` range read, run `pinia-contract-workflow/scripts/check_paired_pinia_contract.ps1`, inspect only the affected store plus direct `utils/types` and one caller per app, then run static contract/env/legacy checks before authenticated API calls or production builds [Task 9] [ad-hoc note]
- Related skill: skills/localhost-test/SKILL.md (canonical)

## Failures and how to do differently

- Do not silently rename `PiniaStore`, `Function`, or `Input` names just because a different store shape looks cleaner; exact public contracts outrank internal taste [Task 1] [ad-hoc note]
- Do not delete a store by filename alone. Search real imports/callers first and remove only unused private types/helpers/tests/callers while preserving shared files still used elsewhere [Task 1] [ad-hoc note]
- If a form option list depends on store data, do not leave it as a static schema constant; move it to a typed computed schema and refresh it after create/update when needed [Task 2] [ad-hoc note]
- Do not claim Vue/Vben structural correctness from an edit alone. Read back the changed region and run the nearest compiler/type-check/browser verification before calling the task done [Task 2] [ad-hoc note]
- For `localhost test`, a spawned process is not success. Treat `000`/connection-refused as a process/port problem, treat `500` as an application error, and verify each URL with an HTTP request before reporting it as working [Task 3] [ad-hoc note]
- If `admin-panel-trash` on `6006` fails the first HTTP check with `Unable to connect to the remote server`, do not report failure immediately; the proven fix here was to wait longer and run a second readiness pass before deciding the Vben app is down [Task 3]
- Do not normalize away contract typos like `getAllBinWIthOrder` or revert to legacy plural store/action names in admin callers; the Sheet contract and current admin callers are the compatibility boundary [Task 4] [ad-hoc note]
- If any trash Store, Function, or Input is missing, renamed, aliased, unioned with an incompatible legacy shape, or called with the wrong argument structure, stop the task and repair that contract drift before adding unrelated features [Task 6] [ad-hoc note]
- Do not let pages query Supabase directly or assemble a second payload contract. Keep the dependency direction `views -> stores -> utils/types -> API/Supabase` and normalize once in typed `src/utils/*-store.ts` helpers [Task 5] [Task 6] [Task 7] [ad-hoc note]
- Do not copy a store package between admin and driver apps without comparing schema, auth role, environment, relation response shape, route inputs, and live callers; copying without that comparison is unsafe [Task 5] [Task 7] [ad-hoc note]
- Do not edit the root `schema.sql` or infer missing persistence from old page designs; if Cyroro lacks `bin_sizes`, `customer_transactions`, `driver_withdrawals`, or driver bank-account tables, keep the design if needed but remove or avoid the legacy query path [Task 8] [ad-hoc note]
- If a CarTrack request returns local 404, treat it as an undeployed external Edge Function warning and report it separately instead of inventing a missing table or blocking unrelated pages [Task 8] [ad-hoc note]
- Do not reintroduce non-Cyroro execution states like `uploadingDeparturePhoto`, and do not conflate `paymentStatus` with workflow `status` when calculating debt, timeline states, or filters [Task 8] [ad-hoc note]
- Do not waste audit time scanning unrelated Sheet tabs, unrelated stores, or full app trees first; use the bounded contract read, paired-app precheck script, and affected-store-plus-one-caller pass before deeper reads [Task 9] [ad-hoc note]
- For trash workflow UI changes, do not close the modal on `开始流程`-equivalent actions, do not treat a selected/previewed file as persisted proof, and do not hide all completed controls when the design relies on disabled buttons for context [Task 7] [ad-hoc note]
- Decorative overlays must not intercept pointer events; keep both the header `X` and footer `Close` button wired to the same close path [Task 7] [ad-hoc note]
- For status/photo workflow changes, verify both visible state and persistence path: button behavior, modal staying open, next-step transition, storage reference, and database status update. Report uncertainty instead of claiming browser validation from type-check output alone [Task 7] [ad-hoc note]

# Task Group: .codex routing hygiene, git metadata cleanup, Luna execution, and verification
scope: Use when work is inside `C:\Users\user\.codex` and the user wants boot/routing overhead reduced, nested Git metadata fixed, cold notes audited for promotion, important markdown protected, or the active GPT-5.6 Luna execution lane kept fast without bloating the boot path.
applies_to: cwd=\\?\C:\Users\user\.codex; reuse_rule=safe for `.codex` knowledge/routing work in this checkout while `00_PULSE.md`, `AGENTS.md`, `CODEX_DYNAMIC_ROUTING.md`, `memories/2_governance`, the router scripts, and the Luna playbook remain the routing truth sources

## Task 1: Audit safe `.codex` cleanup targets, prune stale `.sandbox` logs, and keep rollout summary references intact, success

### rollout_summary_files

- rollout_summaries/2026-07-03T02-34-59-1Seq-codex_cleanup_sandbox_and_rollout_summary_audit.md (cwd=\\?\C:\Users\user\.codex, rollout_path=C:\Users\user\.codex\sessions\2026\07\03\rollout-2026-07-03T10-35-04-019f25d4-5324-7482-af99-a9473dada5ae.jsonl, updated_at=2026-07-03T10:13:39+00:00, thread_id=019f25d4-5324-7482-af99-a9473dada5ae, evidence-based cleanup audit covering route integrity, `.sandbox` shrink, and rollout-summary safety)

### keywords

- .codex, cleanup, sandbox, rollout_summaries, Update-CodexRouting.ps1, Audit-CodexRouting.ps1, zero usage, safe deletion, route integrity, filesystem shrink, googlesheet-email-integration, LAA_PROJECT_SNAPSHOT.md

## Task 2: Reduce duplicate `.codex` boot/routing prose and keep the boot path lean, success

### rollout_summary_files

- rollout_summaries/2026-07-07T06-37-54-1jsr-codex_boot_memory_routing_cleanup_and_protection.md (cwd=\\?\C:\Users\user\.codex, rollout_path=C:\Users\user\.codex\sessions\2026\07\07\rollout-2026-07-07T14-37-59-019f3b4c-2967-7d91-89d5-2e3eded86ef7.jsonl, updated_at=2026-07-07T09:52:15+00:00, thread_id=019f3b4c-2967-7d91-89d5-2e3eded86ef7, boot self-check, small always-active rules, and sentinel-preserving boot refinement)

### keywords

- .codex, 00_PULSE.md, AGENTS.md, CODEX_DYNAMIC_ROUTING.md, ai read .codex knowledge, boot self-check, 10/10 gate, personalized behavior rules, Audit-CodexRouting.ps1, Update-CodexRouting.ps1, hot boot path, token cost, speed

## Task 3: Audit whether cold memory/skill notes deserve promotion into the hot path, extension-backed

### rollout_summary_files

- rollout_summaries/2026-07-07T06-37-54-1jsr-codex_boot_memory_routing_cleanup_and_protection.md (cwd=\\?\C:\Users\user\.codex, rollout_path=C:\Users\user\.codex\sessions\2026\07\07\rollout-2026-07-07T14-37-59-019f3b4c-2967-7d91-89d5-2e3eded86ef7.jsonl, updated_at=2026-07-07T09:52:15+00:00, thread_id=019f3b4c-2967-7d91-89d5-2e3eded86ef7, selective promotion, `(ai manage)` anchors, and hot-path policy validation)
- extensions/ad_hoc/notes/2026-07-07T00-00-00-cold-storage-promotion-policy.md (cwd=\\?\C:\Users\user\.codex, rollout_path=C:\Users\user\.codex\memories\extensions\ad_hoc\notes\2026-07-07T00-00-00-cold-storage-promotion-policy.md, updated_at=2026-07-07T00:00:00, thread_id=extension-ad-hoc-cold-storage-promotion-policy, authoritative extension note) [ad-hoc note]

### keywords

- cold storage audit, memory promotion policy, route promotion policy, ai cold storage audit, ai promote memory, ai memory promotion, 00_PULSE.md, hot boot path, hybrid frontmatter, reusable knowledge, historical context

## Task 4: Protect important routed markdown, measure hot-vs-cold memory, and keep ignore cleanup route-safe, success

### rollout_summary_files

- rollout_summaries/2026-07-07T06-37-54-1jsr-codex_boot_memory_routing_cleanup_and_protection.md (cwd=\\?\C:\Users\user\.codex, rollout_path=C:\Users\user\.codex\sessions\2026\07\07\rollout-2026-07-07T14-37-59-019f3b4c-2967-7d91-89d5-2e3eded86ef7.jsonl, updated_at=2026-07-07T09:52:15+00:00, thread_id=019f3b4c-2967-7d91-89d5-2e3eded86ef7, protected-markdown rule, hot/cold coverage measurement, folder classification, and ignore-file safety)

### keywords

- Protected Markdown Rule, important .md, 00_PULSE.md, 0.1.3, hot vs cold, 0_apex, 1_core, 2_governance, .gitignore, .codexignore, .openaiignore, .claudeignore, .geminiignore, 125 content files, 18 direct references

## Task 5: Adopt GPT-5.6 Luna execution defaults without bloating boot, extension-backed

### rollout_summary_files

- extensions/ad_hoc/notes/2026-07-10-gpt-5-6-luna-operating-playbook.md (cwd=\\?\C:\Users\user\.codex, rollout_path=C:\Users\user\.codex\memories\extensions\ad_hoc\notes\2026-07-10-gpt-5-6-luna-operating-playbook.md, updated_at=2026-07-10T00:00:00, thread_id=extension-ad-hoc-gpt-5-6-luna-operating-playbook, authoritative extension note) [ad-hoc note]

### keywords

- gpt-5.6-luna, luna-5.6-medium, prompt cache, large context, inspect-act-verify, HYDRATE route, GROUND current evidence, model cost optimization, deep_only, stable route prefixes

## Task 6: Remove nested `memories/.git` and convert `memories/` back to ordinary tracked files, success

### rollout_summary_files

- rollout_summaries/2026-07-10T07-21-44-KiJe-codex_memories_nested_git_fix.md (cwd=\\?\C:\Users\user\.codex, rollout_path=C:\Users\user\.codex\sessions\2026\07\10\rollout-2026-07-10T15-21-49-019f4ae7-5d93-7650-89ad-42f1ee7502ac.jsonl, updated_at=2026-07-10T07:24:23+00:00, thread_id=019f4ae7-5d93-7650-89ad-42f1ee7502ac, nested repo removal and gitlink-to-tree conversion)

### keywords

- memories/.git, gitlink, 160000, m memories, git rm --cached -r -- memories, git add -- memories, git ls-files --stage memories, git ls-tree HEAD memories, Track memories as regular Codex files

## Task 7: Deep-maintain `.codex` with GitNexus, safe cleanup, ignore synchronization, and route verification, success

### rollout_summary_files

- rollout_summaries/2026-07-10T06-23-45-F6PQ-codex_deep_maintenance_gitnexus_cleanup_ignore_routing.md (cwd=\\?\C:\Users\user\.codex, rollout_path=C:\Users\user\.codex\sessions\2026\07\10\rollout-2026-07-10T14-23-55-019f4ab2-470b-7d50-ac3a-d49e0258707e.jsonl, updated_at=2026-07-10T07:12:49+00:00, thread_id=019f4ab2-470b-7d50-ac3a-d49e0258707e, one-time GitNexus pass plus cleanup, ignore sweep, route repair, and boot re-hydration guidance)

### keywords

- gitnexus, codexignore, claudeignore, geminiignore, openaiignore, AGENTS.md, CLAUDE.md, CODEX_DYNAMIC_ROUTING.md, Validate-CodexKnowledge.ps1, Audit-CodexRouting.ps1, Test-CodexPerfBenchmark.ps1, sessions cleanup, stale cache cleanup, route integrity, ai read .codex knowledge

## Task 8: Keep new durable `.codex` knowledge and generated developer guidance in English, extension-backed

### rollout_summary_files

- extensions/ad_hoc/notes/2026-07-15-codex-knowledge-english-rule.md (cwd=\\?\C:\Users\user\.codex, rollout_path=C:\Users\user\.codex\memories\extensions\ad_hoc\notes\2026-07-15-codex-knowledge-english-rule.md, updated_at=2026-07-15T00:00:00, thread_id=extension-ad-hoc-codex-knowledge-english-rule, authoritative extension note) [ad-hoc note]

### keywords

- durable .codex knowledge, English, skill updates, Pinia contract audits, migration summaries, developer guidance, do not translate UI labels, Google Sheet values, PiniaStore, Function, Input, table names, column names, status values

## User preferences

- when the user asked to reduce `.codex` size/noise and later said `check this only other dont cause danger` -> keep cleanup narrow, evidence-based, and route-safe instead of doing blind pruning [Task 1]
- when the user asked to find `10 parts that are a waste or unnecessary content` in `.codex` knowledge/memories/skills -> keep the boot path lean and remove duplicate routing prose by default [Task 2]
- when a `.codex`-managed project starts, the user confirmed `ai read .codex knowledge` should stay a small boot read, not a full tree scan -> route with the smallest viable entrypoint first and only expand if the route is still unclear [ad-hoc note]
- when the user asked how to get from `9/10` to `10/10` and wanted AI behavior to be `faster and smarter` -> tighten the boot layer with compact self-checking rules and evidence-first defaults instead of adding broader protocol prose [Task 2]
- when future work stays in the same project area, the user confirmed the matching skill family should stay awake across later chats/turns -> reuse the proven route until the user changes focus or the area is mostly complete [ad-hoc note]
- when `.codex` or project maintenance work spans `3+` changes, multiple files, or DB+code mixed work -> list numbered steps first and coordinate one step per response when the task needs active coordination [ad-hoc note]
- when the user said `for important .md please do not ever change or remove to those very important` -> protect routed markdown by default and prefer additive routing or tiny patches over deletion unless the user explicitly targets that exact file [Task 4]
- when the user wants `.codex` to feel `faster and smarter`, keep the route-first prefix stable, read in bounded batches, and use an inspect-act-verify loop instead of expanding the hot path or dumping large context into every turn [Task 2][Task 5] [ad-hoc note]
- when the user says they `want to first commit but failed` after a `.git` appears under `memories/` -> inspect repository metadata first, treat it as a Git-structure problem, and keep `memories/` as ordinary tracked content rather than recreating a nested repo [Task 6]
- when the user asks to run GitNexus `once` on `.codex` and later says `do it step by step`, treat indexing, cleanup, ignore audit, and routing repair as gated maintenance phases rather than one bulk pass [Task 7]
- when the user asks for `.codex` ignore review, treat it as a full `.gitignore` plus `.xxxxxignore` contract sweep, not a single-file patch [Task 7]
- when the user asks for `comparison before and after of this changes` on routing cleanup, return measurable route-integrity/validator counts rather than only narrative assurance [Task 7]
- when the user asks whether they should reopen a new tab and run `ai read .codex knowledge`, answer with the exact one-time re-hydration behavior after major `.codex` changes [Task 7]
- when writing new durable `.codex` knowledge, skill updates, Pinia contract audits, migration summaries, or generated developer guidance for this workspace, keep that guidance in concise English and do not translate application-layer labels or public contract names [Task 8] [ad-hoc note]

## Reusable knowledge

- For `.codex` cleanup, start from routed surfaces and exact reference checks before broad scans; `skills/website/googlesheet-email-integration/` was safe to remove only after confirming there were no live route references, while `memories/3_domains/claude/LAA_PROJECT_SNAPSHOT.md` had to stay because active skills still referenced it [Task 1]
- The current low-risk `.sandbox` cleanup target is dated history logs; keep runtime markers like `deny_read_acl_state.json` and `setup_marker.json`, and note that ignore contracts already cover `.sandbox/`, `.sandbox-bin/`, and `.sandbox-secrets/` [Task 1]
- `rollout_summaries/` is still live reference material for `memories/MEMORY.md`; if space needs to be reclaimed later, check underlying `sessions/` JSONL history before deleting summaries [Task 1]
- `00_PULSE.md` is the authoritative single boot read for `.codex` routing; `00_CODEX_START_HERE.md` should stay deferred/short, `AGENTS.md` should stay a compact bridge, and `CODEX_DYNAMIC_ROUTING.md` should act like a snapshot/index rather than a long log [Task 2]
- `00_PULSE.md` now carries small always-active boot additions like `0.1 Personalized Behavior Rules`, `0.1.1 Boot Self-Check (10/10 gate)`, and the sentinel-preserving `ai read .codex knowledge` trigger; keep new boot rules compact enough to fit as one-line defaults when possible [Task 2]
- For `.codex` routing, stop at the first valid trigger match and avoid over-reading extra files during normal boot; rollout summaries and archive/history should stay out of the normal route [Task 2]
- `(ai manage)` marks maintenance-owned durable notes/skills, and the short promoted rules from this lane were `READ_BEFORE_ANSWER_PROTOCOL.md`, `SINGLE_TRUTH_SOURCE_PROTOCOL.md`, and `skills/awake-skill-routing/SKILL.md`; large bundles like `0_apex/ENGINEERING_PROTOCOLS.md` and `2_governance/SESSION_START_PROTOCOL.md` should stay cold unless one unique rule is extracted [Task 3]
- For cold memory/skill audits, compare the candidate against current boot routes and current project files before promoting it; promote only when it is reusable, correct, current, and not already represented more cleanly in a hotter note [Task 3] [ad-hoc note]
- If a cold file is valuable but not discoverable enough, prefer adding a small trigger in `00_PULSE.md` or converting the principle into a short hybrid-frontmatter note instead of promoting a bulky historical file directly [Task 3] [ad-hoc note]
- The hot set should be measured from direct boot references, not from total stored files: one audit counted about 18 direct `00_PULSE.md` memory targets across roughly 125 `memories` content files, with `0_apex` and `2_governance` active and `1_core` mostly cold [Task 4]
- The root ignore surface currently spans `.gitignore`, `.codexignore`, `.openaiignore`, `.claudeignore`, and `.geminiignore`; the current risk is not missing ignores so much as hiding or deleting routed markdown that is still referenced [Task 4]
- Luna's large context window is a retrieval advantage, not permission to dump the tree: keep the stable route prefix intact, load the smallest relevant route first, and expand only in bounded batches [Task 5] [ad-hoc note]
- The Luna execution contract for deep `.codex` work is `HYDRATE route -> GROUND current evidence -> PLAN smallest change -> ACT -> VERIFY -> REPORT outcome plus verification` [Task 5] [ad-hoc note]
- Prompt-cache stability matters in the current Luna lane: keep durable instructions and route prefixes unchanged when possible and move volatile task details after them [Task 5] [ad-hoc note]
- Load the full Luna playbook only for deep model-optimization, knowledge-review, routing-validation, or explicit `.codex` improvement work; keep it out of the normal boot read [Task 5] [ad-hoc note]
- If root `git status` shows `m memories` and `git ls-files --stage memories` or `git ls-tree HEAD memories` reports mode `160000`, the root repo is still tracking `memories/` as a gitlink/submodule-like entry even if `.gitmodules` is absent [Task 6]
- The proven conversion path was: move `memories/.git` to an external backup, run `git rm --cached -r -- memories`, then `git add -- memories`, and verify both `git status --short --branch` and that no `.git` directory remains under `memories/` [Task 6]
- `npx gitnexus analyze` from `C:\Users\user\.codex` worked as a one-time graph bootstrap and produced `3,523 nodes | 3,886 edges | 9 clusters | 16 flows`; `npx gitnexus status` then reported the repo up to date [Task 7]
- Generated context like `CLAUDE.md` and `AGENTS.md` can come from GitNexus during `.codex` maintenance; inspect them before treating them as durable truth [Task 7]
- The verified stale cleanup targets in this `.codex` pass were `sessions/2026/06`, `archived_sessions/`, `.tmp/bundled-marketplaces/`, `.tmp/marketplaces/`, `plugins/.remote-plugin-install-staging/`, and `.codex-global-state.json.bak`, with active `sessions/2026/07`, installed plugins, current executables, memories, and skills preserved [Task 7]
- The root ignore contract sweep for `.codex` should cover `.gitignore`, `.codexignore`, `.claudeignore`, `.geminiignore`, `.openaiignore`, and `skills/.gitignore`; durable `memories/` and `skills/` content should remain visible while `.gitnexus/`, generated `.claude/`, attachments, browser/computer-use state, `node_repl`, `process_manager`, and plugin cache noise stay ignored [Task 7]
- `Validate-CodexKnowledge.ps1` is the fast sign-off tool after major `.codex` maintenance; the verified clean state here was `0` missing active targets, `0` legacy refs, `0` trigger conflicts, `0` missing route targets, `status: PASS`, and benchmark `Passed: 18`, `Failed: 0`, `Rating: 10/10` [Task 7]
- After major `.codex` changes, the one-time boot re-hydration ritual is: open a fresh chat and send exactly `ai read .codex knowledge`; do not repeat it on every message after the ready sentinel appears [Task 7]
- In this workspace, durable AI-facing guidance should remain concise English for consistency across `.codex` knowledge, skills, Pinia audits, migration summaries, and generated developer notes; keep app UI labels, database values, Google Sheet values, public `PiniaStore`/`Function`/`Input` names, table names, column names, and status values in their original language/casing [Task 8] [ad-hoc note]

## Failures and how to do differently

- If the route graph or audit counts look wrong after cleanup, treat missing files/references as the first hypothesis and rerun `Update-CodexRouting.ps1` plus `Audit-CodexRouting.ps1` before widening the fix [Task 1]
- Do not delete runtime markers just because they are small, and do not prune rollout summaries while `MEMORY.md` still depends on every file [Task 1]
- Patch matching against `memories/MEMORY.md` can fail when punctuation/encoding differs; use smaller, line-preserving replacements and read the file back immediately after each change [Task 2]
- Over-trimming `memories/MEMORY.md` can corrupt structure; if cleanup collapses the file, restore from `git show HEAD` before retrying smaller edits [Task 2]
- Do not over-expand the boot layer when the user only wants a small update; if a rule fits in one line, keep it as a compact `00_PULSE.md` default instead of rewriting larger sections [Task 2]
- Do not promote a cold file just because it exists; keep it cold when it is historical, project-specific, duplicated by a hotter note, sensitive, or likely to bloat the boot path without improving decisions [Task 3] [ad-hoc note]
- If a file is useful mainly as historical context or cleanup evidence, leave it cold and point to it from memory summaries instead of making it part of the hot route [Task 3] [ad-hoc note]
- Do not delete or rewrite important routed markdown just because it looks old or duplicative; protect route-critical `.md` files by default and verify whether they are still referenced before touching them [Task 4]
- Do not confuse total memory tree size with what the model actually reads on boot; use direct `00_PULSE.md` references as the hot-set proxy and treat runtime DB/log/state files as storage unless a route explicitly reads them [Task 4]
- Do not treat every large `.codex` folder as cleanup noise. Classify active vs stale first, especially under `sessions`, `plugins`, `.sandbox-bin`, and `.tmp` [Task 7]
- Do not accept generated `CLAUDE.md` or `AGENTS.md` blindly after GitNexus; review them, and treat template scope-extraction warnings like `scope extraction failed for skills/normal/design/systems/radix-ui-design-system/templates/component-template.tsx` as non-blocking unless routing actually breaks [Task 7]
- Do not patch one ignore file in isolation when the user asks for `.codex` ignore hygiene; sync the whole ignore set and verify with `git check-ignore` that noise is hidden while routed knowledge stays visible [Task 7]
- Do not treat historical references found in generated/index material as active route failures; rerun the active routing audit and knowledge validator before claiming broken paths [Task 7]
- Do not ask the user to re-run `ai read .codex knowledge` on every message after maintenance; it is a one-time hydration step per fresh chat/session [Task 7]
- Over-reading unrelated skills or knowledge paths adds avoidable boot cost; if the task is still within one project lane, keep one matching skill family awake and defer the rest [ad-hoc note]
- Do not treat Luna's larger context as permission to read unrelated trees, secrets, or session history by default; if three fixes fail on the same issue, stop repeating the same tactic and switch to a deeper audit [Task 5] [ad-hoc note]
- If staging `memories/` still behaves like one opaque path after removing the nested `.git`, the index is probably still holding the gitlink; remove the cached path before re-adding instead of retrying plain `git add` [Task 6]
- Do not delete a nested repo blindly if its history might matter; back up `memories/.git` outside `.codex` first, then convert the root tree and verify the path is now ordinary tracked files [Task 6]
- Do not translate or normalize application UI labels, database values, Google Sheet values, public `PiniaStore`/`Function`/`Input` names, table names, column names, or status values when writing durable guidance; only the AI-facing knowledge wrapper should switch to concise English [Task 8] [ad-hoc note]

# Task Group: VIPBillion cross-project boot routing and knowledge capture
scope: Use when the user says `ai read .codex knowledge` from the VIPBillion workspace and wants the strict boot-read sentinel behavior preserved while the internal boot follow-up routes stay performance-focused and complete.
applies_to: cwd=\\?\C:\Users\user\Desktop\VIPBillion; reuse_rule=safe for VIPBillion route-first boot work in this workspace while `.codex` routing triggers and the current five-lane first-run bundle stay unchanged

## Task 1: Expand the `.codex` boot path so the sentinel-only trigger always wakes the five first-run lanes, success

### rollout_summary_files

- rollout_summaries/2026-07-10T01-12-48-4n5P-codex_boot_first_runs_always_wake_five_lanes.md (cwd=\\?\C:\Users\user\Desktop\VIPBillion, rollout_path=C:\Users\user\.codex\sessions\2026\07\10\rollout-2026-07-10T09-12-53-019f4995-980b-7151-9d07-6099590444f5.jsonl, updated_at=2026-07-10T01:38:44+00:00, thread_id=019f4995-980b-7151-9d07-6099590444f5, boot-first-runs bundle added while preserving sentinel-only output)

### keywords

- ai read .codex knowledge, 00_PULSE.md, Boot First-Runs, always wake these lanes in order, ai project truth doc, ai semantic skill router, ai knowledge validation pass, ai current lane memory, ai hot cold gate, project-handoff-doc-stack, validate-knowledge

## Task 2: Read `.codex` knowledge and preserve the sentinel-only boot response, success

### rollout_summary_files

- rollout_summaries/2026-07-08T04-32-07-uUUL-codex_boot_read_pulse_sentinel.md (cwd=\\?\C:\Users\user\Desktop\VIPBillion, rollout_path=C:\Users\user\.codex\sessions\2026\07\08\rollout-2026-07-08T12-32-12-019f3fff-5d23-7c01-9347-1d7d4523048f.jsonl, updated_at=2026-07-08T04:32:42+00:00, thread_id=019f3fff-5d23-7c01-9347-1d7d4523048f, repeated boot-read request confirmed the sentinel-only response path)

### keywords

- ai read .codex knowledge, Agent is Ready.., 00_PULSE.md, Get-Content -TotalCount 250, boot route, hydrate once per chat session, skip summaries

## User preferences

- when the user said `ai read .codex knowledge` and later asked to `capture all above request that i made and chat` -> treat boot/routing and memory capture as durable work worth preserving, not as one-off setup chatter [Task 2]
- when the user repeats `ai read .codex knowledge` after an aborted or failed earlier attempt -> treat it as a strict boot-read request and keep the response minimal/sentinel-only rather than turning it into an explanation [Task 2]
- when the user asked to `help me ai performance alot more` and to `automatic run the skills or knowledge if needed` -> proactively route to the right skill without making the user restate the boot behavior on every follow-up [Task 2]
- when the user asked to include the `5 missing things` so AI would `never miss a thing here` and then said `always wake these 5 immediately after the boot sentinel` -> keep the outward sentinel response minimal, but bias toward fuller automatic internal follow-up routing when it materially improves downstream performance [Task 1]
- when warned that the boot would become heavier, the user still said `yes` -> for this boot workflow, better reasoning/routing performance can justify a larger internal boot bundle as long as the visible trigger response stays lean [Task 1]

## Reusable knowledge

- `ai read .codex knowledge` is a special trigger that should return the ready sentinel after the route-first boot read; do not replace it with a summary [Task 2]
- In this workspace, the boot read still starts at `C:\Users\user\.codex\00_PULSE.md`; hydrate once per chat session, then reuse that distilled route context instead of re-reading `.codex` on every message [Task 2]
- `00_PULSE.md` now has `## 0.1.2 Boot First-Runs` and the unconditional line `After the boot sentinel, always wake these lanes in order:` so the internal boot sequence stays deterministic [Task 1]
- The current five-lane first-run bundle is: `skills/project-handoff-doc-stack/SKILL.md`, `memories/2_governance/artifacts/skill_path_router.md`, `memories/MEMORY.md`, `skills/claude-meta/validate-knowledge/skill.md`, and `memories/extensions/ad_hoc/notes/2026-07-07T00-00-00-cold-storage-promotion-policy.md` [Task 1]
- The paired trigger aliases added for those lanes are `ai project truth doc`, `ai semantic skill router`, `ai knowledge validation pass`, `ai current lane memory`, and `ai hot cold gate` [Task 1]
- Related skill: skills/awake-skill-routing/SKILL.md

## Failures and how to do differently

- A cached skill-path probe failed because the path did not exist; locate cached skill copies dynamically rather than hardcoding plugin hashes or stale cache paths [Task 2]
- Do not answer `ai read .codex knowledge` with extra explanation or repeated re-reads after boot succeeds; return the sentinel, keep the route awake, and expand only if the user asks for more than the boot read [Task 2]
- When the request is about routing/knowledge capture rather than code changes, stop after extracting and storing reusable routing evidence instead of forcing an implementation task [Task 2]
- If a patch to `00_PULSE.md` misses due to spacing or line-wrap mismatch, re-read the exact surrounding slice and patch against real lines instead of guessing the block text [Task 1]
- Keep the sentinel behavior intact while expanding only the internal follow-up routes; the user wanted a lean outward trigger plus a stronger internal first-run bundle, not a verbose boot response [Task 1]

# Task Group: VIPBillion admin shared module reuse, Vben table/drawer guardrails, and soft-delete-safe CRUD
scope: Use when work is in `admin-vipbillion` and the user wants existing booking-related module shells reused, Vben table/drawer structure kept aligned, or soft-delete-safe CRUD conventions preserved across cloned modules.
applies_to: cwd=\\?\C:\Users\user\Desktop\VIPBillion; reuse_rule=safe for `admin-vipbillion` shared drawer/form and CRUD flows in this workspace while the current booking-related module shells, Vben table/drawer patterns, and store/utils/types package boundaries remain the main truth sources

## Task 1: Reuse existing booking CRUD modules and keep Vben tables/drawers structurally aligned, extension-backed

### rollout_summary_files

- extensions/ad_hoc/notes/2026-07-09-vben-drawer-scroll-top-rule.md (cwd=\\?\C:\Users\user\Desktop\VIPBillion, rollout_path=C:\Users\user\.codex\memories\extensions\ad_hoc\notes\2026-07-09-vben-drawer-scroll-top-rule.md, updated_at=2026-07-09T15:35:41, thread_id=extension-ad-hoc-vben-drawer-scroll-top-rule, authoritative extension note) [ad-hoc note]
- extensions/ad_hoc/notes/2026-07-09T10-07-49-vben-table-column-alignment-rule.md (cwd=\\?\C:\Users\user\Desktop\VIPBillion, rollout_path=C:\Users\user\.codex\memories\extensions\ad_hoc\notes\2026-07-09T10-07-49-vben-table-column-alignment-rule.md, updated_at=2026-07-09T10:07:49, thread_id=extension-ad-hoc-vben-table-column-alignment-rule, authoritative extension note) [ad-hoc note]
- extensions/ad_hoc/notes/2026-07-09T10-06-06-vipbillion-share-existing-booking-modules.md (cwd=\\?\C:\Users\user\Desktop\VIPBillion, rollout_path=C:\Users\user\.codex\memories\extensions\ad_hoc\notes\2026-07-09T10-06-06-vipbillion-share-existing-booking-modules.md, updated_at=2026-07-09T10:06:06, thread_id=extension-ad-hoc-vipbillion-share-existing-booking-modules, authoritative extension note) [ad-hoc note]

### keywords

- admin-vipbillion, Booking Management, report views, booking-related CRUD modules, shared booking CRUD path, Vben table, new column, body cells, summary row cells, horizontal scroll width, action offsets, checkbox offsets, CRUD drawer, module shell, reopen at top scroll position, reset on open, reset on opened, nested content mount, persisted mount state, shared scroll reset helper

## Task 2: Preserve clone-first duplication, booking/driver-job focus, and soft-delete-safe CRUD rules, extension-backed

### rollout_summary_files

- extensions/ad_hoc/notes/2026-07-02-vipbillion-isdelete-rules.md (cwd=\\?\C:\Users\user\Desktop\VIPBillion, rollout_path=C:\Users\user\.codex\memories\extensions\ad_hoc\notes\2026-07-02-vipbillion-isdelete-rules.md, updated_at=2026-07-02T00:00:00, thread_id=extension-ad-hoc-vipbillion-isdelete-rules, authoritative extension note) [ad-hoc note]
- extensions/ad_hoc/notes/2026-07-01T15-53-47-vipbillion-booking-driver-focus.md (cwd=\\?\C:\Users\user\Desktop\VIPBillion, rollout_path=C:\Users\user\.codex\memories\extensions\ad_hoc\notes\2026-07-01T15-53-47-vipbillion-booking-driver-focus.md, updated_at=2026-07-01T15:53:47, thread_id=extension-ad-hoc-vipbillion-booking-driver-focus, authoritative extension note) [ad-hoc note]
- extensions/ad_hoc/notes/2026-06-29T18-18-35-vipbillion-slug-soft-delete-reuse-rule.md (cwd=\\?\C:\Users\user\Desktop\VIPBillion, rollout_path=C:\Users\user\.codex\memories\extensions\ad_hoc\notes\2026-06-29T18-18-35-vipbillion-slug-soft-delete-reuse-rule.md, updated_at=2026-06-29T18:18:35, thread_id=extension-ad-hoc-vipbillion-slug-soft-delete-reuse-rule, authoritative extension note) [ad-hoc note]
- extensions/ad_hoc/notes/2026-06-29T17-30-00-clone-first-summary-rule.md (cwd=\\?\C:\Users\user\Desktop\VIPBillion, rollout_path=C:\Users\user\.codex\memories\extensions\ad_hoc\notes\2026-06-29T17-30-00-clone-first-summary-rule.md, updated_at=2026-06-29T17:30:00, thread_id=extension-ad-hoc-clone-first-summary-rule, authoritative extension note) [ad-hoc note]
- extensions/ad_hoc/notes/2026-06-29T17-21-07-clone-first-rule.md (cwd=\\?\C:\Users\user\Desktop\VIPBillion, rollout_path=C:\Users\user\.codex\memories\extensions\ad_hoc\notes\2026-06-29T17-21-07-clone-first-rule.md, updated_at=2026-06-29T17:21:07, thread_id=extension-ad-hoc-clone-first-rule, authoritative extension note) [ad-hoc note]
- extensions/ad_hoc/notes/2026-06-29T17-14-26-copy-paste-module-rule.md (cwd=\\?\C:\Users\user\Desktop\VIPBillion, rollout_path=C:\Users\user\.codex\memories\extensions\ad_hoc\notes\2026-06-29T17-14-26-copy-paste-module-rule.md, updated_at=2026-06-29T17:14:26, thread_id=extension-ad-hoc-copy-paste-module-rule, authoritative extension note) [ad-hoc note]

### keywords

- copy and paste, duplicate, clone, same modules, booking tables, driver-job tables, deleted_at, isDelete, checkSlugExists, uq_news_project_slug_en, SECURITY DEFINER, soft delete, clone-first

## User preferences

- when future VIPBillion admin work touches booking tables/CRUD and driver-job tables/CRUD together -> keep those surfaces in focus as one evolving area and proactively look for stale relation wiring or cleanup needs after the latest changes settle [Task 2] [ad-hoc note]
- when VIPBillion admin work already has a booking-related CRUD flow, prefer reusing the existing module/drawer path instead of recreating it; only split when the data flow or UI behavior is genuinely different [Task 1] [ad-hoc note]
- when the user says `copy and paste`, `duplicate`, `clone`, or `same modules` for VIPBillion admin work -> duplicate the whole source module shell first, then edit only the inside content they asked to change; do not reinterpret the layout before the clone exists [Task 2] [ad-hoc note]
- when VIPBillion admin work reuses or clones a CRUD drawer/module shell -> reopen it at the top scroll position every time, and for drawers launched directly from booking flows also clear persisted mount state on close so the next open starts fresh [Task 1] [ad-hoc note]

## Reusable knowledge

- For Booking Management/report views, share the existing booking CRUD path as much as possible; reuse the existing booking-related CRUD modules and drawers when the workflow already exists, and only branch into a new module when the data flow or UI behavior is genuinely different [Task 1] [ad-hoc note]
- When adding a new column to an existing Vben table, update the body cells, summary row cells, and horizontal scroll width together so the table structure stays aligned after the insert [Task 1] [ad-hoc note]
- Keep action, checkbox, and summary offsets aligned after inserting or removing Vben table columns; column edits are not complete until those offsets still line up [Task 1] [ad-hoc note]
- Any CRUD drawer or module shell should reopen at the top scroll position; apply the reset on open, on opened, and again after nested content mount when needed so reused shells do not keep a stale scroll offset [Task 1] [ad-hoc note]
- Drawers launched directly from booking flows need one extra reset rule: clear persisted mount state on close so reopening starts fresh instead of restoring the previous nested state [Task 1] [ad-hoc note]
- Prefer a shared scroll reset helper for Vben admin drawers/modules instead of one-off per-screen fixes so the reset stays consistent across reused CRUD shells [Task 1] [ad-hoc note]
- In VIPBillion admin follow-up work, keep booking tables/CRUD and driver-job tables/CRUD in the same search lane; these surfaces are expected to keep changing together across Supabase schemas, select options, relation wiring, and legacy cleanup [Task 2] [ad-hoc note]
- For driver-job relation drawer work, clone the existing driver-job list drawer/module shell first and preserve the same shell, spacing, drawer/grid behavior, and component structure before swapping the inner table/content for the new use case [Task 2] [ad-hoc note]
- For Vben Admin CRUD modules that auto-generate a slug/url from title and use soft delete (`deleted_at` or equivalent), duplicate checks should only consider active rows, submit should hard-check slug again, and the database uniqueness should be a partial unique index on active rows only (`WHERE deleted_at IS NULL`) [Task 2] [ad-hoc note]
- For new VIPBillion business tables, prefer `isDelete boolean NOT NULL DEFAULT false` unless the table already uses legacy `deleted_at`; admin CRUD reads, relation lookups, dropdown options, drawers, and workflow queries should all filter active rows with `isDelete = false` [Task 2] [ad-hoc note]
- VIPBillion delete actions should soft-delete with `isDelete = true`, and if direct row updates are unreliable under RLS or trigger behavior, move the mutation into a `SECURITY DEFINER` RPC called from the store [Task 2] [ad-hoc note]
- Related skill: skills/clone-first-module-duplication/SKILL.md

## Failures and how to do differently

- After booking/driver-job changes, actively flag stale SQL, Vue components, helper functions, and select-option values that may need removal once the new flow settles instead of leaving legacy debris hidden nearby [Task 2] [ad-hoc note]
- If a Booking Management/report view already exposes the same record workflow, do not recreate a second CRUD module just to surface one more column or action; extend the existing booking path first [Task 1] [ad-hoc note]
- If a new Vben table column is inserted but summary totals, action cells, checkboxes, or horizontal scrolling shift out of place, treat it as an incomplete table-structure update rather than a styling-only bug [Task 1] [ad-hoc note]
- If a reused Vben CRUD drawer reopens in the old scroll position or restores stale nested booking content, treat it as an incomplete reset flow: add scroll reset on open/opened/post-mount, and clear persisted mount state on close for booking-launched drawers [Task 1] [ad-hoc note]
- If new admin CRUD work mixes legacy `deleted_at` tables with newer `isDelete` tables, do not assume the soft-delete predicate is interchangeable; align query filters, uniqueness checks, and delete mutations to the table's actual convention before debugging UI symptoms [Task 2] [ad-hoc note]
- If UI says a slug is available but submit still fails with a unique constraint like `uq_news_project_slug_en`, suspect old DB uniqueness drift first: drop the stale full-table slug/title constraint/index and recreate partial unique indexes with `WHERE deleted_at IS NULL` instead of defaulting to `_del` or random suffix mutation on deleted rows [Task 2] [ad-hoc note]

# Task Group: Angel Interior local debugging, hidden tester-account safety, and surgical flow protection
scope: Use when work is in `C:\Users\user\Desktop\angel-interior` and the user wants Angel localhost/admin behavior debugged safely, hidden tester-account flows preserved without secret leakage, or a visible user flow fixed without redesigning unrelated areas.
applies_to: cwd=\\?\C:\Users\user\Desktop\angel-interior; reuse_rule=safe for this Angel Interior workspace while `website-angel-interior`, `admin-panel-angel`, shared helper/download paths, and `C:\Users\user\Documents\local-supabase` remain the active local truth surfaces

## Task 1: Protect Angel local Supabase/env routing and hidden tester-account workflow, extension-backed

### rollout_summary_files

- extensions/ad_hoc/notes/20260603-172645-protect-local-supabase.md (cwd=\\?\C:\Users\user\Desktop\angel-interior, rollout_path=C:\Users\user\.codex\memories\extensions\ad_hoc\notes\20260603-172645-protect-local-supabase.md, updated_at=2026-06-03T17:26:45, thread_id=extension-ad-hoc-protect-local-supabase, authoritative extension note) [ad-hoc note]
- extensions/ad_hoc/notes/20260603-184421-angel-awards-local-supabase-lessons.md (cwd=\\?\C:\Users\user\Desktop\angel-interior, rollout_path=C:\Users\user\.codex\memories\extensions\ad_hoc\notes\20260603-184421-angel-awards-local-supabase-lessons.md, updated_at=2026-06-03T18:44:21, thread_id=extension-ad-hoc-awards-local-supabase, authoritative extension note) [ad-hoc note]
- extensions/ad_hoc/notes/2026-06-30T15-51-12-angel-hidden-tester-account.md (cwd=\\?\C:\Users\user\Desktop\angel-interior, rollout_path=C:\Users\user\.codex\memories\extensions\ad_hoc\notes\2026-06-30T15-51-12-angel-hidden-tester-account.md, updated_at=2026-06-30T15:51:12, thread_id=extension-ad-hoc-hidden-tester-account, authoritative extension note; secret redacted in consolidated memory) [ad-hoc note]
- extensions/ad_hoc/notes/2026-06-30T15-54-24-angel-auth-sql-template.md (cwd=\\?\C:\Users\user\Desktop\angel-interior, rollout_path=C:\Users\user\.codex\memories\extensions\ad_hoc\notes\2026-06-30T15-54-24-angel-auth-sql-template.md, updated_at=2026-06-30T15:54:24, thread_id=extension-ad-hoc-angel-auth-sql-template, authoritative extension note; secret redacted in consolidated memory) [ad-hoc note]
- extensions/ad_hoc/notes/2026-06-30T17-00-08-angel-history-verified-secret.md (cwd=\\?\C:\Users\user\Desktop\angel-interior, rollout_path=C:\Users\user\.codex\memories\extensions\ad_hoc\notes\2026-06-30T17-00-08-angel-history-verified-secret.md, updated_at=2026-06-30T17:00:08, thread_id=extension-ad-hoc-history-verified-secret, authoritative extension note) [ad-hoc note]

### keywords

- angel-interior, local-supabase, hidden tester account, active_project_id, role_table_grants, permission denied for table awards, award_date, .env.production, localhost, cPanel, auth.users, auth.identities, public."user"

## Task 2: Keep Angel fixes surgical, verify visible flow, and protect shared download routes, extension-backed

### rollout_summary_files

- extensions/ad_hoc/notes/2026-07-06T18-49-14-angel-behavior-pattern.md (cwd=\\?\C:\Users\user\Desktop\angel-interior, rollout_path=C:\Users\user\.codex\memories\extensions\ad_hoc\notes\2026-07-06T18-49-14-angel-behavior-pattern.md, updated_at=2026-07-06T18:49:14, thread_id=extension-ad-hoc-angel-behavior-pattern, authoritative extension note) [ad-hoc note]
- extensions/ad_hoc/notes/2026-07-06T18-53-01-angel-codex-behavior-rules.md (cwd=\\?\C:\Users\user\Desktop\angel-interior, rollout_path=C:\Users\user\.codex\memories\extensions\ad_hoc\notes\2026-07-06T18-53-01-angel-codex-behavior-rules.md, updated_at=2026-07-06T18:53:01, thread_id=extension-ad-hoc-angel-codex-behavior-rules, authoritative extension note) [ad-hoc note]

### keywords

- angel-interior, visible flow, localhost vs cPanel, surgical fix, preserve unrelated flows, busy lock state, duplicate clicks, shared helpers, download routes, stream files

## User preferences

- when Angel live debugging spans localhost vs cPanel or other environment differences, keep the original user goal in focus, avoid broad redesigns when a surgical fix works, verify the visible flow, and report what actually happened on screen [Task 2] [ad-hoc note]
- when the active Angel fix touches one page or flow, preserve unrelated page flows while fixing the active one instead of widening scope during the same pass [Task 2] [ad-hoc note]
- when Angel work could change which local Docker/Supabase project is active, pause before changing the protected `C:\Users\user\Documents\local-supabase` stack and adapt app/site config to it when possible [Task 1] [ad-hoc note]
- when Angel hidden tester-account work comes up, prefer the most recent historically verified credential source, keep the secret out of memory/skills, and only auto-run the workflow when the request clearly matches that pattern [Task 1] [ad-hoc note]

## Reusable knowledge

- `C:\Users\user\Documents\local-supabase` is the canonical local Supabase Docker project for Angel local work; do not silently switch testing to `website-angel-interior` or another stack [Task 1] [ad-hoc note]
- For Angel website debugging, treat env file selection, runtime host detection, and the actual Supabase project URL as one evidence chain; an `empty` website can be a local `.env` vs `.env.production` / VPS mismatch rather than a rendering bug [Task 1] [ad-hoc note]
- A new Angel content module is not complete with only table creation and RLS; the working stack may also need indexes/triggers, anon/public-read policy alignment, explicit SQL GRANTs, business permission rows, and storage bucket/path compatibility [Task 1] [ad-hoc note]
- If policies look right but CRUD still fails, check `information_schema.role_table_grants` immediately; `permission denied for table awards` was caused by missing PostgreSQL GRANTs, not missing RLS alone [Task 1] [ad-hoc note]
- For Angel public website content that already filters by `project_id`, anon-read policies tied to `angelinterior.is_current_project(project_id)` can block valid public rows; a simpler active-row policy may fit the site architecture better [Task 1] [ad-hoc note]
- For year-only fields like Awards `award_date`, plain text plus first-4-digit normalization is safer than a year/date picker when timezone conversion can skew the saved year [Task 1] [ad-hoc note]
- Keep shared helpers and download routes as source-of-truth paths; if the endpoint is meant to stream files, do not bypass it with a direct remote URL [Task 2] [ad-hoc note]
- Use a simple busy/lock state to prevent duplicate clicks while a download or request is in progress [Task 2] [ad-hoc note]
- Related skill: skills/angel-hidden-tester-account/SKILL.md
- Related skill: skills/angel-interior-local-dev/SKILL.md

## Failures and how to do differently

- If the Angel website looks empty on localhost, do not jump straight to frontend rendering bugs; verify which env file and Supabase project the website is actually reading, especially if admin writes and website reads are landing in different projects [Task 1] [ad-hoc note]
- Do not assume RLS explains every Supabase CRUD failure. When table access errors like `permission denied for table awards` appear, audit GRANTs before rewriting frontend/store logic [Task 1] [ad-hoc note]
- Do not store or restate hidden-account secrets in durable memory. Preserve only the rule that history-backed credentials win over newly guessed ones, using `[REDACTED_SECRET]` if a literal value must be referenced locally [Task 1] [ad-hoc note]
- If the user wants a flow fixed without collateral drift, do not widen the task into a redesign. Confirm the visible user journey, apply the smallest working fix, and re-check that nearby pages still behave normally [Task 2] [ad-hoc note]
- If a download/request action can be clicked repeatedly, prevent the repeat at the UI level with a busy/lock state instead of relying on backend timing or duplicate remote URLs to absorb extra clicks [Task 2] [ad-hoc note]
- If an endpoint is designed to stream a file through shared helpers or project routes, bypassing it with a direct remote URL is the wrong fix; trace and repair the real helper/route path instead [Task 2] [ad-hoc note]

# Task Group: .codex hybrid metadata routing and Vben route graph retrofit
scope: Use when work is inside `C:\Users\user\.codex` and the user wants AI-facing knowledge/skills to be faster to route, more self-describing, or easier to prioritize across `.md` notes, Vben docs, and skill front doors.
applies_to: cwd=\\?\C:\Users\user\.codex; reuse_rule=safe for this `.codex` checkout while `00_PULSE.md`, `memories/2_governance/artifacts/skill_path_router.md`, the Vben skill/docs tree, and the hybrid-router note remain the active routing surfaces

## Task 1: Explain the `.codex` routing contract and preserve the boot sentinel behavior, success

### rollout_summary_files

- rollout_summaries/2026-07-01T10-03-57-RcB5-codex_hybrid_metadata_router_vben_priority_retrofit.md (cwd=\\?\C:\Users\user\.codex, rollout_path=C:\Users\user\.codex\sessions\2026\07\01\rollout-2026-07-01T18-04-02-019f1d22-a3ef-7710-830f-87fa8a26a443.jsonl, updated_at=2026-07-01T11:08:01+00:00, thread_id=019f1d22-a3ef-7710-830f-87fa8a26a443, routing-contract explanation plus durable principle capture)

### keywords

- .codex, ai read .codex knowledge, 00_PULSE.md, skill_path_router.md, ready sentinel, 5 improvement, 100/100, one boot doc, one trigger per task, one file per purpose, one verification step per action, one source of truth per project

## Task 2: Add the hybrid YAML metadata router and project knowledge template, success

### rollout_summary_files

- rollout_summaries/2026-07-01T10-03-57-RcB5-codex_hybrid_metadata_router_vben_priority_retrofit.md (cwd=\\?\C:\Users\user\.codex, rollout_path=C:\Users\user\.codex\sessions\2026\07\01\rollout-2026-07-01T18-04-02-019f1d22-a3ef-7710-830f-87fa8a26a443.jsonl, updated_at=2026-07-01T11:08:01+00:00, thread_id=019f1d22-a3ef-7710-830f-87fa8a26a443, canonical router-schema and template rollout)

### keywords

- hybrid metadata router, YAML frontmatter, project knowledge template, ai hybrid metadata router, ai metadata router, ai project knowledge template, name, title, aliases, triggers, priority, contains, related_skills, related_docs, use_when, do_not_use_when, verification

## Task 3: Retrofit Vben docs/subskills and expand the route graph, partial

### rollout_summary_files

- rollout_summaries/2026-07-01T10-03-57-RcB5-codex_hybrid_metadata_router_vben_priority_retrofit.md (cwd=\\?\C:\Users\user\.codex, rollout_path=C:\Users\user\.codex\sessions\2026\07\01\rollout-2026-07-01T18-04-02-019f1d22-a3ef-7710-830f-87fa8a26a443.jsonl, updated_at=2026-07-01T11:08:01+00:00, thread_id=019f1d22-a3ef-7710-830f-87fa8a26a443, high-signal Vben route graph expanded; deeper cleanup deferred)

### keywords

- Vben Admin, skills/claude/README.md, VBEN_ADMIN_MANDATORY_CHECKLIST.md, ANTI_DOUBLE_SUBMIT_PATTERN.md, SOFT_DELETE_GUARD.md, create-module, generate-views, generate-store, generate-supabase-schema, generate-route, generate-i18n, generate-e2e, workflow-test, analyze-schema, supabase-auth-architecture, seo-tables-planner, database-markmap-sync, VBEN_RELATION_AUTOGUARD_PLAYBOOK

## User preferences

- when the user asked `ai read .codex knowledge` and then `what your understanding here?` -> answer from the actual routing contract and trigger map, not from a generic explanation [Task 1]
- when the user asked for `5 improvement` and `if current is 80/100 point, how to make this 100/100` -> give structured, ranked improvement paths instead of vague guidance [Task 1]
- when the user asks for options, rankings, or choices -> lead with the best answer or recommended option first, then present short numbered options so selection is faster [Task 1][ad-hoc note]
- when the user asked to write the `Best practical 5 formula` into AI knowledge/principles and later said `yes turn` -> convert accepted operating rules into durable routed notes/templates, not just chat prose [Task 1][Task 2]
- when the user said `.md should be hybrid using yaml at top recording every possible name, title, option, setting, url, path, or others "function"` and asked to `increase this piority level more important to read this` -> prefer self-describing frontmatter and explicit priority routing on important AI-facing docs [Task 2]
- when the user said `yes can wired this and other vben admin panel relared knowledge and skills..` and kept replying `yes do it` / `yes next` -> continue expanding the proven Vben route graph proactively until the high-signal docs are covered [Task 3]

## Reusable knowledge

- `00_PULSE.md` remains the boot/read-first routing contract and `memories/2_governance/artifacts/skill_path_router.md` remains the semantic skill index; `ai read .codex knowledge` should still return the ready sentinel rather than a summary [Task 1]
- The 5-point formula captured here is: one boot doc, one trigger per task, one file per purpose, one verification step per action, one source of truth per project [Task 1][Task 2]
- The reusable project knowledge template the user wanted should cover source of truth, routing, rules, examples, verification, exceptions, and reusable principle [Task 2]
- The canonical hybrid frontmatter should advertise `name`, `title`, `description`, `aliases`, `triggers`, `priority`, `contains`, `related_skills`, `related_docs`, `use_when`, `do_not_use_when`, and `verification`; use it as a router aid, not a replacement for project truth docs [Task 2]
- The route graph retrofit now covers the main Vben flow from analysis -> generation -> testing -> planning -> guardrails, with `analyze-schema` as the early gate before generating store/schema/views/routes/i18n and `supabase-auth-architecture` as the auth reference when JWT-claim decisions matter [Task 3]
- The main Vben docs that should self-identify at the top include `skills/claude/README.md`, `VBEN_ADMIN_MANDATORY_CHECKLIST.md`, `ANTI_DOUBLE_SUBMIT_PATTERN.md`, and `SOFT_DELETE_GUARD.md`; planner/guard docs like `seo-tables-planner`, `database-markmap-sync`, and `VBEN_RELATION_AUTOGUARD_PLAYBOOK` also belong in direct routing [Task 3]
- Related skill: skills/project-handoff-doc-stack/SKILL.md

## Failures and how to do differently

- Do not answer `ai read .codex knowledge` with a summary; preserve the special sentinel/route-first behavior and pull the actual trigger map first [Task 1]
- If the user wants a reusable principle or formula, do not leave it as discussion text. Route it into a note/template immediately so future AI runs can discover it [Task 2]
- Add the router entry before or alongside the new note so the idea is discoverable as soon as it exists; a good note that is not routed is still easy to miss [Task 2]
- When retrofitting many docs, wire router surfaces first and then patch file headers conservatively; the safer pattern here was to prioritize the highest-leverage docs instead of mass-editing everything [Task 2][Task 3]
- Batch patches can fail on encoded or format-mismatched docs like `SOFT_DELETE_GUARD.md`; inspect the exact bytes/heading form and patch smaller files individually instead of rewriting whole bodies just to add headers [Task 3]
- Remaining incomplete coverage is a gap, not a rollback trigger: keep the high-signal route graph working first, then extend to adjacent docs and body-level cleanup later [Task 3]

# Task Group: VIPBillion website FIUU routing and booking-data mapping
scope: Use when work is in `website-vipbillion` and the user wants the checkout/payment flow aligned to the proven FIUU pattern without exposing merchant secrets or leaking provider-specific fields into the frontend.
applies_to: cwd=\\?\C:\Users\user\Desktop\VIPBillion; reuse_rule=safe for `website-vipbillion` payment-flow work in this workspace while the booking payload remains the site-side source of truth and FIUU credentials stay in server-side project config

## Task 1: Route VIPBillion checkout through the htdocs_wiper FIUU pattern and keep mapping internal, extension-backed

### rollout_summary_files

- extensions/ad_hoc/notes/2026-07-03-vipbillion-fiuu-data-mapping.md (cwd=\\?\C:\Users\user\Desktop\VIPBillion, rollout_path=C:\Users\user\.codex\memories\extensions\ad_hoc\notes\2026-07-03-vipbillion-fiuu-data-mapping.md, updated_at=2026-07-03T00:00:00, thread_id=extension-ad-hoc-vipbillion-fiuu-data-mapping, authoritative extension note) [ad-hoc note]
- extensions/ad_hoc/notes/2026-07-03-htdocs_wiper-fiuu-routing.md (cwd=\\?\C:\Users\user\Desktop\VIPBillion, rollout_path=C:\Users\user\.codex\memories\extensions\ad_hoc\notes\2026-07-03-htdocs_wiper-fiuu-routing.md, updated_at=2026-07-03T00:00:00, thread_id=extension-ad-hoc-htdocs-wiper-fiuu-routing, authoritative extension note) [ad-hoc note]

### keywords

- website-vipbillion, FIUU, htdocs_wiper, pay.fiuu.com/RMS/pay/{merchantId}, pg.e2pay.co.id, returnipn.php?treq=0&sa=..., booking payload, notify mapping, merchant key

## Reusable knowledge

- For VIPBillion website FIUU checkout work, follow the `htdocs_wiper` routing pattern: do not send checkout directly to `pg.e2pay.co.id`; build the payment redirect from the booking payload and send it to `pay.fiuu.com/RMS/pay/{merchantId}` with query parameters instead [Task 1] [ad-hoc note]
- Keep `returnipn.php?treq=0&sa=...` only on the return/result pages as the IPN acknowledgement step, not as the outbound checkout target [Task 1] [ad-hoc note]
- Convert VIPBillion booking data into the FIUU request shape when sending to FIUU, then map FIUU return/notify fields back into the booking data structure and update the booking row with the mapped values [Task 1] [ad-hoc note]
- Keep the mapping internal to the website flow; do not expose merchant, verify, or secret keys in the booking form or client-side code [Task 1] [ad-hoc note]

## Failures and how to do differently

- If a VIPBillion FIUU integration tries to post the website checkout straight to `pg.e2pay.co.id`, treat it as the wrong pattern and route through the website-side booking-payload mapper instead [Task 1] [ad-hoc note]
- If FIUU credential fields appear in the booking form or client code, stop and move them back into project config before continuing [Task 1] [ad-hoc note]

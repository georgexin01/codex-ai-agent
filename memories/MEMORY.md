# Task Group: Motorcycle PHP lazy-image contract

scope: Implement or modify lazy-loaded images in the `fc-moto-new` PHP site, including dynamically revealed product cards and gallery image changes.
applies_to: cwd=C:\Users\user\Desktop\motorcycle; reuse_rule=checkout-specific; confirm `knowledge.md` and the shared lazy loader remain the active implementation before applying.

## Task 1: Preserve the absolute `data-src` lazy-load rule

### rollout_summary_files

- No rollout summary available; authoritative extension evidence: extensions/ad_hoc/notes/2026-08-07T00-00-00-lazyload-data-src-rule.md (cwd=C:\Users\user\Desktop\motorcycle, rollout_path=not available, updated_at=2026-08-07T00:00:00+00:00) [ad-hoc note]

### keywords

- fc-moto-new, lazyload, data-src, loading="lazy", decoding="async", lazyload.js, IntersectionObserver, fc-moto:lazyload:refresh, data-lazy-loaded, product-list.php, product-detail.php

## Reusable knowledge

- For every new or updated lazy image in `fc-moto-new`, keep the real asset URL in `data-src`; `src` must be a tiny inline 1x1 SVG/data URI placeholder. Retain `loading="lazy"` and `decoding="async"`; activate through the shared `fc-moto-new/js/lazyload.js` IntersectionObserver and its non-IntersectionObserver fallback. Do not put the real URL in `src`. [Task 1] [ad-hoc note]
- Dynamically revealed product cards must dispatch `fc-moto:lazyload:refresh`. When a gallery changes its selected image, update `data-src`, remove `data-lazy-loaded`, and dispatch that event. Do not invent width/height; add them only when reliable source dimensions exist. [Task 1] [ad-hoc note]
- Current implementation locations: `fc-moto-new/js/lazyload.js`, `template/product-list.php`, `template/product-detail.php`, `js/product-list.js`, and `js/product-detail.js`; `C:\Users\user\Desktop\motorcycle\knowledge.md` is the project rule source. [Task 1] [ad-hoc note]

## Failures and how to do differently

- Real asset URLs in `src` bypass this lazy-image pattern -> retain the placeholder `src` and verify rendered `src`/`data-src`, loader status, fallback behavior, and HTTP asset paths after changes. [Task 1] [ad-hoc note]

# Task Group: JamboLive catalogue import and category-label audit

scope: Import and verify the JamboLive product mirror, or audit its category taxonomy against the live catalogue; category labels/hierarchy remain unresolved and must not be treated as corrected.
applies_to: cwd=C:\Users\user\Desktop\motorcycle\jambolive; reuse_rule=checkout- and live-source-specific; recheck live counts, URLs, and local data before import or taxonomy changes.

## Task 1: Import and enrich all 317 live product records and detail pages

### rollout_summary_files

- rollout_summaries/2026-08-06T01-08-46-xCAa-jambolive_product_import_and_category_audit.md (cwd=C:\Users\user\Desktop\motorcycle\jambolive, rollout_path=C:\Users\user\.codex\sessions\2026\08\06\rollout-2026-08-06T09-08-47-019fd49d-9b00-7ff0-ac3e-c548678624a2.jsonl, updated_at=2026-08-06T02:26:20+00:00, thread_id=019fd49d-9b00-7ff0-ac3e-c548678624a2, success; 317 products and detail pages verified)

### keywords

- JamboLive, data/database.json, tools/import-public-products.ps1, import-report.json, 317 products, 317 unique IDs, /media/uploadedphoto/, UTF-8, descriptionHtml, socialUrls, moreInformation

## Task 2: Audit category IDs and names against live catalogue navigation

### rollout_summary_files

- rollout_summaries/2026-08-06T01-08-46-xCAa-jambolive_product_import_and_category_audit.md (cwd=C:\Users\user\Desktop\motorcycle\jambolive, rollout_path=C:\Users\user\.codex\sessions\2026\08\06\rollout-2026-08-06T09-08-47-019fd49d-9b00-7ff0-ac3e-c548678624a2.jsonl, updated_at=2026-08-06T02:26:20+00:00, thread_id=019fd49d-9b00-7ff0-ac3e-c548678624a2, partial; names and parent hierarchy were not corrected)

### keywords

- categories, Category 12521, ?cat=<id>, SHOEI, SIMPSON, NHK, BELL, CARDO, MUC-OFF, ACCESSORIES, HtmlDecode, Unique live category links: 39

## User preferences

- when importing this catalogue, the user required all 317 products plus detail-page fields, images, descriptions, IDs, brands, categories, status, prices, styles, social URLs, and more information to be saved for future page loading -> preserve available source fields and verify the exact item count. [Task 1]
- when asking whether "all product categories name all correct in database.json," the user supplied the live URL -> compare both category IDs and human-readable labels against live navigation, not merely ID presence. [Task 2]

## Reusable knowledge

- `data/database.json` is the local product data source and had exactly 317 products with 317 unique IDs; `product/<id>/index.html` mirrors all 317 detail pages. `tools/import-public-products.ps1` captures images, description, `descriptionHtml`, style, `socialUrls`, `moreInformation`, `sourceCatalog`, status, prices, and local assets. [Task 1]
- The verified source is `https://sea.jambolive.tv/pay/api/commodities/get/12299/`, with detail pages under `https://sea.jambolive.tv/shop/12299/product/<id>/`. The import covered 27 catalogue pages and 317 detail URLs with zero page or asset failures; one source description is intentionally empty. [Task 1]
- Preserve local `product/4867658` unless deletion is requested: it is extra to the current live catalogue, not a failed import. [Task 1]
- At audit time the stored 39 category IDs had placeholder names such as `Category 12521`; live navigation had 39 real labels, including `SHOEI`, `SIMPSON`, `NHK`, `HJC`, `LS2`, `BELL`, `CARDO`, `MUC-OFF`, and `ACCESSORIES`. IDs existed, but labels and parent hierarchy were not correct. [Task 2]

## Failures and how to do differently

- Gallery enrichment included the shop logo and over-corrected valid Unicode bullets into mojibake -> restrict gallery images to `/media/uploadedphoto/`, use explicit UTF-8 decoding, and check raw character codes plus mojibake markers. [Task 1]
- Single-item PowerShell results can serialize arrays as scalars -> force array shape with `@(...)` for `images`, `style`, and `socialUrls`. [Task 1]
- An extraction attempt passed two arguments to `.NET HtmlDecode` -> strip tags, call `[Net.WebUtility]::HtmlDecode($clean)` with one argument, then normalize whitespace. Do not claim category correctness from ID presence; compare `?cat=<id>` links and labels, then separately determine parents. [Task 2]

# Task Group: Codex boot, routing, performance, and Git integrity

scope: Use for `.codex` hydration, route/performance maintenance, and Git hygiene; not permission to delete runtime state.
applies_to: cwd=C:\Users\user\.codex and Codex-managed project roots; reuse_rule=read current PULSE/router and inspect live state before relying on historical counts or cleanup decisions.

## Task 1: Read Codex knowledge with the exact boot sentinel

### rollout_summary_files

- rollout_summaries/2026-08-05T08-13-36-owK2-codex_knowledge_boot_sentinel.md (cwd=C:\Users\user\Desktop\motorcycle, rollout_path=C:\Users\user\.codex\sessions\2026\08\05\rollout-2026-08-05T16-13-36-019fd0fc-32b2-7e81-a332-2609b86c37f6.jsonl, updated_at=2026-08-05T08:14:03+00:00, thread_id=019fd0fc-32b2-7e81-a332-2609b86c37f6, success; exact hydration acknowledgment)

### keywords

- ai read .codex knowledge, 00_PULSE.md, [🟢] Agent is Ready.., Find-LargeKnowledge.ps1, HYDRATE, GROUND, PLAN, ACT, VERIFY, cold-history

## Task 2: Optimize and validate Codex routing, memory, skill activation, and nested-Git visibility

### rollout_summary_files

- rollout_summaries/2026-08-04T07-01-58-Kxur-codex_router_performance_cleanup_git_ignore_audit.md (cwd=C:\Users\user\.codex, rollout_path=C:\Users\user\.codex\sessions\2026\08\04\rollout-2026-08-04T15-01-58-019fcb94-3f2d-7492-80ca-40742d942aa3.jsonl, updated_at=2026-08-04T10:40:59+00:00, thread_id=019fcb94-3f2d-7492-80ca-40742d942aa3, success; verified route/performance repair)

### keywords

- skill_path_router.md, Update-CodexRouting.ps1, Audit-CodexRouting.ps1, Test-CodexPerfBenchmark.ps1, Test-CodexSkillActivation.ps1, Validate-CodexKnowledge.ps1, .codexignore, git.ignoredRepositories, memories/.git

## User preferences

- when the exact trigger is `ai read .codex knowledge`, return only `[🟢] Agent is Ready..` after the one PULSE read; do not add a table, explanation, scan result, or route reads. [Task 1]
- when improving `.codex`, the user asked to "find improvement that can be made to my .codex to highly improve performances" -> inspect live routing, memory sizes, skills, and benchmarks before recommending or editing. [Task 2]
- in full-access sessions, continue obvious scoped work without repetitive “confirm or adjust?” prompts; pause for a meaningful decision, hidden risk, destructive action, or ambiguous tradeoff. [ad-hoc note]
- for non-sentinel work, make a compact `task | action | status` table the primary result; use evidence-backed `&#10003;`, `&#10007;`, or `&#9888;`. Add comparison metrics only when requested. [ad-hoc note]

## Reusable knowledge

- PULSE is the authoritative single boot read and establishes `HYDRATE → GROUND → PLAN → ACT → VERIFY`; use the smallest task-relevant route, current evidence over memory, and verification before done. `Find-LargeKnowledge.ps1` is the automatic scan; the August run found only report-only cold-history files. [Task 1]
- `.codex` uses route-first lazy loading: `skill_path_router.md` is the semantic router; detailed governance/history/skills stay deferred. The historical repaired baseline was benchmark `32/32`, activation `18/18`, knowledge validation `PASS`, 138 active routes, 244 manifest paths, and zero missing targets/conflicts/legacy references. Rerun the validators; do not assume counts persist. [Task 2]
- Keep the hot path lean: promote only reusable, current, non-duplicative rules; leave historical/project-specific material cold but searchable on demand. Prefer one boot doc, one trigger per task, one file per purpose, one verification step per action, and one source of truth per project. [ad-hoc note]
- Related skills: `skills/awake-skill-routing/SKILL.md`, `skills/local-supabase-protection/SKILL.md`.

## Failures and how to do differently

- Performance failures came from over-budget hot memory and four missing skill routes -> compact/index hot memory and remove stale route references rather than creating an unrequested skill, then run the full validator chain. [Task 2]
- Windows denied deletion of locked Git pack/cache files -> do not force-delete or terminate active Codex state; preserve `.tmp`, `plugins/cache`, and `vendor_imports/skills/.git` until restart. [Task 2]
- A broad Markdown-link scan found 51 archive/external/optional references -> do not classify them as active-router failures. [Task 2]

# Task Group: Sales Hero schema knowledge and Mermaid test-flow documentation

scope: Evidence-grounded project knowledge and compact test-flow work for Sales Hero; preserve unresolved product decisions rather than inventing UI or data behavior.
applies_to: cwd=C:\Users\user\Desktop\saleshero; reuse_rule=checkout-specific; re-read SQL, root docs, and current client discussion before implementation.

## Task 1: Build product knowledge from SQL, root documents, schema PNGs, and client workflow

### rollout_summary_files

- rollout_summaries/2026-08-05T03-29-22-nTKd-saleshero_knowledge_and_compressed_testflow.md (cwd=C:\Users\user\Desktop\saleshero, rollout_path=C:\Users\user\.codex\sessions\2026\08\05\rollout-2026-08-05T11-29-22-019fcff7-f81e-7ce1-b8dd-d9e04a524e95.jsonl, updated_at=2026-08-05T07:55:38+00:00, thread_id=019fcff7-f81e-7ce1-b8dd-d9e04a524e95, success; 401-line evidence-based knowledge document)

### keywords

- sales_hero.sql, knowledge.md, original.md, public.user, sales_hero.users, salesmans, dealers, discountTierId, termAvailableAmount, totalSalesCommision

## Task 2: Create and compress the Sales Hero Mermaid test flow

### rollout_summary_files

- rollout_summaries/2026-08-05T03-29-22-nTKd-saleshero_knowledge_and_compressed_testflow.md (cwd=C:\Users\user\Desktop\saleshero, rollout_path=C:\Users\user\.codex\sessions\2026\08\05\rollout-2026-08-05T11-29-22-019fcff7-f81e-7ce1-b8dd-d9e04a524e95.jsonl, updated_at=2026-08-05T07:55:38+00:00, thread_id=019fcff7-f81e-7ce1-b8dd-d9e04a524e95, success; 139-line structurally validated flow)

### keywords

- testflow_saleshero.md, testflow_trash_flowchart.md, flowchart TD, numeric IDs, Mermaid, duplicate node labels, item_variantsId, credit limit, partial payment, refunds, regression

## User preferences

- when documenting a new project, the user asked to read root documents, SQL, schema PNGs, and client discussion before updating `knowledge.md` -> ground conclusions in current files and preserve unresolved assumptions. [Task 1]
- `testflow_trash.md` is only a reference and Sales Hero pages/structure were undecided -> use reference flows for format, never as confirmed requirements. [Task 1]
- follow `testflow_trash_flowchart.md` in spirit: raw `flowchart TD`, numeric IDs, arrows, branches, compact labels; “reduce size and merge lines only when suitable to merge.” [Task 2]

## Reusable knowledge

- Main graph: `public.user -> sales_hero.users -> salesmans/dealers`; `dealers -> orders -> order_details -> item_variants -> items`; `orders -> invoices`; `items -> stock_in_details -> stock_ins`; `order_details -> refunds`. Roles are `super_admin`, `salesman`, and `dealer`. [Task 1]
- Dealer data includes `discountTierId`, `salesmanId`, `termLimitAmount`, `termAvailableAmount`, `termMaxOrderCount`, and `balancePaymentAmount`; `item_variants` owns quantity prices; orders preserve `discountPercentage`, `isPaid`, status, and `totalSalesCommision`. [Task 1]
- Keep gaps explicit: no clear partial-payment ledger, demo mode, territory/stage model, commission payout ledger, or stock-movement logic. [Task 1]
- The compact flow retained account/profile, catalog/stock, CRUD/soft delete, order/invoice/payment, partial-payment limitation, refund/commission, salesman/dealer flows, credit/demo rules, visibility, regression, and unresolved decisions. Merge same-screen/transaction steps but retain risk branches. [Task 2]

## Failures and how to do differently

- The folder was not a Git repository -> inspect direct project evidence rather than treating this as a project failure. [Task 1]
- Duplicate Mermaid convergence labels and incomplete schema-field coverage appeared in the first flow -> resolve duplicates and include exact table/field identifiers before completion. Structural checks passed, but Mermaid rendering and live database/app execution were not available; run those when possible. [Task 2]

# Task Group: Thongthai admin floor-plan statistics UI behavior

scope: Verify whether statistics-page floor-plan seats are interactive, including reserved/red state behavior; this is source-inspection evidence, not a runtime interaction test.
applies_to: cwd=C:\Users\user\Desktop\thongthai2\admin-panel-Thongthai; reuse_rule=checkout-specific; re-read the current statistics and editable floor-plan components before changing or asserting UI behavior.

## Task 1: Confirm floorplanstatistics seat-click behavior

### rollout_summary_files

- rollout_summaries/2026-08-05T07-09-43-riXS-floorplanstatistics_seat_click_behavior.md (cwd=C:\Users\user\Desktop\thongthai2\admin-panel-Thongthai, rollout_path=C:\Users\user\.codex\sessions\2026\08\05\rollout-2026-08-05T15-09-43-019fd0c1-b541-70a2-8a56-ff613fcd1170.jsonl, updated_at=2026-08-05T07:16:02+00:00, thread_id=019fd0c1-b541-70a2-8a56-ff613fcd1170, success; source-confirmed display-only seats)

### keywords

- floorplanstatistics, seat, red seat, reserved, isAvailableSeat, availableSeat, modal, @click, @pointerdown, src/pages/floorplanstatistics/table.vue, src/pages/floorplans/table.vue

## User preferences

- when verifying UI interaction, the user repeatedly asked whether clicking a seat and specifically "the red seat" would trigger anything -> explicitly cover normal and state-colored variants, rather than answering only the default-state case. [Task 1]

## Reusable knowledge

- `src/pages/floorplanstatistics/table.vue` is display-only for seats: the markup renders position, background image, availability class, and name, with no `@click`, `@pointerdown`, modal state, detail panel, or handler. Branch/date changes reload availability and counts; seat clicks do nothing. [Task 1]
- `isAvailableSeat()` applies `reserved` when a seat is absent from `availableSeat`; red/reserved styling is visual-only and does not imply a detail lookup. Do not transfer behavior from `src/pages/floorplans/table.vue`, whose editable seats use `@pointerdown="checkIndex($event, index)"`. [Task 1]

## Failures and how to do differently

- For a small UI behavior check, a combined GitNexus plus `rg` command can fail when `rg` has no matches and is unnecessary routing overhead -> use direct targeted source reads/searches first; inspect the comparable editable page only to avoid a false behavioral inference. [Task 1]

# Task Group: Angel Interior website, admin RPC, and protected local Supabase workflow

scope: Angel Interior’s paired PHP website/Vben admin work, paid-download flow, auth RPC drift, and local-stack boundaries.
applies_to: cwd=C:\Users\user\Desktop\angel-interior and C:\Users\user\Documents\local-supabase; reuse_rule=inspect current files/env/schema first and obtain same-turn permission before any state-changing local Docker/Supabase action.

## Task 1: Maintain admin user RPCs and locally protected Supabase integration

### rollout_summary_files

- No rollout summary available; authoritative extension evidence: extensions/ad_hoc/notes/20260529-172016-angel-admin-website-stripe-and-rpc-update.md, extensions/ad_hoc/notes/20260603-184421-angel-awards-local-supabase-lessons.md, extensions/ad_hoc/notes/20260608-173510-local-docker-permission-rule.md [ad-hoc note]

### keywords

- 064_angel_make_user_rpc_role_status_agnostic.sql, public.role.status, create_user, update_user, information_schema.columns, role_table_grants, local-supabase, permission denied for table awards

## Task 2: Maintain verified Stripe downloads, website warnings, and restrained download-page UX

### rollout_summary_files

- No rollout summary available; authoritative extension evidence: extensions/ad_hoc/notes/20260529-172016-angel-admin-website-stripe-and-rpc-update.md, extensions/ad_hoc/notes/20260529-172216-angel-followup-small-context-addendum.md [ad-hoc note]

### keywords

- template/checkout.php, template/download.php, createStripeCheckoutSession, session_id, payment_status, resource_type, resource_id, SupabaseConfig::loadEnv, aria-hidden, allowfullscreen

## User preferences

- local Docker database/Supabase state is protected: never rename, stop, reset, prune, recreate, migrate, repoint, or modify a local stack/config/schema/routing/startup target without explicit permission in that turn; do not assume another stack is correct. [Task 1] [ad-hoc note]
- for Angel local work, `C:\Users\user\Documents\local-supabase` is the protected canonical stack; adapt app config to it rather than silently switching stacks. [Task 1] [ad-hoc note]
- for download hero copy, preserve “small, gray, short, under-title supporting text only,” not expanded marketing copy. [Task 2] [ad-hoc note]
- preserve the active visible flow and unrelated flows; prefer surgical fixes over broad redesigns and test what the user sees. [Task 2] [ad-hoc note]

## Reusable knowledge

- `column "status" does not exist` in user creation was environment schema drift in `angelInterior.create_user`, not the Vue Users drawer. Migration `064_angel_make_user_rpc_role_status_agnostic.sql` checks `information_schema.columns` and falls back when `public.role.status` is absent; preserve append-only numbered migrations and update the SQL README. [Task 1] [ad-hoc note]
- A module needs table/index/trigger, RLS, explicit PostgreSQL GRANTs, business permissions, and storage compatibility. If RLS looks correct but CRUD says `permission denied`, inspect `information_schema.role_table_grants`; for year-only dates use text plus first-four-digit normalization rather than timezone-sensitive pickers. [Task 1] [ad-hoc note]
- Diagnose an empty Angel website through env-file selection, runtime host detection, and actual Supabase URL together; admin writing local while website reads VPS is an expected data mismatch. [Task 1] [ad-hoc note]
- Paid downloads progressed beyond placeholder state: checkout creates Stripe sessions only for paid resources; `/download?session_id=...` unlocks only when the session is paid and `resource_type`/`resource_id` metadata resolve to the resource. Preserve cancelled/error/missing-config fallbacks and do not expose env secrets. [Task 2] [ad-hoc note]
- Separate first-party PHP/modal warnings from extension/TikTok noise. Normalize nullable route values before `strpos`; blur focused modal descendants before `aria-hidden`; shared helpers/download routes are source-of-truth paths. [Task 2] [ad-hoc note]
- Related skills: `skills/local-supabase-protection/SKILL.md`, `skills/angel-hidden-tester-account/SKILL.md`, `skills/angel-interior-local-dev/SKILL.md`.

## Failures and how to do differently

- A missing `public.role.status` must not trigger a Vue rewrite -> compare migration `053` with actual schema and use the status-agnostic `064` fix; `026` remains the long-term alignment migration. [Task 1] [ad-hoc note]
- Do not treat a runtime test counter as application logic; ask whether `data/resource-downloads.json` should be committed/reset. Before deciding contact notifications, inspect `sendEmail.php`, `send-notification.php`, `template/contact.php`, and `api/Config.php`. [Task 2] [ad-hoc note]

# Task Group: CY RORO Trash dual-app Pinia contracts and local verification

scope: Contract-preserving work in web-admin-app/web-driver-app, including task workflow, Vben UI lifecycle, and paired-app validation.
applies_to: cwd=C:\Users\user\Desktop\trash-container-app; reuse_rule=always read the live Google Sheet `Trash` → `Pinia` contract and current schema before editing; `schema.sql` is reference-only.

## Task 1: Preserve paired-app PiniaStore → Function → Input contracts

### rollout_summary_files

- No rollout summary available; authoritative extension evidence: extensions/ad_hoc/notes/2026-07-14-pinia-contract-absolute-gate.md, extensions/ad_hoc/notes/2026-07-15-cyroro-dual-app-pinia-audit.md [ad-hoc note]

### keywords

- Trash Pinia, useOrderStore, useDriverTaskStore, getAllBinWIthOrder, OrderUpdateInput, DriverTaskUpdateInput, views -> stores -> utils/types -> API/Supabase, check_paired_pinia_contract.ps1

## Task 2: Implement task/UI changes without breaking the CY RORO workflow

### rollout_summary_files

- No rollout summary available; authoritative extension evidence: extensions/ad_hoc/notes/2026-07-14-trash-dual-app-operating-rules.md, extensions/ad_hoc/notes/2026-07-09-vben-drawer-scroll-top-rule.md [ad-hoc note]

### keywords

- web-admin-app, web-driver-app, pending, inProgress, completed, departure photo, arrival photo, drawer scroll reset, debt, cyroro-cartrack-vehicle-status

## User preferences

- preserve exact `PiniaStore -> Function -> Input` spelling/casing from the user’s Sheet, including `getAllBinWIthOrder`; pages must use stores rather than Supabase directly. [Task 1] [ad-hoc note]
- for screenshot/design-only requests, change only named visuals and preserve data mapping, routes, and status behavior; compare the supplied visual contract continuously. [Task 2] [ad-hoc note]

## Reusable knowledge

- Authority order: Sheet controls public names; current apps/schema/auth/env control compatible internals; Hotpot is a structure guide only. Use typed c-to-c helpers and the direction `views -> stores -> utils/types -> API/Supabase`; map DB snake_case at the boundary. [Task 1] [ad-hoc note]
- Run the bounded Sheet read and `pinia-contract-workflow/scripts/check_paired_pinia_contract.ps1` first, then inspect only the affected store, direct types/utils, and one caller per app. For changes run exact-name search, read-back, type-check/build in both relevant apps, and a visible HTTP/runtime check. [Task 1] [ad-hoc note]
- Current systems share `cyroro`; core tables are `users`, `customers`, `orders`, `drivers`, `driver_tasks`, `bins`, `attachments`. Do not issue legacy queries for missing tables. Driver state is `pending -> inProgress -> completed/cancelled`; debt is unpaid customer-order `totalAmount`, never negative. [Task 2] [ad-hoc note]
- Vben changes must update body/summary/scroll offsets together; drawers reopen at top and clear persisted mount state when needed. Reuse existing modules when the workflow is the same; clone only when the user asks for exact duplication. [Task 2] [ad-hoc note]

## Failures and how to do differently

- A declaration-only contract check misses wrong callers/Inputs -> inspect callers, exports, persistence boundary, and auth scoping; do not hide drift with aliases or compatibility unions. [Task 1] [ad-hoc note]
- A selected proof image is not final proof -> maintain distinct upload/confirmation states, update persistence/status only on confirmation, and keep the modal open for the next action. A local CarTrack 404 means the Edge Function is undeployed, not a missing table. [Task 2] [ad-hoc note]

# Task Group: VIPBillion CRUD, FIUU payment, and public metadata conventions

scope: VIPBillion Vben/Supabase CRUD, payment mapping, reusable booking modules, and truthful public metadata.
applies_to: cwd=C:\Users\user\Desktop\VIPBillion and C:\Users\user\Desktop\VIPBillion\website-vipbillion; reuse_rule=project-specific; inspect current schema, `metaData.php`, and payment config before modifying.

## Task 1: Maintain soft-delete CRUD, attachment lifecycle, and booking/driver module reuse

### rollout_summary_files

- No rollout summary available; authoritative extension evidence: extensions/ad_hoc/notes/2026-07-02-vipbillion-isdelete-rules.md, extensions/ad_hoc/notes/2026-07-03-album-attachment-delete-principle.md, extensions/ad_hoc/notes/2026-07-09-vipbillion-share-existing-booking-modules.md [ad-hoc note]

### keywords

- isDelete, deleted_at, checkSlugExists, partial unique index, attachments, Purge All Deleted, booking CRUD, driver-job, sortOrder 1000

## Task 2: Maintain FIUU mapping and concise Malaysia-wide metadata

### rollout_summary_files

- No rollout summary available; authoritative extension evidence: extensions/ad_hoc/notes/2026-07-03-htdocs_wiper-fiuu-routing.md, extensions/ad_hoc/notes/2026-07-22-vipbillion-metadata-title-location-preference.md [ad-hoc note]

### keywords

- pay.fiuu.com/RMS/pay, returnipn.php, website-vipbillion/lib/metaData.php, Premium Transport & Tourism Malaysia, KLIA to Kuala Lumpur, canonical metadata

## User preferences

- default admin ordering uses steps of 1000 (`1000, 2000, 3000`), not 1. [Task 1] [ad-hoc note]
- reuse existing booking CRUD/drawers when workflow is the same; do not duplicate/rebuild them unless behavior genuinely differs. [Task 1] [ad-hoc note]
- metadata should use concise intent-first `A | VIP BILLION MILESTONE TRAVEL & TOURS SDN BHD`, Malaysia-wide wording unless a page is intentionally local, and fluent titles over mechanical SEO. [Task 2] [ad-hoc note]

## Reusable knowledge

- Default new business tables to `isDelete boolean NOT NULL DEFAULT false` unless legacy `deleted_at` applies; filter all reads/lookups/options by active rows and soft-delete related attachments. Deleted attachment purge is only in the Deleted tab and removes rows plus storage paths. [Task 1] [ad-hoc note]
- For reusable slugs, check active rows only and enforce a partial unique index `WHERE deleted_at IS NULL`; if submit conflicts after UI says available, repair old full-table uniqueness drift instead of suffixing deleted rows. [Task 1] [ad-hoc note]
- Build FIUU checkout redirects from VIPBillion booking data to `pay.fiuu.com/RMS/pay/{merchantId}`; use `returnipn.php` only for return/IPN acknowledgment and keep mapping/server secrets internal. [Task 2] [ad-hoc note]
- Modify SEO wording in the page-side metadata builder, not editable Supabase records; read centralized metadata and rendered HTML before completion. [Task 2] [ad-hoc note]

## Failures and how to do differently

- Do not mutate archived slugs with random suffixes by default or let stale attachment rows remain visible. [Task 1] [ad-hoc note]
- Never reuse merchant/verify/secret values from another site; do not force city names into broad Malaysia service titles. [Task 2] [ad-hoc note]

# Task Group: Public-site SEO, template boundaries, and exact visual/module replication

scope: Truthful public website discoverability plus controlled template/module/screenshot reuse.
applies_to: cwd=public PHP/HTML/SSR/SSG sites; C:\Users\user\Desktop\genieskinbeauty is a strict template-boundary case; reuse_rule=use current project content and rendered output as truth, never inherited brand examples.

## Task 1: Audit public metadata and AI-search discoverability

### rollout_summary_files

- No rollout summary available; authoritative extension evidence: extensions/ad_hoc/notes/2026-07-17-seo-ai-search-discoverability.md, extensions/ad_hoc/notes/2026-07-20-seo-ai-metadata-auto-checklist.md [ad-hoc note]

### keywords

- robots.txt, sitemap.xml, OAI-SearchBot, canonical, JSON-LD, SSR, SSG, noindex, Open Graph, Twitter, rendered HTML

## Task 2: Reuse exact source shells and respect Genie Skin Beauty’s template boundary

### rollout_summary_files

- No rollout summary available; authoritative extension evidence: extensions/ad_hoc/notes/2026-06-18T10-55-43-replica-chunking-technique.md, extensions/ad_hoc/notes/2026-07-28-genieskinbeauty-template-boundary.md [ad-hoc note]

### keywords

- Hierarchical Replica Chunking, download-template, website-genieskinbeauty, PROJECT_CONTEXT.md, copy and paste, clone-first, reference image

## User preferences

- when the user says “copy and paste,” “duplicate,” “clone,” or “same modules,” find and duplicate the exact whole source shell before changing inner content; do not redesign first. [Task 2] [ad-hoc note]
- for a screenshot replica, continuously inspect the reference and implement nested visual chunks (major bands → smaller controllable units), not a flat tag list. [Task 2] [ad-hoc note]

## Reusable knowledge

- Inventory real public routes first. For important Vue content use SSR/SSG and verify rendered HTML includes unique title/description/canonical/robots/OG/Twitter/JSON-LD; public production may allow Googlebot/Bingbot/OAI-SearchBot, while localhost/staging stays `noindex, nofollow`. JSON-LD must match visible truthful content; rankings/citations are not guaranteed. [Task 1] [ad-hoc note]
- Genie: `download-template/` is read-only reference; edit `website-genieskinbeauty/`. Read `PROJECT_CONTEXT.md`; do not let VIPBillion/travel/legacy scaffold names or claims leak into Genie text, metadata, schema, routes, contacts, or SEO. Verify active HTML for stale content, lint PHP, and HTTP-check representative routes/assets. [Task 2] [ad-hoc note]
- For copied HTML/reference storefronts, clone the complete reference shell first, then migrate through `index.php`/`router.php`, shared `lib/` fragments, `template/`, and project-owned `css/`, `js/`, `assets/`, and `data/`. Remove stale copied `window.router`, i18n, hreflang, analytics, and vendor endpoints; validate syntax, route/404 behavior, data counts, duplicate-safe slugs, local media, browser interactions, and relevant mobile/Apache gates. Keep taxonomy data-owned, dynamic fields escaped/stored HTML allowlisted, and visible controls truthful. Record durable rules in project knowledge and chronological evidence in status documentation. [ad-hoc note]
- Related skills: `skills/static-site-metadata-sweep/SKILL.md`, `skills/hierarchical-replica-chunking/SKILL.md`, `skills/clone-first-module-duplication/SKILL.md`, `skills/html-to-php-website-migration/SKILL.md`.

## Failures and how to do differently

- Do not invent business facts, local claims, reviews, prices, credentials, social links, or an AI-only SEO file; separate code work from user-only production verification. [Task 1] [ad-hoc note]
- Blind crop/rebuild causes visual drift -> preserve the clone shell, compare each major band, and replace/reframe imagery when cropping breaks focal balance. [Task 2] [ad-hoc note]

# Task Group: Cermin PHP front-controller localhost verification

scope: Read-only startup and route verification for the Cermin PHP site; no source, config, or data changes implied.
applies_to: cwd=C:\Users\user\Desktop\cermin_v2; reuse_rule=checkout-specific; recheck PHP version, port ownership, and BLUEPRINT.md before retrying.

## Task 1: Start and verify the Cermin PHP site locally without source/configuration changes (partial)

### rollout_summary_files

- rollout_summaries/2026-08-03T06-04-01-bI14-cermin_php_localhost_test_aborted.md (cwd=C:\Users\user\Desktop\cermin_v2, rollout_path=C:\Users\user\.codex\sessions\2026\08\03\rollout-2026-08-03T14-04-01-019fc638-d5a6-7730-8981-2b46478192aa.jsonl, updated_at=2026-08-03T06:05:57+00:00, thread_id=019fc638-d5a6-7730-8981-2b46478192aa, partial; HTTP verification was aborted)

### keywords

- localhost test, php -S 127.0.0.1:8000 index.php, index.php, router.php, BLUEPRINT.md, /skudai, /skudai/home, /unknown, HTTP 404, An empty pipe element is not allowed

## Reusable knowledge

- This is a PHP front-controller (`index.php`, `router.php`, `lib/`, `template/`), not Node/Vite. The documented shape is `php -S 127.0.0.1:8000 index.php`; verify `/`, `/skudai`, `/skudai/home`, and `/unknown` (404), lint PHP, and check canonical implementation URLs. [Task 1]

## Failures and how to do differently

- The server/request command was aborted before any HTTP status was obtained -> inspect port 8000/remaining PHP process, then make individual requests and report exact statuses. Avoid malformed parallel PowerShell pipelines; a process start is not localhost readiness. [Task 1]

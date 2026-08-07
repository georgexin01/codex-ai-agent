# Raw Memories

Merged stage-1 raw memories (stable ascending thread-id order):

## Thread `019fc638-d5a6-7730-8981-2b46478192aa`
updated_at: 2026-08-03T06:05:57+00:00
cwd: \\?\C:\Users\user\Desktop\cermin_v2
rollout_path: C:\Users\user\.codex\sessions\2026\08\03\rollout-2026-08-03T14-04-01-019fc638-d5a6-7730-8981-2b46478192aa.jsonl
rollout_summary_file: 2026-08-03T06-04-01-bI14-cermin_php_localhost_test_aborted.md

---
description: Cermin PHP front-controller localhost test was only partially completed; server/HTTP verification was aborted before statuses were obtained
task: localhost test PHP front controller and clean branch routes
task_group: cermin_v2 local development
 task_outcome: partial
cwd: C:\Users\user\Desktop\cermin_v2
keywords: localhost-test, PHP, php-built-in-server, index.php, router.php, /skudai, HTTP-404, PowerShell
---

### Task 1: Localhost test

task: Start and verify the Cermin PHP site locally without modifying source or configuration
task_group: cermin_v2 local development
task_outcome: partial

Reusable knowledge:
- The workspace is a PHP front-controller site with `index.php`, `router.php`, `lib/`, and `template/`; it has no package/Vite app.
- PHP 8.3.8 is installed. No listener was detected on the checked ports, so port 8000 was selected.
- Documented route checks are `/`, `/skudai`, `/skudai/home`, and `/unknown`; the unknown route should return 404.

Failures and how to do differently:
- The detached server start plus HTTP verification command was aborted by the user after 8.5 seconds, so no URL status was validated. A PHP process may remain; inspect port 8000/processes before retrying.
- Earlier PowerShell inspection scripts failed from malformed pipeline syntax (`An empty pipe element is not allowed`) and an uninformative parallel-command exit 1. Prefer simple sequential PowerShell commands.

References:
- Start shape: `php -S 127.0.0.1:8000 index.php`
- Verification docs: `BLUEPRINT.md` says to lint PHP files and verify `/`, `/skudai`, `/skudai/home`, unknown-path 404, branch isolation, and canonical implementation URLs.
- Abort evidence: server/request command output was `aborted by user after 8.5s`.

## Thread `019fcb94-3f2d-7492-80ca-40742d942aa3`
updated_at: 2026-08-04T10:40:59+00:00
cwd: \\?\C:\Users\user\.codex
rollout_path: C:\Users\user\.codex\sessions\2026\08\04\rollout-2026-08-04T15-01-58-019fcb94-3f2d-7492-80ca-40742d942aa3.jsonl
rollout_summary_file: 2026-08-04T07-01-58-Kxur-codex_router_performance_cleanup_git_ignore_audit.md

---
description: `.codex` routing, performance, cleanup, ignore, and nested-Git maintenance completed with verified routing health; preserve route-first/lazy-loading and avoid deleting locked runtime state.
task: codex-router-performance-cleanup-integrity
task_group: codex-maintenance
 task_outcome: success
cwd: C:\Users\user\.codex
keywords: 00_PULSE.md, skill_path_router, Update-CodexRouting.ps1, Audit-CodexRouting.ps1, Test-CodexPerfBenchmark.ps1, Validate-CodexKnowledge.ps1, MEMORY.md, .codexignore, VS Code, nested Git, luna-5.6-medium
---

### Task 1: Improve and repair `.codex` performance

task: optimize and validate Codex routing/memory/skill activation
 task_group: codex-performance
 task_outcome: success

Preference signals:
- The user asked to “find improvement that can be made to my .codex to highly improve performances” -> inspect live routes, memory sizes, skills, and benchmarks before recommending or editing.
- The user expects clearly scoped fixes to be completed automatically, but protected skill Markdown and important knowledge must remain stable unless explicitly authorized.

Reusable knowledge:
- `00_PULSE.md` is the authoritative single boot read; route first and keep detailed governance, history, and skills lazy.
- Initial failures were hot memory over budget and four missing skill routes. After cleanup/compression and route repair, the benchmark passed `32/32`, activation passed `18/18`, and knowledge validation passed.
- Final routing evidence: 138 active routes, 244 manifest entries, zero missing targets, zero conflicts, zero legacy references.

Failures and how to do differently:
- Do not create a missing skill merely to satisfy a stale route; remove obsolete routes when the feature is not present.
- Locked Windows cache/vendor files cannot be safely deleted while Codex runs; preserve them and retry after closing Codex.

References:
- `C:\Users\user\.codex\codex-router\Update-CodexRouting.ps1 -Quiet`
- `C:\Users\user\.codex\codex-router\Audit-CodexRouting.ps1 -Json`
- `C:\Users\user\.codex\codex-router\Test-CodexPerfBenchmark.ps1 -Json`
- `C:\Users\user\.codex\codex-router\Test-CodexSkillActivation.ps1 -Json`
- `C:\Users\user\.codex\codex-router\Validate-CodexKnowledge.ps1`

### Task 2: Ignore rules and nested Git visibility

task: remove stale ignore entries and prevent VS Code from surfacing nested repositories
 task_group: git-vscode-hygiene
 task_outcome: success

Reusable knowledge:
- `memories/.git` was absent; `git -C memories rev-parse --show-toplevel` correctly resolves to `C:/Users/user/.codex`.
- Removed obsolete `skills/faucet/` entries from `.codexignore` and `skills/.gitignore`; other absent-path rules are intentional future-state protections.
- `.vscode/settings.json` now ignores `memories`, `.tmp/plugins`, and `vendor_imports/skills` through `git.ignoredRepositories`.

References:
- `C:\Users\user\.codex\.vscode\settings.json`
- `.codexignore` and `skills/.gitignore`
- Verification: `memories_nested_git=0`; root Git remains `C:/Users/user/.codex`.

## Thread `019fcff7-f81e-7ce1-b8dd-d9e04a524e95`
updated_at: 2026-08-05T07:55:38+00:00
cwd: \\?\C:\Users\user\Desktop\saleshero
rollout_path: C:\Users\user\.codex\sessions\2026\08\05\rollout-2026-08-05T11-29-22-019fcff7-f81e-7ce1-b8dd-d9e04a524e95.jsonl
rollout_summary_file: 2026-08-05T03-29-22-nTKd-saleshero_knowledge_and_compressed_testflow.md

---
description: Sales Hero schema analysis, role-based product knowledge, and compressed Mermaid test-flow authoring; completed successfully with structural validation
 task: analyze sales_hero.sql and client workflow, then create and compress testflow_saleshero.md
 task_group: saleshero-documentation
 task_outcome: success
 cwd: C:\Users\user\Desktop\saleshero
 keywords: saleshero, sales_hero.sql, knowledge.md, testflow_saleshero.md, Mermaid, flowchart TD, Supabase, salesman, dealer, super-admin, credit-limit, discount-tier, refunds
---

### Task 1: Build project knowledge

task: derive product direction, SQL relationships, and role workflows from project evidence
task_group: saleshero-documentation
task_outcome: success

Preference signals:
- The user explicitly asked to read the root documents, SQL, schema PNGs, and client discussion, then update `knowledge.md` -> future agents should ground product/design conclusions in current project files and preserve unresolved assumptions instead of inventing page structures.
- The user specified that `testflow_trash.md` is only a reference and that Sales Hero pages/structure were undecided -> use reference flows for format, not as confirmed product requirements.

Reusable knowledge:
- Main business graph: `public.user -> sales_hero.users -> salesmans/dealers`; `dealers -> orders -> order_details -> item_variants -> items`; `orders -> invoices`; `items -> stock_in_details -> stock_ins`; `order_details -> refunds`.
- Core roles are `super_admin`, `salesman`, and `dealer` in `sales_hero.users.role`.
- Dealer records include `discountTierId`, `salesmanId`, `termLimitAmount`, `termAvailableAmount`, `termMaxOrderCount`, and `balancePaymentAmount`.
- `item_variants` owns quantity-based prices; orders preserve `discountPercentage`, `isPaid`, status, and `totalSalesCommision`.
- Client requirements include dealer onboarding by Salesman/Super Admin, credit limits, first-order/demo restrictions, manual payment confirmation, discount snapshots, and refund commission adjustments.
- Important schema gaps must remain explicit: no clear payment ledger for partial payments, no explicit demo mode, no territory/stage model, no commission payout ledger, and no shown stock movement logic.

Failures and how to do differently:
- Initial repository check failed because the folder was not a Git repository; proceed with direct file inspection rather than treating this as a project failure.

References:
- `C:\Users\user\Desktop\saleshero\sales_hero.sql`
- `C:\Users\user\Desktop\saleshero\original.md`
- `C:\Users\user\Desktop\saleshero\knowledge.md`

### Task 2: Create and compress Mermaid test flow

task: create a full Sales Hero test flow in the user's Trash Mermaid style, then safely merge adjacent steps
task_group: saleshero-testflow
 task_outcome: success

Preference signals:
- The user asked to follow `testflow_trash_flowchart.md` exactly in spirit: raw `flowchart TD`, numeric IDs, arrows, branches, and compact labels -> preserve this format for future test-flow documents.
- The user asked to reduce size and merge lines only when “suitable to merge” -> merge steps belonging to the same screen/transaction, but keep separate branches for credit limits, partial payment, refunds, permissions, and regression checks.

Reusable knowledge:
- Final `testflow_saleshero.md` is 139 lines / approximately 5.9 KB, reduced from 391 lines / approximately 14.4 KB.
- Final flow covers Admin account/profile setup, catalog and stock, core CRUD and soft delete, order/invoice/payment management, partial-payment limitation, refunds/commission, Salesman app, Dealer app, credit/demo rules, end-to-end sale, visibility, regression, and unresolved decisions.
- Structural validation confirmed `flowchart TD`, 100 node definitions with no duplicate labels, all core table names and SQL fields, no passwords, and no code fences.

Failures and how to do differently:
- The first large flow had duplicate Mermaid node definitions and an incomplete field-check result. Fix duplicate convergence labels and add exact schema identifiers before considering the artifact complete.
- Mermaid rendering and runtime/database execution were not available; future agents should render the diagram and test against a live app/database when possible.

References:
- `C:\Users\user\Desktop\saleshero\testflow_trash_flowchart.md`
- `C:\Users\user\Desktop\saleshero\testflow_saleshero.md`
- Validation checks: `flowchart_TD=True`, `no_duplicate_node_labels=True`, `all_core_tables=True`, `sql_fields=True`, `business_branches=True`, `no_passwords=True`

## Thread `019fd0c1-b541-70a2-8a56-ff613fcd1170`
updated_at: 2026-08-05T07:16:02+00:00
cwd: \\?\C:\Users\user\Desktop\thongthai2\admin-panel-Thongthai
rollout_path: C:\Users\user\.codex\sessions\2026\08\05\rollout-2026-08-05T15-09-43-019fd0c1-b541-70a2-8a56-ff613fcd1170.jsonl
rollout_summary_file: 2026-08-05T07-09-43-riXS-floorplanstatistics_seat_click_behavior.md

---
description: Verified that seats on the floorplanstatistics page are non-interactive; red seats only indicate unavailable/reserved status.
task: inspect floorplanstatistics seat click behavior
task_group: thongthai-admin-panel-ui
task_outcome: success
cwd: C:\Users\user\Desktop\thongthai2\admin-panel-Thongthai
keywords: floorplanstatistics, seat, click, reserved, modal, Vue, table.vue
---

### Task 1: Verify seat-click behavior

task: determine whether clicking any seat, especially a red seat, opens details or a modal
task_group: admin-panel floor-plan UI
task_outcome: success

Preference signals:
- The user repeatedly asked whether clicking a seat or “the red seat” would trigger anything -> future answers should explicitly cover both normal and state-colored seats.

Reusable knowledge:
- In `src/pages/floorplanstatistics/table.vue`, seat elements only render position, background image, availability class, and name. There is no `@click`, `@pointerdown`, modal state, or detail handler.
- `isAvailableSeat()` applies the `reserved` class when the seat is absent from `availableSeat`; the red/reserved appearance is visual-only.
- The page updates seats and statistics when branch/date changes, not when seats are clicked.
- `src/pages/floorplans/table.vue` is a separate editable page with `@pointerdown="checkIndex($event, index)"`; do not infer that behavior exists on the statistics page.

Failures and how to do differently:
- A combined GitNexus plus `rg` command exited nonzero due to no memory matches. For small UI behavior checks, use direct targeted file reads/searches and avoid unnecessary GitNexus routing.

References:
- `src/pages/floorplanstatistics/table.vue:192-204`
- `src/pages/floorplanstatistics/table.vue:111-113`
- `src/pages/floorplans/table.vue:333-345`

## Thread `019fd0fc-32b2-7e81-a332-2609b86c37f6`
updated_at: 2026-08-05T08:14:03+00:00
cwd: \\?\C:\Users\user\Desktop\motorcycle
rollout_path: C:\Users\user\.codex\sessions\2026\08\05\rollout-2026-08-05T16-13-36-019fd0fc-32b2-7e81-a332-2609b86c37f6.jsonl
rollout_summary_file: 2026-08-05T08-13-36-owK2-codex_knowledge_boot_sentinel.md

---
description: Boot hydration for Codex knowledge completed; exact sentinel behavior and large-knowledge scan route are validated.
task: ai read .codex knowledge
task_group: codex-boot-routing
task_outcome: success
cwd: C:\Users\user\Desktop\motorcycle
keywords: PULSE, codex knowledge, boot sentinel, Find-LargeKnowledge, routing, cold-history
---

### Task 1: Codex knowledge boot

task: ai read .codex knowledge
task_group: codex-boot-routing
task_outcome: success

Reusable knowledge:
- The exact trigger must read `C:\Users\user\.codex\00_PULSE.md` once and respond only with `[🟢] Agent is Ready..`; do not add a table, explanation, or extra route reads.
- PULSE establishes the normal lifecycle `HYDRATE → GROUND → PLAN → ACT → VERIFY` and requires smallest-scope routing, current evidence, and verification before declaring edits done.
- Automatic knowledge scan command: `C:\Users\user\.codex\codex-router\Find-LargeKnowledge.ps1`.
- The scan completed successfully and classified four files as `cold-history` / `report only`: `memories/MEMORY_DETAILS.md`, `memories/MOBILE_APP_DESIGN_RECIPE_DETAILS.md`, `memories/IMAGE_TO_MOBILE_APP_PIPELINE_DETAILS.md`, and `memories/1_core/HEADER_FOOTER_DESIGN_RULES_DETAILS.md`.

Failures and how to do differently:
- No failure observed; the exact sentinel-only response requirement was followed.

References:
- User trigger: `ai read .codex knowledge`
- Boot file: `C:\Users\user\.codex\00_PULSE.md`
- Scan script: `C:\Users\user\.codex\codex-router\Find-LargeKnowledge.ps1`

## Thread `019fd49d-9b00-7ff0-ac3e-c548678624a2`
updated_at: 2026-08-06T02:26:20+00:00
cwd: \\?\C:\Users\user\Desktop\motorcycle\jambolive
rollout_path: C:\Users\user\.codex\sessions\2026\08\06\rollout-2026-08-06T09-08-47-019fd49d-9b00-7ff0-ac3e-c548678624a2.jsonl
rollout_summary_file: 2026-08-06T01-08-46-xCAa-jambolive_product_import_and_category_audit.md

---
description: Imported and verified 317 JamboLive products into the local database, then found category labels are placeholders rather than live names.
task: crawl-live-jambolive-products-and-audit-categories
task_group: jambolive-catalogue
task_outcome: partial
cwd: C:\Users\user\Desktop\motorcycle\jambolive
keywords: JamboLive, database.json, product importer, 317 products, categories, PowerShell, UTF-8, import-report
---

### Task 1: Import and enrich product catalogue

task: crawl all 317 live product records and detail pages into local JSON
 task_group: jambolive-catalogue
 task_outcome: success

Preference signals:
- The user explicitly required all 317 products, detail-page fields, images, descriptions, IDs, brands, categories, status, prices, styles, social URLs, and more information to be saved for future page loading -> similar tasks should preserve as much source data as available and verify the exact item count.

Reusable knowledge:
- `data/database.json` contains exactly 317 products with 317 unique IDs and no duplicates.
- Live catalogue count was verified as 317; the importer crawled 27 catalogue pages and all 317 detail URLs with 0 page failures and 0 asset failures.
- All 317 corresponding `product/<id>/index.html` files exist and every product has local image data. One local folder, `product/4867658`, is extra and was preserved because it is not in the current live catalogue.
- The importer is `tools/import-public-products.ps1`; it captures `images`, `description`, `descriptionHtml`, `style`, `socialUrls`, `moreInformation`, `sourceCatalog`, status, prices, and local assets.
- One source product has no description; the empty value reflects source truth.

Failures and how to do differently:
- Initial enrichment incorrectly included the shop logo in image arrays and over-corrected valid Unicode bullets into mojibake. Restrict gallery images to `/media/uploadedphoto/`, use explicit UTF-8 decoding, and validate raw character codes plus mojibake markers.
- Single-item PowerShell outputs can serialize arrays as scalars; force array shape with `@(...)` for fields such as `images`, `style`, and `socialUrls`.

References:
- `data/database.json`
- `data/import-report.json`
- `tools/import-public-products.ps1`
- Live API: `https://sea.jambolive.tv/pay/api/commodities/get/12299/`
- Detail URL pattern: `https://sea.jambolive.tv/shop/12299/product/<id>/`
- Verification result: `Products=317`, `UniqueIds=317`, `DetailPages=317`, `MissingImages=0`, `BadImagePaths=0`, `RawCatalog=0`, `MoreInformation=0`.

### Task 2: Audit category names against live catalogue

task: compare category IDs and names in database.json with live catalogue navigation
 task_group: jambolive-category-audit
 task_outcome: partial

Preference signals:
- The user asked whether “all product categories name all correct in database.json,” and supplied the live URL -> future audits should compare both category IDs and human-readable labels against the live navigation, not just verify that IDs exist.

Reusable knowledge:
- `database.json` currently has 39 category IDs, but names are placeholders such as `Category 12521`.
- The live page exposes 39 category links with real names: `SHOEI`, `SIMPSON`, `NHK`, `HJC`, `LS2`, `SUPERFLY`, `J CRUISE`, `J FORCE`, `NEOTEC`, `GT AIR`, `Z8`, `X15`, `J.O`, `HORNET ADV`, `EX ZERO`, `GLAMSTER`, `SPEED BANDIT`, `DARKSOME`, `VENOM`, `M52`, `M30`, `M82`, `CHOPPER`, `STROBE 2`, `ADVANT 2`, `ADVANT X`, `S1GP S`, `S1GP PRO`, `K5R`, `C71`, `I31`, `X-CURSION`, `BELL`, `BULLIT SE`, `CARDO`, `MUC-OFF`, `ACCESSORIES`, `AIRFLOW 2`, and `GLOVE`.
- Category IDs were present, but names and parent hierarchy were not correct. No database correction was completed in this rollout.

Failures and how to do differently:
- An initial extraction command called `.NET HtmlDecode` with two arguments and emitted repeated overload errors. The corrected sequence is: strip tags first, call `[Net.WebUtility]::HtmlDecode($clean)` with one argument, then normalize whitespace.
- Do not claim category correctness from ID presence alone; compare live `?cat=<id>` links and labels, then separately determine parent relationships.

References:
- Live category URL: `https://sea.jambolive.tv/shop/12299/product/`
- Stored categories: `data/database.json` → `categories`
- Evidence: live extraction found `Unique live category links: 39`; stored names were all `Category <id>`.


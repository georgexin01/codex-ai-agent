# Task Group: local-model-cache / Ollama discovery
scope: Locate locally installed Ollama models on Windows without broad profile scans.
applies_to: cwd=C:\Users\user\Desktop\huwa and Windows local model caches; reuse_rule=paths are user-machine-specific, but cache layout and targeted-search strategy are reusable.

## Task 1: Locate Gemma 4 Ollama model folder, success

### rollout_summary_files

- rollout_summaries/2026-08-20T01-25-28-9wIS-locate_gemma4_ollama_model_folder.md (cwd=C:\Users\user\Desktop\huwa, rollout_path=C:\Users\user\.codex\sessions\2026\08\20\rollout-2026-08-20T09-25-28-01a01cc5-ef06-7613-ab20-48507ef62f16.jsonl, updated_at=2026-08-20T01:26:38+00:00, thread_id=01a01cc5-ef06-7613-ab20-48507ef62f16)

### keywords

- Gemma 4, Ollama, .ollama, manifests, registry.ollama.ai, blobs, timeout

## Reusable knowledge

- Verified Gemma 4 manifests are under `C:\Users\user\.ollama\models\manifests\registry.ollama.ai\library\gemma4\e2b` and `...\e4b`; actual model blobs are separate in `C:\Users\user\.ollama\models\blobs`. [Task 1]
- Search known cache roots first: `.ollama`, Hugging Face, then LM Studio. [Task 1]

## Failures and how to do differently

- Symptom: recursive scan of `C:\Users\user` timed out after 20 seconds. Cause: broad Windows profile scan. Fix: query known model-cache roots before any broad fallback. [Task 1]

# Task Group: image-generation asset policy and routing
scope: Route actual image-generation requests and keep project raster assets measured, correctly formatted, and outside `.codex` storage.
applies_to: cwd=C:\Users\user\.codex and website/mobile projects; reuse_rule=apply when the user has generation intent, not merely image debugging or layout questions.

## Task 1: Consolidate no-Codex generated-image storage, asset sizing, and trigger routing

### rollout_summary_files

- rollout_summaries/2026-08-13T08-59-12-0qMc-zetasoftware_blog_regeneration_portfolio_phone_frame_correct.md (cwd=D:\backup\website-zetasoftware, rollout_path=C:\Users\user\.codex\sessions\2026\08\13\rollout-2026-08-13T16-59-12-019ffa58-d0c5-7e41-b135-6dd2e966daa4.jsonl, updated_at=2026-08-13T11:03:42+00:00, thread_id=019ffa58-d0c5-7e41-b135-6dd2e966daa4, incomplete asset handoff evidence)

### keywords

- image generation, generated_images, IMAGE_GENERATION_ASSET_POLICY.md, JPG, PNG, rendered dimensions, Bootstrap v5.3, generate create make render produce design

## User preferences

- when creating project-bound images, the user requires that they never intentionally be stored under `C:\Users\user\.codex\generated_images\` or another `.codex` folder -> put final assets in the active project’s documented asset folder, update consuming references, and verify them there. [Task 1] [ad-hoc note]
- when creating website/mobile raster assets, use a measurement-first workflow: actual computed section/card/div/img dimensions are authoritative; Bootstrap v5.3 tiers are only a grouping aid. [Task 1] [ad-hoc note]

## Reusable knowledge

- Canonical policy is `C:\Users\user\.codex\codex-router\IMAGE_GENERATION_ASSET_POLICY.md`; final assets should be 30–1600px per edge, fit the measured rendered element, default to JPG when opaque, and use PNG only for real alpha or artifact-sensitive flat art. [Task 1] [ad-hoc note]
- Activate image-generation routing for a generation verb (`generate`, `create`, `make`, `render`, `produce`, `design`) plus an image noun (`image`, `photo`, `banner`, `logo`, `hero`, `card`, `profile`, `gallery`, `ad`, `asset`); then use `skills/.system/imagegen/SKILL.md`. Do not route ordinary image debugging as generation without generation intent. [Task 1] [ad-hoc note]

## Failures and how to do differently

- Generated output under `.codex\generated_images` is transient preview material, not project storage. Copy or create the final file in the project asset folder and verify references before completion; remove a transient protected preview only when practical. [Task 1] [ad-hoc note]

# Task Group: Supabase VPS backup restore and local PostgREST exposure
scope: Repair an inconsistent Huwa2 SQL backup, restore it atomically, and expose its schema through a CLI-managed local Supabase stack.
applies_to: cwd=C:\Users\user\Documents\supabase-project-backup-restore; reuse_rule=backup counts/UUIDs are checkout-specific, but repair and CLI configuration procedure is reusable.

## Task 1: Repair auth backup, restore Huwa2, and expose `huwa2`, success

### rollout_summary_files

- rollout_summaries/2026-08-14T02-47-47-8IL6-huwa2_vps_restore_and_postgrest_expose.md (cwd=C:\Users\user\Documents\supabase-project-backup-restore, rollout_path=C:\Users\user\.codex\sessions\2026\08\14\rollout-2026-08-14T10-47-47-019ffe2b-21d6-7ff2-9bea-6cfa6ab17768.jsonl, updated_at=2026-08-14T03:10:24+00:00, thread_id=019ffe2b-21d6-7ff2-9bea-6cfa6ab17768)

### keywords

- Supabase, huwa2, atomic restore, auth.users, auth.identities, identities_user_id_fkey, PGRST_DB_SCHEMAS, config.toml, Git Bash

## User preferences

- when restoring the VPS-backed `huwa2` project locally, preserve the original backup and repair only a local working copy when possible; treat local database state as protected and use the existing atomic restore. [Task 1]
- when exposing a schema, verify database presence and API exposure separately; make narrow, backed-up configuration changes. [Task 1]

## Reusable knowledge

- Before restore, validate every `auth.identities.user_id` has a matching `auth.users.id`. This backup had 10 orphan phone identities; adding placeholder parent user rows to the working copy changed it to 18 users, 26 identities, 0 orphans while preserving identity UUIDs. Some recovered accounts may not authenticate due to incomplete source fields. [Task 1]
- Use `scripts/04-restore-local.sh` with `C:\Program Files (x86)\Git\bin\bash.exe`; successful restore commits atomically, restores storage, and intentionally leaves existing edge functions alone. [Task 1]
- For CLI-managed stacks, edit `C:\Users\user\Documents\local-supabase\supabase\config.toml` `[api].schemas`, add `"huwa2"`, then `supabase stop --workdir ...` and `supabase start --workdir ...`; this preserves Docker-backed local data. Verify `PGRST_DB_SCHEMAS`, schema/project presence, and orphan count. [Task 1]

## Failures and how to do differently

- `scripts/06-expose-schema.sh` can fail with `Could not locate compose file for 'supabase_rest_local-supabase'.` Cause: Supabase CLI management does not provide Compose config-file labels. Detect `com.supabase.cli.project` and use CLI config instead. [Task 1]
- Do not retry an inconsistent original backup unchanged; preserve it as `.original.sql` and validate referential integrity first. [Task 1]

# Task Group: Zeta Software bilingual static site
scope: Maintain English/Simplified-Chinese parity across blogs, FAQ, homepage/services, and portfolio UI in the static Zeta Software website.
applies_to: cwd=D:\backup\website-zetasoftware; reuse_rule=project paths/contracts are checkout-specific; bilingual-parity, source-of-truth, and validation practices are reusable for similar sites.

## Task 1: Build/maintain bilingual blog system and localhost verification, partial

### rollout_summary_files

- rollout_summaries/2026-08-13T01-17-52-eGXh-zetasoftware_bilingual_blog_system_revisions.md (cwd=D:\backup\website-zetasoftware, rollout_path=C:\Users\user\.codex\sessions\2026\08\13\rollout-2026-08-13T09-17-53-019ff8b2-757c-7922-bc4f-99b7ec3f1f53.jsonl, updated_at=2026-08-13T06:18:23+00:00, thread_id=019ff8b2-757c-7922-bc4f-99b7ec3f1f53, UX replacement remains unverified)

### keywords

- blogs.json, blogs-cn.json, js/blogs.js, .htaccess, localhost test, php.exe -S, contentHtml, author, UTF-8

## Task 2: Build/rebalance FAQ and homepage/services parity, success

### rollout_summary_files

- rollout_summaries/2026-08-13T09-01-30-FmzH-zetasoftware_bilingual_faq_homepage_blogs_pricing_parity.md (cwd=D:\backup\website-zetasoftware, rollout_path=C:\Users\user\.codex\sessions\2026\08\13\rollout-2026-08-13T17-01-30-019ffa5a-eb3e-7172-8f41-7b65c41c8a95.jsonl, updated_at=2026-08-13T09:54:49+00:00, thread_id=019ffa5a-eb3e-7172-8f41-7b65c41c8a95)
- rollout_summaries/2026-08-13T06-18-50-bDIs-zetasoftware_bilingual_faq_system_and_interrupted_globalizat.md (cwd=D:\backup\website-zetasoftware, rollout_path=C:\Users\user\.codex\sessions\2026\08\13\rollout-2026-08-13T14-18-50-019ff9c5-febf-7151-a502-860618d376c8.jsonl, updated_at=2026-08-13T09:01:23+00:00, thread_id=019ff9c5-febf-7151-a502-860618d376c8)

### keywords

- faq.json, js/faq.js, FAQPage JSON-LD, paired IDs, home-blogs.js, pricing-section, Orbitron, status.md, meta.md

## Task 3: Regenerate blogs / exact portfolio phone-frame reuse, partial

### rollout_summary_files

- rollout_summaries/2026-08-13T08-59-12-0qMc-zetasoftware_blog_regeneration_portfolio_phone_frame_correct.md (cwd=D:\backup\website-zetasoftware, rollout_path=C:\Users\user\.codex\sessions\2026\08\13\rollout-2026-08-13T16-59-12-019ffa58-d0c5-7e41-b135-6dd2e966daa4.jsonl, updated_at=2026-08-13T11:03:42+00:00, thread_id=019ffa58-d0c5-7e41-b135-6dd2e966daa4, blog replacement incomplete; phone-frame correction verified)

### keywords

- blogs.md, data/blogs.json, data/blogs-cn.json, sticky-phone, phone-screen, portfolio-card-phone, css/style.css?v=0138, cPanel

## User preferences

- when changing this site, English is the main design/markup source and `cn/` is the localized duplicate -> inspect/update both counterparts, preserve paired structure, localized visible text, and `status.md`/`meta.md` tracking. [Task 1][Task 2][Task 3]
- when asked to “copy the english parts and duplicate in chinese parts replace with it,” use English markup/layout as source of truth; do not make English-only completion claims. [Task 1]
- when FAQ content is requested, make answers “long and human friendly,” relevant to blog/search intent rather than keyword stuffing; include a distinct company-focused subset when requested. [Task 2]
- when asked for the “exact same design,” reuse canonical homepage DOM classes/structure and measured dimensions rather than a visual approximation. [Task 3]

## Reusable knowledge

- Stable local server here is `php.exe -S 127.0.0.1:8080 -t .`; report raw URLs/statuses. Python Store alias was unusable and a `py.exe` listener returned empty replies. [Task 1]
- Blogs are data-driven through `data/blogs.json`, `data/blogs-cn.json`, `js/blogs.js`, and `.htaccess`; match slugs/image paths and preserve paragraph-only `contentHtml`. The unfinished UX replacement must be reread and then JSON-validated with both detail routes. [Task 1]
- FAQ source is `data/faq.json` (`en`/`cn`); `js/faq.js` selects language from `/cn/`, renders accordions, and updates `#faq-schema`. Preserve crawlable fallback HTML, 30 unique paired stable IDs, ordering, visible question/answer parity, and FAQPage schema parity. [Task 2]
- Final FAQ rebalance: five Zeta IDs first, nine paired title changes, 30 records each language. Latest blog cards use `js/home-blogs.js`, sort localized data by date, take three, escape text, and refresh Lucide icons. Services pricing requires the same Google Fonts link as homepage for Orbitron parity. [Task 2]
- Exact portfolio reuse uses `sticky-phone portfolio-card-phone`, `phone-screen`, `phone-camera`, `phone-physical-btn`, `reflection-overlay`, and `screen-light-bleed`; verified dimensions: desktop 310×640px, mobile 275×572px. [Task 3]

## Failures and how to do differently

- Symptom: multilingual HTML appears corrupted after bulk PowerShell replacement. Cause: default `Get-Content`/`Set-Content` encoding. Fix: explicit UTF-8/no-BOM or surgical patches; use byte/Unicode-aware checks before diagnosing mojibake. [Task 1][Task 2]
- Symptom: FAQ patch has `Expected ',' or ']' after array element`, duplicate IDs, or Chinese lag. Fix: parse JSON immediately, check counts/duplicate IDs/paired IDs and compare each changed paired title before closing. [Task 2]
- Do not claim 10-blog regeneration completed: only three generated images were evidenced; final image files must live in `images/blog/`, be referenced and verified, and both datasets must actually be replaced. [Task 3]
- Browser/cPanel rendering was not verified for portfolio; source/HTTP checks are insufficient for deployed visual completion—upload and hard refresh before claiming it. [Task 3]

# Task Group: .codex routing, performance, and long-task maintenance
scope: Keep Codex boot/routing fast with lossless compression, validated route changes, and resumable checkpoints.
applies_to: cwd=C:\Users\user\.codex; reuse_rule=use current router counts/paths only as historical baselines; preserve protected runtime/repository state unless authorized.

## Task 1: Routing/performance cleanup and Git visibility, success

### rollout_summary_files

- rollout_summaries/2026-08-04T07-01-58-Kxur-codex_router_performance_cleanup_git_ignore_audit.md (cwd=C:\Users\user\.codex, rollout_path=C:\Users\user\.codex\sessions\2026\08\04\rollout-2026-08-04T15-01-58-019fcb94-3f2d-7492-80ca-40742d942aa3.jsonl, updated_at=2026-08-04T10:40:59+00:00, thread_id=019fcb94-3f2d-7492-80ca-40742d942aa3)

### keywords

- 00_PULSE.md, skill_path_router, Update-CodexRouting.ps1, Audit-CodexRouting.ps1, Test-CodexPerfBenchmark.ps1, .codexignore, git.ignoredRepositories

## Task 2: Codex knowledge boot sentinel and large-knowledge scan, success

### rollout_summary_files

- rollout_summaries/2026-08-05T08-13-36-owK2-codex_knowledge_boot_sentinel.md (cwd=C:\Users\user\Desktop\motorcycle, rollout_path=C:\Users\user\.codex\sessions\2026\08\05\rollout-2026-08-05T16-13-36-019fd0fc-32b2-7e81-a332-2609b86c37f6.jsonl, updated_at=2026-08-05T08:14:03+00:00, thread_id=019fd0fc-32b2-7e81-a332-2609b86c37f6)

### keywords

- ai read .codex knowledge, [🟢] Agent is Ready.., Find-LargeKnowledge.ps1, cold-history, PULSE

## Task 3: Lean maintenance and lossless hot-memory compression, success

### rollout_summary_files

- rollout_summaries/2026-08-12T07-57-58-bZCY-codex_lean_maintenance_and_memory_compression.md (cwd=C:\Users\user\.codex, rollout_path=C:\Users\user\.codex\sessions\2026\08\12\rollout-2026-08-12T15-57-58-019ff4fa-668d-74d2-bc92-64724b087b5c.jsonl, updated_at=2026-08-12T08:30:52+00:00, thread_id=019ff4fa-668d-74d2-bc92-64724b087b5c)

### keywords

- MEMORY.md, MEMORY_DETAILS.md, KNOWLEDGE_COMPRESSION_PROTOCOL.md, Verify-KnowledgeCompression.ps1, nested-memories-git, hot memory

## Task 4: Add fast-batch workflow protocol, partial

### rollout_summary_files

- rollout_summaries/2026-08-12T08-56-09-fmgd-codex_fast_batch_workflow_protocol.md (cwd=C:\Users\user\.codex, rollout_path=C:\Users\user\.codex\sessions\2026\08\12\rollout-2026-08-12T16-56-09-019ff52f-a88b-7893-a2b3-9a5d5e75097d.jsonl, updated_at=2026-08-12T09:01:25+00:00, thread_id=019ff52f-a88b-7893-a2b3-9a5d5e75097d)

### keywords

- FAST BATCH STATE, task checkpoint, context compression, DONE, ACTIVE, NEXT, BLOCKED, DEFERRED, OBSOLETE, nested-memories-git

## User preferences

- when improving `.codex`, the user asked to “find improvement ... to highly improve performances” -> inspect live routes, memory sizes, skills, and benchmarks before recommending or editing. [Task 1]
- when requesting maintenance, “wont make heavy changes to it” -> prefer reversible, surgical changes; preserve routes, protected skill Markdown, important knowledge, secrets, and repository state unless explicitly authorized. [Task 3]
- when content is long or work remains, the user requested “fast batch workflow knowledge” for old task requests and things to do -> checkpoint exact requirements and the smallest verified continuation state. [Task 4]

## Reusable knowledge

- `00_PULSE.md` is the authoritative boot contract: route first, lazy-load detailed governance/history/skills, and follow `HYDRATE → GROUND → PLAN → ACT → VERIFY`. Exact trigger `ai read .codex knowledge` must reply only `[🟢] Agent is Ready..`; `Find-LargeKnowledge.ps1` is the large-knowledge scan. [Task 1][Task 2][Task 3]
- After route/index changes, run `codex-router\Update-CodexRouting.ps1 -Quiet`, then audit/activation/performance checks. Historical successful checks included 32/32 benchmark, 18/18 activation, and zero missing targets/conflicts; do not treat counts as current without rerunning. [Task 1][Task 3]
- Compress hot `MEMORY.md` as a compact index with searchable detail companion, preserving route coverage; use `Verify-KnowledgeCompression.ps1` after compression. [Task 3]
- FAST BATCH checkpoints retain exact objectives, acceptance criteria, safety boundaries, paths, IDs, errors, decisions, changed files, and verification evidence. Use `DONE`, `ACTIVE`, `NEXT`, `BLOCKED`, `DEFERRED`, `OBSOLETE`; batch independent read-only checks only. [Task 4]

## Failures and how to do differently

- Do not create a missing skill just to satisfy a stale route; remove obsolete routing when that feature is absent. Locked Windows cache/vendor files and `memories\.git` require explicit cleanup authorization—do not delete them while Codex runs. [Task 1][Task 3]
- Encoding-sensitive Markdown anchors can break large patches. Inspect exact nearby lines and split into small stable-anchor patches. [Task 3][Task 4]
- A plan/running process is not progress evidence. Refresh checkpoints only after a verification gate; keep destructive/auth/database/ambiguous operations ordered rather than batching them. [Task 4]

# Task Group: PHP website metadata, indexing policy, and project-agnostic guidance
scope: Centralize evidence-based metadata/manifest updates and enforce FC-Moto’s noindex policy.
applies_to: cwd=C:\Users\user\Desktop\motorcycle\fc-moto-new and C:\Users\user\Desktop\ai comment; reuse_rule=FC-Moto values are project-specific; evidence-first metadata guidance is reusable.

## Task 1: FC-Moto metadata, sitemap, mojibake, and footer taxonomy, success/partial

### rollout_summary_files

- rollout_summaries/2026-08-07T08-58-09-YPrd-fc_moto_metadata_noindex_and_homepage_cleanup.md (cwd=C:\Users\user\Desktop\motorcycle\fc-moto-new, rollout_path=C:\Users\user\.codex\sessions\2026\08\07\rollout-2026-08-07T16-58-09-019fdb71-b29e-7ad3-85f2-fa36bb94a3c3.jsonl, updated_at=2026-08-10T04:31:01+00:00, thread_id=019fdb71-b29e-7ad3-85f2-fa36bb94a3c3)

### keywords

- fcMotoPageMeta, lib/initData.php, lib/htmlhead.php, noindex, nofollow, site.webmanifest, sitemap.xml, category.json, mojibake

## Task 2: Project-agnostic metadata and manifest guidance, success

### rollout_summary_files

- rollout_summaries/2026-08-10T04-13-53-hwPl-project_agnostic_metadata_and_webmanifest_guidance.md (cwd=C:\Users\user\Desktop\ai comment, rollout_path=C:\Users\user\.codex\sessions\2026\08\10\rollout-2026-08-10T12-13-53-019fe9e0-8772-7143-8b6b-11cc8a866137.jsonl, updated_at=2026-08-10T04:22:20+00:00, thread_id=019fe9e0-8772-7143-8b6b-11cc8a866137)

### keywords

- metaTitle.txt, INSUFFICIENT DATA, project identity, site.webmanifest, Select-String -LiteralPath, centralized metadata

## User preferences

- for FC-Moto, the user explicitly said “noindex, nofollow please” -> default to sitewide `noindex, nofollow` for general crawlers and Googlebot until indexing is explicitly authorized. [Task 1]
- when metadata is requested, find the “actual project name user are working on rightnow,” not an old project name; use the broadest accurate scope supported by active evidence and centralize it in the existing metadata architecture. [Task 2]
- when editing FC-Moto footer taxonomy, use `category.json` source order, six entries per column, leave second title empty, and remove Top Brands rather than hardcoding labels. [Task 1]

## Reusable knowledge

- FC-Moto metadata is centralized in `lib/initData.php` (`fcMotoSiteData()`, `fcMotoPageMeta()`, `fcMotoIsIndexable()`) and shared `lib/htmlhead.php`; do not scatter it through templates. `fcMotoIsIndexable()` returns false and sitemap availability does not override page-level noindex. [Task 1]
- For generalized guidance, require active evidence for identity/scope and say `INSUFFICIENT DATA` if unavailable. Synchronize `site.webmanifest` `name`, `short_name`, `description`, `lang`, `id`, `start_url`, `scope`, `display`, colors, and existing icon facts; do not create a manifest only for SEO. [Task 2]
- Mojibake check pattern: `rg -n 'Ã¢|Ãƒ|Ã‚|ï¿½' <file>`, then lint/HTTP verify. For PowerShell manifest requests returning bytes, decode with `[Text.Encoding]::UTF8.GetString(...)`. [Task 1]

## Failures and how to do differently

- Do not claim production crawler/Apache/Search Console verification from local results; report them as deployment checks. [Task 1]
- `rg --literal-path` is unsupported here; use `Select-String -LiteralPath` for exact-file scans. Non-Git folders need read-back/targeted scans instead of `git diff`. [Task 2]
- Minified CSS may cause broad patch-context failure; patch smaller units and render-check the final footer layout. [Task 1]

# Task Group: JamboLive product catalogue import and category audit
scope: Import the complete live JamboLive catalogue into local JSON and audit category labels against live navigation.
applies_to: cwd=C:\Users\user\Desktop\motorcycle\jambolive; reuse_rule=counts/URLs reflect this catalogue snapshot; importer and validation shape are reusable.

## Task 1: Import 317 products and audit categories, partial

### rollout_summary_files

- rollout_summaries/2026-08-06T01-08-46-xCAa-jambolive_product_import_and_category_audit.md (cwd=C:\Users\user\Desktop\motorcycle\jambolive, rollout_path=C:\Users\user\.codex\sessions\2026\08\06\rollout-2026-08-06T09-08-47-019fd49d-9b00-7ff0-ac3e-c548678624a2.jsonl, updated_at=2026-08-06T02:26:20+00:00, thread_id=019fd49d-9b00-7ad3-85f2-fa36bb94a3c3, import verified; category names unresolved)

### keywords

- JamboLive, database.json, import-public-products.ps1, 317 products, uploadedphoto, UTF-8, categories, HtmlDecode

## User preferences

- when importing product data, the user required all 317 products plus detail fields/images/descriptions/IDs/brands/categories/status/prices/styles/social URLs/more information for future page loading -> preserve available source data and verify exact counts. [Task 1]
- when auditing categories, the user asked whether names were “all correct in database.json” against the live URL -> compare both category IDs and human-readable labels, not ID existence alone. [Task 1]

## Reusable knowledge

- `tools/import-public-products.ps1` populates `data/database.json` and detail `product/<id>/index.html`; it captures `images`, `description`, `descriptionHtml`, `style`, `socialUrls`, `moreInformation`, `sourceCatalog`, status, prices, and local assets. Snapshot verification: 317 products/unique IDs/detail pages, zero missing images/assets. [Task 1]
- Restrict gallery images to `/media/uploadedphoto/`; force singleton output fields to arrays with `@(...)`. Preserve source-truth empty descriptions and extra local folders unless deletion is requested. [Task 1]
- Stored category IDs existed but names were placeholders (`Category <id>`); live page exposed 39 real labels. Correct labels/parent hierarchy were not applied in this rollout. [Task 1]

## Failures and how to do differently

- Avoid over-correcting Unicode bullets into mojibake: use explicit UTF-8 decoding and validate raw character codes plus mojibake markers. [Task 1]
- `[Net.WebUtility]::HtmlDecode` takes one argument: strip tags, call `HtmlDecode($clean)`, then normalize whitespace. [Task 1]

# Task Group: Sales Hero schema knowledge and Mermaid test flow
scope: Derive role-based product knowledge from SQL/client evidence and author compact, structurally-valid Mermaid test flows.
applies_to: cwd=C:\Users\user\Desktop\saleshero; reuse_rule=business/schema facts are project-specific; source-grounded documentation and Mermaid validation are reusable.

## Task 1: Build Sales Hero knowledge and compressed test flow, success

### rollout_summary_files

- rollout_summaries/2026-08-05T03-29-22-nTKd-saleshero_knowledge_and_compressed_testflow.md (cwd=C:\Users\user\Desktop\saleshero, rollout_path=C:\Users\user\.codex\sessions\2026\08\05\rollout-2026-08-05T11-29-22-019fcff7-f81e-7ce1-b8dd-d9e04a524e95.jsonl, updated_at=2026-08-05T07:55:38+00:00, thread_id=019fcff7-f81e-7ce1-b8dd-d9e04a524e95)

### keywords

- sales_hero.sql, knowledge.md, testflow_saleshero.md, flowchart TD, salesman, dealer, super_admin, discountTierId, totalSalesCommision

## User preferences

- when building product knowledge, read root docs, SQL, schema PNGs, and client discussion, then preserve unresolved assumptions rather than inventing page structures; reference flows are format references, not confirmed requirements. [Task 1]
- when writing test flow, follow `testflow_trash_flowchart.md` in spirit: raw `flowchart TD`, numeric IDs, arrows, branches, compact labels; merge only steps from the same screen/transaction and retain key business branches. [Task 1]

## Reusable knowledge

- Key graph: `public.user -> sales_hero.users -> salesmans/dealers`; dealers/orders/order_details/item_variants/items; orders/invoices; stock/refund links. Roles are `super_admin`, `salesman`, `dealer`; important fields include `discountTierId`, credit limits, `discountPercentage`, `isPaid`, and `totalSalesCommision`. [Task 1]
- Keep missing payment ledger/demo/territory/commission-payout/stock-movement decisions explicitly unresolved. The final 139-line flow passed header, unique labels, core table/field, branch, and no-password/code-fence checks. [Task 1]

## Failures and how to do differently

- A non-Git folder is not a task failure—inspect project files directly. Validate Mermaid duplicate convergence labels and exact SQL identifiers before completion; render/test against a live app/database when available. [Task 1]

# Task Group: focused local UI and PHP localhost verification
scope: Answer narrow UI interaction questions from source and test PHP front-controller routes without overclaiming.
applies_to: cwd=C:\Users\user\Desktop\thongthai2\admin-panel-Thongthai and C:\Users\user\Desktop\cermin_v2; reuse_rule=source locations/routes are checkout-specific.

## Task 1: Verify floorplanstatistics seat click behavior, success

### rollout_summary_files

- rollout_summaries/2026-08-05T07-09-43-riXS-floorplanstatistics_seat_click_behavior.md (cwd=C:\Users\user\Desktop\thongthai2\admin-panel-Thongthai, rollout_path=C:\Users\user\.codex\sessions\2026\08\05\rollout-2026-08-05T15-09-43-019fd0c1-b541-70a2-8a56-ff613fcd1170.jsonl, updated_at=2026-08-05T07:16:02+00:00, thread_id=019fd0c1-b541-70a2-8a56-ff613fcd1170)

### keywords

- floorplanstatistics, table.vue, reserved, red seat, @click, @pointerdown, modal

## Task 2: Cermin PHP localhost readiness check, partial

### rollout_summary_files

- rollout_summaries/2026-08-03T06-04-01-bI14-cermin_php_localhost_test_aborted.md (cwd=C:\Users\user\Desktop\cermin_v2, rollout_path=C:\Users\user\.codex\sessions\2026\08\03\rollout-2026-08-03T14-04-01-019fc638-d5a6-7730-8981-2b46478192aa.jsonl, updated_at=2026-08-03T06:05:57+00:00, thread_id=019fc638-d5a6-7730-8981-2b46478192aa, HTTP verification aborted)

### keywords

- localhost test, php -S, index.php, router.php, /skudai, /unknown, HTTP-404, An empty pipe element is not allowed

## User preferences

- when asking whether a seat—especially “the red seat”—does anything, explicitly cover normal and state-colored cases. [Task 1]

## Reusable knowledge

- `floorplanstatistics/table.vue` is display-only: no `@click`, `@pointerdown`, modal state, or detail handler; `reserved` red styling indicates absence from `availableSeat`. `floorplans/table.vue` is a separate editable interaction surface. [Task 1]
- Cermin is a PHP front-controller (`index.php`, `router.php`, `lib/`, `template/`), served from root with `php -S 127.0.0.1:8000 index.php`; lint and verify `/`, `/skudai`, `/skudai/home`, and `/unknown` (404). [Task 2]

## Failures and how to do differently

- For a small source behavior check, direct targeted searches beat a combined GitNexus/`rg` command that can fail merely on no matches. [Task 1]
- A detached server is not a successful localhost test. The prior check was user-aborted before statuses; inspect port/PHP processes then issue individual HTTP requests. Use simple sequential PowerShell commands to avoid `An empty pipe element is not allowed`. [Task 2]

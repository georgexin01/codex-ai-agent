# Task Group: `.codex` repository recovery, routing, and safe maintenance

scope: Recover missing Codex content, maintain routing/hot memory, and diagnose Git or PowerShell workflow issues without destructive resets.
applies_to: cwd=C:\Users\user\.codex; reuse_rule=reuse for this Codex repository/worktree; re-check current Git state, counts, and generated routing before acting.

## Task 1: Recover missing memories and skills; disable sparse checkout

### rollout_summary_files

- rollout_summaries/2026-10-08T01-40-56-1R8h-codex_sparse_checkout_recovery_and_powershell_alert.md (cwd=C:\Users\user\.codex, rollout_path=\\?\C:\Users\user\.codex\sessions\2026\10\08\rollout-2026-10-08T09-40-56-01a1192b-b085-75e1-a18b-2d3afb096a9d.jsonl, updated_at=2026-10-08T07:03:57+00:00, thread_id=01a1192b-b085-75e1-a18b-2d3afb096a9d, verified recovery)

### keywords

- sparse-checkout, skip-worktree, git sparse-checkout disable, core.sparseCheckout, TRACKED_ABSENT, memories, skills, .githooks/pre-commit

## Task 2: Lean routing and hot-memory maintenance

### rollout_summary_files

- rollout_summaries/2026-08-12T07-57-58-bZCY-codex_lean_maintenance_and_memory_compression.md (cwd=C:\Users\user\.codex, rollout_path=C:\Users\user\.codex\sessions\2026\08\12\rollout-2026-08-12T15-57-58-019ff4fa-668d-74d2-bc92-64724b087b5c.jsonl, updated_at=2026-08-12T08:30:52+00:00, thread_id=019ff4fa-668d-74d2-bc92-64724b087b5c, validated maintenance)
- rollout_summaries/2026-09-04T01-18-24-1Zuq-codex_boot_and_localhost_test_blocked.md (cwd=C:\Users\user\.codex, rollout_path=C:\Users\user\.codex\sessions\2026\09\04\rollout-2026-09-04T09-18-24-01a069fe-d709-7e00-b7e6-2069c0077bea.jsonl, updated_at=2026-09-04T01:19:08+00:00, thread_id=01a069fe-d709-7e00-b7e6-2069c0077bea, boot contract)

### keywords

- 00_PULSE.md, ai read .codex knowledge, [🟢] Agent is Ready.., HYDRATE GROUND PLAN ACT VERIFY, Update-CodexRouting.ps1, Audit-CodexRouting.ps1, MEMORY_DETAILS.md

## Task 3: Git staging and generated-images cleanup

### rollout_summary_files

- rollout_summaries/2026-08-20T01-54-45-Rl4o-codex_git_sparse_checkout_and_generated_images_cleanup.md (cwd=C:\Users\user\.codex, rollout_path=\\?\C:\Users\user\.codex\sessions\2026\08\20\rollout-2026-08-20T09-54-45-01a01ce0-bb0d-76b1-898a-dabc3ae2eddc.jsonl, updated_at=2026-08-20T08:30:33+00:00, thread_id=01a01ce0-bb0d-76b1-898a-dabc3ae2eddc, historical sparse-checkout state)

### keywords

- git add --sparse, thread-writer-locks, generated_images, RecycleOption::SendToRecycleBin, memories/.git, git status, cc66c6a

## Task 4: Distinguish PowerShell web-request warning from Codex approval

### rollout_summary_files

- rollout_summaries/2026-10-08T01-40-56-1R8h-codex_sparse_checkout_recovery_and_powershell_alert.md (cwd=C:\Users\user\.codex, rollout_path=\\?\C:\Users\user\.codex\sessions\2026\10\08\rollout-2026-10-08T09-40-56-01a1192b-b085-75e1-a18b-2d3afb096a9d.jsonl, updated_at=2026-10-08T07:03:57+00:00, thread_id=01a1192b-b085-75e1-a18b-2d3afb096a9d, verified diagnosis)

### keywords

- Invoke-WebRequest, Security Warning: Script Execution Risk, UseBasicParsing, PowerShell 5.1, Codex approval

## User preferences

- When files appear missing, the user wanted the actual cause and safe recovery rather than a generic reset -> inspect evidence first and avoid destructive reset/restore operations. [Task 1]
- When asking for sparse checkout to be disabled “permenent,” the user wanted confirmation that memories and skills would not disappear again -> state the verified setting and protection boundary; do not promise an absolute guarantee against future explicit changes. [Task 1]
- When requesting maintenance, the user said “wont make heavy changes to it” -> prefer reversible, surgical changes that preserve routes, skills, secrets, and repository state. [Task 2]

## Reusable knowledge

- If tracked Codex files seem deleted, first compare `git config --bool core.sparseCheckout`, `git ls-files`, and `Test-Path`: sparse checkout can omit tracked content while preserving it in Git. `git sparse-checkout disable` was verified to materialize all tracked files and `.githooks/pre-commit` rejects enabled sparse checkout. [Task 1]
- `00_PULSE.md` is the authoritative boot contract. For the exact trigger `ai read .codex knowledge`, return only `[🟢] Agent is Ready..`; hydrate once, then use route-first, task-specific reads. [Task 2]
- After route/index changes, refresh generated data with `codex-router/Update-CodexRouting.ps1 -Quiet`; validate routing and activation rather than trusting file edits. The prior maintenance run passed routing audit, performance 32/32, activation 18/18, and compression preservation. [Task 2]
- For this parent repository, review `git status` before staging. The historical sparse workaround was `git add --sparse -A -- . ':!thread-writer-locks/**'`; runtime lock files should remain excluded. If a destructive directory cleanup is necessary and permitted, Recycle Bin deletion is recoverable. [Task 3]
- The PowerShell 5.1 alert “Security Warning: Script Execution Risk” is not a Codex approval prompt. Use `Invoke-WebRequest -UseBasicParsing` for web requests; do not recommend permanently accepting full HTML parsing. [Task 4]

## Failures and how to do differently

- Symptom: files are unreadable/missing. Cause: they may be skipped by sparse checkout, not deleted. Fix: inspect sparse state and tracked presence before searching backups or resetting. [Task 1]
- Symptom: knowledge validation fails. Cause: pre-existing nested `memories/.git` (and historically a secret-like pattern) remains. Fix: do not alter nested Git metadata or expose sensitive content without explicit approval. [Task 1][Task 2]
- Symptom: a large Markdown patch or output snapshot fails/truncates. Fix: inspect exact encoding/context, use small patches or controlled replacements, then verify headings, route counts, and detail coverage. [Task 2]
- Symptom: localhost test runs from `.codex` and finds no app. Fix: obtain the actual application root before discovery; process startup alone is not readiness—HTTP-check expected URLs. [Task 2]

# Task Group: Zeta Software bilingual static-site maintenance and performance

scope: Maintain the English/Simplified-Chinese static site, generated detail pages, visual/content parity, localhost verification, and performance work.
applies_to: cwd=D:\backup\website-zetasoftware; reuse_rule=reuse only for this static bilingual checkout; preserve English structure/design and update corresponding `cn/` output unless the request explicitly narrows scope.

## Task 1: FAQ, homepage blogs, workflow labels, and services pricing parity

### rollout_summary_files

- rollout_summaries/2026-08-13T09-01-30-FmzH-zetasoftware_bilingual_faq_homepage_blogs_pricing_parity.md (cwd=D:\backup\website-zetasoftware, rollout_path=C:\Users\user\.codex\sessions\2026\08\13\rollout-2026-08-13T17-01-30-019ffa5a-eb3e-7172-8f41-7b65c41c8a95.jsonl, updated_at=2026-08-13T09:54:49+00:00, thread_id=019ffa5a-eb3e-7172-8f41-7b65c41c8a95, verified bilingual changes)

### keywords

- data/faq.json, js/faq.js, FAQPage JSON-LD, home-blogs.js, blogs.json, blogs-cn.json, pricing-section, Orbitron, services/index.html, status.md, meta.md

## Task 2: Static localhost verification, Lighthouse work, and incomplete image migration

### rollout_summary_files

- rollout_summaries/2026-09-04T01-20-03-IpkW-zeta_static_site_localhost_performance_image_loading.md (cwd=D:\backup\website-zetasoftware, rollout_path=\\?\C:\Users\user\.codex\sessions\2026\09\04\rollout-2026-09-04T09-20-03-01a06a00-5a37-7e72-bbbc-b6b33c856356.jsonl, updated_at=2026-09-07T05:56:45+00:00, thread_id=01a06a00-5a37-7e72-bbbc-b6b33c856356, partial—JPG migration unfinished)

### keywords

- localhost test, php -S 127.0.0.1:8080, Lighthouse, WebP, data-src, IntersectionObserver, images/mobile, images/website, apply-body-image-lazyload.js, style.min.css, .htaccess

## Task 3: Generated navigation, description formatting, cache, main-thread, and CSS minification

### rollout_summary_files

- rollout_summaries/2026-09-07T05-57-20-zPhy-zeta_website_project_audit_navigation_content_performance.md (cwd=D:\backup\website-zetasoftware, rollout_path=C:\Users\user\.codex\sessions\2026\09\07\rollout-2026-09-07T13-57-20-01a07a71-4c56-70b0-a1e2-b8a02742ecb4.jsonl, updated_at=2026-09-07T09:41:02+00:00, thread_id=01a07a71-4c56-70b0-a1e2-b8a02742ecb4, partial—CSS final verification incomplete)

### keywords

- generate-standard-internal-management-pages.js, update-site-navigation.js, nav-links, format-detail-content.js, long-form-intros.js, clean-css-cli, Cloudflare cache, main.js, Lucide, GSAP, Lenis

## User preferences

- For bilingual edits, the user expects paired English/Chinese records and project tracking updates, not English-only completion; quantify requested proportions and preserve stable paired IDs. [Task 1]
- When providing screenshots and asking for the “exact same design,” treat the screenshot plus the corresponding homepage markup/CSS as source of truth and inspect both language pages. [Task 1]
- For `localhost test`, detect the project runtime, start only the needed server, and verify actual URLs rather than treating process startup as success. [Task 2]
- The user specified body images as `data-src="..."` plus a 1×1 SVG `src`, excluding project logo, icon, `zcapital2`, `logo-zeta`, header, and footer; do not broaden lazy loading beyond that contract. [Task 2]
- When restoring a missing header/menu, the user emphasized not removing unrequested content; preserve descriptions, images, CSS, routes, and page content in narrow fixes. [Task 3]
- For descriptions, “merge back some suitable” endings and reduce about 50–100 words -> use natural groups, not artificial line breaks after every sentence. [Task 3]
- When asked to update only the minified counterpart, keep the change narrowly scoped—no HTML, JavaScript, layout, or content edits. [Task 3]

## Reusable knowledge

- English markup/design is the source for bilingual work; `cn/` must preserve structure while localizing visible content. Project truth and source maps include `README.md`, `status.md`, `meta.md`, `scripts/seo-config.js`, `scripts/update-site-navigation.js`, generators, data files, `long-form-intros.js`, and `format-detail-content.js`. [Task 3]
- `js/faq.js` loads `/data/faq.json` by `/cn/` path and refreshes visible FAQ plus FAQPage JSON-LD. Validate JSON parsing, unique counts, paired IDs, and title changes in each language. [Task 1]
- Homepage latest blogs use `js/home-blogs.js`: choose localized dataset, sort date descending, take three, escape text, render links, refresh Lucide icons, and retain the exact card/CTA class contract. [Task 1]
- This checkout is static (no package manifest/Vite/PHP entry); use `php -S 127.0.0.1:8080 -t <workspace>` and HTTP-check representative English/CN, blog, legal, robots, and sitemap routes. Browser visual QA and production deployment are separate. [Task 2]
- SIM generation must invoke `require("./update-site-navigation");` after generation; regenerate both hubs and all language detail pages, then assert non-empty desktop/mobile nav and exactly one active SIM state. [Task 3]
- For cache policy: versioned CSS/JS (and versioned images) can use `public, max-age=31536000, immutable`; replaceable unversioned images should use about 30 days; HTML should revalidate. Cloudflare browser-cache settings can override origin headers. [Task 3]
- Main-thread suggestions are hypotheses until traced: profile mobile-throttled `Evaluate Script`, `Recalculate Style/Layout`, `Animation Frame Fired`, and `Image Decode`; likely first targets are global `main.js`, broad Lucide loading, optional animation loops, repeated observers, and repeated `lucide.createIcons()`. [Task 3]

## Failures and how to do differently

- Symptom: large FAQ patch seems complete but data is invalid or one language lags. Fix: parse JSON; check duplicate and paired IDs, counts, and both-language title changes before reporting. Use UTF-8-safe/escaped checks for Chinese. [Task 1]
- Symptom: service typography still differs although shared CSS uses `var(--font-heading)`. Cause: pages do not load the Google Fonts stylesheet. Fix: align markup and explicitly load the same Plus Jakarta Sans/Orbitron/Space Mono URL in both pages; manually hard refresh for final visual confirmation when browser automation is absent. [Task 1]
- Symptom: local Lighthouse reports missing Apache compression/cache. Cause: PHP/http-server does not apply `.htaccess`. Fix: report these as production-only verification items. [Task 2]
- Symptom: mobile/website asset migration appears ready. It is not: JPG canonicalization, reference rewrites, and WebP deletion were interrupted. Before deleting anything, resolve HTML/JS/JSON/CSS references (including root-relative paths), ensure JPGs exist, route-check images, and verify actual `IntersectionObserver` behavior including dynamically inserted images. [Task 2]
- Symptom: minified CSS has been written but completion is claimed. Fix: rerun clean independent hash/idempotence, served-file HTTP 200, selector, and `git diff --check` tests; final verification was interrupted. [Task 3]

# Task Group: Used-Car Vue/Supabase project understanding, local verification, and loan-card edits

scope: Navigate the Used-Car client, distinguish authoritative schema sources, run the correct local build, and make narrowly scoped saved-loan UI changes.
applies_to: cwd=C:\Users\user\Desktop\used-car (active app C:\Users\user\Desktop\used-car\template); reuse_rule=checkout-specific; verify current docs/source because the external admin repo and live schema were unavailable.

## Task 1: Project audit, SQL source boundary, localhost, and saved-loan reversal

### rollout_summary_files

- rollout_summaries/2026-08-27T07-28-15-vpVJ-used_car_project_audit_localhost_sql_loan_card_revision.md (cwd=C:\Users\user\Desktop\used-car, rollout_path=\\?\C:\Users\user\.codex\sessions\2026\08\27\rollout-2026-08-27T15-28-15-01a0421e-939f-7453-b375-f3a5f387b2a7.jsonl, updated_at=2026-08-28T09:08:56+00:00, thread_id=01a0421e-939f-7453-b375-f3a5f387b2a7, verified app/UI work; live schema unknown)

### keywords

- PROJECT_CONTEXT.md, LOCAL-SEARCH-MAP.md, template/, Vue 3, ViteSSG, Pinia, Supabase, _archived migrations, admin-panel-used-car, dev:local, development.localhost, Favorites.vue, MyLoans.vue, 精准报价

## User preferences

- When asked to “read and understand my project ... all folder and .md,” provide source-grounded understanding and inspect project-owned Markdown comprehensively; treat `sample/` and screenshots as reference-only. [Task 1]
- For targeted UI changes and reversals (“both cards pages”), make surgical edits and inspect both `Favorites.vue` and `MyLoans.vue`; preserve existing card data and unrelated contact behavior. [Task 1]
- When contact behavior is requested, reuse existing `dealers.info`/environment fallback and WhatsApp conventions rather than inventing contact data. [Task 1]

## Reusable knowledge

- `PROJECT_CONTEXT.md` is the primary truth map; current source/runtime evidence outranks README or historical handoff. The app root `template/` is Vue 3, Vite, TypeScript, Tailwind v4, Pinia, Vue Router, vue-i18n (`zh/en/ms`), ViteSSG, PWA, and Supabase; flow is views → Pinia stores → Supabase services → `cars` schema. [Task 1]
- Never provision from `template/src/sql/migrations/_archived/`: `template/src/sql/migrations/README.md` says the authoritative migrations were in external `D:\admin-panel-used-car\apps\web-antd\src\sql\migrations\` and that repo/live schema was not available. Treat current schema truth as `INSUFFICIENT DATA`. [Task 1]
- Start locally from `template/` with `pnpm.cmd run dev:local`; successful verification used `http://127.0.0.1:3000` on `/`, `/home`, `/cars`, `/cars/brands`, `/profile/about`, and `/articles`. [Task 1]
- Saved-loan cards live in `template/src/views/favorites/Favorites.vue` and `template/src/views/profile/MyLoans.vue`. The `精准报价` button and unused `LoanContactSheet.vue` were removed; preserve `RM... / 月`, price, down payment, term, rate, saved date, and delete action. [Task 1]

## Failures and how to do differently

- Symptom: default SSG build reports `Error: supabaseUrl is required.` Cause: local environment values are not injected. Fix: use `pnpm.cmd exec vite build --mode development.localhost` for local verification and never print keys. Type-check still had pre-existing errors; do not claim type-clean. [Task 1]
- Symptom: files look absent or `rg` syntax fails. Fix: run from `template/` or use absolute paths; keep PowerShell/ripgrep quoting simple and avoid wildcard paths. [Task 1]

# Task Group: Huwa2 VPS Supabase backup restore and PostgREST exposure

scope: Repair an inconsistent Huwa2 backup, restore it atomically to local Supabase, and expose its schema through the CLI-managed API stack.
applies_to: cwd=C:\Users\user\Documents\supabase-project-backup-restore; reuse_rule=backup/version-specific; preserve originals and validate current backup data before modifying or restoring.

## Task 1: Repair, restore, and expose `huwa2`

### rollout_summary_files

- rollout_summaries/2026-08-14T02-47-47-8IL6-huwa2_vps_restore_and_postgrest_expose.md (cwd=C:\Users\user\Documents\supabase-project-backup-restore, rollout_path=\\?\C:\Users\user\.codex\sessions\2026\08\14\rollout-2026-08-14T10-47-47-019ffe2b-21d6-7ff2-9bea-6cfa6ab17768.jsonl, updated_at=2026-08-14T03:10:24+00:00, thread_id=019ffe2b-21d6-7ff2-9bea-6cfa6ab17768, validated restore)

### keywords

- huwa2, 04-auth-rows.sql, auth.users, auth.identities, identities_user_id_fkey, orphan identities, 04-restore-local.sh, PGRST_DB_SCHEMAS, [api].schemas, config.toml, Supabase CLI

## User preferences

- The user wanted the VPS-backed `huwa2` project locally while preserving the original backup and protected local database state -> repair only a working copy, use atomic restore, back up config, and avoid unrelated resets. [Task 1]
- The user asked for localhost access, which requires separately proving database restoration and API schema exposure. [Task 1]

## Reusable knowledge

- Validate every `auth.identities.user_id` against `auth.users.id` before restore. The recorded backup had 8 users, 26 identities, and 10 orphans; preserve the original, repair the working SQL, then validate `users=18 identities=26 orphan_ids=0`. Recovered records may not authenticate because source phone/password data was incomplete. [Task 1]
- `scripts/04-restore-local.sh` is transactional; after repair it restored the schema, storage policy, 85 objects, and intentionally skipped existing edge functions. Use the available Git Bash at `C:\Program Files (x86)\Git\bin\bash.exe` if the common path is missing. [Task 1]
- This local stack is Supabase CLI-managed, not Compose-managed. Add `"huwa2"` under `[api].schemas` in `C:\Users\user\Documents\local-supabase\supabase\config.toml`, back it up first, then `supabase stop/start --workdir ...` without resetting volumes; verify live `PGRST_DB_SCHEMAS`. [Task 1]

## Failures and how to do differently

- Symptom: `identities_user_id_fkey` during restore. Cause: backup rows are internally inconsistent, not restore ordering. Fix: do not retry unchanged; validate and repair parent rows first. [Task 1]
- Symptom: `Could not locate compose file for 'supabase_rest_local-supabase'`. Cause: expose script assumes Compose labels. Fix: detect `com.supabase.cli.project`, update CLI `config.toml`, and restart via Supabase CLI. [Task 1]

# Task Group: Windows Chrome SideBySide startup repair

scope: Diagnose a Chrome shortcut that targets an existing executable but fails after an incomplete Chrome update.
applies_to: cwd=C:\Users\user\Desktop\used-car; reuse_rule=machine/version-specific; inspect the installed Chrome version, event log, and pending files before any elevated replacement.

## Task 1: Repair broken Chrome launchers after incomplete update

### rollout_summary_files

- rollout_summaries/2026-08-27T01-14-49-nqVw-repair_chrome_side_by_side_startup_error.md (cwd=C:\Users\user\Desktop\used-car, rollout_path=C:\Users\user\.codex\sessions\2026\08\27\rollout-2026-08-27T09-14-50-01a040c8-b2ca-73e0-9fcf-88af85530a0e.jsonl, updated_at=2026-08-27T01:18:15+00:00, thread_id=01a040c8-b2ca-73e0-9fcf-88af85530a0e, verified repair)

### keywords

- Chrome, SideBySide, Dependent Assembly, new_chrome.exe, new_chrome_proxy.exe, 151.0.7922.173, 151.0.7922.175, elevated PowerShell

## User preferences

- When the user asks “can ai fix this problem for me?”, investigate and safely repair the issue rather than offering generic instructions. [Task 1]

## Reusable knowledge

- A valid shortcut plus a SideBySide missing assembly points to an executable-update issue, not a shortcut problem. Inspect versioned directories, pending `new_chrome*` files, and registry version. [Task 1]
- In the recorded repair, complete `151.0.7922.175` pending launchers replaced broken `151.0.7922.173` only after elevated version-checked backup/copy. Verify both launcher file versions and an actual Chrome process launch; `chrome.exe --version` can just launch the browser. [Task 1]

## Failures and how to do differently

- Do not recreate the shortcut when its executable exists and SideBySide identifies the missing assembly. If the bundled installer exits nonzero, use a narrowly scoped replacement only after confirming newer complete files and preserving the old launchers. [Task 1]

# Task Group: Evidence-bound metadata and site.webmanifest guidance

scope: Maintain reusable website metadata instructions without leaking historical project identities or making unsupported SEO/manifest claims.
applies_to: cwd=C:\Users\user\Desktop\ai comment; reuse_rule=reuse the guidance pattern across web projects, but derive every identity, scope, URL, asset, and claim from the active project.

## Task 1: Generalize metadata identity and manifest rules

### rollout_summary_files

- rollout_summaries/2026-08-10T04-13-53-hwPl-project_agnostic_metadata_and_webmanifest_guidance.md (cwd=C:\Users\user\Desktop\ai comment, rollout_path=\\?\C:\Users\user\.codex\sessions\2026\08\10\rollout-2026-08-10T12-13-53-019fe9e0-8772-7143-8b6b-11cc8a866137.jsonl, updated_at=2026-08-10T04:22:20+00:00, thread_id=019fe9e0-8772-7143-8b6b-11cc8a866137, verified instruction update)

### keywords

- (AI) metaTitle.txt, SEO metadata, project identity, INSUFFICIENT DATA, site.webmanifest, Open Graph, JSON-LD, Select-String -LiteralPath

## User preferences

- The user asked for the “actual project name user are working on rightnow,” not prior names -> inspect active project files, visible brand, config, routes, metadata, and runtime evidence; preserve exact confirmed spelling/legal suffix. [Task 1]
- The user asked to avoid narrow “car, door, hotel” wording and requested “more globe or area larger things” -> use the broadest accurate category/market/region scope supported by evidence; never invent global reach. [Task 1]
- The user wanted centralized metadata and asked to include a `site.webmanifest` reminder -> use the project’s metadata architecture and keep manifest identity synchronized when it is an installable app. [Task 1]

## Reusable knowledge

- `(AI) metaTitle.txt` requires `INSUFFICIENT DATA` when identity cannot be confirmed and forbids copying company names, domains, URLs, social accounts, locations, colors, page filenames, or claims from examples/history. Detail pages may use confirmed item/article names; category/home pages may use broad confirmed offerings. [Task 1]
- Manifest fields `name`, `short_name`, `description`, `lang`, `id`, `start_url`, `scope`, `display`, colors, and icon paths/MIME/sizes must be evidence-based and consistent with HTML metadata, Open Graph, favicon, visible brand, and JSON-LD. Do not create a manifest solely for SEO. [Task 1]

## Failures and how to do differently

- `rg --literal-path` is unsupported in this environment; use PowerShell `Select-String -LiteralPath` for an exact-file scan. In a non-Git workspace, use read-back and targeted scans instead of `git diff`. [Task 1]

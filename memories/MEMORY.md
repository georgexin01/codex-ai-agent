# Task Group: XHS/TikTok inbox Telegram preview
scope: Vue mock-chat preview orientation, Telegram timeline/date behavior, and upload UI; preserve TikTok/XHS isolation.
applies_to: cwd=D:\project\xhs-tiktok-inbox; reuse_rule=use only after reconciling stale PROJECT_CONTEXT.md with current PhonePreview.vue/source.

## Task 1: Telegram date dividers, sticky-date cycling, and time-only notices

### rollout_summary_files

- rollout_summaries/2026-10-15T02-12-32-It36-fix_time_only_telegram_date_markers.md (cwd=D:\project\xhs-tiktok-inbox, rollout_path=C:\Users\user\.codex\sessions\2026\10\15\rollout-2026-10-15T10-12-33-01a13d55-251d-7450-85cd-b5903ba42304.jsonl, updated_at=2026-10-15T04:28:02+00:00, thread_id=01a13d55-251d-7450-85cd-b5903ba42304)
- rollout_summaries/2026-10-15T01-08-25-vGYm-telegram_sticky_date_click_cycle.md (cwd=D:\project\xhs-tiktok-inbox, rollout_path=C:\Users\user\.codex\sessions\2026\10\15\rollout-2026-10-15T09-08-26-01a13d1a-7276-78d0-8c19-27b3dca280ee.jsonl, updated_at=2026-10-15T01:49:31+00:00, thread_id=01a13d1a-7276-78d0-8c19-27b3dca280ee, browser behavior unverified)
- rollout_summaries/2026-10-13T10-15-27-ekZ9-telegram_date_divider_sequence_and_sticky_history.md (cwd=D:\project\xhs-tiktok-inbox, rollout_path=C:\Users\user\.codex\sessions\2026\10\13\rollout-2026-10-13T18-15-33-01a134c2-8b36-70d0-b2ec-ded39973bf8f.jsonl, updated_at=2026-10-14T02:30:41+00:00, thread_id=01a134c2-8b36-70d0-b2ec-ded39973bf8f)

### keywords

- PhonePreview.vue, Telegram, stickyHistoryDate, historyDates, cycleStickyHistoryDate, getNoticeHistoryTimestamp, time-only, date divider, npm run build

## Task 2: Global upload image sizing tiers

### rollout_summary_files

- rollout_summaries/2026-10-12T06-24-02-dlD6-all_tabs_upload_image_sizing_tiers_popup.md (cwd=D:\project\xhs-tiktok-inbox, rollout_path=C:\Users\user\.codex\sessions\2026\10\12\rollout-2026-10-12T14-24-03-01a12ec8-5255-7ad1-8475-8fb42dfceea4.jsonl, updated_at=2026-10-12T06:59:26+00:00, thread_id=01a12ec8-5255-7ad1-8475-8fb42dfceea4)

### keywords

- image sizing, all tabs, upload, tiers, popup, UnifiedSettings.vue, PhonePreview.vue

## User preferences

- when changing the preview, the user scoped it to “Telegram/date behavior” and asked that scrolling remain intact -> keep Telegram-only branches isolated and add interaction beside, not instead of, scroll logic. [Task 1]
- when the visible date should stay centered under the header while scrolling, treat the screenshot behavior as an acceptance criterion; do not declare it visually correct without scrolling QA. [Task 1]

## Reusable knowledge

- The app is a Vue 3 + Vite JavaScript mock chat generator: App.vue owns shared state, UnifiedSettings.vue edits it, and PhonePreview.vue renders previews; it is not a real inbox/backend. [Task 1]
- In PhonePreview.vue, explicit dates retain their parsing; `HH:MM` values matching `/^\\d{1,2}:\\d{2}$/` represent the current real-world local date. [Task 1]
- Sticky cycling uses distinct history dates newest-to-oldest and wraps; production build and `git diff --check` passed, but manual Telegram click/scroll QA remains a separate gate. [Task 1]

## Failures and how to do differently

- Symptom: timeline order derives an October 14 label before the explicit October 8 divider -> cause: per-message timestamp derivation; fix: use explicit divider dates as section boundaries and first-notice history date for pre-divider messages. [Task 1]
- Symptom: a build changes `dist/index.html` bundle references -> inspect generated artifacts before committing; a passing build is not proof of visual interaction. [Task 1]

# Task Group: VIPBillion public website and booking flow
scope: PHP bilingual public-site CTA, booking preselection/prefill, and exact-scope UI work.
applies_to: cwd=D:\project\VIPBillion\website-vipbillion; reuse_rule=inspect dirty status and exact shared template source before editing; do not apply admin conventions blindly to public PHP.

## Task 1: Homepage/services quote CTA and booking prefill

### rollout_summary_files

- rollout_summaries/2026-10-15T02-49-20-z2H4-vipbillion_home_hero_h1_and_booking_cta.md (cwd=D:\project\VIPBillion\website-vipbillion, rollout_path=C:\Users\user\.codex\sessions\2026\10\15\rollout-2026-10-15T10-49-20-01a13d76-d6b9-7812-aae5-4818b0a53cde.jsonl, updated_at=2026-10-15T08:37:27+00:00, thread_id=01a13d76-d6b9-7812-aae5-4818b0a53cde)

### keywords

- template/booking.php, booking-prefill-session.php, nav.get_quote, service_interest, preselectServiceRoute, fillVehicleOptions, PHP session, php -l

## Task 2: Missed header “View Our Services” CTA request

### rollout_summary_files

- rollout_summaries/2026-10-15T08-40-58-GbCk-vipbillion_header_cta_request_missed.md (cwd=D:\project\VIPBillion\website-vipbillion, rollout_path=C:\Users\user\.codex\sessions\2026\10\15\rollout-2026-10-15T16-40-58-01a13eb8-c451-7ba1-8551-d173ae1acf74.jsonl, updated_at=2026-10-15T09:58:21+00:00, thread_id=01a13eb8-c451-7ba1-8551-d173ae1acf74, failed scope adherence)

### keywords

- View Our Services, Get a Quote, /booking, lib/header.php, index.php, template/booking.php, header CTA, request missed

## User preferences

- when the user said “read and understand my product first include .md then update below” and requested `View Our Services` → `Get a Quote` to `/booking`, inspect relevant Markdown/source, then make exactly that header change; an attached screenshot does not override explicit text. [Task 2]
- when the user requested “increase text size 4-5px”, weight 500, and theme green, preserve narrowly scoped visual edits and use existing tokens such as `var(--main-color)`. [Task 1]
- the user selected “30 天（推荐）” -> use 30-day retention for isolated booking prefill, not browser-cookie application state. [Task 1]

## Reusable knowledge

- `index.php` routes `/booking` to `template/booking.php`; shared header code is under `lib/header.php` or included partials. Search exact displayed wording before patching. [Task 2]
- Service CTAs pass `?service=<slug>`; only a unique normalized service/route match preselects route. Otherwise leave route selection to the user. Vehicle default is lowest positive-priced, non-consultation, non-Bus option. [Task 1]
- `lib/booking-prefill-session.php` holds only name, phone, departure and arrival in a separate server-side session with 30-day TTL; escape values on render and save before insertion so a failed booking can refresh prefill. [Task 1]

## Failures and how to do differently

- Symptom: screenshot interpretation points to a different UI than explicit text -> cause: task drift; fix: re-anchor on the requested label, source and route, patch only that source, then lint/read back/test navigation. [Task 2]
- Normal public-page browser requests record visits; use a non-visitor-counting harness before claiming end-to-end visual/runtime success. [Task 1]

# Task Group: Lion Rider orientation, storefront, and admin boundary
scope: project handoff, PHP/JSON storefront, spare-parts behavior, and separate Vben/Supabase admin.
applies_to: cwd=D:\project\lionrider; reuse_rule=separate lionrider-website from admin-panel-lionrider; inspect existing dirty website changes first.

## Task 1: Project handoff, account sidebar, spare-parts and localhost

### rollout_summary_files

- rollout_summaries/2026-10-13T06-16-33-OhXB-lionrider_project_handoff_spareparts_localhost_test.md (cwd=D:\project\lionrider\lionrider-website, rollout_path=C:\Users\user\.codex\sessions\2026\10\13\rollout-2026-10-13T14-16-33-01a133e7-d37a-7312-a72b-4b6feafda2c3.jsonl, updated_at=2026-10-14T02:30:50+00:00, thread_id=01a133e7-d37a-7312-a72b-4b6feafda2c3)
- rollout_summaries/2026-10-13T06-12-43-M5EQ-lionrider_account_mobile_sidebar_and_project_handoff.md (cwd=D:\project\lionrider, rollout_path=C:\Users\user\.codex\sessions\2026\10\13\rollout-2026-10-13T14-12-43-01a133e4-51b0-7453-b814-ec4392e2bdd8.jsonl, updated_at=2026-10-14T09:53:24+00:00, thread_id=01a133e4-51b0-7453-b814-ec4392e2bdd8)

### keywords

- lionrider-website, PHP, product.json, spareparts-models.json, mobile sidebar, Spare Parts finder, localhost, Vben admin, schema lionrider

## Task 2: Incomplete all-Markdown orientation

### rollout_summary_files

- rollout_summaries/2026-10-14T02-12-43-ymqp-lionrider_markdown_orientation_partial.md (cwd=D:\project\lionrider, rollout_path=C:\Users\user\.codex\sessions\2026\10\14\rollout-2026-10-14T10-12-43-01a1382e-f2e0-7553-aae2-50891763274d.jsonl, updated_at=2026-10-14T09:44:38+00:00, thread_id=01a1382e-f2e0-7553-aae2-50891763274d, partial)

### keywords

- PROJECT_CONTEXT.md, BLUEPRINT.md, status.md, AGENTS.md, CLAUDE.md, SUPABASE.md, documentation drift, 341 products

## User preferences

- when the user asks to understand “my project and all .md”, treat completeness literally; do not report success after only front-door documents. [Task 2]

## Reusable knowledge

- Website is PHP/JSON and has no Supabase connection; the Vben admin uses shared Docker-local Supabase schema `lionrider`. Current fixture has 341 products (317 accessories, 24 spareparts); demo fitment/prices are illustrative. [Task 2]
- `knowledge.md` is FC-Moto material and conflicts with Lion Rider truth; exclude it. Current source/newest dated status outrank stale docs that still say 317 products. [Task 2]

## Failures and how to do differently

- The root is not Git but `lionrider-website` is, with pre-existing modifications; do not modify it before preserving/inspecting its status. [Task 2]

# Task Group: Zeta Software bilingual static website
scope: English/CN parity, static generation, performance, cleanup, SEO and local HTTP verification.
applies_to: cwd=D:\backup\website-zetasoftware; reuse_rule=English is markup/design source and cn/ is localized counterpart; read status.md and current source before relying on older notes.

## Task 1: Bilingual content/design parity and generated navigation

### rollout_summary_files

- rollout_summaries/2026-08-13T09-01-30-FmzH-zetasoftware_bilingual_faq_homepage_blogs_pricing_parity.md (cwd=D:\backup\website-zetasoftware, rollout_path=C:\Users\user\.codex\sessions\2026\08\13\rollout-2026-08-13T17-01-30-019ffa5a-eb3e-7172-8f41-7b65c41c8a95.jsonl, updated_at=2026-08-13T09:54:49+00:00, thread_id=019ffa5a-eb3e-7172-8f41-7b65c41c8a95)
- rollout_summaries/2026-09-07T05-57-20-zPhy-zeta_website_project_audit_navigation_content_performance.md (cwd=D:\backup\website-zetasoftware, rollout_path=C:\Users\user\.codex\sessions\2026\09\07\rollout-2026-09-07T13-57-20-01a07a71-4c56-70b0-a1e2-b8a02742ecb4.jsonl, updated_at=2026-09-07T09:41:02+00:00, thread_id=01a07a71-4c56-70b0-a1e2-b8a02742ecb4)

### keywords

- faq.json, js/faq.js, home-blogs.js, update-site-navigation, generate-standard-internal-management-pages, pricing-section, Orbitron, cn/

## Task 2: Static localhost/performance/lazy-load and cleanup

### rollout_summary_files

- rollout_summaries/2026-10-12T02-32-50-FulX-zeta_website_cleanup_mail_host_seo_audit.md (cwd=D:\backup\website-zetasoftware, rollout_path=C:\Users\user\.codex\sessions\2026\10\12\rollout-2026-10-12T10-32-50-01a12df4-a688-72d0-8aa6-dd792838fc51.jsonl, updated_at=2026-10-12T06:20:38+00:00, thread_id=01a12df4-a688-72d0-8aa6-dd792838fc51)
- rollout_summaries/2026-09-04T01-20-03-IpkW-zeta_static_site_localhost_performance_image_loading.md (cwd=D:\backup\website-zetasoftware, rollout_path=C:\Users\user\.codex\sessions\2026\09\04\rollout-2026-09-04T09-20-03-01a06a00-5a37-7e72-bbbc-b6b33c856356.jsonl, updated_at=2026-09-07T05:56:45+00:00, thread_id=01a06a00-5a37-7e72-bbbc-b6b33c856356, JPG/WebP migration incomplete)

### keywords

- php -S 127.0.0.1:8080, data-src, IntersectionObserver, images/mobile, images/website, WebP, JPG, .htaccess, mail host, canonical

## User preferences

- the user expects paired English/Chinese records, structure, visible text, and tracking updates; never report one-language completion without checking the counterpart. [Task 1]
- when asked for “exact same design”, use the supplied screenshot and existing homepage markup/CSS as active visual source of truth, not a look-alike redesign. [Task 1]
- for body images, the user specified `data-src` plus 1×1 SVG `src`, excluding logo/icon/header/footer; only delete the specified WebPs after reference/existence validation. [Task 2]

## Reusable knowledge

- Serve as static files with `php -S 127.0.0.1:8080 -t <workspace>`; HTTP 200 proves route serving, not browser visual, Apache cache/compression, or production behavior. [Task 2]
- Related skill: skills/zeta-bilingual-static-site/SKILL.md
- Generators must render shared navigation or invoke `require("./update-site-navigation");` after generation; otherwise generated SIM pages regress to empty menus. [Task 1]
- Parse JSON and check count, unique IDs, paired EN/CN IDs and title parity after content edits. `js/home-blogs.js` sorts localized JSON by date and renders latest three. [Task 1]

## Failures and how to do differently

- Symptom: bulk HTML/image transform works on relative paths but misses root-relative `images/...` -> resolve those from project root and audit malformed whitespace before attributes. [Task 2]
- Do not delete WebPs in `images/mobile`/`images/website`: JPG conversion was aborted after a ripgrep regex error. Use a robust reference scan across HTML, JS, JSON, CSS, validate JPEGs/routes, then limit deletion to the two folders. [Task 2]

# Task Group: .codex routing, memory, and Git recovery
scope: boot contract, routing performance, sparse-checkout recovery, and knowledge-tree maintenance.
applies_to: cwd=C:\Users\user\.codex; reuse_rule=current files/tests beat historical metrics; Git commands belong at the root repo, not memories/.

## Task 1: Boot, lean routing, and localhost boundary

### rollout_summary_files

- rollout_summaries/2026-10-08T01-40-56-1R8h-codex_sparse_checkout_recovery_and_powershell_alert.md (cwd=C:\Users\user\.codex, rollout_path=C:\Users\user\.codex\sessions\2026\10\08\rollout-2026-10-08T09-40-56-01a1192b-b085-75e1-a18b-2d3afb096a9d.jsonl, updated_at=2026-10-08T07:03:57+00:00, thread_id=01a1192b-b085-75e1-a18b-2d3afb096a9d)
- rollout_summaries/2026-08-12T07-57-58-bZCY-codex_lean_maintenance_and_memory_compression.md (cwd=C:\Users\user\.codex, rollout_path=C:\Users\user\.codex\sessions\2026\08\12\rollout-2026-08-12T15-57-58-019ff4fa-668d-74d2-bc92-64724b087b5c.jsonl, updated_at=2026-08-12T08:30:52+00:00, thread_id=019ff4fa-668d-74d2-bc92-64724b087b5c)
- rollout_summaries/2026-09-04T01-18-24-1Zuq-codex_boot_and_localhost_test_blocked.md (cwd=C:\Users\user\.codex, rollout_path=C:\Users\user\.codex\sessions\2026\09\04\rollout-2026-09-04T09-18-24-01a069fe-d709-7e00-b7e6-2069c0077bea.jsonl, updated_at=2026-09-04T01:19:08+00:00, thread_id=01a069fe-d709-7e00-b7e6-2069c0077bea)

### keywords

- 00_PULSE.md, ai read .codex knowledge, Agent is Ready, sparse-checkout, core.sparseCheckout, Audit-CodexRouting.ps1, memories/.git, Invoke-WebRequest -UseBasicParsing

## Task 2: Root Git and generated-image boundary

### rollout_summary_files

- rollout_summaries/2026-08-20T01-54-45-Rl4o-codex_git_sparse_checkout_and_generated_images_cleanup.md (cwd=C:\Users\user\.codex, rollout_path=C:\Users\user\.codex\sessions\2026\08\20\rollout-2026-08-20T09-54-45-01a01ce0-bb0d-76b1-898a-dabc3ae2eddc.jsonl, updated_at=2026-08-20T08:30:33+00:00, thread_id=01a01ce0-bb0d-76b1-898a-dabc3ae2eddc)

### keywords

- root Git only, generated_images, git add --sparse, thread-writer-locks, Recycle Bin, memories/.git

## User preferences

- when in full-access mode, avoid repetitive “Step X done — confirm or adjust?” prompts; continue obvious safe implementation, pausing only for a meaningful decision, hidden risk, destructive action, or ambiguous tradeoff. [ad-hoc note]
- `ai read .codex knowledge` is a small boot read, not a full-tree scan; wake only the relevant project skill family and re-check routing at each new request. [ad-hoc note]

## Reusable knowledge

- `00_PULSE.md` owns boot: exact `ai read .codex knowledge` returns only `[🟢] Agent is Ready..`; hydrate once, then use lazy task-specific reads. [Task 1]
- Related skill: skills/localhost-project-match/SKILL.md
- Missing tracked content may be sparse-checkout omission, not deletion: check `core.sparseCheckout`, `git ls-files`, and materialization before backups/reset. Verified guard is `git sparse-checkout disable` plus the pre-commit check; never promise absolute permanence. [Task 1]
- `C:\Users\user\.codex\.git` is the only Git repo for this tree. `memories/` is ordinary tracked content; never init/clone a nested repo. [ad-hoc note]
- Keep generated project assets out of `.codex/generated_images`; use the active project's asset folder and update consuming references. [ad-hoc note]

## Failures and how to do differently

- A localhost check from `.codex` found no app/listener. Rerun from the actual application root; a port/listener is not proof it serves the intended checkout. [Task 1]
- PowerShell 5.1 `Invoke-WebRequest` security warning is not a Codex approval prompt; use `-UseBasicParsing` where appropriate and do not broadly approve it. [Task 1]

# Task Group: Local Supabase backup/restore and protected Docker state
scope: Huwa2 restore/PostgREST exposure plus cross-project local Docker safety.
applies_to: cwd=C:\Users\user\Documents\supabase-project-backup-restore and C:\Users\user\Documents\local-supabase; reuse_rule=read-only inspection is safe; any stack/config/schema/state change needs explicit same-turn user permission unless a current task explicitly supplied it.

## Task 1: Huwa2 VPS backup repair and API exposure

### rollout_summary_files

- rollout_summaries/2026-08-14T02-47-47-8IL6-huwa2_vps_restore_and_postgrest_expose.md (cwd=C:\Users\user\Documents\supabase-project-backup-restore, rollout_path=C:\Users\user\.codex\sessions\2026\08\14\rollout-2026-08-14T10-47-47-019ffe2b-21d6-7ff2-9bea-6cfa6ab17768.jsonl, updated_at=2026-08-14T03:10:24+00:00, thread_id=019ffe2b-21d6-7ff2-9bea-6cfa6ab17768)

### keywords

- huwa2, auth.identities, identities_user_id_fkey, atomic restore, PostgREST, PGRST_DB_SCHEMAS, [api].schemas, local-supabase, config.toml

## User preferences

- the user treats local Docker/Supabase state as protected: never rename, stop, reset, prune, recreate, repoint, or modify stack/config/schema exposure without explicit permission in that turn. [ad-hoc note]

## Reusable knowledge

- Preserve original backup and repair only a working copy. Before restore, verify every `auth.identities.user_id` has a parent `auth.users.id`; failed atomic restore rolls back. [Task 1]
- Related skill: skills/local-supabase-protection/SKILL.md
- CLI-managed local stack uses `C:\Users\user\Documents\local-supabase\supabase\config.toml`, `[api].schemas`; update there rather than seeking Compose labels, then verify live `PGRST_DB_SCHEMAS`. [Task 1]
- For Angel/local web “empty” symptoms, treat env selection, runtime host detection and actual Supabase URL as one evidence chain; correct RLS alone does not prove access—check `information_schema.role_table_grants`. [ad-hoc note]

## Failures and how to do differently

- `scripts/06-expose-schema.sh` failed with `Could not locate compose file for 'supabase_rest_local-supabase'` because it assumed Compose. Detect `com.supabase.cli.project` and use CLI config. [Task 1]

# Task Group: Used-Car Vue/Supabase workflow
scope: project orientation, authoritative schema boundary, local Vite verification, and saved-loan UI edits.
applies_to: cwd=C:\Users\user\Desktop\used-car\template; reuse_rule=client archived SQL is not authoritative; external admin schema must be current and present before provisioning.

## Task 1: Audit, localhost, SQL boundary, and saved-loan iteration

### rollout_summary_files

- rollout_summaries/2026-08-27T07-28-15-vpVJ-used_car_project_audit_localhost_sql_loan_card_revision.md (cwd=C:\Users\user\Desktop\used-car, rollout_path=C:\Users\user\.codex\sessions\2026\08\27\rollout-2026-08-27T15-28-15-01a0421e-939f-7453-b375-f3a5f387b2a7.jsonl, updated_at=2026-08-28T09:08:56+00:00, thread_id=01a0421e-939f-7453-b375-f3a5f387b2a7)

### keywords

- PROJECT_CONTEXT.md, template/, ViteSSG, development.localhost, archived migrations, Favorites.vue, MyLoans.vue, 精准报价, supabaseUrl is required

## User preferences

- when asked to read “my project ... all folder and .md”, produce source-grounded understanding and comprehensively inspect project-owned Markdown; samples/screenshots are reference-only. [Task 1]
- for a targeted card change then “remove it from both cards pages”, make minimal edits and check both Favorites.vue and MyLoans.vue. [Task 1]

## Reusable knowledge

- Runnable app root is `template/`; `pnpm.cmd run dev:local` serves port 3000. Use `--mode development.localhost` for builds because default SSG can fail `Error: supabaseUrl is required.` [Task 1]
- `PROJECT_CONTEXT.md` is truth map but current runtime/source outrank old handoffs. Authoritative migrations were documented in missing external admin repo; archived client migrations must not provision the live schema. [Task 1]

## Failures and how to do differently

- Complex detached PowerShell startup and ripgrep quoting failed; use a short `Start-Process` with explicit `template/` working directory and simple separately quoted searches. [Task 1]

# Task Group: Metadata identity, static SEO, and image assets
scope: evidence-based metadata/manifest work and global raster/lazy-load contracts.
applies_to: cwd=C:\Users\user\Desktop\ai comment and cross-project web work; reuse_rule=derive all identity/claims from active project evidence, never copied examples/history.

## Task 1: Project-agnostic metadata and site.webmanifest guidance

### rollout_summary_files

- rollout_summaries/2026-08-10T04-13-53-hwPl-project_agnostic_metadata_and_webmanifest_guidance.md (cwd=C:\Users\user\Desktop\ai comment, rollout_path=C:\Users\user\.codex\sessions\2026\08\10\rollout-2026-08-10T12-13-53-019fe9e0-8772-7143-8b6b-11cc8a866137.jsonl, updated_at=2026-08-10T04:22:20+00:00, thread_id=019fe9e0-8772-7143-8b6b-11cc8a866137)

### keywords

- metaTitle.txt, project identity, SEO metadata, site.webmanifest, INSUFFICIENT DATA, Select-String -LiteralPath

## User preferences

- the user asked for the “actual project name user are working on rightnow” and no historical VIP Billion/direct project examples -> derive identity from active source/config/visible brand, retaining confirmed legal spelling only. [Task 1]
- use broad/global wording only when evidence supports it; do not invent reach or narrow all examples to “car, door, hotel”. [Task 1]

## Reusable knowledge

- Metadata identity cannot be confirmed -> say `INSUFFICIENT DATA`. Sync manifest `name`, `short_name`, description, lang, id/start_url/scope, display, colors and existing icons only for an installable app. [Task 1]
- Related skill: skills/static-site-metadata-sweep/SKILL.md
- Global AI raster policy: measure rendered target first; final edges 30–1600px (never wider than 1600), JPG for opaque assets and PNG only for genuine alpha/artifact-sensitive flat art; verify dimensions and store in project assets. [ad-hoc note]
- Page-body lazy images keep real URL in `data-src` with a 1×1 SVG `src`; use IntersectionObserver, load-event cleanup, lazy/async decoding, and exclude header/footer/menu/floating UI/background/video. [ad-hoc note]

## Failures and how to do differently

- `rg --literal-path` is unsupported. For exact-file scan use `Select-String -LiteralPath`; when no Git repo exists, use read-back/targeted scans rather than claiming `git diff`. [Task 1]

# Task Group: Windows Chrome SideBySide repair
scope: global Chrome startup failure caused by incomplete version updates.
applies_to: cwd=Windows system scope; reuse_rule=only elevate/replace/install after version/event evidence and preserve backups where feasible.

## Task 1: Diagnose and repair missing dependent assembly

### rollout_summary_files

- rollout_summaries/2026-10-14T01-08-21-BDke-repair_chrome_side_by_side_startup_error.md (cwd=D:\project\xhs-tiktok-inbox, rollout_path=C:\Users\user\.codex\sessions\2026\10\14\rollout-2026-10-14T09-08-21-01a137f4-0654-7372-abcd-b822f7242dda.jsonl, updated_at=2026-10-14T01:26:34+00:00, thread_id=01a137f4-0654-7372-abcd-b822f7242dda)
- rollout_summaries/2026-08-27T01-14-49-nqVw-repair_chrome_side_by_side_startup_error.md (cwd=C:\Users\user\Desktop\used-car, rollout_path=C:\Users\user\.codex\sessions\2026\08\27\rollout-2026-08-27T09-14-50-01a040c8-b2ca-73e0-9fcf-88af85530a0e.jsonl, updated_at=2026-08-27T01:18:15+00:00, thread_id=01a040c8-b2ca-73e0-9fcf-88af85530a0e)

### keywords

- Chrome, SideBySide, Event ID 33, Dependent Assembly, new_chrome.exe, Chrome Enterprise MSI, msiexec, AuthenticodeSignature

## Reusable knowledge

- First determine whether pinned shortcuts target the same root executable and inspect SideBySide event/version directories. A valid shortcut is not the cause when the executable has a missing assembly. [Task 1]
- If a local setup is incomplete/unusable, validate official installer size/signature/publisher, install elevated, then verify installer exit code, executable version, process liveness, shortcuts and fresh SideBySide events. [Task 1]

## Failures and how to do differently

- `chrome.exe --version` can behave as a browser launch; verify launcher file version and process/event evidence instead. Do not repeatedly run a failing non-elevated repair. [Task 1]

# Task Group: VIPBillion admin, payment, and data conventions
scope: recurring Vben/Supabase CRUD, attachments, booking/driver-job focus, FIUU and news import rules.
applies_to: cwd=D:\project\VIPBillion and related VIPBillion admin/site checkouts; reuse_rule=inspect current schema/config first; never expose/reuse credentials.

## Task 1: VIPBillion discovery and Google Sheet optimization audit

### rollout_summary_files

- rollout_summaries/2026-10-13T04-22-41-QlZW-vipbillion_project_and_google_sheet_optimization_audit.md (cwd=D:\project\VIPBillion, rollout_path=C:\Users\user\.codex\sessions\2026\10\13\rollout-2026-10-13T12-22-41-01a1337f-959e-7af3-ba5d-913ed7a4d3f4.jsonl, updated_at=2026-10-13T08:05:25+00:00, thread_id=01a1337f-959e-7af3-ba5d-913ed7a4d3f4)

### keywords

- VIPBillion, Google Sheet, booking, driver job, Vben, Supabase, isDelete, slug, FIUU, news import

## User preferences

- keep focus on booking and driver-job CRUD together; after changes settle, actively flag stale SQL, Vue components, helpers and select options. [ad-hoc note]
- sort fields default to steps of 1000 (1000, 2000, 3000), not 1. [ad-hoc note]

## Reusable knowledge

- New business tables generally use `isDelete boolean NOT NULL DEFAULT false`; every CRUD read, lookup, dropdown, drawer and workflow query filters `isDelete = false`; delete soft-deletes. Attachment-bearing modules soft-delete related attachment rows, show them in Deleted, and purge both records/storage only from Deleted. [ad-hoc note]
- Soft-deleted rows must not block slug reuse: active-only duplicate check, `checkSlugExists()`, submit-time recheck, and partial unique index `WHERE deleted_at IS NULL`. A UI-available/submit-unique error suggests legacy full uniqueness drift. [ad-hoc note]
- FIUU redirect uses `pay.fiuu.com/RMS/pay/{merchantId}` built from booking payload; map responses back to booking fields, retain `returnipn.php` only on result/IPN path, and keep secrets in project config. [ad-hoc note]
- For local-Docker news imports use additive 10,40,50,50,50 phases; validate counts, bilingual JSON, company name, SQL, proportional 1200x630/400x300 images and `/news`; never reset/alter unrelated rows. [ad-hoc note]

## Failures and how to do differently

- Do not mutate deleted slugs with random suffixes as default, and do not treat only RLS as access proof when direct update behavior indicates grants/trigger/RPC issues. [ad-hoc note]

# Task Group: General collaboration, replica, and project-knowledge conventions
scope: cross-project working style and durable routing/documentation patterns.
applies_to: cwd=all projects; reuse_rule=apply only when compatible with current repo contracts and user request; current source remains authoritative.

## Task 1: Cross-project operational conventions

### rollout_summary_files

- rollout_summaries/2026-08-12T08-56-09-fmgd-codex_fast_batch_workflow_protocol.md (cwd=C:\Users\user\.codex, rollout_path=C:\Users\user\.codex\sessions\2026\08\12\rollout-2026-08-12T16-56-09-019ff52f-a88b-7893-a2b3-9a5e75097d.jsonl, updated_at=2026-08-12T09:01:25+00:00, thread_id=019ff52f-a88b-7893-a2b3-9a5e75097d)

### keywords

- best answer first, clone-first, Hierarchical Replica Chunking, one source of truth, project knowledge template, verification, screenshot replica

## User preferences

- for options/rankings, lead with the recommended answer, then concise numbered alternatives so selection is fast. [ad-hoc note]
- when the user says “copy and paste”, “duplicate”, “clone”, or “same modules”, locate and duplicate the exact full module shell first; preserve layout/spacing/drawer-grid behavior, then change only requested inner content. [ad-hoc note]
- for screenshot replicas, keep the reference actively monitored throughout the task and use Hierarchical Replica Chunking: bands → nested visual chunks → structure/spacing/type/palette/image composition per chunk. [ad-hoc note]

## Reusable knowledge

- Use the five-point routing rule: one boot doc, one trigger per task, one file per purpose, one verification step per action, one source of truth per project. [ad-hoc note]
- Related skill: skills/awake-skill-routing/SKILL.md, skills/clone-first-module-duplication/SKILL.md, skills/hierarchical-replica-chunking/SKILL.md, skills/html-to-php-website-migration/SKILL.md
- Project knowledge should identify source of truth, routing, rules, examples, verification and exceptions; self-describing frontmatter is a router aid, not a substitute for project truth. [ad-hoc note]
- Prefer current files, tests, logs and schema over memory; execute surgically and verify read-back/lint/build/smoke before completion. [ad-hoc note]
- Angel: keep provided tester credentials out of memory; use a user-verified historic source rather than guessing, align auth/profile/business user records when the explicitly requested tester workflow applies, and keep demo login values blank/non-sensitive. Admin RPC `column "status" does not exist` is schema drift: inspect migrations/schema before Vue and use append-only compatibility migration. [ad-hoc note]
- Angel paid downloads: inspect checkout route, download route and `lib/downloadData.php` together; a real download requires a paid Stripe session whose metadata matches the resource. Preserve missing-config/cancel/error fallbacks, keep runtime keys secret, and separate first-party warnings from browser-extension/embed noise. [ad-hoc note]
- EDSB admin is phone-first: new Auth identity defaults to `email = NULL`; do not clear shared existing emails without owner approval. Local VPS parity applies only to local Docker, never VPS, and must not copy another project's active-project pointer. [ad-hoc note]
- Genie Skin Beauty: `download-template/` is read-only visual reference; edit `website-genieskinbeauty/` and never carry VIPBillion inherited names/content into Genie. [ad-hoc note]
- HTML-to-PHP replica sites: clone the full reference shell, migrate through router/shared `lib/`/`template/` and project-owned assets, remove stale source-specific endpoints, then validate syntax, route matrix (including expected 404), JSON/catalog counts and visible controls. [ad-hoc note]
- Vben/Pinia work: preserve store contracts, relation bindings and active-row filters; reset CRUD drawers to top on opening (including nested content) and update table body, summary and horizontal scroll together when columns change. [ad-hoc note]
- Zeta Capital news keeps full server-rendered crawlable cards/JSON-LD, initially reveals 12 then 3 via IntersectionObserver, and provides a no-observer fallback; its card images follow the data-src SVG-placeholder rule. [ad-hoc note]

## Failures and how to do differently

- Do not turn a screenshot replica into a flat element checklist or redesign it before cloning the requested source. Do not load unrelated skills/knowledge trees when a small routed read suffices. [ad-hoc note]
- Never infer an active project/stack from a similar checkout, a loaded port, or an old note; establish current root, env/runtime target and source-of-truth path first. [ad-hoc note]

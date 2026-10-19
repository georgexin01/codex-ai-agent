# Task Group: C:\Users\user\.codex — Codex routing, Git, and protected memory paths

scope: Maintain the Codex configuration repository, its boot/routing contracts, sparse-checkout state, and protected memory files; not an application-project localhost runbook.
applies_to: cwd=C:\Users\user\.codex; reuse_rule=recheck current hooks, sparse state, and Git status before mutation because these are checkout-specific.

## Task 1: Recover sparse/missing files and unblock protected-path commits

### rollout_summary_files

- rollout_summaries/2026-10-16T08-24-39-QpWZ-codex_precommit_protected_deletions_recovery_push.md (cwd=C:\Users\user\.codex, rollout_path=C:\Users\user\.codex\sessions\2026\10\16\rollout-2026-10-16T16-24-39-01a143d0-2eb2-7b91-8f78-221999fe3aed.jsonl, updated_at=2026-10-19T02:11:02+00:00, thread_id=01a143d0-2eb2-7b91-8f78-221999fe3aed, success; restored 17 deletions, committed/pushed remaining work)
- rollout_summaries/2026-10-16T01-34-59-TSQM-resolve_protected_codex_staged_deletion.md (cwd=C:\Users\user\.codex, rollout_path=C:\Users\user\.codex\sessions\2026\10\16\rollout-2026-10-16T09-34-59-01a14259-1f6b-7bd1-bd04-e127b476e7a8.jsonl, updated_at=2026-10-19T02:11:19+00:00, thread_id=01a14259-1f6b-7bd1-bd04-e127b476e7a8, success; restored one routed file and passed hook)
- rollout_summaries/2026-10-08T01-40-56-1R8h-codex_sparse_checkout_recovery_and_powershell_alert.md (cwd=C:\Users\user\.codex, rollout_path=C:\Users\user\.codex\sessions\2026\10\08\rollout-2026-10-08T09-40-56-01a1192b-b085-75e1-a18b-2d3afb096a9d.jsonl, updated_at=2026-10-08T07:03:57+00:00, thread_id=01a1192b-b085-75e1-a18b-2d3afb096a9d, success)

### keywords

- pre-commit, protected-paths, staged-deletion, memories/phase2_workspace_diff.md, git restore, sparse-checkout, git sparse-checkout disable

## Task 2: Lean maintenance, Git staging, and boot/localhost routing

### rollout_summary_files

- rollout_summaries/2026-08-20T01-54-45-Rl4o-codex_git_sparse_checkout_and_generated_images_cleanup.md (cwd=C:\Users\user\.codex, rollout_path=C:\Users\user\.codex\sessions\2026\08\20\rollout-2026-08-20T09-54-45-01a01ce0-bb0d-76b1-898a-dabc3ae2eddc.jsonl, updated_at=2026-08-20T08:30:33+00:00, thread_id=01a01ce0-bb0d-76b1-898a-dabc3ae2eddc, partial)
- rollout_summaries/2026-08-12T07-57-58-bZCY-codex_lean_maintenance_and_memory_compression.md (cwd=C:\Users\user\.codex, rollout_path=C:\Users\user\.codex\sessions\2026\08\12\rollout-2026-08-12T15-57-58-019ff4fa-668d-74d2-bc92-64724b087b5c.jsonl, updated_at=2026-08-12T08:30:52+00:00, thread_id=019ff4fa-668d-74d2-bc92-64724b087b5c, success)
- rollout_summaries/2026-09-04T01-18-24-1Zuq-codex_boot_and_localhost_test_blocked.md (cwd=C:\Users\user\.codex, rollout_path=C:\Users\user\.codex\sessions\2026\09\04\rollout-2026-09-04T09-18-24-01a069fe-d709-7e00-b7e6-2069c0077bea.jsonl, updated_at=2026-09-04T01:19:08+00:00, thread_id=01a069fe-d709-7e00-b7e6-2069c0077bea, partial)

### keywords

- 00_PULSE.md, ai read .codex knowledge, Update-CodexRouting.ps1, Test-CodexPerfBenchmark.ps1, memories/.git, git add --sparse, localhost-test

## User preferences

- when maintaining `.codex`, the user asked to “take action ... wont make heavy changes to it” -> favor reversible, surgical changes that preserve routes, skills, secrets, and repository state. [Task 2]

## Reusable knowledge

- `00_PULSE.md` is the boot contract; the exact hydration trigger `ai read .codex knowledge` returns only `[🟢] Agent is Ready..`. Hydrate once per chat, then read task-specific routes lazily. [Task 2]
- A pre-commit hook rejects staged deletions under `memories/` and `skills/`. For an accidentally deleted tracked protected file, recover it with `git restore --source=HEAD --staged --worktree -- <path>` and validate `git hook run pre-commit`. [Task 1]
- Diagnose a commit rejection as local hook versus remote failure first. Use `git diff --cached --name-only --diff-filter=D -- memories/ skills/`; restore unintended protected files, then run `git diff --cached --check` and the hook before committing. [Task 1]
- Missing tracked files can be a sparse-checkout omission, not deletion. Inspect `git sparse-checkout list`; the latest recovery disabled sparse checkout permanently. [Task 1]
- After route/index changes, refresh generated routing with `codex-router/Update-CodexRouting.ps1 -Quiet`; the 2026-08 baseline passed benchmark 32/32, activation 18/18, routing audit with no missing targets/conflicts. [Task 2]

## Failures and how to do differently

- Symptom: an application localhost test finds no project from `.codex` -> cause: wrong working directory -> rerun from the actual project root; startup alone is not success, HTTP-check real URLs. [Task 2]
- Symptom: `Validate-CodexKnowledge.ps1` fails on `memories/.git` -> nested Git metadata is pre-existing; do not remove or mutate it without explicit approval. [Task 2]
- Symptom: PowerShell warns that a command may be unsafe -> distinguish this security warning from Codex approval; inspect the command and policy context rather than assuming user permission was denied. [Task 1]
- The large-knowledge scanner may omit a deleted file because it scans only files present in the worktree; check staged deletions directly. Pre-existing `.codex-global-state.json` secret-pattern and nested `memories/.git` validator findings are not justification to alter unrelated files. [Task 1]

# Task Group: D:\project\VIPBillion\website-vipbillion — PHP website, booking UX, and optimization audit

scope: Work on the bilingual VIPBillion public PHP website: orientation, customer-request audit, CTA/booking flow, and booking modal behavior.
applies_to: cwd=D:\project\VIPBillion\website-vipbillion; reuse_rule=current source/live evidence outranks root Markdown that may be historical; do not make real booking/page requests merely for visual testing because visit tracking or records may change.

## Task 1: Website orientation and 13-row Optimization Plan audit

### rollout_summary_files

- rollout_summaries/2026-10-15T02-49-58-3dyZ-vipbillion_website_audit_booking_modal_ux.md (cwd=D:\project\VIPBillion, rollout_path=C:\Users\user\.codex\sessions\2026\10\15\rollout-2026-10-15T10-49-58-01a13d77-69bb-71a1-a74a-b50080a22db5.jsonl, updated_at=2026-10-16T01:10:55+00:00, thread_id=01a13d77-69bb-71a1-a74a-b50080a22db5, partial)
- rollout_summaries/2026-10-13T04-22-41-QlZW-vipbillion_project_and_google_sheet_optimization_audit.md (cwd=D:\project\VIPBillion, rollout_path=C:\Users\user\.codex\sessions\2026\10\13\rollout-2026-10-13T12-22-41-01a1337f-959e-7af3-ba5d-913ed7a4d3f4.jsonl, updated_at=2026-10-13T08:05:25+00:00, thread_id=01a1337f-959e-7af3-ba5d-913ed7a4d3f4, success)

### keywords

- WORKSPACE.md, STATUS.md, MASTER_PLAN.md, lib/initData.php, Optimization Plan, Google Sheets, duplicate WhatsApp, Instagram, pricing mismatch, 60–90 Hours

## Task 2: Get a Quote /booking flow, service preselection, and 30-day prefill

### rollout_summary_files

- rollout_summaries/2026-10-15T02-49-20-z2H4-vipbillion_home_hero_h1_and_booking_cta.md (cwd=D:\project\VIPBillion, rollout_path=C:\Users\user\.codex\sessions\2026\10\15\rollout-2026-10-15T10-49-20-01a13d76-d6b9-7812-aae5-4818b0a53cde.jsonl, updated_at=2026-10-15T08:37:27+00:00, thread_id=01a13d76-d6b9-7812-aae5-4818b0a53cde, success)
- rollout_summaries/2026-10-15T08-40-58-GbCk-vipbillion_header_cta_request_missed.md (cwd=D:\project\VIPBillion, rollout_path=C:\Users\user\.codex\sessions\2026\10\15\rollout-2026-10-15T16-40-58-01a13eb8-c451-7ba1-8551-d173ae1acf74.jsonl, updated_at=2026-10-15T09:58:21+00:00, thread_id=01a13eb8-c451-7ba1-8551-d173ae1acf74, failed request-routing caution)

### keywords

- View Our Services, Get a Quote, /booking, nav.get_quote, preselectServiceRoute, fillVehicleOptions, booking-prefill-session.php, VBBookingPrefill

## Task 3: Booking confirmation dialog, minimum loading, and idempotency

### rollout_summary_files

- rollout_summaries/2026-10-15T02-49-58-3dyZ-vipbillion_website_audit_booking_modal_ux.md (cwd=D:\project\VIPBillion, rollout_path=C:\Users\user\.codex\sessions\2026\10\15\rollout-2026-10-15T10-49-58-01a13d77-69bb-71a1-a74a-b50080a22db5.jsonl, updated_at=2026-10-16T01:10:55+00:00, thread_id=01a13d77-69bb-71a1-a74a-b50080a22db5, partial)

### keywords

- booking-confirmation-modal, waitForMinimumLoading, 1000 ms, BookingModel.php, BookingRequestConflictException, findExistingWebsiteBookingById

## User preferences

- when starting VIPBillion work, the user asked to “understand my website first include .md” -> read orientation/status/plan docs, reconcile them against current source, then change only the requested area. [Task 1][Task 2]
- for request audits, the user requested “summarize it all in chinese show me in comparision tables with detailed information.. pages, task, changes, problem, done?” -> provide Chinese tables and distinguish sheet status from independently verified source/live status. [Task 1]
- when user requested `View Our Services` → `Get a Quote`, navigating to `/booking`, the attached screenshot did not authorize a different CSS task -> locate the exact label, patch its source only, and verify destination. [Task 2]
- “all popup modal should be display position center” and “loading speed are too fast slower +1sec to it” -> center dialogs in both viewport axes and show feedback at least 1000 ms without delaying already-slow requests. [Task 3]

## Reusable knowledge

- Entry/routing/shared init are `index.php`, `router.php`, and `lib/initData.php`; EN/CN paths use `/cn/...`, `i18n/en.json`, `i18n/cn.json`, localized fields, and models under `api/Models/`. Current booking/payment source exists even where historical docs say Phase 2 was removed. [Task 1]
- The Optimization Plan has 13 actions (7 P0, 4 P1, 2 P2). Confirmed issues include duplicate WhatsApp on `/contacts`, conditional Instagram rendering, Apps Script contact submission, no clear WhatsApp GTM event, pricing RM500 vs RM600 mismatch, `60–90 Hours`, and About anchors/visitor prominence. Business confirmation is needed before changing prices, durations, categories, FAQs, social accounts, or authentic imagery. [Task 1]
- CTAs use bilingual `nav.get_quote` to `/booking`; cards append `?service=<slug>`. Only preselect a route for one normalized match; on ambiguity let the user choose. Vehicle default is lowest positive-price non-consultation, non-Bus option. The isolated 30-day server-side `VBBookingPrefill` session stores only name, phone, departure and arrival addresses; escape values when rendering. [Task 2]
- Current booking dialog CSS is `.booking-confirmation-modal[open] { position:fixed; top:50%; left:50%; transform:translate(-50%,-50%); }`; `waitForMinimumLoading()` enforces the one-second minimum. Same UUID + matching booking data reuses a row; mismatched replay raises `BookingRequestConflictException`. [Task 3]

## Failures and how to do differently

- `API_SETUP_COMPLETE.md` has historical configuration and credential-like material in prior output; do not rely on it as current config and never retain secrets. [Task 1]
- Browser/live booking verification remains incomplete: use an isolated test DB, mocked API, or visitor-tracking-bypassing fixture. Do not claim end-to-end visual/API success from `php -l`, JSON parsing, or `git diff --check` alone. [Task 2][Task 3]
- “All popup modal” was only applied to the booking confirmation dialog. Before declaring a sitewide fix, inspect other systems such as `main-register-container`, header modal, and lightGallery. Use smaller PowerShell validation commands when a complex quoted command fails. [Task 3]

# Task Group: D:\project\xhs-tiktok-inbox — Vue chat preview and Telegram timeline behavior

scope: Maintain the fictional TikTok/XHS/Telegram preview generator, especially image sizing and Telegram date-history logic.
applies_to: cwd=D:\project\xhs-tiktok-inbox; reuse_rule=platform-specific changes must not alter other preview tabs; build validation is necessary but browser interaction QA is a separate gate.

## Task 1: Upload-image size tiers across tabs and popup

### rollout_summary_files

- rollout_summaries/2026-10-12T06-24-02-dlD6-all_tabs_upload_image_sizing_tiers_popup.md (cwd=D:\project\xhs-tiktok-inbox, rollout_path=C:\Users\user\.codex\sessions\2026\10\12\rollout-2026-10-12T14-24-03-01a12ec8-5255-7ad1-8475-8fb42dfceea4.jsonl, updated_at=2026-10-12T06:59:26+00:00, thread_id=01a12ec8-5255-7ad1-8475-8fb42dfceea4, success)

### keywords

- UnifiedSettings.vue, PhonePreview.vue, upload image, longest-side, image sizing tiers, popup

## Task 2: Telegram divider sequence, sticky-date cycle, and time-only markers

### rollout_summary_files

- rollout_summaries/2026-10-15T02-12-32-It36-fix_time_only_telegram_date_markers.md (cwd=D:\project\xhs-tiktok-inbox, rollout_path=C:\Users\user\.codex\sessions\2026\10\15\rollout-2026-10-15T10-12-33-01a13d55-251d-7450-85cd-b5903ba42304.jsonl, updated_at=2026-10-15T04:28:02+00:00, thread_id=01a13d55-251d-7450-85cd-b5903ba42304, success)
- rollout_summaries/2026-10-15T01-08-25-vGYm-telegram_sticky_date_click_cycle.md (cwd=D:\project\xhs-tiktok-inbox, rollout_path=C:\Users\user\.codex\sessions\2026\10\15\rollout-2026-10-15T09-08-26-01a13d1a-7276-78d0-8c19-27b3dca280ee.jsonl, updated_at=2026-10-15T01:49:31+00:00, thread_id=01a13d1a-7276-78d0-8c19-27b3dca280ee, partial)
- rollout_summaries/2026-10-13T10-15-27-ekZ9-telegram_date_divider_sequence_and_sticky_history.md (cwd=D:\project\xhs-tiktok-inbox, rollout_path=C:\Users\user\.codex\sessions\2026\10\13\rollout-2026-10-13T18-15-33-01a134c2-8b36-70d0-b2ec-ded39973bf8f.jsonl, updated_at=2026-10-14T02:30:41+00:00, thread_id=01a134c2-8b36-70d0-b2ec-ded39973bf8f, partial)

### keywords

- PhonePreview.vue, historyDates, stickyHistoryDate, firstNoticeHistoryDate, cycleStickyHistoryDate, getNoticeHistoryTimestamp, Telegram, date divider

## Task 3: System-wide Chrome SideBySide repair

### rollout_summary_files

- rollout_summaries/2026-10-14T01-08-21-BDke-repair_chrome_side_by_side_startup_error.md (cwd=D:\project\xhs-tiktok-inbox, rollout_path=C:\Users\user\.codex\sessions\2026\10\14\rollout-2026-10-14T09-08-21-01a137f4-0654-7372-abcd-b822f7242dda.jsonl, updated_at=2026-10-14T01:26:34+00:00, thread_id=01a137f4-0654-7372-abcd-b822f7242dda, success)

### keywords

- Chrome, SideBySide, Event ID 33, Google Chrome Enterprise MSI, msiexec, 155.0.8059.80

## User preferences

- when changing the chat preview, the user scoped it to Telegram/date behavior -> preserve platform isolation and existing scroll-based sticky-date updates rather than replacing them. [Task 2]
- the user clarified the visible date stays centered below the header while scrolling and specified October 8 → October 12 → October 14 -> use explicit divider dates as authoritative section boundaries. [Task 2]

## Reusable knowledge

- Vue 3 + Vite mock generator: `App.vue` owns shared state, `UnifiedSettings.vue` edits it, `PhonePreview.vue` renders previews. `PROJECT_CONTEXT.md` is stale in places; reconcile it with current source. [Task 1][Task 2]
- `PhonePreview.vue` has `historyDates`, `defaultHistoryDate`, `stickyHistoryDate`, `firstNoticeHistoryDate`, and `getNoticeHistoryTimestamp`. Time-only `/^\d{1,2}:\d{2}$/` values use the current local calendar date; explicit dates remain unchanged. [Task 2]
- The clickable sticky date is a button that cycles unique history dates newest-to-oldest via `cycleStickyHistoryDate()`; CSS uses `.chat-body.telegram > button.sticky-history-date`. [Task 2]
- Use shared longest-side sizing tiers for upload previews across each tab and modal, then run `npm.cmd run build` and `git diff --check`. [Task 1]
- For a system-wide Chrome SideBySide error, verify the official Enterprise MSI file size, `AuthenticodeSignature`, publisher, elevated `msiexec` exit code, executable version, direct/pinned launches, and fresh Event ID 33 status. A complete official MSI repaired this installation after bundled setup exit code `12`. [Task 3]

## Failures and how to do differently

- Build success does not demonstrate click/scroll behavior. Manually test Telegram tab scrolling and sticky-date clicks before declaring complete; generated `dist/` references may change during build and need review. [Task 2]
- A rollout solved time-only inheritance while the image-described interaction was broader; confirm the exact UI acceptance criterion before editing. Prefer small separately quoted PowerShell searches after an unterminated-quote failure. [Task 2]
- Do not repeat non-elevated local setup attempts for a global broken Chrome install; validate the installer and use a system-level repair. [Task 3]

# Task Group: D:\project\lionrider\lionrider-website — PHP/JSON storefront, handoff, and Spare Parts finder

scope: Maintain Lion Rider storefront architecture, local runtime, responsive account UI, and catalog-derived Spare Parts filtering.
applies_to: cwd=D:\project\lionrider\lionrider-website; reuse_rule=do not confuse the JSON storefront with admin-panel Supabase work; inspect dirty worktree and current data before editing.

## Task 1: Storefront orientation, Markdown handoff, and mobile account sidebar

### rollout_summary_files

- rollout_summaries/2026-10-14T02-12-43-ymqp-lionrider_markdown_orientation_partial.md (cwd=D:\project\lionrider, rollout_path=C:\Users\user\.codex\sessions\2026\10\14\rollout-2026-10-14T10-12-43-01a1382e-f2e0-7553-aae2-50891763274d.jsonl, updated_at=2026-10-14T09:44:38+00:00, thread_id=01a1382e-f2e0-7553-aae2-50891763274d, partial)
- rollout_summaries/2026-10-13T06-12-43-M5EQ-lionrider_account_mobile_sidebar_and_project_handoff.md (cwd=D:\project\lionrider, rollout_path=C:\Users\user\.codex\sessions\2026\10\13\rollout-2026-10-13T14-12-43-01a133e4-51b0-7453-b814-ec4392e2bdd8.jsonl, updated_at=2026-10-14T09:53:24+00:00, thread_id=01a133e4-51b0-7453-b814-ec4392e2bdd8, success)

### keywords

- status.md, PROJECT_CONTEXT.md, BLUEPRINT.md, PHP JSON storefront, account-sidebar, customer-dashboard, max-width: 620px, documentation drift

## Task 2: Spare Parts availability filter and localhost verification

### rollout_summary_files

- rollout_summaries/2026-10-13T06-16-33-OhXB-lionrider_project_handoff_spareparts_localhost_test.md (cwd=D:\project\lionrider, rollout_path=C:\Users\user\.codex\sessions\2026\10\13\rollout-2026-10-13T14-16-33-01a133e7-d37a-7312-a72b-4b6feafda2c3.jsonl, updated_at=2026-10-14T02:30:50+00:00, thread_id=01a133e7-d37a-7312-a72b-4b6feafda2c3, success)

### keywords

- spareparts-home.php, spareparts-finder.js, Only show models with available Spare Parts, normalize, 127.0.0.1:8012, router.php

## User preferences

- when asked to understand “my project and all .md”, treat completeness literally; do not report it complete after front-door docs only. [Task 1]
- the user asked to “take highly note” of the planned overhaul and save a cache/status guide -> maintain `status.md` after meaningful work, while current files and latest owner direction outrank old status entries. [Task 1]
- “if website is in mobile responsive view please hide the above sidemenu” -> hide it on mobile rather than merely compress it. [Task 1]

## Reusable knowledge

- Storefront root is PHP front controller `index.php` with `router.php`, `template/`, `lib/`, `css/`, `js/`, and JSON catalog data. It has no verified Supabase connection; workspace real database docs/admin schema are a separate boundary. [Task 1]
- `status.md` is the durable storefront handoff. Historical docs drift: old files say 317 products while current fixture/newest status has 341; `knowledge.md` refers to unrelated `fc-moto` and must be excluded. [Task 1]
- Account sidebar mobile rule: `.customer-dashboard .account-sidebar { display: none; }` under `@media (max-width: 620px)`. [Task 1]
- Finder default is availability-only; normalize make/model on products and source models, exclude sold-out/all-unavailable real variations, while a non-sold-out variationless product qualifies. Start server with `php -S 127.0.0.1:8012 router.php` and HTTP-check `/`, `/spareparts/yamaha`, `/spareparts/kawasaki`. [Task 2]

## Failures and how to do differently

- Do not modify the existing dirty website repository until checking its pre-existing changes. A 151-file Markdown request was only partially completed; continue exhaustive read or explicitly narrow scope. [Task 1]
- Direct model-name matching misses catalog records; normalize first. Use one patch operation per file when a multi-operation patch fails. Browser account QA needs a signed-in local session. [Task 2]

# Task Group: D:\backup\website-zetasoftware — bilingual static-site content, performance, and SEO routing

scope: Maintain Zeta Software static bilingual site parity, generated navigation, images/performance, and hosting/SEO rules.
applies_to: cwd=D:\backup\website-zetasoftware; reuse_rule=apply edits to EN/CN pair where relevant and distinguish source/local-server validation from production/browser validation.

## Task 1: Bilingual FAQ, homepage/blog, services, and pricing parity

### rollout_summary_files

- rollout_summaries/2026-08-13T09-01-30-FmzH-zetasoftware_bilingual_faq_homepage_blogs_pricing_parity.md (cwd=D:\backup\website-zetasoftware, rollout_path=C:\Users\user\.codex\sessions\2026\08\13\rollout-2026-08-13T17-01-30-019ffa5a-eb3e-7172-8f41-7b65c41c8a95.jsonl, updated_at=2026-08-13T09:54:49+00:00, thread_id=019ffa5a-eb3e-7172-8f41-7b65c41c8a95, success)

### keywords

- faq.json, js/faq.js, paired IDs, home-blogs.js, pricing-section, Orbitron, services/index.html, cn/services/index.html

## Task 2: Static localhost, image/performance work, navigation generator, and SEO cleanup

### rollout_summary_files

- rollout_summaries/2026-10-12T02-32-50-FulX-zeta_website_cleanup_mail_host_seo_audit.md (cwd=D:\backup\website-zetasoftware, rollout_path=C:\Users\user\.codex\sessions\2026\10\12\rollout-2026-10-12T10-32-50-01a12df4-a688-72d0-8aa6-dd792838fc51.jsonl, updated_at=2026-10-12T06:20:38+00:00, thread_id=01a12df4-a688-72d0-8aa6-dd792838fc51, partial)
- rollout_summaries/2026-09-07T05-57-20-zPhy-zeta_website_project_audit_navigation_content_performance.md (cwd=D:\backup\website-zetasoftware, rollout_path=C:\Users\user\.codex\sessions\2026\09\07\rollout-2026-09-07T13-57-20-01a07a71-4c56-70b0-a1e2-b8a02742ecb4.jsonl, updated_at=2026-09-07T09:41:02+00:00, thread_id=01a07a71-4c56-70b0-a1e2-b8a02742ecb4, partial)
- rollout_summaries/2026-09-04T01-20-03-IpkW-zeta_static_site_localhost_performance_image_loading.md (cwd=D:\backup\website-zetasoftware, rollout_path=C:\Users\user\.codex\sessions\2026\09\04\rollout-2026-09-04T09-20-03-01a06a00-5a37-7e72-bbbc-b6b33c856356.jsonl, updated_at=2026-09-07T05:56:45+00:00, thread_id=01a06a00-5a37-7e72-bbbc-b6b33c856356, partial)

### keywords

- php -S 127.0.0.1:8080, .htaccess, WebP, data-src, IntersectionObserver, update-site-navigation.js, style.min.css, mail host, canonical redirect

## Task 3: AI SEO preview pages, generated navigation, and locale routing

### rollout_summary_files

- rollout_summaries/2026-10-16T08-08-24-ur6z-bilingual_ai_seo_preview_page_navigation.md (cwd=D:\backup\website-zetasoftware, rollout_path=C:\Users\user\.codex\sessions\2026\10\16\rollout-2026-10-16T16-53-58-01a143c1-5061-73f0-9004-73e8a602dbd3_01a143eb-0564-7c82-a593-25fe88223946.jsonl, updated_at=2026-10-16T09:05:43+00:00, thread_id=01a143c1-5061-73f0-9004-73e8a602dbd3, success; local-only)

### keywords

- ai-seo, generate-ai-seo-pages.js, update-site-navigation.js, languageRoutes, getLanguagePage, exactPages, hreflang, /about/ai-seo/, /cn/about/ai-seo/

## Task 4: Sitemap audit and transparent service-icon replacement

### rollout_summary_files

- rollout_summaries/2026-10-16T08-39-02-c7D5-zeta_sitemap_audit_and_service_icons.md (cwd=D:\backup\website-zetasoftware, rollout_path=C:\Users\user\.codex\sessions\2026\10\16\rollout-2026-10-16T16-39-02-01a143dd-59c3-74a2-aca5-a3cffdd32833.jsonl, updated_at=2026-10-16T09:16:47+00:00, thread_id=01a143dd-59c3-74a2-aca5-a3cffdd32833, success; production unverified)

### keywords

- sitemap.xml, robots.txt, generate-blog-pages.js, blogs.json, blogs-cn.json, hreflang, noindex, services/index.html, service-icons, transparent PNG

## User preferences

- user requests for bilingual content mean paired English/Chinese records and tracking updates, not English-only completion; quantify exact requested changes such as title percentages and order. [Task 1]
- when screenshots ask for the “exact same design”, treat homepage markup/CSS and screenshot as active visual source of truth and inspect both languages. [Task 1]
- `localhost test` means detect site type, start only required server, and verify real URLs; startup alone is not success. [Task 2]
- for Aiseo-derived preview pages, complete/latest details remain at `aiseo.zetasoftware.my`; make the preview/authoritative-site boundary explicit and avoid repeated plan pricing. [Task 3]
- Sitemap work must inventory generated routes/content data before deciding coverage. [Task 4]

## Reusable knowledge

- `js/faq.js` selects `/data/faq.json` by `/cn/` and updates visible FAQ + FAQPage JSON-LD. Validate JSON parse, duplicate IDs, counts, paired IDs, and paired title changes after bulk FAQ edits. [Task 1]
- `home-blogs.js` sorts localized data by descending date, takes three, escapes content, renders links, refreshes Lucide, and integrates lazy loading. Services pages must explicitly load the Google-font URL used by homepage for Orbitron token parity. [Task 1]
- Static checkout has no package manifest/Vite/PHP entry: serve `php -S 127.0.0.1:8080 -t <workspace>`. Local PHP server does not test Apache `.htaccess` gzip/cache/redirect behavior. [Task 2]
- Generator pipeline matters: use source data/scripts for generated SIM navigation, not hand edits to output. For bulk image transforms, resolve root-relative `images/...` from project root and validate malformed whitespace-before-attribute output. [Task 2]
- Generate AI SEO from `scripts/generate-ai-seo-pages.js`, selecting `about/index.html` for EN and `cn/about/index.html` for CN. Add a new bilingual route to both `languageRoutes`, `getLanguagePage()`/`exactPages`, generated desktop/mobile navigation, and sitemap alternates; then verify both pages, CSS, images, and locale switching locally. [Task 3]
- The sitemap audit found 646 unique URLs from 660 HTML files; noindex compatibility pages must stay out. Blog routes derive from `data/blogs.json`, `data/blogs-cn.json`, and `data/blogs-cn-additional.json` through `scripts/generate-blog-pages.js`. [Task 4]
- Related skill: skills/zeta-bilingual-static-site/SKILL.md. [Task 3][Task 4]

## Failures and how to do differently

- Do not remove original raster/WebP assets before canonical JPG/lazy-load migration is complete and every intended reference is updated. Browser automation was unavailable in several runs, so manual hard-refresh/production verification remains required for visual/cache/redirect claims. [Task 2]
- Unicode comparisons and large text patches can corrupt JSON or miss expected HTML context; use UTF-8-safe checks, fresh exact context, and paired-language validation. [Task 1]
- A locale-specific generator-template mistake can produce an English footer in CN output; correct the template selection and regenerate. Navigation generation touched 662 HTML files (746 working-tree paths), so review the full diff before publish. Production was not verified for Tasks 3-4. [Task 3][Task 4]

# Task Group: C:\Users\user\Desktop\used-car — Vue/Supabase project and Windows Chrome repair

scope: Orient and verify the Used-Car Vue app, respect external schema ownership, and handle Chrome SideBySide launch failure seen in this workspace.
applies_to: cwd=C:\Users\user\Desktop\used-car; reuse_rule=the runnable app is template/; archived client migrations are not schema authority.

## Task 1: Used-Car audit, schema boundary, localhost, and saved-loan UI

### rollout_summary_files

- rollout_summaries/2026-08-27T07-28-15-vpVJ-used_car_project_audit_localhost_sql_loan_card_revision.md (cwd=C:\Users\user\Desktop\used-car, rollout_path=C:\Users\user\.codex\sessions\2026\08\27\rollout-2026-08-27T15-28-15-01a0421e-939f-7453-b375-f3a5f387b2a7.jsonl, updated_at=2026-08-28T09:08:56+00:00, thread_id=01a0421e-939f-7453-b375-f3a5f387b2a7, success)

### keywords

- PROJECT_CONTEXT.md, template, ViteSSG, archived migrations, admin-panel-used-car, pnpm.cmd run dev:local, development.localhost, Favorites.vue, MyLoans.vue

## Task 2: Chrome SideBySide startup repair

### rollout_summary_files

- rollout_summaries/2026-08-27T01-14-49-nqVw-repair_chrome_side_by_side_startup_error.md (cwd=C:\Users\user\Desktop\used-car, rollout_path=C:\Users\user\.codex\sessions\2026\08\27\rollout-2026-08-27T09-14-50-01a040c8-b2ca-73e0-9fcf-88af85530a0e.jsonl, updated_at=2026-08-27T01:18:15+00:00, thread_id=01a040c8-b2ca-73e0-9fcf-88af85530a0e, success)

### keywords

- Chrome, SideBySide, missing dependent assembly, new_chrome.exe, 151.0.7922.175, chrome_proxy.exe

## User preferences

- “read and understand my project ... all folder and .md” -> give source-grounded understanding and comprehensively inspect project-owned Markdown; reference/sample assets are not live business facts. [Task 1]
- targeted card changes should remain minimal and be checked in both `Favorites.vue` and `MyLoans.vue`. [Task 1]

## Reusable knowledge

- Active root `template/` is Vue 3/Vite/TypeScript/Tailwind/Pinia/Vue Router/vue-i18n/ViteSSG/PWA/Supabase. `PROJECT_CONTEXT.md` is the truth map; current source/runtime outranks README/historical handoff. [Task 1]
- All client SQL migrations are explicitly archived; schema authority is external `D:\admin-panel-used-car\apps\web-antd\src\sql\migrations\` and was absent locally, so live schema is `INSUFFICIENT DATA`. Run local build as `pnpm.cmd exec vite build --mode development.localhost`; default SSG fails `supabaseUrl is required` without injected env. [Task 1]
- Start local client from `template/` with `pnpm.cmd run dev:local` (port 3000) and HTTP-check routes. [Task 1]
- Chrome repair: valid shortcut + SideBySide missing assembly means inspect Chrome version directories, `new_chrome*`, and registry before replacing launchers; retain versioned backups and verify launcher version/process, not `chrome.exe --version`. [Task 2]

## Failures and how to do differently

- Run source checks from `template/` or absolute paths; complex detached PowerShell launch quoting may fail, while `Start-Process pnpm.cmd` with working directory succeeds. [Task 1]
- Do not recreate a valid shortcut just because Chrome fails. If installer fails, make elevated, version-checked backup/copy only after identifying a complete pending build. [Task 2]

# Task Group: C:\Users\user\Documents\supabase-project-backup-restore — Huwa2 local restore and PostgREST exposure

scope: Safely repair/import the Huwa2 VPS backup into local Supabase and expose its schema through the CLI-managed stack.
applies_to: cwd=C:\Users\user\Documents\supabase-project-backup-restore; reuse_rule=preserve original backup and Docker-backed local data; exact counts/path are backup-specific.

## Task 1: Repair auth backup, atomic restore, and add Huwa2 to API schemas

### rollout_summary_files

- rollout_summaries/2026-08-14T02-47-47-8IL6-huwa2_vps_restore_and_postgrest_expose.md (cwd=C:\Users\user\Documents\supabase-project-backup-restore, rollout_path=C:\Users\user\.codex\sessions\2026\08\14\rollout-2026-08-14T10-47-47-019ffe2b-21d6-7ff2-9bea-6cfa6ab17768.jsonl, updated_at=2026-08-14T03:10:24+00:00, thread_id=019ffe2b-21d6-7ff2-9bea-6cfa6ab17768, success)

### keywords

- huwa2, auth.users, auth.identities, identities_user_id_fkey, atomic restore, 04-auth-rows.sql, PGRST_DB_SCHEMAS, config.toml, Supabase CLI

## User preferences

- user wanted the VPS-backed `huwa2` available locally while treating original backup and local database state as protected -> repair only a working copy, use atomic restore, and avoid unrelated resets. [Task 1]

## Reusable knowledge

- Before restore, validate every `auth.identities.user_id` has `auth.users.id`. This backup had 10 orphan phone identities; adding placeholder parents to the working copy yielded 18 users, 26 identities, 0 orphans. Recovered accounts may lack authenticable passwords/phone data. [Task 1]
- Use `scripts/04-restore-local.sh`; available Git Bash was `C:\Program Files (x86)\Git\bin\bash.exe`. Successful restore committed transaction, storage policies/85 objects, and deliberately skipped 18 existing edge functions. [Task 1]
- Local stack is managed by Supabase CLI at `C:\Users\user\Documents\local-supabase`, not Compose. Add `"huwa2"` to `[api].schemas` in `supabase/config.toml`, then `supabase stop --workdir ...` / `supabase start --workdir ...`; verify `PGRST_DB_SCHEMAS`, project/schema, and orphan count. [Task 1]

## Failures and how to do differently

- Do not retry a known inconsistent backup unchanged. `scripts/06-expose-schema.sh` fails `Could not locate compose file for 'supabase_rest_local-supabase'` in CLI-managed environments; detect `com.supabase.cli.project` and update CLI config instead. [Task 1]

# Task Group: C:\Users\user\Desktop\ai comment — evidence-bound metadata and web manifest guidance

scope: Update reusable website metadata instructions without leaking historical project identity or unsupported claims.
applies_to: cwd=C:\Users\user\Desktop\ai comment; reuse_rule=derive all identity/scope values from the active project only; this is instruction-file guidance, not a specific site’s metadata.

## Task 1: Project-agnostic metaTitle and site.webmanifest workflow

### rollout_summary_files

- rollout_summaries/2026-08-10T04-13-53-hwPl-project_agnostic_metadata_and_webmanifest_guidance.md (cwd=C:\Users\user\Desktop\ai comment, rollout_path=C:\Users\user\.codex\sessions\2026\08\10\rollout-2026-08-10T12-13-53-019fe9e0-8772-7143-8b6b-11cc8a866137.jsonl, updated_at=2026-08-10T04:22:20+00:00, thread_id=019fe9e0-8772-7143-8b6b-11cc8a866137, success)

### keywords

- (AI) metaTitle.txt, INSUFFICIENT DATA, project identity, broad scope, site.webmanifest, Select-String -LiteralPath

## User preferences

- find the “actual project name user are working on rightnow” and avoid copied VIP Billion/direct project names -> derive name from current files, brand, configuration, routes, metadata, and runtime evidence; preserve confirmed spelling/legal suffix. [Task 1]
- avoid narrow examples “car, door, hotel” and use broader/global meaning only when evidence supports it; metadata belongs in the existing centralized module/include, not seed/data or unrelated templates. [Task 1]

## Reusable knowledge

- Require `INSUFFICIENT DATA` when identity is unconfirmed; do not copy names, domains, URLs, social accounts, locations, colors, page filenames, or claims from example/history. Detail pages can retain confirmed item names; home/category pages can use broader confirmed offerings. [Task 1]
- Manifest reminder covers evidence-based `name`, `short_name`, `description`, `lang`, `id`, `start_url`, `scope`, `display`, colors, and existing icon paths/MIME/sizes. Do not create a manifest merely for SEO when site is not an installable web app. [Task 1]

## Failures and how to do differently

- `rg --literal-path` is unsupported; use PowerShell `Select-String -LiteralPath` for an exact-file scan. If no Git repo, use read-back and targeted scans rather than `git diff`. [Task 1]

# Task Group: D:\backup\zeta-aiseo — generated-news sitemap coverage

scope: Maintain the Chinese Zeta Aiseo static news pipeline, generated sitemap, and shared homepage asset versions.
applies_to: cwd=D:\backup\zeta-aiseo; reuse_rule=validate current data/generator output rather than assumed article lists; article publishing remains evidence-gated.

## Task 1: Sitemap and published-news route audit

### rollout_summary_files

- rollout_summaries/2026-10-12T04-27-14-dxCe-zeta_aiseo_sitemap_news_route_audit.md (cwd=D:\backup\zeta-aiseo, rollout_path=C:\Users\user\.codex\sessions\2026\10\12\rollout-2026-10-12T12-27-14-01a12e5d-60dd-7b02-9b53-d85577178fce.jsonl, updated_at=2026-10-12T04:30:11+00:00, thread_id=01a12e5d-60dd-7b02-9b53-d85577178fce, success)

### keywords

- sitemap.xml, published news routes, generated routes, zeta-aiseo

## Task 2: News-workflow orientation and shared `?v=2301` cache busting

### rollout_summary_files

- rollout_summaries/2026-10-16T04-08-33-Mk34-zeta_aiseo_project_orientation_cache_busting_v2301.md (cwd=D:\backup\zeta-aiseo, rollout_path=C:\Users\user\.codex\sessions\2026\10\16\rollout-2026-10-16T12-08-34-01a142e5-b9be-7dd2-b7a7-f6e0cc2311fe.jsonl, updated_at=2026-10-16T09:08:54+00:00, thread_id=01a142e5-b9be-7dd2-b7a7-f6e0cc2311fe, partial; cache update succeeded, five articles not delivered)

### keywords

- data/news.json, generate-news.js, validate-news.js, NEWS_WORKFLOW.md, aiseo-comparison.css, ?v=2301, assets/main.css, assets/news.css, assets/news-images.js

## User preferences

- Article work starts by reading project Markdown and routed skills; the shared CSS/JS cache version should be explicit and easy to update. [Task 2]

## Reusable knowledge

- Sitemap was already complete against generated published news routes; validate route generation and sitemap together before adding entries. [Task 1]
- `data/news.json` is canonical; run `node tools/generate-news.js` then `node tools/validate-news.js`. Contracts: Simplified Chinese, stable lowercase ASCII slugs, no public byline, `/news/` + `/news/{slug}/`, max 900x600 local covers strictly under 200,000 bytes. [Task 2]
- The homepage loads `assets/main.css`, `/assets/news.css`, `/assets/aiseo-comparison.css`, `assets/main.js`, and `assets/news-images.js`, not `style.css`. Version all related references together and deploy both `index.html` and changed assets. [Task 2]

## Failures and how to do differently

- Do not infer missing sitemap coverage from article files alone; compare the actual published-route generator output. [Task 1]
- Do not treat the incomplete five-article request as a completed publishing run. GitNexus was not indexed for this checkout, so local docs/source are the reliable evidence. A local cache fix does not prove production: inspect live resource URLs and computed SVG checkmark styles after publishing. [Task 2]

# Task Group: D:\project\mincorner — checkout text tracing and secure pickup-date workflow

scope: Trace cart UI wording and maintain pickup-date rules across browser selection and PHP order finalization.
applies_to: cwd=D:\project\mincorner; reuse_rule=checkout-specific; preserve existing dirty work and exclude unrelated admin reporting date pickers.

## Task 1: Confirm Remark popup hardcoding

### rollout_summary_files

- rollout_summaries/2026-10-13T01-34-59-HFET-confirm_remark_popup_hardcoded.md (cwd=D:\project\mincorner, rollout_path=C:\Users\user\.codex\sessions\2026\10\13\rollout-2026-10-13T09-35-00-01a132e6-0be2-72c1-ba80-59225dfa87d3.jsonl, updated_at=2026-10-13T03:03:56+00:00, thread_id=01a132e6-0be2-72c1-ba80-59225dfa87d3, success)

### keywords

- Remark, 备注, cart popup, hardcoded bilingual text

## Task 2: Malaysia pickup-date window and post-cart security validation

### rollout_summary_files

- rollout_summaries/2026-10-16T07-11-32-MkqL-mincorner_pickup_date_window_security_validation.md (cwd=D:\project\mincorner, rollout_path=C:\Users\user\.codex\sessions\2026\10\16\rollout-2026-10-16T15-11-33-01a1438d-4087-7df2-a212-e184982c6c0b.jsonl, updated_at=2026-10-16T08:24:48+00:00, thread_id=01a1438d-4087-7df2-a212-e184982c6c0b, success; browser/live order unverified)

### keywords

- cart.php, checkout.php, CartController.php, assets/js/app.js, bootstrap-datepicker, cartPickupDateWindow, cartPickupDateUnavailableReason, Asia/Kuala_Lumpur, Failed to order, placeOrderWithoutPayment

## User preferences

- user asked whether the Remark popup was hardcoded -> answer source-tracing questions with the exact template/source evidence, not assumptions about translation systems. [Task 1]
- Validate an unpickable date on cart creation and again immediately before final order creation; return a visible failed-order reason and retain subtle eligible-date guidance. [Task 2]

## Reusable knowledge

- The right-side Remark/备注 cart popup uses hardcoded bilingual template text. [Task 1]
- Customer picker is only `cart.php` `#datepicker` in shared `assets/js/app.js`; `checkout.php` displays the stored date. Canonical rule: Malaysia today +3 through start+19 inclusive (20 days), Mondays unavailable. Server helpers centralize range/Monday reasoning; finalization rechecks saved `delivery_date` under lock before stock decrement. [Task 2]

## Failures and how to do differently

- Keep this as a diagnostic result; do not propose a localization rewrite unless requested. [Task 1]
- Do not apply customer pickup restrictions to admin reporting pickers. Syntax/diff checks passed but no browser/calendar or live-order run occurred; visually test the date cells and test a safe order path before calling the UI end-to-end complete. [Task 2]

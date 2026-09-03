# Task Group: C:\Users\user\Desktop\used-car project audit, SQL boundaries, saved-loan UI, and search visibility

scope: Current Used-Car architecture, source boundaries, local verification, surgical saved-loan revisions, and evidence-gated search visibility.
applies_to: cwd=C:\Users\user\Desktop\used-car; reuse_rule=Checkout-specific. Read PROJECT_CONTEXT.md first; `template/` is active and `sample/` is reference only.

## Task 1: Project audit, SQL source audit, localhost, and saved-loan reversal, succeeded/partial

### rollout_summary_files

- rollout_summaries/2026-08-27T07-28-15-vpVJ-used_car_project_audit_localhost_sql_loan_card_revision.md (cwd=\\?\C:\Users\user\Desktop\used-car, rollout_path=\\?\C:\Users\user\.codex\sessions\2026\08\27\rollout-2026-08-27T15-28-15-01a0421e-939f-7453-b375-f3a5f387b2a7.jsonl, updated_at=2026-08-28T09:08:56+00:00, thread_id=01a0421e-939f-7453-b375-f3a5f387b2a7, live schema unverified)

### keywords

- PROJECT_CONTEXT.md, template/, _archived, 001-017, Favorites.vue, MyLoans.vue, ContactSheet.vue, pnpm.cmd run dev:local, development.localhost, supabaseUrl is required

## Task 2: Project handoff and read-only search visibility audit, partial

### rollout_summary_files

- rollout_summaries/2026-08-26T07-59-08-hW4u-used_car_project_context_product_operating_model_search_audi.md (cwd=\\?\C:\Users\user\Desktop\used-car, rollout_path=C:\Users\user\.codex\sessions\2026\08\26\rollout-2026-08-26T15-59-08-01a03d14-7cf8-7140-a996-b323c2e5e046.jsonl, updated_at=2026-08-26T11:02:31+00:00, thread_id=01a03d14-7cf8-7140-a996-b323c2e5e046, production visibility unproven)
- rollout_summaries/2026-08-27T07-26-14-HZEO-used_car_codex_boot_and_project_read_deferred.md (cwd=\\?\C:\Users\user\Desktop\used-car, rollout_path=C:\Users\user\.codex\sessions\2026\08\27\rollout-2026-08-27T15-26-14-01a0421c-bb2c-7070-ac68-04167f73867e.jsonl, updated_at=2026-08-27T07:26:42+00:00, thread_id=01a0421c-bb2c-7070-ac68-04167f73867e, onboarding routing)

### keywords

- LOCAL-SEARCH-MAP.md, useSEO.ts, ViteSSG, robots.txt, sitemap.xml, carmvp.example.my, hreflang, OAI-SearchBot, INSUFFICIENT DATA

## User preferences

- when asking to "read and understand my project ... all folder and .md," build a durable source-grounded map: inspect project-owned Markdown comprehensively, treat `sample/` and screenshots as reference, and reconcile current source, services, types, and SQL. [Task 1]
- when requesting a focused saved-loan change and removal from "both cards pages," make surgical edits, check both `Favorites.vue` and `MyLoans.vue`, and preserve unrelated WhatsApp/contact behavior. [Task 1]
- reuse the existing primary dealer/environment fallback and WhatsApp conventions; do not invent contact data. [Task 1]

## Reusable knowledge

- Active app is `template/`: Vue 3, Vite, TypeScript, Tailwind v4, Pinia, Vue Router, vue-i18n (zh/en/ms), ViteSSG, PWA, Supabase; flow is views -> Pinia stores -> Supabase services -> `cars` schema. `PROJECT_CONTEXT.md` is the truth map. [Task 1]
- Never provision from `template/src/sql/migrations/_archived/`: client migrations 001-017 are deprecated. Admin migrations 001-039 were documented under `D:\admin-panel-used-car\apps\web-antd\src\sql\migrations\`, but that repo and live schema were unavailable; retain `INSUFFICIENT DATA`. Client services expect `slug`, `isHot`, `isActive`, `loan_term_option`, `cta_events`, `articles`, and `v_published_articles`. [Task 1]
- Run `pnpm.cmd run dev:local` from `template`; frontend is `http://127.0.0.1:3000`. For SSR missing environment configuration, use `pnpm.cmd exec vite build --mode development.localhost` with keys redacted. [Task 1]
- Saved-loan cards are in the two named views. Temporary `LoanContactSheet.vue` and the precise-quote button were removed; retain payment, price, down-payment, term, rate, saved date, and delete action. Vehicle WhatsApp remains in `views/cars/ContactSheet.vue`. [Task 1]
- Audit visibility in order: source -> ViteSSG build -> preview -> rendered HTML -> robots/sitemap -> production crawler/CDN. Keep `crawl -> index eligibility -> AI citation -> referral visit -> product action -> qualified lead` distinct. [Task 2]

## Failures and how to do differently

- Current source outranks README/blueprint: known drift includes `#root` CSS vs `#app` mount, obsolete mock-data/VITE_DATA_MODE claims, missing `VITE_SITE_BASE_URL`, and direct Supabase services. Type-check had unrelated errors; do not claim a clean build. [Task 1]
- Prefer simple separately quoted PowerShell commands and relative checks from `template/`; wildcard quoting and complex detached-start commands failed. [Task 1]
- Do not infer Johor/JB coverage, identity, contacts, production domain, inventory, rankings, or AI citations from fallback data, local HTTP 200, or Bing. Verify origin/CDN, crawler access, rendered output, and analytics separately. [Task 2]

# Task Group: Windows Chrome SideBySide startup repair

scope: Diagnose an installed Chrome launch failure caused by an incomplete update when the shortcut is valid.
applies_to: cwd=C:\Users\user\Desktop\used-car; reuse_rule=Machine/version-specific; inspect current files, event logs, registry version, and obtain authorization before elevated replacement.

## Task 1: Repair Chrome startup error, succeeded

### rollout_summary_files

- rollout_summaries/2026-08-27T01-14-49-nqVw-repair_chrome_side_by_side_startup_error.md (cwd=\\?\C:\Users\user\Desktop\used-car, rollout_path=C:\Users\user\.codex\sessions\2026\08\27\rollout-2026-08-27T09-14-50-01a040c8-b2ca-73e0-9fcf-88af85530a0e.jsonl, updated_at=2026-08-27T01:18:15+00:00, thread_id=01a040c8-b2ca-73e0-9fcf-88af85530a0e, success)

### keywords

- Chrome, SideBySide, missing dependent assembly, 151.0.7922.173, 151.0.7922.175, new_chrome.exe, new_chrome_proxy.exe, chrome.exe.broken

## User preferences

- when troubleshooting, the user asked "can ai fix this problem for me?" -> investigate and safely repair the actual issue when authorized, not generic instructions. [Task 1]

## Reusable knowledge

- A valid root `chrome.exe` shortcut plus SideBySide missing assembly pointed to a failed update, not shortcut damage. A complete pending build may exist as `new_chrome.exe`/`new_chrome_proxy.exe`; this repair switched version-checked launchers after backups. [Task 1]

## Failures and how to do differently

- Installer exit code `3` is a pivot: inspect pending files, versioned directory/manifest, and registry first. `chrome.exe --version` acted as a normal launch; verify file versions and an actual Chrome process. [Task 1]

# Task Group: Project-agnostic product development, metadata, and search reasoning

scope: Evidence-gated overlay for product, architecture, UX, metadata, SEO, AI research, and knowledge evolution.
applies_to: cwd=project-agnostic; reuse_rule=Use for product/search/content/knowledge work, not routine narrow edits; current project evidence and explicit user direction outrank the overlay.

## Task 1: Product-development operating model, active

### rollout_summary_files

- extensions/ad_hoc/notes/2026-08-26-product-development-operating-model.md (cwd=project-agnostic, rollout_path=not available, updated_at=2026-08-26, thread_id=not available, authoritative extension note) [ad-hoc note]
- rollout_summaries/2026-08-26T07-59-08-hW4u-used_car_project_context_product_operating_model_search_audi.md (cwd=\\?\C:\Users\user\Desktop\used-car, rollout_path=C:\Users\user\.codex\sessions\2026\08\26\rollout-2026-08-26T15-59-08-01a03d14-7cf8-7140-a996-b323c2e5e046.jsonl, updated_at=2026-08-26T11:02:31+00:00, thread_id=01a03d14-7cf8-7140-a996-b323c2e5e046, adapted)

### keywords

- product-development-operating-model, 60/40, adopt/adapt/defer/reject, one intent per canonical page, OAI-SearchBot, IndexNow, llms.txt, INSUFFICIENT DATA

## Task 2: Evidence-bound metadata and webmanifest guidance, succeeded

### rollout_summary_files

- rollout_summaries/2026-08-10T04-13-53-hwPl-project_agnostic_metadata_and_webmanifest_guidance.md (cwd=\\?\C:\Users\user\Desktop\ai comment, rollout_path=C:\Users\user\.codex\sessions\2026\08\10\rollout-2026-08-10T12-13-53-019fe9e0-8772-7143-8b6b-11cc8a866137.jsonl, updated_at=2026-08-10T04:22:20+00:00, thread_id=019fe9e0-8772-7143-8b6b-11cc8a866137, success)

### keywords

- (AI) metaTitle.txt, site.webmanifest, centralized metadata, name, short_name, start_url, scope

## User preferences

- for durable Codex knowledge, preserve English-only improvements and narrow exact trigger control: remove standalone `meta` while retaining `meta update` and `meta seo`. [Task 1]
- for metadata, avoid old project identities and narrow "car, door, hotel" examples; derive current identity/scope from active evidence without exaggeration. [Task 2]

## Reusable knowledge

- Protect the verified 60% foundation; for meaningful evolution use `context -> existing owner -> overlap/conflict -> adopt/adapt/defer/reject -> smallest integration -> activation boundary -> verification -> rollback`. [Task 1] [ad-hoc note]
- Each canonical page needs one primary intent and useful next action. Keep `crawl -> index eligibility -> AI citation -> referral visit -> product action -> qualified lead` distinct. IndexNow is only a freshness notification; `llms.txt` is optional/reversible and never replaces visible HTML, robots, sitemap, canonical, or sources. [Task 1] [ad-hoc note]
- Centralize metadata in the existing owner; derive visible brand, legal spelling, routes, config, and runtime evidence. Manifest values apply only to installable apps. [Task 2]

## Failures and how to do differently

- Stop with `INSUFFICIENT DATA` when truth, volatile facts, ownership, public entity/location, intent uniqueness, maintenance owner, or production verification is missing. [Task 1] [ad-hoc note]
- Do not add unsupported `triggers` to skill frontmatter; validators reject them. Do not force strategic overhead onto routine fixes. [Task 1]

# Task Group: EDSB page-body image lazy loading

scope: High-priority `data-src`/placeholder contract for eligible EDSB page-body images, including dynamic cards.
applies_to: cwd=C:\Users\user\Desktop\EDSB; reuse_rule=Inspect `website-edsb/js/main.js` and `EDSB_IMAGE_LOADING_CONTINUATION.md`; do not apply to excluded UI/background/video assets.

## Task 1: High-priority data-src lazy-loading contract

### rollout_summary_files

- extensions/ad_hoc/notes/2026-08-21-high-priority-data-src-lazyload.md (cwd=C:\Users\user\Desktop\EDSB, rollout_path=not available, updated_at=2026-08-21, thread_id=not available, authoritative extension note) [ad-hoc note]

### keywords

- lazyload, data-src, IntersectionObserver, 1x1 SVG placeholder, loading=lazy, decoding=async, data-lazy-exclude, website-edsb/js/main.js

## Reusable knowledge

- Keep original URL in `data-src`, use a 1x1 SVG data-image placeholder in `src`, and restore it with `IntersectionObserver`. Remove `data-src` only after a successful load; apply `loading="lazy"` and `decoding="async"`. Dynamic/news/infinite-scroll images use the same contract before/immediately after append. [Task 1] [ad-hoc note]
- Exclude header/footer/mobile menu/off-canvas/preloader/WhatsApp/floating-contact UI and `[data-lazy-exclude]`; leave CSS backgrounds, `data-background-image`, video, and sources unchanged. [Task 1] [ad-hoc note]

## Failures and how to do differently

- Attribute rewrites alone are insufficient: browser-check pre/post reveal and dynamic lists, confirm exclusions/background/video counts, then run syntax, HTTP, and UTF-8 checks. [Task 1] [ad-hoc note]

# Task Group: C:\Users\user\.codex boot, maintenance, and Git staging

scope: Codex sentinel behavior, route-first maintenance, fast-batch checkpoints, and safe parent-repository staging.
applies_to: cwd=C:\Users\user\.codex; reuse_rule=Checkout-specific. Inspect status, sparse checkout, locks, and nested Git before changing, staging, or cleaning.

## Task 1: Exact Codex knowledge boot sentinel, succeeded

### rollout_summary_files

- rollout_summaries/2026-08-27T07-26-14-HZEO-used_car_codex_boot_and_project_read_deferred.md (cwd=\\?\C:\Users\user\Desktop\used-car, rollout_path=C:\Users\user\.codex\sessions\2026\08\27\rollout-2026-08-27T15-26-14-01a0421c-bb2c-7070-ac68-04167f73867e.jsonl, updated_at=2026-08-27T07:26:42+00:00, thread_id=01a0421c-bb2c-7070-ac68-04167f73867e, success)
- rollout_summaries/2026-08-05T08-13-36-owK2-codex_knowledge_boot_sentinel.md (cwd=\\?\C:\Users\user\Desktop\motorcycle, rollout_path=C:\Users\user\.codex\sessions\2026\08\05\rollout-2026-08-05T16-13-36-019fd0fc-32b2-7e81-a332-2609b86c37f6.jsonl, updated_at=2026-08-05T08:14:03+00:00, thread_id=019fd0fc-32b2-7e81-a332-2609b86c37f6, success)

### keywords

- ai read .codex knowledge, 00_PULSE.md, [🟢] Agent is Ready.., HYDRATE, GROUND, PLAN, ACT, VERIFY

## Task 2: Route-first maintenance, fast-batch checkpoints, and sparse staging, succeeded/partial

### rollout_summary_files

- rollout_summaries/2026-08-20T01-54-45-Rl4o-codex_git_sparse_checkout_and_generated_images_cleanup.md (cwd=\\?\C:\Users\user\.codex, rollout_path=\\?\C:\Users\user\.codex\sessions\2026\08\20\rollout-2026-08-20T09-54-45-01a01ce0-bb0d-76b1-898a-dabc3ae2eddc.jsonl, updated_at=2026-08-20T08:30:33+00:00, thread_id=01a01ce0-bb0d-76b1-898a-dabc3ae2eddc, nested Git pending)
- rollout_summaries/2026-08-12T08-56-09-fmgd-codex_fast_batch_workflow_protocol.md (cwd=\\?\C:\Users\user\.codex, rollout_path=C:\Users\user\.codex\sessions\2026\08\12\rollout-2026-08-12T16-56-09-019ff52f-a88b-7893-a2b3-9a5d5e75097d.jsonl, updated_at=2026-08-12T09:01:25+00:00, thread_id=019ff52f-a88b-7893-a2b3-9a5d5e75097d, nested Git pending)
- rollout_summaries/2026-08-12T07-57-58-bZCY-codex_lean_maintenance_and_memory_compression.md (cwd=\\?\C:\Users\user\.codex, rollout_path=C:\Users\user\.codex\sessions\2026\08\12\rollout-2026-08-12T15-57-58-019ff4fa-668d-74d2-bc92-64724b087b5c.jsonl, updated_at=2026-08-12T08:30:52+00:00, thread_id=019ff4fa-668d-74d2-bc92-64724b087b5c, success)
- rollout_summaries/2026-08-04T07-01-58-Kxur-codex_router_performance_cleanup_git_ignore_audit.md (cwd=\\?\C:\Users\user\.codex, rollout_path=C:\Users\user\.codex\sessions\2026\08\04\rollout-2026-08-04T15-01-58-019fcb94-3f2d-7492-80ca-40742d942aa3.jsonl, updated_at=2026-08-04T10:40:59+00:00, thread_id=019fcb94-3f2d-7492-80ca-40742d942aa3, routing health verified)

### keywords

- Update-CodexRouting.ps1, Audit-CodexRouting.ps1, FAST BATCH STATE, DONE, ACTIVE, NEXT, BLOCKED, git add --sparse, thread-writer-locks, memories/.git

## User preferences

- for `.codex` improvements, the user asked to "highly improve performances" but "wont make heavy changes" -> inspect live routes, memory sizes, skills, and benchmarks first; favor surgical, reversible changes. [Task 2]
- for long work, preserve exact requirements and an actionable continuation state after verification gates. [Task 2]

## Reusable knowledge

- Exact `ai read .codex knowledge`: read `00_PULSE.md` once and reply only `[🟢] Agent is Ready..`; the next message is normal TASK state with no repeated sentinel/full tree scan. [Task 1]
- Route first and keep detail lazy. Checkpoints preserve objectives, boundaries, paths, contracts, IDs/errors, decisions, changed files, and evidence with `DONE`, `ACTIVE`, `NEXT`, `BLOCKED`, `DEFERRED`, `OBSOLETE`. [Task 2]
- For route/index edits, update routing then run audit, activation, performance, and compression verification. Batch only independent read-only work; order edits, destructive work, auth/secrets, database changes, and ambiguous choices. [Task 2]
- Earlier routing repair passed benchmark `32/32`, activation `18/18`, with 138 active routes, 244 manifest entries, zero missing targets, zero conflicts, and zero legacy references. Recheck current state rather than treating these as timeless counts. [Task 2]
- When sparse checkout blocks staging, use `git add --sparse`; normal staging was restored by adding `codex-router`, `memories`, and `skills`. Use Recycle Bin API only after exact-target verification. [Task 2]

## Failures and how to do differently

- Do not create a missing skill just to satisfy a stale route. Locked Windows cache/vendor files should be preserved until Codex closes. Newer evidence found `C:\Users\user\.codex\memories\.git` as nested Git metadata at commit `06cfff2`, contrary to an older absent observation; inspect current state and do not remove it without explicit authorization. [Task 2]

# Task Group: D:\backup\website-zetasoftware bilingual content, FAQ, blog, and visual parity

scope: Static bilingual EN/CN site maintenance, data-driven FAQ/blog contracts, exact visual reuse, and localhost verification.
applies_to: cwd=D:\backup\website-zetasoftware; reuse_rule=Checkout-specific. English is markup/design source; update `cn/` with localized visible text and preserve paired IDs/slugs/schema.

## Task 1: Bilingual FAQ, homepage/blog, services, and pricing parity, succeeded

### rollout_summary_files

- rollout_summaries/2026-08-13T09-01-30-FmzH-zetasoftware_bilingual_faq_homepage_blogs_pricing_parity.md (cwd=\\?\D:\backup\website-zetasoftware, rollout_path=C:\Users\user\.codex\sessions\2026\08\13\rollout-2026-08-13T17-01-30-019ffa5a-eb3e-7172-8f41-7b65c41c8a95.jsonl, updated_at=2026-08-13T09:54:49+00:00, thread_id=019ffa5a-eb3e-7172-8f41-7b65c41c8a95, success)
- rollout_summaries/2026-08-13T06-18-50-bDIs-zetasoftware_bilingual_faq_system_and_interrupted_globalizat.md (cwd=\\?\D:\backup\website-zetasoftware, rollout_path=C:\Users\user\.codex\sessions\2026\08\13\rollout-2026-08-13T14-18-50-019ff9c5-febf-7151-a502-860618d376c8.jsonl, updated_at=2026-08-13T09:01:23+00:00, thread_id=019ff9c5-febf-7151-a502-860618d376c8, later request completed by newer rollout)

### keywords

- data/faq.json, js/faq.js, FAQPage JSON-LD, home-blogs.js, pricing-section, Orbitron, status.md, meta.md, paired IDs

## Task 2: Bilingual blog system and exact portfolio phone-frame reuse, partial/succeeded

### rollout_summary_files

- rollout_summaries/2026-08-13T08-59-12-0qMc-zetasoftware_blog_regeneration_portfolio_phone_frame_correct.md (cwd=\\?\D:\backup\website-zetasoftware, rollout_path=\\?\C:\Users\user\.codex\sessions\2026\08\13\rollout-2026-08-13T16-59-12-019ffa58-d0c5-7e41-b135-6dd2e966daa4.jsonl, updated_at=2026-08-13T11:03:42+00:00, thread_id=019ffa58-d0c5-7e41-b135-6dd2e966daa4, blog regeneration unverified; phone reuse success)
- rollout_summaries/2026-08-13T01-17-52-eGXh-zetasoftware_bilingual_blog_system_revisions.md (cwd=\\?\D:\backup\website-zetasoftware, rollout_path=C:\Users\user\.codex\sessions\2026\08\13\rollout-2026-08-13T09-17-53-019ff8b2-757c-7922-bc4f-99b7ec3f1f53.jsonl, updated_at=2026-08-13T06:18:23+00:00, thread_id=019ff8b2-757c-7922-bc4f-99b7ec3f1f53, article replacement unverified)

### keywords

- data/blogs.json, data/blogs-cn.json, js/blogs.js, blogs.md, contentHtml, sticky-phone, phone-screen, css/style.css, 1200px, UTF-8

## User preferences

- for bilingual changes, English markup/design is the source; update `cn/`, localize visible text, and verify paired IDs/slugs/schema. [Task 1][Task 2]
- FAQ answers should be "long and human friendly" with readable intent coverage; balance local relevance with broader service wording and put at least five company questions near the top. [Task 1]
- for exact visual requests, reuse canonical component/classes/measurements, not a pseudo-phone approximation. [Task 2]
- preserve explicit edit boundaries: blog work must not change the homepage unless requested; remove author fields and display together. [Task 2]

## Reusable knowledge

- `data/faq.json` holds `en`/`cn`; `js/faq.js` selects by `/cn/`, renders accordions, and synchronizes `#faq-schema` FAQPage JSON-LD. Final verified state: 30 unique paired records per language, five company IDs first, nine paired title changes, and crawlable fallback HTML in both FAQ pages. [Task 1]
- `js/home-blogs.js` sorts localized datasets, renders three cards with the requested classes/CTA, and refreshes Lucide icons. Services pricing uses shared homepage classes; load the same Google Fonts URL in both services pages for Orbitron parity. [Task 1]
- Blog data uses `data/blogs.json`/`data/blogs-cn.json`, shared slugs/image paths, and `contentHtml`; preserve matching `slug`, `category`, `date`, `readTime`, `image`, `title`, `excerpt`, `contentHtml`, no author field/display, and no related-articles section. Root-relative image URLs resolve against the project; copy assets into `images/blog/` and existence-check before JSON references. Existing renderer has optional GSAP/Lenis fallbacks. [Task 2]
- Phone-frame reuse: `sticky-phone portfolio-card-phone`, `phone-screen`, `phone-camera`, `phone-physical-btn`, `reflection-overlay`, `screen-light-bleed`; desktop 310x640, mobile 275x572. [Task 2]

## Failures and how to do differently

- Use explicit UTF-8/no-BOM or surgical patches for multilingual files. After JSON edits, parse JSON and check counts, duplicate IDs, and EN/CN pairing immediately. [Task 1][Task 2]
- Do not claim the ten-article regeneration or `why-user-experience-should-shape-the-build` article replacement completed: generated assets/dataset replacement were not fully evidenced. [Task 2]
- Source/HTTP checks are not browser/cPanel proof; hard-refresh after upload before claiming visual completion. Use `status.md`/`meta.md` as project contracts and verify JSON parse, relevant `node --check`, `git diff --check`, and real local HTTP responses. [Task 1][Task 2]

# Task Group: Huwa2 Supabase VPS restore and local PostgREST exposure

scope: Repair backup-only auth integrity, atomically restore locally, and expose a schema through Supabase CLI.
applies_to: cwd=C:\Users\user\Documents\supabase-project-backup-restore; reuse_rule=Machine/backup-specific. Preserve originals and local Docker data.

## Task 1: Repair, restore, and expose Huwa2, succeeded

### rollout_summary_files

- rollout_summaries/2026-08-14T02-47-47-8IL6-huwa2_vps_restore_and_postgrest_expose.md (cwd=\\?\C:\Users\user\Documents\supabase-project-backup-restore, rollout_path=C:\Users\user\.codex\sessions\2026\08\14\rollout-2026-08-14T10-47-47-019ffe2b-21d6-7ff2-9bea-6cfa6ab17768.jsonl, updated_at=2026-08-14T03:10:24+00:00, thread_id=019ffe2b-21d6-7ff2-9bea-6cfa6ab17768, success)

### keywords

- huwa2, 04-auth-rows.sql, identities_user_id_fkey, orphan identities, 04-restore-local.sh, PGRST_DB_SCHEMAS, [api].schemas, config.toml

## User preferences

- preserve the original backup, repair only a local working copy, and make narrow backed-up state changes. [Task 1]

## Reusable knowledge

- Before restore, ensure every `auth.identities.user_id` has an `auth.users.id`; this working copy used placeholder parents for orphan identities. Recovered accounts may not authenticate. [Task 1]
- Restore using `C:\Program Files (x86)\Git\bin\bash.exe scripts/04-restore-local.sh vps-backups/huwa2-20260814-104556`. CLI-managed exposure belongs in `C:\Users\user\Documents\local-supabase\supabase\config.toml` `[api].schemas`, then `supabase stop/start --workdir ...`; verify `PGRST_DB_SCHEMAS`. [Task 1]

## Failures and how to do differently

- Do not retry an inconsistent backup unchanged. `scripts/06-expose-schema.sh` fails with `Could not locate compose file for 'supabase_rest_local-supabase'` for CLI-managed containers; detect `com.supabase.cli.project` and use CLI config. [Task 1]

# Task Group: C:\Users\user\Desktop\motorcycle catalogue and FC-Moto metadata

scope: JamboLive catalogue/category audit and FC-Moto PHP metadata/content policy.
applies_to: cwd=C:\Users\user\Desktop\motorcycle\jambolive or C:\Users\user\Desktop\motorcycle\fc-moto-new; reuse_rule=Checkout-specific; do not cross-apply source data or noindex policy.

## Task 1: JamboLive import and category audit, partial

### rollout_summary_files

- rollout_summaries/2026-08-06T01-08-46-xCAa-jambolive_product_import_and_category_audit.md (cwd=\\?\C:\Users\user\Desktop\motorcycle\jambolive, rollout_path=C:\Users\user\.codex\sessions\2026\08\06\rollout-2026-08-06T09-08-47-019fd49d-9b00-7ff0-ac3e-c548678624a2.jsonl, updated_at=2026-08-06T02:26:20+00:00, thread_id=019fd49d-9b00-7ff0-ac3e-c548678624a2, category correction not completed)

### keywords

- database.json, import-public-products.ps1, 317 products, 39 categories, HtmlDecode, sea.jambolive.tv

## Task 2: FC-Moto metadata, noindex policy, and PHP content cleanup, partial/succeeded

### rollout_summary_files

- rollout_summaries/2026-08-07T08-58-09-YPrd-fc_moto_metadata_noindex_and_homepage_cleanup.md (cwd=\\?\C:\Users\user\Desktop\motorcycle\fc-moto-new, rollout_path=\\?\C:\Users\user\.codex\sessions\2026\08\07\rollout-2026-08-07T16-58-09-019fdb71-b29e-7ad3-85f2-fa36bb94a3c3.jsonl, updated_at=2026-08-10T04:31:01+00:00, thread_id=019fdb71-b29e-7ad3-85f2-fa36bb94a3c3, footer read-back incomplete)

### keywords

- fcMotoIsIndexable, noindex, nofollow, lib/initData.php, lib/htmlhead.php, sitemap.php, site.webmanifest, footer.php, mojibake

## User preferences

- category correctness means IDs and human-readable labels compared directly with the live source. [Task 1]
- the user explicitly said "noindex, nofollow please" -> retain sitewide `noindex, nofollow` until reauthorized. [Task 2]
- footer categories should follow `category.json` in basic/source order, six per column; remove Top Brands. [Task 2]

## Reusable knowledge

- `data/database.json` had 317 unique products; live category labels require stripping tags, `[Net.WebUtility]::HtmlDecode($clean)`, whitespace normalization, and comparison to `?cat=<id>`. [Task 1]
- Metadata ownership is `lib/initData.php` plus `lib/htmlhead.php`. `fcMotoIsIndexable()` unconditionally returns false, so general crawlers and Googlebot emit `noindex, nofollow`; sitemap availability does not override that policy. [Task 2]
- For FC-Moto content, use `rg -n 'â|Ã|Â|�' template/home.php`, then `php -l` and HTTP check after surgical UTF-8 correction. Footer taxonomy comes from `data/category.json` through `fcMotoProductSubcategoryDefinitions('moto')`; escape labels/slugs. [Task 2]

## Failures and how to do differently

- IDs alone did not prove category correctness; stored names were placeholders. Use `@(...)` to prevent one-item arrays serializing as scalars. [Task 1]
- Production indexing/Apache/Search Console/crawler behavior remained unverified. PowerShell webmanifest reads may be bytes; UTF-8 decode before parsing. Use small patches when minified CSS prevents context matching, then inspect rendered footer markup/layout. [Task 2]

# Task Group: C:\Users\user\Desktop\saleshero schema knowledge and Mermaid test flow

scope: SQL-grounded project handoff and compact, user-format-preserving test-flow documentation.
applies_to: cwd=C:\Users\user\Desktop\saleshero; reuse_rule=Checkout-specific; preserve unresolved product decisions and treat Trash flow as format reference only.

## Task 1: Sales Hero schema knowledge and Mermaid flow, succeeded

### rollout_summary_files

- rollout_summaries/2026-08-05T03-29-22-nTKd-saleshero_knowledge_and_compressed_testflow.md (cwd=\\?\C:\Users\user\Desktop\saleshero, rollout_path=C:\Users\user\.codex\sessions\2026\08\05\rollout-2026-08-05T11-29-22-019fcff7-f81e-7ce1-b8dd-d9e04a524e95.jsonl, updated_at=2026-08-05T07:55:38+00:00, thread_id=019fcff7-f81e-7ce1-b8dd-d9e04a524e95, success)

### keywords

- sales_hero.sql, knowledge.md, testflow_saleshero.md, flowchart TD, discountTierId, item_variantsId, totalSalesCommision

## User preferences

- when asking to read root documents, SQL, schema PNGs, and client discussion, ground conclusions in current project files and preserve unresolved assumptions rather than inventing page structures. [Task 1]
- follow `testflow_trash_flowchart.md` "exactly in spirit": raw `flowchart TD`, numeric IDs, arrows, branches, compact labels; merge only steps suitable to the same screen/transaction. [Task 1]

## Reusable knowledge

- Core graph: `public.user -> sales_hero.users -> salesmans/dealers`; dealers -> orders -> order_details -> item_variants -> items; `orders -> invoices`; `order_details -> refunds`. Core roles are `super_admin`, `salesman`, `dealer`; `item_variants` owns quantity pricing. [Task 1]
- Keep gaps explicit: no clear partial-payment ledger, demo mode, territory/stage, commission-payout ledger, or shown stock movement logic. Final flow structurally validated `flowchart TD`, no duplicate labels, core tables/fields/business branches, and no passwords. [Task 1]

## Failures and how to do differently

- Not being a Git repo is not project failure: inspect direct files. For Mermaid, fix duplicate convergence labels and include exact schema identifiers; rendering/runtime/database execution were unavailable, so do not imply those tests ran. [Task 1]

# Task Group: C:\Users\user\Desktop\thongthai2 floorplanstatistics seat interaction

scope: Direct-source UI behavior inspection of floor-plan statistic seats versus the editable floorplans page.
applies_to: cwd=C:\Users\user\Desktop\thongthai2\admin-panel-Thongthai; reuse_rule=Checkout-specific; answer state-colored-seat questions from `floorplanstatistics/table.vue` before inferring behavior from another page.

## Task 1: Thongthai floorplanstatistics red-seat interaction, succeeded

### rollout_summary_files

- rollout_summaries/2026-08-05T07-09-43-riXS-floorplanstatistics_seat_click_behavior.md (cwd=\\?\C:\Users\user\Desktop\thongthai2\admin-panel-Thongthai, rollout_path=C:\Users\user\.codex\sessions\2026\08\05\rollout-2026-08-05T15-09-43-019fd0c1-b541-70a2-8a56-ff613fcd1170.jsonl, updated_at=2026-08-05T07:16:02+00:00, thread_id=019fd0c1-b541-70a2-8a56-ff613fcd1170, success)

### keywords

- floorplanstatistics, table.vue, reserved, isAvailableSeat, @click, @pointerdown, floorplans

## User preferences

- when asking whether clicking a seat or "the red seat" does anything, explicitly cover normal and state-colored seats. [Task 1]

## Reusable knowledge

- `floorplanstatistics/table.vue` is display-only: no click/pointer/modal/detail handler; red is `reserved` via `isAvailableSeat()`. `floorplans/table.vue` is separate and editable with `@pointerdown`. [Task 1]

## Failures and how to do differently

- For small behavior checks, direct source inspection beat GitNexus; an rg no-match is not a product failure. [Task 1]

# Task Group: Windows Ollama model location

scope: Locate installed Ollama model manifests/blobs without broad profile scans.
applies_to: cwd=C:\Users\user\Desktop\huwa; reuse_rule=Machine-specific; recheck cache path, installed model, and version.

## Task 1: Locate Gemma 4, succeeded

### rollout_summary_files

- rollout_summaries/2026-08-20T01-25-28-9wIS-locate_gemma4_ollama_model_folder.md (cwd=\\?\C:\Users\user\Desktop\huwa, rollout_path=C:\Users\user\.codex\sessions\2026\08\20\rollout-2026-08-20T09-25-28-01a01cc5-ef06-7613-ab20-48507ef62f16.jsonl, updated_at=2026-08-20T01:26:38+00:00, thread_id=01a01cc5-ef06-7613-ab20-48507ef62f16, success)

### keywords

- Ollama, gemma4, e2b, e4b, .ollama/models/manifests, .ollama/models/blobs

## Reusable knowledge

- Manifests are under `.ollama\models\manifests\registry.ollama.ai\library\<model>` and blobs under `.ollama\models\blobs`. [Task 1]

## Failures and how to do differently

- Do not recursively scan the whole Windows profile first; it timed out. Check known Ollama, Hugging Face, and LM Studio caches. [Task 1]

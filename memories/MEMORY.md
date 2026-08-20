# Task Group: HUWA2 customer Vue app visual-work continuation state

scope: Continue customer-facing visual work in the active HUWA2 Vue app while preserving established stores, API/RPC contracts, routes, i18n, and documented verification gates.
applies_to: cwd=C:\Users\user\Desktop\huwa\webApp-huwa2; reuse_rule=checkout-specific current-state note, last verified 2026-08-19; treat `sample`, `webApp-huwa`, and `admin-panel-huwa-2` as read-only references and recheck current source/changelog before implementation.

## Task 1: HUWA2 customer app current state and visual-work boundaries

### rollout_summary_files

- No rollout summary is available for this task; source is `project_notes/HUWA2_WEBAPP_CURRENT_STATE.md` (cwd=C:\Users\user\Desktop\huwa\webApp-huwa2, rollout_path=not provided, updated_at=2026-08-19, ad-hoc current-state note).

### keywords

- webApp-huwa2, PROJECT_CHANGELOG.md, npm.cmd run build, port 5174, Lucky Numbers, /luckydraw, checkoutApi.ts, cartStore, shippingSettingStore, migration 191, src/assets/images/generate/, --v2

## User preferences

- when doing HUWA2 visual work, preserve existing Vue behavior, Pinia stores, API/RPC calls, route guards, i18n keys, and database contracts; implementation batches belong in `C:\Users\user\Desktop\huwa\PROJECT_CHANGELOG.md`. [Task 1] [ad-hoc note]
- generated images belong in `src/assets/images/generate/`, must not exceed 1,200px width, and use PNG only for genuine transparency; do not create duplicate versioned CSS selectors such as `--v2`, `--v3`, `--v4`, or `--v5` for the same role. [Task 1] [ad-hoc note]

## Reusable knowledge

- The active app is `webApp-huwa2`; run locally on port 5174 and use `npm.cmd run build` as the production build check. No committed local `.env` exists, so runtime data depends on launch configuration; never expose credentials or authenticated data. [Task 1] [ad-hoc note]
- Major customer-page visual work covers Home, Catalog, Product Detail, Cart, Payment/result, Orders, Profile, Referral, Lucky Draw, VIP, Addresses, Notifications, Points, Transactions, Bank Account, Withdraw, and Withdrawal History. Legal copy is unchanged while `/terms`, `/refund-policy`, and `/privacy-policy` use mascots `12.png`, `2.png`, and `8.png` respectively. `/fortune` and `/zodiac` remain unfinished; `/profile/edit` needs an authenticated screenshot check. [Task 1] [ad-hoc note]
- Homepage `Lucky Numbers` goes to `/luckydraw`. Homepage search opens Catalog with its query; selecting a Catalog category clears search and restores category/all results. The Home variant modal rises above the shared footer only while open. [Task 1] [ad-hoc note]
- Lucky Draw uses image reels and local demo results because no backend Lucky Draw schema/RPC contract was provided. Its handle is idle PNG/active GIF with a 2,000 ms reset; success uses `9.png`, and `Nice try!` uses `13.png`. [Task 1] [ad-hoc note]
- Keep data boundaries: `checkoutApi.ts` and server quote/order RPCs own totals, shipping, discounts, points, membership, commission, charity, payment, refund, and cancellation. `cartStore` is browser storage, not a `huwa2` cart table. Verify callers before changing `shippingSettingStore` (`huwa2.shipping_settings`); `bannerStore` and `App.vue` already use active homepage banner/splash RPCs from migration 191. [Task 1] [ad-hoc note]

## Failures and how to do differently

- A successful build does not establish exact visual parity -> for Vue/template/CSS changes, read back changed files, run `npm.cmd run build`, then inspect the target route at the target mobile viewport against its `/sample` reference. If browser/screenshot access is unavailable, report the visual gate as blocked or partial. [Task 1] [ad-hoc note]
- Direct database calls to fix a visual issue -> use existing stores/API boundaries instead; recheck checkout and shipping contracts before altering behavior. [Task 1] [ad-hoc note]

# Task Group: Huwa2 VPS Supabase restore and local PostgREST exposure

scope: Repair an inconsistent Huwa2 VPS backup, restore it atomically into local Supabase, and expose the schema through a CLI-managed PostgREST stack.
applies_to: cwd=C:\Users\user\Documents\supabase-project-backup-restore; reuse_rule=checkout/environment-specific; preserve the original backup and local Docker data, and identify the active Supabase management mode before changing configuration.

## Task 1: Repair, restore, and expose the Huwa2 VPS backup locally

### rollout_summary_files

- rollout_summaries/2026-08-14T02-47-47-8IL6-huwa2_vps_restore_and_postgrest_expose.md (cwd=C:\Users\user\Documents\supabase-project-backup-restore, rollout_path=C:\Users\user\.codex\sessions\2026\08\14\rollout-2026-08-14T10-47-47-019ffe2b-21d6-7ff2-9bea-6cfa6ab17768.jsonl, updated_at=2026-08-14T03:10:24+00:00, thread_id=019ffe2b-21d6-7ff2-9bea-6cfa6ab17768, success)

### keywords

- Supabase, huwa2, 04-auth-rows.sql, auth.users, auth.identities, identities_user_id_fkey, scripts/04-restore-local.sh, PostgREST, PGRST_DB_SCHEMAS, [api].schemas, config.toml, com.supabase.cli.project

## User preferences

- when making the VPS-backed `huwa2` project available locally, preserve the original backup, repair only a working copy when necessary, and avoid unrelated resets or mutations of protected local database state. [Task 1]
- the requested outcome was localhost containing the VPS `huwa2` schema -> separately verify restored database presence and API exposure. [Task 1]

## Reusable knowledge

- Validate every `auth.identities.user_id` against `auth.users.id` before restore. This backup had 8 users and 26 identities, including 10 phone identities whose parents were absent; preserve `04-auth-rows.original.sql`, repair only the working copy, then require `users=18`, `identities=26`, `orphan_ids=0`. [Task 1]
- `scripts/04-restore-local.sh` is transactional. Successful restore committed, applied storage policies, restored 85 storage objects, and intentionally skipped 18 existing edge functions; verify project row `1`, `huwa2` schema, 26 tables, 18 public/auth users, one bucket, 85 objects, and no orphan identities. Recovered source auth records may still not log in because passwords/four phone values were missing. [Task 1]
- This host uses Supabase CLI management at `C:\Users\user\Documents\local-supabase`, not standalone Compose. Back up `supabase/config.toml`, add `"huwa2"` to `[api].schemas`, run CLI `supabase stop`/`supabase start`, then verify `PGRST_DB_SCHEMAS` includes `huwa2`. [Task 1]

## Failures and how to do differently

- `identities_user_id_fkey` -> do not retry unchanged SQL. The transaction rolled back; validate orphans, retain untouched SQL, repair only the local copy, and regenerate future VPS backups with the current generator. The VPS-side omission was not live-verified. [Task 1]
- `Could not locate compose file for 'supabase_rest_local-supabase'` -> `06-expose-schema.sh` assumes Compose labels/files. Detect `com.supabase.cli.project`; configure `[api].schemas` and restart with the Supabase CLI instead. [Task 1]
- `C:\Program Files\Git\bin\bash.exe` missing -> probe Git Bash; this host used `C:\Program Files (x86)\Git\bin\bash.exe`. [Task 1]

# Task Group: Zeta Software bilingual website maintenance

scope: Data-driven English/Chinese content, exact UI parity, image policy, localhost verification, and project tracking for the static Zeta site.
applies_to: cwd=D:\backup\website-zetasoftware; reuse_rule=checkout-specific; read `status.md` before work, use English markup as source of truth, and update the matching `cn/` counterpart.

## Task 1: Bilingual FAQ source, reordering, and global-intent revision

### rollout_summary_files

- rollout_summaries/2026-08-13T09-01-30-FmzH-zetasoftware_bilingual_faq_homepage_blogs_pricing_parity.md (cwd=D:\backup\website-zetasoftware, rollout_path=C:\Users\user\.codex\sessions\2026\08\13\rollout-2026-08-13T17-01-30-019ffa5a-eb3e-7172-8f41-7b65c41c8a95.jsonl, updated_at=2026-08-13T09:54:49+00:00, thread_id=019ffa5a-eb3e-7172-8f41-7b65c41c8a95, success)
- rollout_summaries/2026-08-13T06-18-50-bDIs-zetasoftware_bilingual_faq_system_and_interrupted_globalizat.md (cwd=D:\backup\website-zetasoftware, rollout_path=C:\Users\user\.codex\sessions\2026\08\13\rollout-2026-08-13T14-18-50-019ff9c5-febf-7151-a502-860618d376c8.jsonl, updated_at=2026-08-13T09:01:23+00:00, thread_id=019ff9c5-febf-7151-a502-860618d376c8, superseded follow-up)

### keywords

- faq.json, js/faq.js, FAQPage JSON-LD, crawlable fallback, paired IDs, Johor Bahru, Zeta Software, UTF-8

## Task 2: Homepage latest blogs, services labels, and pricing parity

### rollout_summary_files

- rollout_summaries/2026-08-13T09-01-30-FmzH-zetasoftware_bilingual_faq_homepage_blogs_pricing_parity.md (cwd=D:\backup\website-zetasoftware, rollout_path=C:\Users\user\.codex\sessions\2026\08\13\rollout-2026-08-13T17-01-30-019ffa5a-eb3e-7172-8f41-7b65c41c8a95.jsonl, updated_at=2026-08-13T09:54:49+00:00, thread_id=019ffa5a-eb3e-7172-8f41-7b65c41c8a95, success)

### keywords

- home-blogs.js, col-12 col-md-6 col-lg-4, View More Articles, Week 1, pricing-section, Orbitron, Google Fonts

## Task 3: Blog system, article edits, and incomplete ten-article regeneration

### rollout_summary_files

- rollout_summaries/2026-08-13T08-59-12-0qMc-zetasoftware_blog_regeneration_portfolio_phone_frame_correct.md (cwd=D:\backup\website-zetasoftware, rollout_path=C:\Users\user\.codex\sessions\2026\08\13\rollout-2026-08-13T16-59-12-019ffa58-d0c5-7e41-b135-6dd2e966daa4.jsonl, updated_at=2026-08-13T11:03:42+00:00, thread_id=019ffa58-d0c5-7e41-b135-6dd2e966daa4, partial)
- rollout_summaries/2026-08-13T01-17-52-eGXh-zetasoftware_bilingual_blog_system_revisions.md (cwd=D:\backup\website-zetasoftware, rollout_path=C:\Users\user\.codex\sessions\2026\08\13\rollout-2026-08-13T09-17-53-019ff8b2-757c-7922-bc4f-99b7ec3f1f53.jsonl, updated_at=2026-08-13T06:18:23+00:00, thread_id=019ff8b2-757c-7922-bc4f-99b7ec3f1f53, partial with verified existing blog system)

### keywords

- blogs.json, blogs-cn.json, blogs.js, blogs.md, contentHtml, lazy-load data-src, why-user-experience-should-shape-the-build, images/blog

## Task 4: Portfolio phone-frame component parity

### rollout_summary_files

- rollout_summaries/2026-08-13T08-59-12-0qMc-zetasoftware_blog_regeneration_portfolio_phone_frame_correct.md (cwd=D:\backup\website-zetasoftware, rollout_path=C:\Users\user\.codex\sessions\2026\08\13\rollout-2026-08-13T16-59-12-019ffa58-d0c5-7e41-b135-6dd2e966daa4.jsonl, updated_at=2026-08-13T11:03:42+00:00, thread_id=019ffa58-d0c5-7e41-b135-6dd2e966daa4, success)

### keywords

- portfolio-card-phone, sticky-phone, phone-screen, phone-camera, reflection-overlay, screen-light-bleed, css/style.css?v=0138

## User preferences

- when changing this site, English is the main design/markup source and Chinese under `cn/` is the duplicate-design counterpart with localized visible text; update and check both before reporting completion. [Task 1][Task 2][Task 3][Task 4]
- FAQ answers should be "long and human friendly"; place five Zeta-company questions near the top, reduce Johor Bahru-specific wording, use broader supported wording, and change at least 20% of titles when requested. [Task 1]
- for homepage blog cards, preserve `col-12 col-md-6 col-lg-4`, placement below `// OUR CAPABILITIES`, language-specific JSON, and a centered red `View More Articles` CTA with right arrow. [Task 2]
- "exact same design" means reuse canonical homepage structure/classes, not a visual approximation. [Task 2][Task 4]
- when supplied blog content says "do not use title using only normal text paragraph field", retain paragraph-only `contentHtml` unless headings are approved. [Task 3]
- when the workflow trigger is exactly `localhost test`, report the raw URLs and HTTP statuses; do not treat an open listener as healthy. [Task 3]
- when working on the blog system, keep unrelated homepage content unchanged unless the user requests it. If the user says to remove author data/display, remove the `author` field from both datasets and the shared `.blog-author` renderer. [Task 3]

## Reusable knowledge

- Read `status.md` first; append requests and maintain `DONE`, `ACTIVE`, `NEXT`, `BLOCKED`, `DEFERRED`, and verification evidence. Keep `meta.md` synchronized with route, SEO, crawl, manifest, and public state. The current homepage parity checkpoint is four active website showcase cards/images and three core capability cards in each language. [ad-hoc note]
- `data/faq.json` is the `en`/`cn` source; `js/faq.js` selects `/cn/`, escapes text, renders accordions, and refreshes `#faq-schema`. Final state: 30 unique paired IDs, five Zeta IDs first, nine paired title changes, aligned fallback HTML and FAQPage JSON-LD. [Task 1]
- `js/home-blogs.js` selects localized data, sorts descending by date, takes exactly three, escapes text, renders links, refreshes Lucide, and honors lazy loading. Service labels and pricing/font links must be changed in both languages; pages use `<base href="/">`. [Task 2]
- Blog records in `data/blogs.json`/`data/blogs-cn.json` share slugs/image paths and require `slug`, `category`, `date`, `readTime`, `image`, `title`, `excerpt`, `contentHtml`. `blogs.js` uses clean `.htaccess` routes; root-relative assets resolve from project root. [Task 3]
- For this static site, Python's Store alias/detached Python server were unreliable; PHP was stable at `php.exe -S 127.0.0.1:8080 -t .`. Verify `/blogs/`, a detail slug, and their `/cn/` counterparts with HTTP 200. [Task 3]
- Portfolio phone cards reuse the homepage DOM: desktop 310x640, mobile 275x572, 4px border, 48px outer radius, 2px inset, 46px screen radius. Portfolio overrides keep all eight cards visible without `.active`. [Task 4]
- Every AI-generated image must be at most 1600px wide; request an appropriate allowed width, inspect final dimensions, resize oversize output before use, use JPG unless alpha is genuinely needed, and log filename, prompt/source, intended use, requested/final dimensions, format, and transparency reason. HUWA is capped at 1200px. [ad-hoc note]

## Failures and how to do differently

- Invalid/duplicate FAQ JSON -> parse JSON and check count, duplicate IDs, paired IDs, title changes, fallback, and schema immediately; use UTF-8-safe checks before diagnosing Chinese mojibake. [Task 1]
- Do not claim the ten-blog regeneration or prior UX body replacement complete: read current data first; copy generated assets into `images/blog/` and validate them before references. Optional motion libraries may be absent, so keep `main.js` fallbacks. [Task 3]
- Default PowerShell bulk read/write corrupted multilingual HTML -> use explicit UTF-8/no-BOM handling or surgical patches. Resolve `/images/...` relative to project root before declaring an asset missing. [Task 3]
- Pseudo-phone DOM differed from the homepage -> copy canonical DOM/classes. Local HTTP/source checks do not prove cPanel visual deployment; upload, hard-refresh, and inspect in a browser before claiming deployed parity. [Task 4]

# Task Group: .codex routing, compression, and task checkpoints

scope: Maintain Codex boot routing and compact verified continuation knowledge without destructive repository changes.
applies_to: cwd=C:\Users\user\.codex; reuse_rule=environment-specific; live files and current router output override historical route counts.

## Task 1: Routing health and lean memory maintenance

### rollout_summary_files

- rollout_summaries/2026-08-12T07-57-58-bZCY-codex_lean_maintenance_and_memory_compression.md (cwd=C:\Users\user\.codex, rollout_path=C:\Users\user\.codex\sessions\2026\08\12\rollout-2026-08-12T15-57-58-019ff4fa-668d-74d2-bc92-64724b087b5c.jsonl, updated_at=2026-08-12T08:30:52+00:00, thread_id=019ff4fa-668d-74d2-bc92-64724b087b5c, success)
- rollout_summaries/2026-08-04T07-01-58-Kxur-codex_router_performance_cleanup_git_ignore_audit.md (cwd=C:\Users\user\.codex, rollout_path=C:\Users\user\.codex\sessions\2026\08\04\rollout-2026-08-04T15-01-58-019fcb94-3f2d-7492-80ca-40742d942aa3.jsonl, updated_at=2026-08-04T10:40:59+00:00, thread_id=019fcb94-3f2d-7492-80ca-40742d942aa3, older validation baseline)

### keywords

- 00_PULSE.md, Update-CodexRouting.ps1, Audit-CodexRouting.ps1, Test-CodexPerfBenchmark.ps1, Test-CodexSkillActivation.ps1, nested-memories-git

## Task 2: Fast-batch workflow protocol

### rollout_summary_files

- rollout_summaries/2026-08-12T08-56-09-fmgd-codex_fast_batch_workflow_protocol.md (cwd=C:\Users\user\.codex, rollout_path=C:\Users\user\.codex\sessions\2026\08\12\rollout-2026-08-12T16-56-09-019ff52f-a88b-7893-a2b3-9a5d5e75097d.jsonl, updated_at=2026-08-12T09:01:25+00:00, thread_id=019ff52f-a88b-7893-a2b3-9a5d5e75097d, partial; validator blocker remains)

### keywords

- FAST BATCH STATE, DONE, ACTIVE, NEXT, BLOCKED, DEFERRED, OBSOLETE, context compression, skills/fast-batch-checkpoint/SKILL.md

## Task 3: Exact Codex boot sentinel

### rollout_summary_files

- rollout_summaries/2026-08-05T08-13-36-owK2-codex_knowledge_boot_sentinel.md (cwd=C:\Users\user\Desktop\motorcycle, rollout_path=C:\Users\user\.codex\sessions\2026\08\05\rollout-2026-08-05T16-13-36-019fd0fc-32b2-7e81-a332-2609b86c37f6.jsonl, updated_at=2026-08-05T08:14:03+00:00, thread_id=019fd0fc-32b2-7e81-a332-2609b86c37f6, success)

### keywords

- ai read .codex knowledge, 00_PULSE.md, Agent is Ready, Find-LargeKnowledge.ps1

## User preferences

- when asked to improve `.codex`, "find improvement ... to highly improve performances" -> inspect live routes, memory sizes, skills, and benchmarks before recommending or editing. [Task 1]
- "take action ... wont make heavy changes to it" -> prefer reversible, surgical maintenance; preserve routes, application skills, secrets, and repository state. [Task 1]
- for long work, the user requested "fast batch workflow knowledge" -> retain exact constraints and a precise continuation state. [Task 2]

## Reusable knowledge

- `00_PULSE.md` is authoritative; exact `ai read .codex knowledge` returns only `[🟢] Agent is Ready..`. After routing/index changes, run `Update-CodexRouting.ps1 -Quiet`, then audit, benchmark, and activation checks; current output wins over historical counts. [Task 1][Task 3]
- Use `FAST BATCH STATE` and checkpoint only after verification; batch independent read-only checks, not destructive/auth/secret/database/ambiguous actions. Related skill: skills/fast-batch-checkpoint/SKILL.md [Task 2]
- VIPBillion local-Docker news import is additive-only: use `news.md` and the existing importer; phases `10, 40, 50, 50, 50`; preserve old rows, normalize `VIP BILLION MILESTONE TRAVEL & TOURS` (or source `SDN BHD` form), run selected/cumulative count, JSON/aligned-language, company-name, generated SQL/insert, proportional-image, and one `/news` smoke gates. Images must preserve aspect ratio within desktop `1200x630` and mobile `400x300`, without padding/letterboxing; do not repeat broad recaptures/audits unless a gate fails or source/schema changes. [ad-hoc note]

## Failures and how to do differently

- `Validate-CodexKnowledge.ps1` can fail solely on pre-existing `memories\.git` (`nested-memories-git`) -> do not remove/mutate it without explicit repository-cleanup permission. [Task 1][Task 2]
- Do not create missing skills merely to satisfy stale routes; remove obsolete routes when no feature exists. Encoding-sensitive Markdown anchors need small patches around stable nearby text. [Task 1][Task 2]

# Task Group: FC-Moto PHP metadata and shared site content

scope: Centralized metadata, noindex policy, UTF-8 cleanup, and data-driven footer edits in FC-Moto.
applies_to: cwd=C:\Users\user\Desktop\motorcycle\fc-moto-new; reuse_rule=checkout-specific; do not transfer brand/domain facts to another site.

## Task 1: Metadata, indexing policy, homepage, and footer cleanup

### rollout_summary_files

- rollout_summaries/2026-08-07T08-58-09-YPrd-fc_moto_metadata_noindex_and_homepage_cleanup.md (cwd=C:\Users\user\Desktop\motorcycle\fc-moto-new, rollout_path=C:\Users\user\.codex\sessions\2026\08\07\rollout-2026-08-07T16-58-09-019fdb71-b29e-7ad3-85f2-fa36bb94a3c3.jsonl, updated_at=2026-08-10T04:31:01+00:00, thread_id=019fdb71-b29e-7ad3-85f2-fa36bb94a3c3, success/partial footer)

### keywords

- fcMotoPageMeta, fcMotoIsIndexable, lib/initData.php, lib/htmlhead.php, robots.txt, site.webmanifest, noindex, nofollow, category.json, mojibake

## User preferences

- "noindex, nofollow please" -> emit sitewide `noindex, nofollow` for general crawlers and Googlebot until explicitly authorized otherwise. [Task 1]
- footer categories must come from `category.json` in basic/source order, six per column, with an empty second title and no Top Brands. [Task 1]

## Reusable knowledge

- Centralize FC-Moto metadata in `fcMotoSiteData()`/`fcMotoPageMeta()` in `lib/initData.php`, rendered by `lib/htmlhead.php`; `fcMotoIsIndexable()` returns false. [Task 1]
- Validate mojibake using `rg -n 'ÃƒÂ¢|ÃƒÆ’|Ãƒâ€š|Ã¯Â¿Â½' template/home.php`, PHP lint, and HTTP 200. Footer taxonomy comes from `fcMotoProductSubcategoryDefinitions('moto')`; escape output. [Task 1]

## Failures and how to do differently

- Local checks do not verify production crawling, Apache, or webmaster tools; report them as deployment checks. Decode webmanifest bytes as UTF-8 before JSON parsing. [Task 1]
- Minified CSS makes broad patch context brittle -> use small patches and inspect rendered footer markup. [Task 1]

# Task Group: Project-agnostic metadata and webmanifest guidance

scope: Reusable instructions for truthful current-project identity and existing installable-app manifest updates.
applies_to: cwd=C:\Users\user\Desktop\ai comment; reuse_rule=reusable workflow; always derive facts from the active project.

## Task 1: Current-project metadata identity and manifest reminder

### rollout_summary_files

- rollout_summaries/2026-08-10T04-13-53-hwPl-project_agnostic_metadata_and_webmanifest_guidance.md (cwd=C:\Users\user\Desktop\ai comment, rollout_path=C:\Users\user\.codex\sessions\2026\08\10\rollout-2026-08-10T12-13-53-019fe9e0-8772-7143-8b6b-11cc8a866137.jsonl, updated_at=2026-08-10T04:22:20+00:00, thread_id=019fe9e0-8772-7143-8b6b-11cc8a866137, success)

### keywords

- metaTitle.txt, INSUFFICIENT DATA, site.webmanifest, Select-String -LiteralPath, centralized metadata

## User preferences

- "actual project name user are working on rightnow" and avoid historical project names -> derive exact identity from current files, visible brand, config, routes, metadata, and runtime evidence. [Task 1]
- use broader/global meaning when evidence supports it, but never invent global reach; put metadata in the central module/include. [Task 1]

## Reusable knowledge

- If identity is unconfirmed, state `INSUFFICIENT DATA`; do not borrow names, domains, social accounts, locations, colors, URLs, filenames, or claims from examples/history. Synchronize an existing installable-app manifest, but do not create one solely for SEO. [Task 1]

## Failures and how to do differently

- `rg --literal-path` is unsupported -> use `Select-String -LiteralPath` for exact-file scans. A non-Git workspace needs read-back and targeted scans instead of `git diff`. [Task 1]

# Task Group: JamboLive catalogue import and category audit

scope: Import live product data and compare stored taxonomy with source navigation.
applies_to: cwd=C:\Users\user\Desktop\motorcycle\jambolive; reuse_rule=checkout/time-specific; recheck live source before modifying data.

## Task 1: Import 317 products and audit 39 category labels

### rollout_summary_files

- rollout_summaries/2026-08-06T01-08-46-xCAa-jambolive_product_import_and_category_audit.md (cwd=C:\Users\user\Desktop\motorcycle\jambolive, rollout_path=C:\Users\user\.codex\sessions\2026\08\06\rollout-2026-08-06T09-08-47-019fd49d-9b00-7ff0-ac3e-c548678624a2.jsonl, updated_at=2026-08-06T02:26:20+00:00, thread_id=019fd49d-9b00-7ff0-ac3e-c548678624a2, import success/category correction pending)

### keywords

- database.json, import-public-products.ps1, 317 products, categories, /media/uploadedphoto/, UTF-8, HtmlDecode

## User preferences

- preserve all 317 products and detail-page fields/assets; verify exact item count. Category audits must compare IDs and human-readable labels, not only ID presence. [Task 1]

## Reusable knowledge

- `tools/import-public-products.ps1` populates `data/database.json`; 317 unique product IDs/detail pages/local images were verified. Keep empty descriptions when that is source truth and preserve extra `product/4867658`. [Task 1]
- Stored names were placeholders while live navigation exposed 39 real labels; compare `?cat=<id>` links/labels, then separately determine hierarchy. [Task 1]

## Failures and how to do differently

- Restrict galleries to `/media/uploadedphoto/`, explicitly decode UTF-8, validate character codes/missing markers, and force PowerShell arrays with `@(...)`. Strip tags then call `[Net.WebUtility]::HtmlDecode($clean)` with one argument. [Task 1]

# Task Group: Sales Hero schema knowledge and Mermaid test flow

scope: Ground product documentation and compact Mermaid test flows in current Sales Hero evidence.
applies_to: cwd=C:\Users\user\Desktop\saleshero; reuse_rule=checkout-specific; reference flows are formatting references, not requirements.

## Task 1: SQL-derived product knowledge and compressed test flow

### rollout_summary_files

- rollout_summaries/2026-08-05T03-29-22-nTKd-saleshero_knowledge_and_compressed_testflow.md (cwd=C:\Users\user\Desktop\saleshero, rollout_path=C:\Users\user\.codex\sessions\2026\08\05\rollout-2026-08-05T11-29-22-019fcff7-f81e-7ce1-b8dd-d9e04a524e95.jsonl, updated_at=2026-08-05T07:55:38+00:00, thread_id=019fcff7-f81e-7ce1-b8dd-d9e04a524e95, success)

### keywords

- sales_hero.sql, knowledge.md, testflow_saleshero.md, flowchart TD, salesman, dealer, credit-limit, refunds

## User preferences

- read root documents, SQL, schema PNGs, and client discussion before conclusions; preserve unresolved assumptions. `testflow_trash.md` is a format reference only. [Task 1]
- use raw `flowchart TD`, numeric IDs, branches, and compact labels; merge only same-screen/transaction steps, never important credit/payment/refund/permission branches. [Task 1]

## Reusable knowledge

- Main graph: `public.user -> sales_hero.users -> salesmans/dealers`; dealers/orders/details/variants/items/invoices/refunds are the core workflow. Roles are `super_admin`, `salesman`, `dealer`. [Task 1]
- Validate Mermaid: no duplicate node labels, core tables/fields, business branches, and no passwords; final artifact was 139 lines with 100 node definitions. [Task 1]

## Failures and how to do differently

- A non-Git folder is not a project failure: inspect files directly. Mermaid/runtime DB were unavailable, so future work should render and live-test when possible. [Task 1]

# Task Group: Thongthai floorplan statistics UI behavior

scope: Determine whether seat visuals on the statistics page are interactive.
applies_to: cwd=C:\Users\user\Desktop\thongthai2\admin-panel-Thongthai; reuse_rule=checkout-specific; distinguish statistics from editable floorplan pages.

## Task 1: Verify red-seat click behavior

### rollout_summary_files

- rollout_summaries/2026-08-05T07-09-43-riXS-floorplanstatistics_seat_click_behavior.md (cwd=C:\Users\user\Desktop\thongthai2\admin-panel-Thongthai, rollout_path=C:\Users\user\.codex\sessions\2026\08\05\rollout-2026-08-05T15-09-43-019fd0c1-b541-70a2-8a56-ff613fcd1170.jsonl, updated_at=2026-08-05T07:16:02+00:00, thread_id=019fd0c1-b541-70a2-8a56-ff613fcd1170, success)

### keywords

- floorplanstatistics, isAvailableSeat, reserved, @click, @pointerdown, floorplans/table.vue

## User preferences

- when asking whether a seat or "the red seat" triggers behavior, explicitly cover normal and state-colored seats. [Task 1]

## Reusable knowledge

- `src/pages/floorplanstatistics/table.vue` only renders seat position/background/class/name; no click/pointer/modal/detail handler. `reserved` means absent from `availableSeat`, so it is visual-only. Editable `floorplans/table.vue` is separate and has `@pointerdown`. [Task 1]

## Failures and how to do differently

- For a small UI-behavior question, use targeted direct reads/searches; unnecessary GitNexus plus `rg` can fail nonzero on no-memory matches. [Task 1]

# Task Group: Cermin PHP localhost verification

scope: Safely start and verify Cermin front-controller routes.
applies_to: cwd=C:\Users\user\Desktop\cermin_v2; reuse_rule=checkout-specific; source was not modified and prior verification was aborted.

## Task 1: PHP front-controller local test

### rollout_summary_files

- rollout_summaries/2026-08-03T06-04-01-bI14-cermin_php_localhost_test_aborted.md (cwd=C:\Users\user\Desktop\cermin_v2, rollout_path=C:\Users\user\.codex\sessions\2026\08\03\rollout-2026-08-03T14-04-01-019fc638-d5a6-7730-8981-2b46478192aa.jsonl, updated_at=2026-08-03T06:05:57+00:00, thread_id=019fc638-d5a6-7730-8981-2b46478192aa, partial/aborted)

### keywords

- php -S 127.0.0.1:8000 index.php, router.php, /skudai, /unknown, HTTP-404, PowerShell

## Reusable knowledge

- PHP 8.3.8; expected checks are `/`, `/skudai`, `/skudai/home`, and unknown-path 404. Start: `php -S 127.0.0.1:8000 index.php`. [Task 1]

## Failures and how to do differently

- Prior server/request command was aborted before statuses: inspect port 8000/PHP processes first, then use simple sequential PowerShell commands rather than malformed pipelines. [Task 1]

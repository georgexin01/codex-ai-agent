# Task Group: Codex routing, collaboration, and localhost project match
scope: Use exact lightweight boot routing, activate only matching knowledge, and prove a localhost listener belongs to the requested checkout.
applies_to: cwd=C:\Users\user\.codex and cross-project workflows; reuse_rule=read current routing/skill state first; runtime/project-match rules are reusable but ports/counts are time-sensitive.

## Task 1: Exact boot, focused routing, and root-Git maintenance

### rollout_summary_files

- extensions/ad_hoc/notes/2026-09-24T15-35-00-codex-focused-routing-maintenance.md (cwd=C:\Users\user\.codex, rollout_path=INSUFFICIENT DATA, updated_at=2026-09-24T15:35:00+00:00, ad-hoc note; routing audit/activation evidence)
- rollout_summaries/2026-09-04T01-18-24-1Zuq-codex_boot_and_localhost_test_blocked.md (cwd=C:\Users\user\.codex, rollout_path=C:\Users\user\.codex\sessions\2026\09\04\rollout-2026-09-04T09-18-24-01a069fe-d709-7e00-b7e6-2069c0077bea.jsonl, updated_at=2026-09-04T01:19:08+00:00, thread_id=01a069fe-d709-7e00-b7e6-2069c0077bea)

### keywords

- ai read .codex knowledge, 00_PULSE.md, Agent is Ready, root Git only, memories/.git, generated_images, skill-activation-cases.json

## Task 2: Localhost runtime detection and route match

### rollout_summary_files

- extensions/ad_hoc/notes/2026-09-22T00-00-00-localhost-test-performance.md (cwd=D:\backup\zeta-capital\website-zetaCapital, rollout_path=INSUFFICIENT DATA, updated_at=2026-09-22T00:00:00+00:00, ad-hoc note; PHP project match verified)

### keywords

- localhost test, NO_DEV_SCRIPT, php-built-in, index.php, index.html, HTTP 2xx/3xx, localhost-project-match

## Task 3: Cross-project operating overlays and reporting conventions

### rollout_summary_files

- extensions/ad_hoc/notes/2026-08-26-product-development-operating-model.md (cwd=cross-project product work, rollout_path=INSUFFICIENT DATA, updated_at=2026-08-26T00:00:00+00:00, ad-hoc note; evidence-gated product overlay)
- extensions/ad_hoc/notes/2026-07-15-codex-knowledge-english-rule.md (cwd=C:\Users\user\.codex, rollout_path=INSUFFICIENT DATA, updated_at=2026-07-15T00:00:00+00:00, ad-hoc note; knowledge language rule)
- extensions/ad_hoc/notes/2026-07-16T00-00-00-mandatory-task-action-status-table.md (cwd=cross-project reporting, rollout_path=INSUFFICIENT DATA, updated_at=2026-07-16T00:00:00+00:00, ad-hoc note; task/action/status convention)

### keywords

- 60/40 focus gate, customer value loop, one boot doc, one trigger per task, English knowledge, task action status table

## User preferences

- in full-access mode, avoid repetitive “Step X done — confirm or adjust?” prompts; continue obvious implementation and pause only for a meaningful decision, hidden risk, destructive action, or ambiguous tradeoff. [Task 1] [ad-hoc note]
- for `ai read .codex knowledge`, reply only `[🟢] Agent is Ready..`; hydrate once and do not repeat boot. [Task 1]
- wake only the relevant skill family, keep it awake during related work, then sleep it when focus changes. [Task 1] [ad-hoc note]
- for `localhost test`, report project root, runtime, port, and requested URL/status checks—not merely a listener. [Task 2]
- keep durable Codex knowledge in English; use a compact task/action/status table when the user asks for a structured progress report. [Task 3] [ad-hoc note]

## Reusable knowledge

- `C:\Users\user\.codex\.git` is the only Git repository for this knowledge tree; `memories/` is ordinary tracked content. If `memories/.git` reappears, inspect it before changing it. [Task 1] [ad-hoc note]
- A `package.json` without `dev`, `start`, or `dev:local` does not prove a package runtime. Continue to `index.php`/`index.html`; reuse a listener only if every requested path returns HTTP 2xx/3xx from the intended project. [Task 2]
- Keep route-first knowledge lazy; refresh/audit routing after route changes. Use project folders, never `.codex/generated_images/`, for final image assets. [Task 1] [ad-hoc note]
- Related skills: skills/awake-skill-routing/SKILL.md; skills/localhost-project-match/SKILL.md. [Task 1][Task 2]
- For cross-page/product decisions, prioritize the verified 60% foundation (customer problem, working journey, trustworthy data, clear action, reliability) over unproven expansion. Record unknowns as `INSUFFICIENT DATA`; do not force a strategy review onto a narrow mechanical fix. [Task 3] [ad-hoc note]

## Failures and how to do differently

- `NO_DEV_SCRIPT` on a PHP/static site -> inspect entrypoints instead of stopping. [Task 2]
- root HTTP 200 but requested route fails -> another project owns the listener; choose another port or obtain authority to stop it. [Task 2]

# Task Group: Zeta Software bilingual static-site maintenance
scope: Maintain English/Simplified-Chinese generated pages, source-faithful reuse, local checks, performance/cache work, and safe image-loading follow-up.
applies_to: cwd=D:\backup\website-zetasoftware; reuse_rule=checkout-specific: read README.md, status.md, meta.md, and current generators first; English markup/design is canonical and `cn/` needs localized visible-text parity.

## Task 1: Generator/navigation, content formatting, cache policy, and CSS minification

### rollout_summary_files

- rollout_summaries/2026-09-07T05-57-20-zPhy-zeta_website_project_audit_navigation_content_performance.md (cwd=D:\backup\website-zetasoftware, rollout_path=C:\Users\user\.codex\sessions\2026\09\07\rollout-2026-09-07T13-57-20-01a07a71-4c56-70b0-a1e2-b8a02742ecb4.jsonl, updated_at=2026-09-07T09:41:02+00:00, thread_id=01a07a71-4c56-70b0-a1e2-b8a02742ecb4, CSS final verification incomplete)

### keywords

- generate-standard-internal-management-pages.js, update-site-navigation.js, format-detail-content.js, long-form-intros.js, style.min.css, clean-css-cli, Cloudflare cache, main.js

## Task 2: Localhost, Lighthouse/image work, lazyloading, and incomplete JPG migration

### rollout_summary_files

- rollout_summaries/2026-09-04T01-20-03-IpkW-zeta_static_site_localhost_performance_image_loading.md (cwd=D:\backup\website-zetasoftware, rollout_path=\\?\C:\Users\user\.codex\sessions\2026\09\04\rollout-2026-09-04T09-20-03-01a06a00-5a37-7e72-bbbc-b6b33c856356.jsonl, updated_at=2026-09-07T05:56:45+00:00, thread_id=01a06a00-5a37-7e72-bbbc-b6b33c856356, JPG/WebP follow-up incomplete)
- extensions/ad_hoc/notes/2026-08-21-high-priority-data-src-lazyload.md (cwd=workflow-wide, rollout_path=INSUFFICIENT DATA, updated_at=2026-08-21T00:00:00+00:00, ad-hoc note; lazy-image contract)

### keywords

- php -S 127.0.0.1:8080 -t, Lighthouse, data-src, 1x1 SVG, IntersectionObserver, images/mobile, images/website, WebP, JPG

## Task 3: FAQ/blog/homepage/services parity and exact phone-frame reuse

### rollout_summary_files

- rollout_summaries/2026-08-13T09-01-30-FmzH-zetasoftware_bilingual_faq_homepage_blogs_pricing_parity.md (cwd=D:\backup\website-zetasoftware, rollout_path=C:\Users\user\.codex\sessions\2026\08\13\rollout-2026-08-13T17-01-30-019ffa5a-eb3e-7172-8f41-7b65c41c8a95.jsonl, updated_at=2026-08-13T09:54:49+00:00, thread_id=019ffa5a-eb3e-7172-8f41-7b65c41c8a95)
- rollout_summaries/2026-08-13T08-59-12-0qMc-zetasoftware_blog_regeneration_portfolio_phone_frame_correct.md (cwd=D:\backup\website-zetasoftware, rollout_path=\\?\C:\Users\user\.codex\sessions\2026\08\13\rollout-2026-08-13T16-59-12-019ffa58-d0c5-7e41-b135-6dd2e966daa4.jsonl, updated_at=2026-08-13T11:03:42+00:00, thread_id=019ffa58-d0c5-7e41-b135-6dd2e966daa4, blog regeneration incomplete; phone reuse complete)
- rollout_summaries/2026-08-13T06-18-50-bDIs-zetasoftware_bilingual_faq_system_and_interrupted_globalizat.md (cwd=D:\backup\website-zetasoftware, rollout_path=C:\Users\user\.codex\sessions\2026\08\13\rollout-2026-08-13T14-18-50-019ff9c5-febf-7151-a502-860618d376c8.jsonl, updated_at=2026-08-13T09:01:23+00:00, thread_id=019ff9c5-febf-7151-a502-860618d376c8)

### keywords

- data/faq.json, js/faq.js, FAQPage JSON-LD, home-blogs.js, data/blogs.json, data/blogs-cn.json, sticky-phone, phone-screen, pricing-section

## User preferences

- bilingual content/layout: English markup/design is the source; update Chinese localized visible text and parity checks in the same task. Read `status.md` first and keep status/meta evidence current. [Task 1][Task 3] [ad-hoc note]
- preserve unrelated descriptions, images, CSS, routes, and content in narrow menu/layout fixes; for “exact same design,” reuse canonical markup/classes and dimensions. [Task 1][Task 3]
- “merge back some suitable” endings and roughly 50–100 fewer words -> group related sentences naturally, not a break per sentence. [Task 1]
- body images use `data-src` plus a 1x1 SVG placeholder; exclude logo/icon/header/footer/mobile-menu/floating UI and do not delete WebPs before JPG/reference verification. [Task 2]

## Reusable knowledge

- Related skill: skills/zeta-bilingual-static-site/SKILL.md. Serve this static checkout with `php -S 127.0.0.1:8080 -t <workspace>`; HTTP 200 does not prove Apache, visual QA, or deployment. [Task 2]
- SIM generator skipped the shared nav updater; keep `require("./update-site-navigation");` after generation, regenerate, then inspect non-empty desktop/mobile navigation and active state. [Task 1]
- FAQ source `data/faq.json` has `en`/`cn`; `js/faq.js` renders accordions and matching FAQPage JSON-LD. Preserve paired unique IDs, crawlable fallback, and schema alignment. [Task 3]
- For true lazy loading, restore URL near viewport, remove `data-src` only on successful load, set `loading="lazy"`/`decoding="async"`, and register dynamic cards too. [Task 2]
- Immutable caching belongs on versioned CSS/JS; keep unversioned images short-lived. Trace main-thread work before optimization; cache headers do not remove parse/layout/image decode. [Task 1]

## Failures and how to do differently

- invalid FAQ JSON, duplicate records, or CN drift -> parse immediately and check counts, paired IDs/titles, fallback, and schema. [Task 3]
- Chinese looks corrupt in PowerShell -> use UTF-8-aware Node/file bytes, not console display. [Task 3]
- deleting WebPs after partial search -> resolve HTML/JS/JSON/CSS references, confirm JPG/routes/observer behavior, then delete only authorized files. [Task 2]
- minified CSS was written but final verification was interrupted -> rerun hash/idempotence, HTTP 200, selector, and `git diff --check`. [Task 1]

# Task Group: EDSB Admin phone-only login and Docker-local Auth parity
scope: Maintain the EDSB Admin phone-first identity contract and reproduce supplied reference only in Docker-local Supabase.
applies_to: cwd=C:\Users\user\Desktop\EDSB\admin-panel-edsb; reuse_rule=checkout- and state-specific: never run a local parity operation against the VPS; protect shared identity data.

## Task 1: Phone-only login and local parity

### rollout_summary_files

- extensions/ad_hoc/notes/2026-09-18T02-15-00-edsb-local-vps-parity.md (cwd=C:\Users\user\Desktop\EDSB\admin-panel-edsb, rollout_path=INSUFFICIENT DATA, updated_at=2026-09-18T02:15:00+00:00, ad-hoc note; Docker-local parity verified)
- extensions/ad_hoc/notes/2026-09-18T00-00-00-edsb-phone-only-admin-login.md (cwd=C:\Users\user\Desktop\EDSB\admin-panel-edsb, rollout_path=INSUFFICIENT DATA, updated_at=2026-09-18T00:00:00+00:00, ad-hoc note; migration contract verified)

### keywords

- admin-panel-edsb, auth.users.phone, phone/password, 050_edsb_phone_only_admin_users.sql, edsb.users, public."user", Docker-local Supabase, /auth/login

## User preferences

- match supplied identity data only in Docker-local EDSB; never run the parity operation on the VPS. Do not clear shared Auth/public email without explicit owner approval. [Task 1] [ad-hoc note]

## Reusable knowledge

- EDSB login identity is `auth.users.phone`; phone is required in CRUD/profile updates. New Auth identities use `email = NULL`; active EDSB CRUD does not store/expose email. `050_edsb_phone_only_admin_users.sql` implements the contract. [Task 1] [ad-hoc note]

## Failures and how to do differently

- VPS reference is not a generic migration source -> do not carry unrelated linkage or password hashes and never retain credentials in memory. [Task 1]

# Task Group: Local Supabase protection, restore, and Angel Interior systems
scope: Safely work with protected Docker/Supabase, repair/restore backups, and maintain linked Angel admin/website flows.
applies_to: cwd=C:\Users\user\Documents\local-supabase; C:\Users\user\Documents\supabase-project-backup-restore; C:\Users\user\Desktop\angel-interior; reuse_rule=stateful: identify active stack/env and obtain explicit same-turn permission before state-changing Docker/Supabase work.

## Task 1: Protected stack, Huwa2 restore, and API exposure

### rollout_summary_files

- rollout_summaries/2026-08-14T02-47-47-8IL6-huwa2_vps_restore_and_postgrest_expose.md (cwd=C:\Users\user\Documents\supabase-project-backup-restore, rollout_path=C:\Users\user\.codex\sessions\2026\08\14\rollout-2026-08-14T10-47-47-019ffe2b-21d6-7ff2-9bea-6cfa6ab17768.jsonl, updated_at=2026-08-14T03:10:24+00:00, thread_id=019ffe2b-21d6-7ff2-9bea-6cfa6ab17768)
- extensions/ad_hoc/notes/20260608-173510-local-docker-permission-rule.md (cwd=local Docker/Supabase workflows, rollout_path=INSUFFICIENT DATA, updated_at=2026-06-08T17:35:10+00:00, ad-hoc note; absolute protection rule)

### keywords

- local-supabase, Docker, auth.identities, identities_user_id_fkey, atomic restore, PGRST_DB_SCHEMAS, config.toml, role_table_grants

## Task 2: Angel admin RPC, website data, and paid download

### rollout_summary_files

- extensions/ad_hoc/notes/20260529-172016-angel-admin-website-stripe-and-rpc-update.md (cwd=C:\Users\user\Desktop\angel-interior, rollout_path=INSUFFICIENT DATA, updated_at=2026-05-29T17:20:16+00:00, ad-hoc note; admin/website runtime paths)
- extensions/ad_hoc/notes/20260603-184421-angel-awards-local-supabase-lessons.md (cwd=C:\Users\user\Desktop\angel-interior, rollout_path=INSUFFICIENT DATA, updated_at=2026-06-03T18:44:21+00:00, ad-hoc note; grants/RLS and env diagnosis)

### keywords

- angelInterior.create_user, 064_angel_make_user_rpc_role_status_agnostic.sql, public.role.status, Stripe Checkout, download?session_id, role_table_grants

## User preferences

- local Docker/Supabase state is protected: never rename, reset, prune, stop, recreate, relabel, repoint, or modify it without explicit current-turn permission. [Task 1] [ad-hoc note]
- Angel fixes should remain surgical, preserve unrelated flows, and verify the visible user flow rather than only code. [Task 2] [ad-hoc note]

## Reusable knowledge

- Validate every `auth.identities.user_id` before restore; preserve original backup and repair a working copy. Configure CLI-managed schema exposure in `[api].schemas` separately from database restoration. [Task 1]
- Angel empty website while admin has data -> compare env selection, runtime host, and actual Supabase URL before changing frontend. `permission denied` with correct RLS -> inspect `information_schema.role_table_grants`. [Task 2]
- Angel `column "status" does not exist` during user creation is RPC schema drift, not automatically a Vue bug. Inspect migration contract; use append-only 064 role-status-agnostic migration where applicable and keep README migration index aligned. [Task 2]
- Paid downloads must verify paid Stripe session metadata against resource identity; retain missing-config/cancel/error states and never expose keys. [Task 2]
- Related skill: skills/local-supabase-protection/SKILL.md. [Task 1]

## Failures and how to do differently

- Compose-label exposure script fails under CLI-managed stack -> detect CLI project and use CLI config/restart without resetting data. [Task 1]
- website/admin mismatch -> do not “fix” rendering until both stack targets are proven. [Task 2]

# Task Group: Vue/Vben/Pinia contract-driven paired applications
scope: Preserve externally specified Store/Function/Input contracts, paired-app boundaries, and visual-only scope.
applies_to: cwd=C:\Users\user\Desktop\trash-container-app and similar Vben/Pinia apps; reuse_rule=read current source-of-truth contract first; never transfer another project's API/schema assumptions.

## Task 1: CY RORO Trash admin/driver contract

### rollout_summary_files

- extensions/ad_hoc/notes/2026-07-15-cyroro-dual-app-pinia-audit.md (cwd=C:\Users\user\Desktop\trash-container-app, rollout_path=INSUFFICIENT DATA, updated_at=2026-07-15T00:00:00+00:00, ad-hoc note; paired-app audit)
- extensions/ad_hoc/notes/2026-07-14-pinia-contract-absolute-gate.md (cwd=C:\Users\user\Desktop\trash-container-app, rollout_path=INSUFFICIENT DATA, updated_at=2026-07-14T00:00:00+00:00, ad-hoc note; authoritative contract gate)

### keywords

- Trash Pinia, PiniaStore, Function, Input, getAllBinWIthOrder, web-admin-app, web-driver-app, OrderUpdateInput, DriverTaskUpdateInput, cyroro

## User preferences

- for “design only,” change only the named page/component/property; do not alter content, mapping, status logic, or navigation. Preserve exact public spelling/casing, including `getAllBinWIthOrder`. [Task 1] [ad-hoc note]

## Reusable knowledge

- Google Sheet `Trash` → `Pinia` is public contract. Search both apps for every store/action/input, callers/exports, and persistence boundary. Keep `views -> stores -> utils/types -> API/Supabase`; views do not query Supabase. [Task 1]
- Stores own API/RPC and typed inputs; helpers own pure mapping. Verify with exact-name searches, read-back, type-check in both apps, build for multi-file/store changes, then visible workflow smoke tests. [Task 1]

## Failures and how to do differently

- visual/local edit reveals contract drift -> repair contract before unrelated work. Reuse old project organization only; never import foreign APIs/schema. [Task 1]

# Task Group: Metadata, SEO/AI search, image assets, and reference-template migration
scope: Derive truthful public content from active project evidence, use source shells without leaking their identity, and implement measured assets/crawlable loading.
applies_to: cwd=C:\Users\user\Desktop\ai comment and public-site projects; reuse_rule=project identity/claims always require current evidence; global image cap applies unless a stricter project cap exists.

## Task 1: Project metadata, manifest, SEO, and AI search

### rollout_summary_files

- rollout_summaries/2026-08-10T04-13-53-hwPl-project_agnostic_metadata_and_webmanifest_guidance.md (cwd=C:\Users\user\Desktop\ai comment, rollout_path=\\?\C:\Users\user\.codex\sessions\2026\08\10\rollout-2026-08-10T12-13-53-019fe9e0-8772-7143-8b6b-11cc8a866137.jsonl, updated_at=2026-08-10T04:22:20+00:00, thread_id=019fe9e0-8772-7143-8b6b-11cc8a866137)
- extensions/ad_hoc/notes/2026-07-20-seo-ai-metadata-auto-checklist.md (cwd=public PHP/HTML/SSR/SSG sites, rollout_path=INSUFFICIENT DATA, updated_at=2026-07-20T00:00:00+00:00, ad-hoc note; discoverability checklist)

### keywords

- (AI) metaTitle.txt, INSUFFICIENT DATA, site.webmanifest, canonical, robots.txt, sitemap.xml, JSON-LD, OAI-SearchBot

## Task 2: Clone-first PHP/reference work and image/lazyload policy

### rollout_summary_files

- extensions/ad_hoc/notes/2026-08-06T18-09-44-html-to-php-website-workflow.md (cwd=PHP website migration workflows, rollout_path=INSUFFICIENT DATA, updated_at=2026-08-06T18:09:44+00:00, ad-hoc note; clone-first workflow)
- extensions/ad_hoc/notes/2026-08-20T12-00-00-image-generation-asset-policy.md (cwd=workflow-wide, rollout_path=INSUFFICIENT DATA, updated_at=2026-08-20T12:00:00+00:00, ad-hoc note; measurement-first assets)
- extensions/ad_hoc/notes/2026-09-22T00-15-00-news-progressive-lazyload.md (cwd=D:\backup\zeta-capital\website-zetaCapital, rollout_path=INSUFFICIENT DATA, updated_at=2026-09-22T00:15:00+00:00, ad-hoc note; crawlable progressive cards)

### keywords

- clone first, exact same design, Hierarchical Replica Chunking, index.php, router.php, 1600px, JPG, PNG alpha, data-src, ItemList JSON-LD

## User preferences

- find the “actual project name user are working on rightnow”; use `INSUFFICIENT DATA`, not historical names or invented global claims. [Task 1]
- “copy and paste”, “duplicate”, “clone”, or “same modules” -> duplicate exact complete source shell first, then alter requested inner content. Screenshot replication requires continuous reference comparison and nested visual chunks. [Task 2] [ad-hoc note]
- generated images: measurement-first, 1600px maximum (HUWA 1200px), JPG by default; record intended use/dimensions in project evidence. [Task 2] [ad-hoc note]

## Reusable knowledge

- SEO needs truthful route inventory, unique title/description/canonical/H1/visible content, crawlable links, and valid visible-content-backed JSON-LD. Production may allow Googlebot/Bingbot/OAI-SearchBot; localhost/staging stays `noindex, nofollow`. No special AI tag guarantees ranking/citation. [Task 1]
- Manifest only for real installable apps; evidence all identity/scope/icons. Clone full PHP shell through documented routes/shared fragments; copied sites are visual reference, not target APIs/analytics/identity/claims. [Task 1][Task 2]
- For progressive news, keep all articles server-rendered + ItemList JSON-LD, reveal batches with sentinel IntersectionObserver, and provide a no-IntersectionObserver reveal-all fallback. [Task 2]
- Related skills: skills/static-site-metadata-sweep/SKILL.md; skills/html-to-php-website-migration/SKILL.md; skills/hierarchical-replica-chunking/SKILL.md. [Task 1][Task 2]

## Failures and how to do differently

- `rg --literal-path` unsupported -> use `Select-String -LiteralPath`; non-Git workspace needs targeted scans/read-back. [Task 1]
- reference template leaks stale identity/claims -> treat it read-only and scan rendered target routes. [Task 2]
- oversized/dynamic images -> resize before use and register late cards with the same observer contract. [Task 2]

# Task Group: Used-Car Vue/Supabase workflow and Chrome SideBySide repair
scope: Orient and make surgical client changes while protecting external-admin schema evidence; diagnose host-specific Chrome update failures separately.
applies_to: cwd=C:\Users\user\Desktop\used-car; reuse_rule=checkout/host-specific: app root is `template/`; source/runtime evidence outranks history and Chrome versions must be rechecked.

## Task 1: Audit, schema boundary, local verification, and UI reversal

### rollout_summary_files

- rollout_summaries/2026-08-27T07-28-15-vpVJ-used_car_project_audit_localhost_sql_loan_card_revision.md (cwd=C:\Users\user\Desktop\used-car, rollout_path=\\?\C:\Users\user\.codex\sessions\2026\08\27\rollout-2026-08-27T15-28-15-01a0421e-939f-7453-b375-f3a5f387b2a7.jsonl, updated_at=2026-08-28T09:08:56+00:00, thread_id=01a0421e-939f-7453-b375-f3a5f387b2a7)

### keywords

- PROJECT_CONTEXT.md, template/, ViteSSG, _archived, Favorites.vue, MyLoans.vue, development.localhost, useSEO.ts

## Task 2: Chrome missing SideBySide assembly

### rollout_summary_files

- rollout_summaries/2026-08-27T01-14-49-nqVw-repair_chrome_side_by_side_startup_error.md (cwd=C:\Users\user\Desktop\used-car, rollout_path=C:\Users\user\.codex\sessions\2026\08\27\rollout-2026-08-27T09-14-50-01a040c8-b2ca-73e0-9fcf-88af85530a0e.jsonl, updated_at=2026-08-27T01:18:15+00:00, thread_id=01a040c8-b2ca-73e0-9fcf-88af85530a0e)

### keywords

- Chrome, SideBySide, Dependent Assembly, new_chrome.exe, chrome_proxy.exe, file version

## User preferences

- “read and understand my project ... all folder and .md” -> source-grounded overview; samples/screenshots are reference-only. Targeted UI change then reversal “in both cards pages” -> minimal edits and inspect both surfaces. [Task 1]

## Reusable knowledge

- `template/` is Vue/Vite/TypeScript/Pinia/ViteSSG/Supabase. Never provision from `_archived`; start with `pnpm.cmd run dev:local`; missing-env build uses `pnpm.cmd exec vite build --mode development.localhost` without printing keys. [Task 1]
- For SideBySide, inspect event/versioned files and pending `new_chrome*` before shortcut recreation; use file version/registry/processes, not `chrome.exe --version`. [Task 2]

## Failures and how to do differently

- wrong cwd yields false paths -> work from `template/` or absolute paths. Pre-existing type-check errors are baseline, not automatically current-change failures. [Task 1]

# Task Group: VIPBillion content imports, metadata, and reusable Vben modules
scope: Keep VIPBillion Docker imports additive, public copy truthful, and shared admin modules structurally reused.
applies_to: cwd=C:\Users\user\Desktop\VIPBillion and its approved local-Docker workflow; reuse_rule=project-specific company/title rules apply only to VIPBillion; do not reset or modify unrelated database rows.

## Task 1: Additive news batches, metadata titles, and admin reuse

### rollout_summary_files

- extensions/ad_hoc/notes/20260812-vipbillion-news-fast-batch-workflow.md (cwd=VIPBillion local-Docker workflow, rollout_path=INSUFFICIENT DATA, updated_at=2026-08-12T00:00:00+00:00, ad-hoc note; approved batch gate)
- extensions/ad_hoc/notes/2026-07-22-vipbillion-metadata-title-location-preference.md (cwd=C:\Users\user\Desktop\VIPBillion\website-vipbillion, rollout_path=INSUFFICIENT DATA, updated_at=2026-07-22T00:00:00+00:00, ad-hoc note; title/location contract)

### keywords

- VIP BILLION MILESTONE TRAVEL & TOURS, 10 40 50 50 50, news.md, additive-only, 1200x630, 400x300, lib/metaData.php, soft delete, partial unique index

## User preferences

- VIPBillion news imports are additive-only: preserve old rows unless a correction is explicit; do not reset/delete/recreate unrelated local Docker/Supabase data. [Task 1] [ad-hoc note]
- public metadata uses Malaysia-wide wording unless a page is genuinely local; use concise intent-first titles and do not modify customer-editable Supabase records merely for SEO wording. [Task 1] [ad-hoc note]

## Reusable knowledge

- Use `news.md` schema/existing importer. Approved phases are `10, 40, 50, 50, 50`; compact gate checks selected/cumulative counts, JSON/language alignment, company normalization, generated SQL/inserts, proportional images, and one `/news` smoke test. [Task 1]
- Keep image aspect ratio inside 1200x630 desktop and 400x300 mobile without padding/letterboxing. For soft-deleted slugs, frontend duplicate checks use active rows and DB uniqueness is a partial index `WHERE deleted_at IS NULL`. [Task 1] [ad-hoc note]
- For “same module,” clone the complete existing module shell before changing inner data/content; retain exact shared drawer/grid behavior. [Task 1] [ad-hoc note]

## Failures and how to do differently

- UI says slug available but submit hits unique constraint -> suspect old full-table uniqueness drift; repair constraint/index to partial active-row uniqueness rather than suffixing deleted slugs. [Task 1]

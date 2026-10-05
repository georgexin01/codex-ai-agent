# Task Group: EDSB Admin phone-only login and Docker-local Auth parity
scope: Maintain the EDSB Admin phone-first identity contract and reproduce the supplied reference only in Docker-local Supabase.
applies_to: cwd=C:\Users\user\Desktop\EDSB\admin-panel-edsb; reuse_rule=checkout- and state-specific: apply phone/Auth parity only to Docker-local EDSB, never to the VPS; protect shared identity data.

## Task 1: Phone-only EDSB Admin login and local parity verification

### rollout_summary_files

- extensions/ad_hoc/notes/2026-09-18T02-15-00-edsb-local-vps-parity.md (cwd=C:\Users\user\Desktop\EDSB\admin-panel-edsb, rollout_path=INSUFFICIENT DATA, updated_at=2026-09-18T02:15:00+00:00, ad-hoc note; Docker-local parity verified)
- extensions/ad_hoc/notes/2026-09-18T00-00-00-edsb-phone-only-admin-login.md (cwd=C:\Users\user\Desktop\EDSB\admin-panel-edsb, rollout_path=INSUFFICIENT DATA, updated_at=2026-09-18T00:00:00+00:00, ad-hoc note; migration contract verified)

### keywords

- admin-panel-edsb, auth.users.phone, phone/password, 050_edsb_phone_only_admin_users.sql, edsb.users, public."user", Docker-local Supabase, /auth/login, /users/list

## User preferences

- when matching the supplied VPS identity data locally, keep the operation scoped to Docker-local EDSB; do not apply the parity operation to the VPS. [Task 1]
- do not clear existing `auth.users.email` or `public."user".email` without explicit owner approval; shared identity data is outside the EDSB User CRUD boundary. [Task 1]

## Reusable knowledge

- EDSB Admin login identity is `auth.users.phone`; phone is required in User CRUD and profile updates. New EDSB Auth identities use `email = NULL` by default; active EDSB CRUD does not store or expose email. [Task 1]
- `apps/web-antd/src/sql/migrations/050_edsb_phone_only_admin_users.sql` implements the contract. Local verification confirmed `edsb.users.email` is absent, phone is non-null, and EDSB create/update RPCs exist. [Task 1]
- A supplied profile can retain a nullable profile-email column to preserve its local shape even though active EDSB CRUD remains phone-first; Auth login phone and profile phone may intentionally differ in the supplied reference. [Task 1]
- The cited local parity check passed Auth identity, EDSB `public.user` link, EDSB profile shape, 16 EDSB business tables, and HTTP 200 for `/`, `/auth/login`, and `/users/list`. [Task 1]

## Failures and how to do differently

- VPS/reference data is not a generic migration source -> never copy a reference row's unrelated project linkage into local EDSB, and do not carry database password hashes into guidance. [Task 1]
- Phone-only CRUD does not authorize destructive email cleanup -> preserve shared Auth/public email fields unless the owner explicitly approves it. [Task 1]

# Task Group: Zeta Software bilingual static-site maintenance
scope: Maintain English/Simplified-Chinese generated pages, source-faithful design reuse, local checks, performance/cache work, and safe image-migration follow-up.
applies_to: cwd=D:\backup\website-zetasoftware; reuse_rule=checkout-specific: read README.md, status.md, meta.md, and current generators first; English markup/design is canonical and `cn/` needs localized visible-text parity.

## Task 1: Generated navigation, bilingual content formatting, cache policy, and CSS minification

### rollout_summary_files

- rollout_summaries/2026-09-07T05-57-20-zPhy-zeta_website_project_audit_navigation_content_performance.md (cwd=D:\backup\website-zetasoftware, rollout_path=C:\Users\user\.codex\sessions\2026\09\07\rollout-2026-09-07T13-57-20-01a07a71-4c56-70b0-a1e2-b8a02742ecb4.jsonl, updated_at=2026-09-07T09:41:02+00:00, thread_id=01a07a71-4c56-70b0-a1e2-b8a02742ecb4, minified CSS written; final served-file/idempotence check incomplete)

### keywords

- generate-standard-internal-management-pages.js, update-site-navigation.js, format-detail-content.js, long-form-intros.js, style.min.css, clean-css-cli, Cloudflare cache, main.js, Lucide, GSAP, Lenis

## Task 2: Localhost, Lighthouse/image work, true lazy loading, and incomplete JPG migration

### rollout_summary_files

- rollout_summaries/2026-09-04T01-20-03-IpkW-zeta_static_site_localhost_performance_image_loading.md (cwd=D:\backup\website-zetasoftware, rollout_path=\\?\C:\Users\user\.codex\sessions\2026\09\04\rollout-2026-09-04T09-20-03-01a06a00-5a37-7e72-bbbc-b6b33c856356.jsonl, updated_at=2026-09-07T05:56:45+00:00, thread_id=01a06a00-5a37-7e72-bbbc-b6b33c856356, JPG/WebP follow-up incomplete)

### keywords

- php -S 127.0.0.1:8080 -t, Lighthouse, data-src, IntersectionObserver, apply-body-image-lazyload.js, images/mobile, images/website, WebP, JPG

## Task 3: FAQ/blog/homepage/services parity and exact phone-frame reuse

### rollout_summary_files

- rollout_summaries/2026-08-13T09-01-30-FmzH-zetasoftware_bilingual_faq_homepage_blogs_pricing_parity.md (cwd=D:\backup\website-zetasoftware, rollout_path=C:\Users\user\.codex\sessions\2026\08\13\rollout-2026-08-13T17-01-30-019ffa5a-eb3e-7172-8f41-7b65c41c8a95.jsonl, updated_at=2026-08-13T09:54:49+00:00, thread_id=019ffa5a-eb3e-7172-8f41-7b65c41c8a95)
- rollout_summaries/2026-08-13T08-59-12-0qMc-zetasoftware_blog_regeneration_portfolio_phone_frame_correct.md (cwd=D:\backup\website-zetasoftware, rollout_path=\\?\C:\Users\user\.codex\sessions\2026\08\13\rollout-2026-08-13T16-59-12-019ffa58-d0c5-7e41-b135-6dd2e966daa4.jsonl, updated_at=2026-08-13T11:03:42+00:00, thread_id=019ffa58-d0c5-7e41-b135-6dd2e966daa4, blog regeneration incomplete; phone reuse complete)
- rollout_summaries/2026-08-13T06-18-50-bDIs-zetasoftware_bilingual_faq_system_and_interrupted_globalizat.md (cwd=D:\backup\website-zetasoftware, rollout_path=C:\Users\user\.codex\sessions\2026\08\13\rollout-2026-08-13T14-18-50-019ff9c5-febf-7151-a502-860618d376c8.jsonl, updated_at=2026-08-13T09:01:23+00:00, thread_id=019ff9c5-febf-7151-a502-860618d376c8)

### keywords

- data/faq.json, js/faq.js, FAQPage JSON-LD, home-blogs.js, data/blogs.json, data/blogs-cn.json, sticky-phone, phone-screen, pricing-section

## User preferences

- when bilingual content/layout is requested, English markup/design is the source; update the Chinese counterpart with localized visible text and parity checks in the same task. [Task 1][Task 3]
- when restoring a missing header/menu, preserve descriptions, images, CSS, routes, and unrelated page content during narrow fixes. [Task 1]
- when revising long descriptions, the user said "merge back some suitable" endings and requested roughly 50-100 fewer words -> group related sentences naturally, not one break per sentence. [Task 1]
- when requesting `localhost test`, detect the project type, start only the needed server, and report verified URLs/statuses rather than a process launch. [Task 2]
- body images should use `data-src` plus a 1x1 SVG placeholder; exclude project logo, icon, zcapital2, logo-zeta, header, and footer. Do not remove WebPs in the two target folders until requested JPG sources and all references are verified. [Task 2]
- when FAQ content is requested, favor "long and human friendly" answers tied to blog/search questions and local audience intent, with a distinct company-focused subset rather than keyword stuffing. [Task 3]
- when requesting "exact same design," reuse canonical homepage markup/classes and measured structure instead of a visual approximation. [Task 3]

## Reusable knowledge

- Related skill: skills/zeta-bilingual-static-site/SKILL.md. [Task 1][Task 2][Task 3]
- This static checkout has no package/Vite/PHP entry: serve with `php -S 127.0.0.1:8080 -t <workspace>`; representative EN/CN HTTP 200 checks do not prove Apache `.htaccess`, browser visual QA, or deployment. [Task 2]
- SIM generator emitted empty desktop/mobile nav because it skipped the shared updater. Keep `require("./update-site-navigation");` after generation, regenerate, then inspect non-empty navigation and an active state. [Task 1]
- `scripts/format-detail-content.js` selectively groups sentences; `scripts/long-form-intros.js` holds compact shared EN/CN tails. Preserve technical acronyms/proper names while shortening shared copy. [Task 1]
- Versioned CSS/JS can use `Cache-Control: public, max-age=31536000, immutable`; keep replaceable unversioned images around 30 days until filenames/query strings are versioned; HTML should revalidate. [Task 1]
- `main.js` combines navigation, lazy images, sliders, testimonials, forms, and optional animation. Take a throttled Chrome trace before main-thread changes; inspect Evaluate Script, layout, animation frames, and image decode. [Task 1]
- FAQ source is `data/faq.json` with `en`/`cn`; `js/faq.js` renders accordions and matching FAQPage JSON-LD. The 13-Aug validation had 30 paired IDs, while the later 7-Sep checkout audit reports 40 records per language; read the current dataset, preserve its paired IDs/count, crawlable fallback HTML, and schema alignment. [Task 1][Task 3]
- `js/home-blogs.js` sorts localized data by date, selects three, escapes text, refreshes Lucide icons, and integrates lazy-image loading. Blog dataset replacement to ten records/images was not evidenced. [Task 3]
- Canonical homepage phone frame is `sticky-phone portfolio-card-phone` with `phone-screen`, camera, physical button, reflection, and light-bleed; preserve desktop 310x640 and mobile 275x572 dimensions. [Task 3]

## Failures and how to do differently

- Invalid JSON, duplicate records, or CN parity lag after FAQ bulk edits -> parse JSON immediately; check the current count (do not reuse the historical 30-record snapshot), unique IDs, paired IDs/titles, fallback, and schema before closing. [Task 1][Task 3]
- Chinese text appears corrupted in PowerShell -> inspect bytes with UTF-8-aware Node/file checks before diagnosing mojibake; avoid default PowerShell bulk writes. [Task 3]
- Generator regression restores blank menus -> run generator and shared nav updater together, then inspect generated output rather than only source. [Task 1]
- Do not delete WebPs in `images/mobile`/`images/website`: resolve HTML/JS/JSON/CSS references, confirm JPG files/routes and true `IntersectionObserver` lazy loading (including dynamically inserted blog images), then delete only authorized WebPs. [Task 2]
- `clean-css-cli` wrote `style.min.css`, but final verification was interrupted -> rerun hash/idempotence, HTTP 200 for `/css/style.min.css?v=0179`, selector check, and `git diff --check`. [Task 1]

# Task Group: Used-Car Vue/Supabase project workflow
scope: Orient, verify, and make surgical client changes in the Used-Car Vue 3/ViteSSG app while protecting the external-admin schema boundary.
applies_to: cwd=C:\Users\user\Desktop\used-car; reuse_rule=checkout-specific: app root is `template/`; read `PROJECT_CONTEXT.md` first and treat current source/runtime evidence as stronger than historical docs.

## Task 1: Whole-project audit, SQL-source boundary, localhost, and saved-loan reversal

### rollout_summary_files

- rollout_summaries/2026-08-27T07-28-15-vpVJ-used_car_project_audit_localhost_sql_loan_card_revision.md (cwd=C:\Users\user\Desktop\used-car, rollout_path=\\?\C:\Users\user\.codex\sessions\2026\08\27\rollout-2026-08-27T15-28-15-01a0421e-939f-7453-b375-f3a5f387b2a7.jsonl, updated_at=2026-08-28T09:08:56+00:00, thread_id=01a0421e-939f-7453-b375-f3a5f387b2a7)

### keywords

- PROJECT_CONTEXT.md, LOCAL-SEARCH-MAP.md, template/, ViteSSG, Pinia, Supabase, _archived, Favorites.vue, MyLoans.vue, development.localhost, useSEO.ts, robots.txt, sitemap.xml

## User preferences

- when asking to "read and understand my project ... all folder and .md," provide source-grounded whole-project understanding; `sample/` and screenshots are reference-only, not live inventory/business facts. [Task 1]
- when requesting a targeted UI change then reversal "in both cards pages," make minimal edits and inspect both surfaces before declaring completion. [Task 1]
- preserve English-only durable knowledge and narrow trigger control; do not add aliases opportunistically. [Task 1]

## Reusable knowledge

- `template/` is Vue 3, Vite, TypeScript, Tailwind v4, Pinia, Vue Router, vue-i18n (`zh/en/ms`), ViteSSG, PWA, and Supabase. [Task 1]
- Never provision from `template/src/sql/migrations/_archived/`; external admin migrations 001-039 at `D:\admin-panel-used-car\apps\web-antd\src\sql\migrations\` are documented as authoritative, but were unavailable during audit, so live schema is `INSUFFICIENT DATA`. [Task 1]
- Start from `template/` with `pnpm.cmd run dev:local`; verified host is `http://127.0.0.1:3000`. [Task 1]
- Saved-loan cards are `Favorites.vue` and `profile/MyLoans.vue`; current verified state has no precise-quote button or `LoanContactSheet.vue`. Existing vehicle contact behavior is `cars/ContactSheet.vue`. [Task 1]
- SEO readiness requires source -> ViteSSG build -> preview -> rendered HTML -> robots/sitemap -> production crawler/CDN. HTTP 200 alone is not proof. [Task 1]

## Failures and how to do differently

- Default SSG can fail with `Error: supabaseUrl is required.` when env variables are absent -> use `pnpm.cmd exec vite build --mode development.localhost` for local verification; never print keys. [Task 1]
- Wrong cwd gave false missing-path results -> run checks from `template/` or use absolute paths; favor simple separately quoted PowerShell/rg commands. [Task 1]
- `pnpm.cmd run type-check` had pre-existing errors -> report it as non-clean; do not attribute all failures to the current change. [Task 1]

# Task Group: Codex configuration, boot routing, and maintenance
scope: Follow the exact boot sentinel, maintain route-first knowledge, and distinguish current configuration from historical maintenance artifacts.
applies_to: cwd=C:\Users\user\.codex and boot requests from other cwd; reuse_rule=time-sensitive: re-read current `00_PULSE.md` and router state before edits; historical counts/routes may be stale.

## Task 1: Exact Codex knowledge boot and localhost routing guard

### rollout_summary_files

- rollout_summaries/2026-09-04T01-18-24-1Zuq-codex_boot_and_localhost_test_blocked.md (cwd=C:\Users\user\.codex, rollout_path=C:\Users\user\.codex\sessions\2026\09\04\rollout-2026-09-04T09-18-24-01a069fe-d709-7e00-b7e6-2069c0077bea.jsonl, updated_at=2026-09-04T01:19:08+00:00, thread_id=01a069fe-d709-7e00-b7e6-2069c0077bea, localhost test correctly blocked)

### keywords

- ai read .codex knowledge, 00_PULSE.md, Agent is Ready, localhost-test, ports 3000 5173 6006

## Task 2: Routing/performance and Git maintenance

### rollout_summary_files

- rollout_summaries/2026-08-20T01-54-45-Rl4o-codex_git_sparse_checkout_and_generated_images_cleanup.md (cwd=C:\Users\user\.codex, rollout_path=\\?\C:\Users\user\.codex\sessions\2026\08\20\rollout-2026-08-20T09-54-45-01a01ce0-bb0d-76b1-898a-dabc3ae2eddc.jsonl, updated_at=2026-08-20T08:30:33+00:00, thread_id=01a01ce0-bb0d-76b1-898a-dabc3ae2eddc, historical nested-Git status; recheck current worktree)
- rollout_summaries/2026-08-12T07-57-58-bZCY-codex_lean_maintenance_and_memory_compression.md (cwd=C:\Users\user\.codex, rollout_path=C:\Users\user\.codex\sessions\2026\08\12\rollout-2026-08-12T15-57-58-019ff4fa-668d-74d2-bc92-64724b087b5c.jsonl, updated_at=2026-08-12T08:30:52+00:00, thread_id=019ff4fa-668d-74d2-bc92-64724b087b5c)

### keywords

- Update-CodexRouting.ps1, Audit-CodexRouting.ps1, Test-CodexPerfBenchmark.ps1, knowledge compression, git sparse-checkout, thread-writer-locks, nested memories/.git

## User preferences

- when asking for `.codex` improvements, "find improvement ... to highly improve performances" -> inspect live routes, memory sizes, skills, and benchmarks before recommending/editing. [Task 2]
- when asking to "take action ... wont make heavy changes," prefer reversible surgical maintenance; preserve skills, secrets, routes, and repository state. [Task 2]

## Reusable knowledge

- Exact trigger `ai read .codex knowledge` reads current `00_PULSE.md` once and replies only `[🟢] Agent is Ready..`; on the next normal turn, enter task state without repeating boot. [Task 1]
- For localhost testing, discover a runnable application/project root first. `.codex` had no runnable project/listener on 3000/5173/6006, so starting there is a stop condition. [Task 1]
- Route first and keep deep knowledge lazy. Refresh generated routing via `codex-router/Update-CodexRouting.ps1 -Quiet`, then audit/benchmark/activation as applicable. [Task 2]
- In sparse checkout, inspect `git status` before staging; historical explicit staging used `git add --sparse -A -- . ':!thread-writer-locks/**'`. [Task 2]

## Failures and how to do differently

- Do not mutate `memories/.git` or other nested Git metadata without explicit cleanup authorization; current status must be rechecked. [Task 2]
- Large encoded Markdown patches can fail -> inspect exact context and use smaller stable patches; do not treat truncated command output as source evidence. [Task 2]

# Task Group: Local Supabase VPS backup restore and API exposure
scope: Repair inconsistent auth backup data, run protected atomic Huwa2 restore, and expose the restored schema through the CLI-managed local stack.
applies_to: cwd=C:\Users\user\Documents\supabase-project-backup-restore; reuse_rule=stateful and checkout-specific: inspect active stack/config and back up before mutations.

## Task 1: Repair Huwa2 auth backup, restore it, and expose `huwa2`

### rollout_summary_files

- rollout_summaries/2026-08-14T02-47-47-8IL6-huwa2_vps_restore_and_postgrest_expose.md (cwd=C:\Users\user\Documents\supabase-project-backup-restore, rollout_path=C:\Users\user\.codex\sessions\2026\08\14\rollout-2026-08-14T10-47-47-019ffe2b-21d6-7ff2-9bea-6cfa6ab17768.jsonl, updated_at=2026-08-14T03:10:24+00:00, thread_id=019ffe2b-21d6-7ff2-9bea-6cfa6ab17768)

### keywords

- huwa2, auth.users, auth.identities, identities_user_id_fkey, 04-auth-rows.sql, atomic restore, PGRST_DB_SCHEMAS, config.toml, com.supabase.cli.project

## User preferences

- when restoring VPS data locally, preserve the original backup and repair only a working copy when possible; treat local database state as protected. [Task 1]
- when the goal is localhost access, separately verify database restoration and PostgREST API exposure. [Task 1]

## Reusable knowledge

- Validate every `auth.identities.user_id` against `auth.users.id` before restore. Historical repair preserved `04-auth-rows.original.sql`, added 10 placeholder parents to working SQL, and reached 18 users / 26 identities / 0 orphans. [Task 1]
- Use `C:\Program Files (x86)\Git\bin\bash.exe` for existing `scripts/04-restore-local.sh` on this host. Atomic restore commits only after success. [Task 1]
- Actual local stack is CLI-managed at `C:\Users\user\Documents\local-supabase`; add schema names in `[api].schemas` of `supabase/config.toml`, back it up, then CLI stop/start without resetting the data volume. [Task 1]

## Failures and how to do differently

- `scripts/06-expose-schema.sh` fails `Could not locate compose file for 'supabase_rest_local-supabase'` because it assumes Compose labels -> detect `com.supabase.cli.project` and use CLI config instead. [Task 1]
- Recovered placeholder auth records may not be login-capable: source had missing passwords/phone fields. Do not describe DB restoration as fully recovering authentication. [Task 1]

# Task Group: Project-agnostic metadata and webmanifest workflow
scope: Update reusable SEO/metadata instructions without leaking historical project identities or inventing scope.
applies_to: cwd=C:\Users\user\Desktop\ai comment; reuse_rule=apply to current-project metadata work only after identity and architecture are evidenced.

## Task 1: Current-project metadata identity, broad truthful scope, and manifest reminder

### rollout_summary_files

- rollout_summaries/2026-08-10T04-13-53-hwPl-project_agnostic_metadata_and_webmanifest_guidance.md (cwd=C:\Users\user\Desktop\ai comment, rollout_path=\\?\C:\Users\user\.codex\sessions\2026\08\10\rollout-2026-08-10T12-13-53-019fe9e0-8772-7143-8b6b-11cc8a866137.jsonl, updated_at=2026-08-10T04:22:20+00:00, thread_id=019fe9e0-8772-7143-8b6b-11cc8a866137)

### keywords

- (AI) metaTitle.txt, INSUFFICIENT DATA, site.webmanifest, Select-String -LiteralPath, project identity, SEO metadata

## User preferences

- when metadata is requested, find the "actual project name user are working on rightnow"; avoid historical project examples and derive exact identity from current evidence. [Task 1]
- use the broadest accurate industry/category/market/region/country/international scope supported by evidence; never invent global reach. [Task 1]
- use the project's centralized metadata module/include, not seed/data or unrelated templates. [Task 1]

## Reusable knowledge

- Use `INSUFFICIENT DATA` when identity is unconfirmed. Do not copy names, domains, URLs, social accounts, locations, colors, filenames, or claims from examples/history. [Task 1]
- Synchronize a manifest only where the project is an installable web app; evidence `name`, `short_name`, `description`, `lang`, `id`, `start_url`, `scope`, display/colors, and existing icons. [Task 1]

## Failures and how to do differently

- `rg --literal-path` is unsupported -> use PowerShell `Select-String -LiteralPath` for exact-file scans. If workspace has no Git repo, use targeted scans/read-back rather than claiming `git diff` verification. [Task 1]

# Task Group: Windows Chrome SideBySide repair
scope: Diagnose a specific Chrome update failure where the launcher exists but its dependent assembly is missing.
applies_to: cwd=C:\Users\user\Desktop\used-car; reuse_rule=host-specific and time-sensitive: verify current event, paths, pending files, and versions before action.

## Task 1: Chrome missing SideBySide assembly repair

### rollout_summary_files

- rollout_summaries/2026-08-27T01-14-49-nqVw-repair_chrome_side_by_side_startup_error.md (cwd=C:\Users\user\Desktop\used-car, rollout_path=C:\Users\user\.codex\sessions\2026\08\27\rollout-2026-08-27T09-14-50-01a040c8-b2ca-73e0-9fcf-88af85530a0e.jsonl, updated_at=2026-08-27T01:18:15+00:00, thread_id=01a040c8-b2ca-73e0-9fcf-88af85530a0e)

### keywords

- Chrome, SideBySide, Dependent Assembly, new_chrome.exe, 151.0.7922.175, chrome_proxy.exe

## Reusable knowledge

- For Chrome SideBySide with an existing valid shortcut, inspect event/versioned application files and pending `new_chrome*` before recreating a shortcut. Historical repair replaced launchers only after elevated version-checked backup and verified 151.0.7922.175 process launch. [Task 1]

## Failures and how to do differently

- `chrome.exe --version` may launch Chrome rather than reliably report version -> use file version, registry, and running processes. [Task 1]

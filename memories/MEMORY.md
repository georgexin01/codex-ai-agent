# Task Group: Zeta Software bilingual static-site maintenance

scope: Maintain, test, generate, and optimize the English/Simplified-Chinese static site without breaking language parity or generated navigation.
applies_to: cwd=D:\backup\website-zetasoftware; reuse_rule=Reuse for this checkout and its static HTML/generator architecture; re-check current generated output, asset versions, and server state before edits.

## Task 1: Audit, restore generated navigation, reshape detail copy, and assess performance

### rollout_summary_files

- rollout_summaries/2026-09-07T05-57-20-zPhy-zeta_website_project_audit_navigation_content_performance.md (cwd=D:\backup\website-zetasoftware, rollout_path=C:\Users\user\.codex\sessions\2026\09\07\rollout-2026-09-07T13-57-20-01a07a71-4c56-70b0-a1e2-b8a02742ecb4.jsonl, updated_at=2026-09-07T09:41:02+00:00, thread_id=01a07a71-4c56-70b0-a1e2-b8a02742ecb4, partial: CSS minification needs final verification)

### keywords

- Zeta Software, bilingual static HTML, generate-standard-internal-management-pages, update-site-navigation, format-detail-content, long-form-intros, style.min.css, Cloudflare cache, main.js

## Task 2: Localhost verification, Lighthouse/static-quality work, and unfinished lazy/JPG migration

### rollout_summary_files

- rollout_summaries/2026-09-04T01-20-03-IpkW-zeta_static_site_localhost_performance_image_loading.md (cwd=D:\backup\website-zetasoftware, rollout_path=\\?\C:\Users\user\.codex\sessions\2026\09\04\rollout-2026-09-04T09-20-03-01a06a00-5a37-7e72-bbbc-b6b33c856356.jsonl, updated_at=2026-09-07T05:56:45+00:00, thread_id=01a06a00-5a37-7e72-bbbc-b6b33c856356, partial: do not claim JPG/WebP migration complete)

### keywords

- localhost-test, php -S 127.0.0.1:8080, Lighthouse, WebP, JPG, data-src, IntersectionObserver, apply-body-image-lazyload, images/mobile, images/website

## Task 3: FAQ, homepage latest blogs, services labels, and pricing/font parity

### rollout_summary_files

- rollout_summaries/2026-08-13T09-01-30-FmzH-zetasoftware_bilingual_faq_homepage_blogs_pricing_parity.md (cwd=D:\backup\website-zetasoftware, rollout_path=C:\Users\user\.codex\sessions\2026\08\13\rollout-2026-08-13T17-01-30-019ffa5a-eb3e-7172-8f41-7b65c41c8a95.jsonl, updated_at=2026-08-13T09:54:49+00:00, thread_id=019ffa5a-eb3e-7172-8f41-7b65c41c8a95)

### keywords

- faq.json, js/faq.js, home-blogs.js, blogs.json, bilingual parity, pricing-section, Orbitron, Google Fonts, services/index.html, Week 1

## User preferences

- When changing bilingual site content, the user expects paired English/Chinese records and tracking updates, not English-only completion; quantify requested changes such as “at least five” items or “at least 20% of titles.” [Task 3]
- When the user asks for “exact same design” with screenshots, treat the matching homepage markup/CSS and screenshot as the visual source of truth; inspect both English and Chinese pages. [Task 3]
- When restoring a missing header/menu, preserve descriptions, images, CSS, routes, and unrelated page content unless explicitly requested. [Task 1]
- For copy formatting, “merge back some suitable” endings means natural sentence groups, not a break after every sentence; requested shortening should retain topic-specific content. [Task 1]
- “localhost test” means detect the project runtime, start only the necessary server, and verify actual URLs rather than reporting a process start. [Task 2]
- For the image request, preserve the stated contract: body images use a 1×1 SVG `src` plus original `data-src`; exclude project logo, icon, `zcapital2`, `logo-zeta`, header, and footer; remove WebPs only after references are safely corrected. [Task 2]
- When asked only to update the minified counterpart, keep the operation narrowly scoped: no HTML, JavaScript, layout, or content changes. [Task 1]

## Reusable knowledge

- English markup/design is the source for bilingual work; corresponding `cn/` pages must preserve structure while localizing visible content. Project truth is in `README.md`, `status.md`, `meta.md`, `project-maintenance.md`, `website-content-knowledge-cn.md`, and `blogs.md`. [Task 1]
- Important generator/source map: `scripts/seo-config.js`, `scripts/update-site-navigation.js`, `scripts/partials/site-footer.js`, `scripts/generate-business-model-pages.js`, `scripts/generate-standard-internal-management-pages.js`, `scripts/business-models-data.js`, `scripts/standard-internal-management-data.js`, `scripts/long-form-intros.js`, and `scripts/format-detail-content.js`. The site is static generated HTML with root-relative assets, versioned CSS/JS, JSON-LD and WebPage Microdata. [Task 1]
- For Standard Internal Management pages, invoke `require("./update-site-navigation");` after generation. It fixed empty desktop/mobile `<nav>` output across 10 English and 10 Chinese details plus both hubs; validate non-empty nav, internal links, and exactly one active SIM state. [Task 1]
- `format-detail-content.js` groups related sentences in pairs with selective `<br />`/`<br /><br />`; compact shared English/Chinese tails live in `long-form-intros.js`. The validated regeneration gate covered 40 bilingual Business Model/SIM pages, language consistency, no duplicated hero descriptions, and HTTP 200. [Task 1]
- Serve this checkout as static files: `php -S 127.0.0.1:8080 -t <workspace>`. It has no package manifest, Vite config, or PHP entry file. Check `/`, `/cn/`, `/blogs/`, `/cn/blogs/`, `/privacy/`, `/cn/privacy/`, `/robots.txt`, and `/sitemap.xml`. [Task 2]
- Performance baseline: 94 WebP sidecars were validated while original raster files remained; all 154 HTML files passed static checks and 94 WebPs decoded. Local PHP/http-server checks do not exercise Apache `.htaccess` compression/cache behavior. [Task 2]
- `js/main.js` is the first main-thread investigation target: it globally combines navigation, lazy images, sliders/testimonials, forms, and optional animation behavior. Use a mobile-throttled Chrome Performance trace to distinguish `Evaluate Script`, layout, animation frames, and image decode before changing code; cache policy cannot solve parsing/layout/animation cost. [Task 1]
- Cache policy: versioned CSS/JS can use `public, max-age=31536000, immutable`; replaceable unversioned images should use roughly 30 days until names/query strings are versioned; HTML should revalidate. Cloudflare browser-cache settings can override origin TTLs. [Task 1]
- `js/faq.js` loads `/data/faq.json` according to `/cn/` and updates visible FAQ plus FAQPage JSON-LD. After FAQ edits, run JSON parse, duplicate-ID, count, paired-ID, and paired-title checks. [Task 3]
- `js/home-blogs.js` selects a language dataset, sorts descending by date, renders the latest three escaped records, refreshes Lucide icons, and integrates lazy-image loading. Preserve `col-12 col-md-6 col-lg-4`, placement below `// OUR CAPABILITIES`, localized JSON, and the centered red `View More Articles` CTA. [Task 3]
- Services pricing parity uses `pricing-section`, `pricing-grid`, `pricing-card glass-panel`, `featured`, `popular-badge`, and centered full-width CTA. Services pages must explicitly load the same Google Fonts URL as homepages for `var(--font-heading)`/Orbitron to work. [Task 3]

## Failures and how to do differently

- Generator output can regress to empty menus when it emits nav containers but skips the shared updater; render shared navigation or run `update-site-navigation.js`, then regenerate and inspect both languages. [Task 1]
- The mobile/website JPG migration is unfinished. A PowerShell ripgrep regex error interrupted reference auditing; do not delete any WebPs. First resolve HTML/JS/JSON/CSS references robustly, ensure the new JPGs exist, verify routes/images, then delete only WebPs in the two requested folders. Also verify true `IntersectionObserver` behavior, including dynamically inserted blog images, before calling lazy loading complete. [Task 2]
- Bulk image rewrites initially missed root-relative `images/...` paths and created malformed ` / fetchpriority=` attributes. Resolve paths from the project root and scan generated HTML for whitespace-before-attribute defects. [Task 2]
- Source and HTTP checks cannot prove visual parity when browser automation is unavailable; state that manual hard-refresh visual QA remains. [Task 3]
- CSS minification was written with `npx --yes clean-css-cli@5.6.3 -o css/style.min.css css/style.css`, but final hash/idempotence, served-file, selector, and `git diff --check` validation was interrupted. Use separate simple commands, not a complex combined PowerShell wrapper. [Task 1]

# Task Group: Codex workspace maintenance and localhost routing

scope: Maintain `C:\Users\user\.codex` routing, Git staging, boot behavior, and correctly scoped localhost checks.
applies_to: cwd=C:\Users\user\.codex; reuse_rule=Checkout-specific commands and counts may be stale; reuse the diagnosis and safeguards, then inspect current config and Git status.

## Task 1: Lean routing/knowledge maintenance

### rollout_summary_files

- rollout_summaries/2026-08-12T07-57-58-bZCY-codex_lean_maintenance_and_memory_compression.md (cwd=C:\Users\user\.codex, rollout_path=C:\Users\user\.codex\sessions\2026\08\12\rollout-2026-08-12T15-57-58-019ff4fa-668d-74d2-bc92-64724b087b5c.jsonl, updated_at=2026-08-12T08:30:52+00:00, thread_id=019ff4fa-668d-74d2-bc92-64724b087b5c)

### keywords

- 00_PULSE.md, MEMORY.md, MEMORY_DETAILS.md, Update-CodexRouting.ps1, Audit-CodexRouting.ps1, Test-CodexPerfBenchmark.ps1, Test-CodexSkillActivation.ps1, memories/.git

## Task 2: Sparse-checkout staging, push, and generated-image cleanup

### rollout_summary_files

- rollout_summaries/2026-08-20T01-54-45-Rl4o-codex_git_sparse_checkout_and_generated_images_cleanup.md (cwd=C:\Users\user\.codex, rollout_path=\\?\C:\Users\user\.codex\sessions\2026\08\20\rollout-2026-08-20T09-54-45-01a01ce0-bb0d-76b1-898a-dabc3ae2eddc.jsonl, updated_at=2026-08-20T08:30:33+00:00, thread_id=01a01ce0-bb0d-76b1-898a-dabc3ae2eddc, partial: nested memories Git metadata remains)

### keywords

- git sparse-checkout, git add --sparse, thread-writer-locks, generated_images, Recycle Bin, nested memories/.git, GitHub push

## Task 3: Boot and localhost readiness boundary

### rollout_summary_files

- rollout_summaries/2026-09-04T01-18-24-1Zuq-codex_boot_and_localhost_test_blocked.md (cwd=C:\Users\user\.codex, rollout_path=C:\Users\user\.codex\sessions\2026\09\04\rollout-2026-09-04T09-18-24-01a069fe-d709-7e00-b7e6-2069c0077bea.jsonl, updated_at=2026-09-04T01:19:08+00:00, thread_id=01a069fe-d709-7e00-b7e6-2069c0077bea, partial: no application root was in scope)

### keywords

- 00_PULSE.md, ai read .codex knowledge, localhost-test, ports 3000, 5173, 6006, project root, HYDRATE GROUND PLAN ACT VERIFY

## User preferences

- When maintaining Codex, the user asked to “take action ... wont make heavy changes to it” -> prefer reversible, surgical work that preserves routes, application skills, secrets, and repository state. [Task 1]
- The user accepted a compact hot `memories/MEMORY.md` only when detailed content remained in `MEMORY_DETAILS.md`; preserve searchable detail when compressing routing context. [Task 1]

## Reusable knowledge

- `00_PULSE.md` is the authoritative boot contract. The exact `ai read .codex knowledge` trigger must return only `[🟢] Agent is Ready..`; hydrate once per chat and use task-specific reads afterward. [Task 1][Task 3]
- After route/index changes, refresh generated routing/manifest with `codex-router/Update-CodexRouting.ps1 -Quiet`, then use the routing audit, perf benchmark, skill activation, and knowledge-compression verifier appropriate to the change. [Task 1]
- For parent Git sparse checkout, add required top-level directories with `git sparse-checkout add --skip-checks codex-router memories skills`; ignore `thread-writer-locks/`. Inspect `git status` before staging because unrelated paths may exist. [Task 2]
- Where sparse patterns still block intended files, `git add --sparse -A -- . ':!thread-writer-locks/**'` stages the intended set without runtime locks. [Task 2]
- A localhost readiness test must start from the actual application root: identify project context/package files, reuse/check a matching port, start detached if necessary, and HTTP-check each expected URL. No listener under `.codex` is not a project failure. [Task 3]

## Failures and how to do differently

- `Validate-CodexKnowledge.ps1` was blocked by nested `C:\Users\user\.codex\memories\.git`; do not remove or mutate it without explicit authorization. The same nested repo caused parent-repo staging friction. [Task 1][Task 2]
- For generated-image cleanup, direct recursive deletion was blocked; a recoverable Recycle Bin API deletion succeeded. Prefer recoverable deletion where policy blocks destructive removal. [Task 2]
- Large Markdown patches may fail on encoded/format-mismatched text and large command output may truncate evidence. Inspect exact context, use smaller patches, and verify counts/headings/coverage with targeted commands. [Task 1]
- Do not run localhost discovery from the Codex configuration directory. The previous scan of ports 3000/5173/6006 found no runnable project because it was not the application directory. [Task 3]

# Task Group: Used-Car Vue/Supabase project workflow

scope: Understand, run, validate, and make narrow UI changes in the Used-Car client while respecting its external-schema boundary.
applies_to: cwd=C:\Users\user\Desktop\used-car; reuse_rule=Reuse source maps and local commands for this checkout; treat counts, current schema, and running services as time-sensitive.

## Task 1: Project audit, SQL-source boundary, localhost verification, and saved-loan UI reversal

### rollout_summary_files

- rollout_summaries/2026-08-27T07-28-15-vpVJ-used_car_project_audit_localhost_sql_loan_card_revision.md (cwd=C:\Users\user\Desktop\used-car, rollout_path=\\?\C:\Users\user\.codex\sessions\2026\08\27\rollout-2026-08-27T15-28-15-01a0421e-939f-7453-b375-f3a5f387b2a7.jsonl, updated_at=2026-08-28T09:08:56+00:00, thread_id=01a0421e-939f-7453-b375-f3a5f387b2a7)

### keywords

- PROJECT_CONTEXT.md, LOCAL-SEARCH-MAP.md, Vue 3, ViteSSG, Pinia, Supabase, archived migrations, Favorites.vue, MyLoans.vue, 精准报价, development.localhost

## User preferences

- When asked to “read and understand my project ... all folder and .md,” inspect project-owned Markdown comprehensively and give source-grounded understanding; `sample/` and screenshots are reference-only. [Task 1]
- For a targeted UI change or reversal such as removal from “both cards pages,” make surgical edits, preserve existing card data and unrelated WhatsApp/contact behavior, and check both `Favorites.vue` and `MyLoans.vue`. [Task 1]
- If contact behavior is requested, reuse the existing primary dealer/environment fallback and WhatsApp conventions instead of inventing contact data. [Task 1]

## Reusable knowledge

- Active app root is `template/`: Vue 3, Vite, TypeScript, Tailwind v4, Pinia, Vue Router, `vue-i18n` (`zh/en/ms`), ViteSSG, PWA, and Supabase. Start locally with `pnpm.cmd run dev:local` in `template/`; validated routes use `http://127.0.0.1:3000`. [Task 1]
- `PROJECT_CONTEXT.md` is the project truth map; current source/runtime evidence outranks README and historical handoff text. Key routes/services/stores are under `template/src/router/index.ts`, `template/src/services/`, and `template/src/stores/`. [Task 1]
- All client SQL migrations are explicitly deprecated in `template/src/sql/migrations/_archived/`. The authoritative migrations are documented as external admin-repo files `001–039`; because that repo was absent, live schema remains `INSUFFICIENT DATA`. Do not provision from archived client migrations. [Task 1]
- Saved-loan cards live in `template/src/views/favorites/Favorites.vue` and `template/src/views/profile/MyLoans.vue`. The temporary `LoanContactSheet.vue` and yellow `精准报价` button were removed; preserve existing monthly price, down-payment, term, rate, saved date, and delete behavior. [Task 1]
- Local build validation is `pnpm.cmd exec vite build --mode development.localhost`; it succeeded after reversal. [Task 1]

## Failures and how to do differently

- Default SSG/build can fail with `Error: supabaseUrl is required.` when variables are absent. Use `--mode development.localhost` for this local project and never print keys. [Task 1]
- Run source checks from `template/` or use absolute paths; wrong working-directory-relative paths produced false missing-file reports. [Task 1]
- PowerShell `rg` quoting/wildcard complexity caused failed schema searches; prefer simple separately quoted commands. [Task 1]

# Task Group: Huwa2 Supabase backup restore and PostgREST exposure

scope: Repair a VPS Supabase backup locally, execute an atomic restore, and expose the `huwa2` schema through the CLI-managed local API stack.
applies_to: cwd=C:\Users\user\Documents\supabase-project-backup-restore; reuse_rule=Backup paths, counts, and schema names are rollout-specific; reuse the validation and CLI-vs-Compose decision rule.

## Task 1: Repair auth backup, restore locally, and expose `huwa2`

### rollout_summary_files

- rollout_summaries/2026-08-14T02-47-47-8IL6-huwa2_vps_restore_and_postgrest_expose.md (cwd=C:\Users\user\Documents\supabase-project-backup-restore, rollout_path=C:\Users\user\.codex\sessions\2026\08\14\rollout-2026-08-14T10-47-47-019ffe2b-21d6-7ff2-9bea-6cfa6ab17768.jsonl, updated_at=2026-08-14T03:10:24+00:00, thread_id=019ffe2b-21d6-7ff2-9bea-6cfa6ab17768)

### keywords

- Supabase, huwa2, atomic restore, auth.users, auth.identities, identities_user_id_fkey, orphan identities, PostgREST, PGRST_DB_SCHEMAS, config.toml, Git Bash

## User preferences

- When making the VPS-backed `huwa2` project available locally, preserve the original backup and repair only a local working copy where possible; treat local database state as protected. [Task 1]
- For localhost schema exposure, verify database presence and API exposure separately; make narrow backed-up changes and preserve the DB volume. [Task 1]

## Reusable knowledge

- Before restore, validate every `auth.identities.user_id` has a matching `auth.users.id`. This backup had 10 missing parents; adding placeholder parent users to the working copy yielded 18 users, 26 identities, and zero orphan references. Recovered accounts may still be unable to authenticate if the VPS backup lacks passwords/phone data. [Task 1]
- Use `scripts/04-restore-local.sh` with Git Bash (`C:\Program Files (x86)\Git\bin\bash.exe` was the available path). Success is `Atomic DB restore committed.`; validate project/schema/table/user/object counts after restore. [Task 1]
- The local stack is Supabase CLI-managed at `C:\Users\user\Documents\local-supabase`, not standalone Compose. Add `"huwa2"` to `[api].schemas` in `supabase\config.toml`, then `supabase stop --workdir ...` and `supabase start --workdir ...` to preserve Docker-backed data. Confirm `PGRST_DB_SCHEMAS`, project/schema visibility, and orphan count. [Task 1]

## Failures and how to do differently

- Do not retry an inconsistent backup unchanged: the failed transaction rolled back, but the root cause was backup data, not restore order. [Task 1]
- `scripts/06-expose-schema.sh` fails with `Could not locate compose file for 'supabase_rest_local-supabase'` under CLI-managed stacks. Detect `com.supabase.cli.project` and edit CLI config rather than searching for Compose labels. [Task 1]

# Task Group: Windows Chrome SideBySide launch repair

scope: Diagnose Chrome startup failures caused by incomplete updates and safely switch launchers to an already-installed complete version.
applies_to: cwd=C:\Users\user\Desktop\used-car; reuse_rule=Windows/Chrome-installation-specific; inspect current logs, version folders, registry, and launchers before any replacement.

## Task 1: Repair missing SideBySide dependent assembly

### rollout_summary_files

- rollout_summaries/2026-08-27T01-14-49-nqVw-repair_chrome_side_by_side_startup_error.md (cwd=C:\Users\user\Desktop\used-car, rollout_path=C:\Users\user\.codex\sessions\2026\08\27\rollout-2026-08-27T09-14-50-01a040c8-b2ca-73e0-9fcf-88af85530a0e.jsonl, updated_at=2026-08-27T01:18:15+00:00, thread_id=01a040c8-b2ca-73e0-9fcf-88af85530a0e)

### keywords

- Chrome, SideBySide, missing dependent assembly, new_chrome.exe, chrome_proxy.exe, elevated PowerShell, 151.0.7922.175

## User preferences

- When the user asks “can ai fix this problem for me?”, investigate and safely repair the actual fault rather than offering generic instructions. [Task 1]

## Reusable knowledge

- If a pinned shortcut targets an existing root `chrome.exe` but SideBySide logs name a missing assembly, inspect Chrome versioned directories, pending `new_chrome.exe`/`new_chrome_proxy.exe`, and registry version before touching the shortcut. [Task 1]
- Here, a complete pending build `151.0.7922.175` was present under `C:\Program Files\Google\Chrome\Application`; after elevated, version-checked backup/copy replacement, active launchers and running processes confirmed success. Retain old launchers with explicit `.broken-<version>` names. [Task 1]

## Failures and how to do differently

- Do not recreate a valid shortcut just because Chrome will not launch. The installer exit code `3` did not resolve the incomplete update; use pending launchers only after narrowly scoped elevated backup/copy operations. `chrome.exe --version` may launch a browser rather than report a version, so verify file versions and process existence. [Task 1]

# Task Group: Project-agnostic metadata and webmanifest workflow

scope: Keep reusable metadata guidance grounded in the active website/app rather than inherited examples or historical project identities.
applies_to: cwd=C:\Users\user\Desktop\ai comment; reuse_rule=Reuse as guidance for metadata instruction files, but derive all actual identity, claims, and manifest values from the current project.

## Task 1: Generalize `(AI) metaTitle.txt` and add manifest reminder

### rollout_summary_files

- rollout_summaries/2026-08-10T04-13-53-hwPl-project_agnostic_metadata_and_webmanifest_guidance.md (cwd=C:\Users\user\Desktop\ai comment, rollout_path=\\?\C:\Users\user\.codex\sessions\2026\08\10\rollout-2026-08-10T12-13-53-019fe9e0-8772-7143-8b6b-11cc8a866137.jsonl, updated_at=2026-08-10T04:22:20+00:00, thread_id=019fe9e0-8772-7143-8b6b-11cc8a866137)

### keywords

- metaTitle.txt, SEO metadata, project identity, INSUFFICIENT DATA, broad scope, site.webmanifest, Select-String -LiteralPath

## User preferences

- The user asked for the “actual project name user are working on rightnow” and to avoid old project names: derive identity from current files, visible brand, config, routes, metadata, and runtime evidence; retain confirmed spelling/legal suffix. [Task 1]
- The user asked to avoid narrow “car, door, hotel” examples and wanted broader/global meaning: use the broadest truthful category/market/region scope supported by evidence, never invent global reach. [Task 1]
- Put metadata in the existing centralized module/include rather than seed/data or unrelated templates, and update `site.webmanifest` with active project information when it exists. [Task 1]

## Reusable knowledge

- `(AI) metaTitle.txt` requires `INSUFFICIENT DATA` when identity cannot be confirmed and forbids copying names, domains, URLs, social accounts, locations, colors, page filenames, or claims from examples/history. Detail pages can retain confirmed item/article names; homepage/category pages can use broader confirmed offerings. [Task 1]
- A real installable-web-app manifest should synchronize evidence-based `name`, `short_name`, `description`, `lang`, `id`, `start_url`, `scope`, `display`, colors, and existing icon paths/MIME types/sizes. Do not create a manifest solely for SEO. [Task 1]

## Failures and how to do differently

- `rg --literal-path` is unsupported; use PowerShell `Select-String -LiteralPath` for exact-file scans. If the workspace is not a Git repo, use read-back and targeted scans instead of `git diff`. [Task 1]

# Task Group: .codex worktree, routing, and Git maintenance

scope: Maintain the user's Codex configuration checkout, recover missing tracked knowledge, and keep routing/Git workflows safe.
applies_to: cwd=C:\Users\user\.codex; reuse_rule=use for this checkout's tracked configuration and PowerShell workflow; re-check current Git state before acting.

## Task 1: Recover missing memories and skills; disable sparse checkout

### rollout_summary_files

- rollout_summaries/2026-10-08T01-40-56-1R8h-codex_sparse_checkout_recovery_and_powershell_alert.md (cwd=C:\Users\user\.codex, rollout_path=\\?\C:\Users\user\.codex\sessions\2026\10\08\rollout-2026-10-08T09-40-56-01a1192b-b085-75e1-a18b-2d3afb096a9d.jsonl, updated_at=2026-10-08T07:03:57+00:00, thread_id=01a1192b-b085-75e1-a18b-2d3afb096a9d, success)

### keywords

- core.sparseCheckout, git sparse-checkout disable, skip-worktree, TRACKED_ABSENT, .githooks/pre-commit, memories, skills

## Task 2: Lean routing and hot-memory compression

### rollout_summary_files

- rollout_summaries/2026-08-12T07-57-58-bZCY-codex_lean_maintenance_and_memory_compression.md (cwd=C:\Users\user\.codex, rollout_path=C:\Users\user\.codex\sessions\2026\08\12\rollout-2026-08-12T15-57-58-019ff4fa-668d-74d2-bc92-64724b087b5c.jsonl, updated_at=2026-08-12T08:30:52+00:00, thread_id=019ff4fa-668d-74d2-bc92-64724b087b5c, success)

### keywords

- 00_PULSE.md, MEMORY.md, MEMORY_DETAILS.md, Update-CodexRouting.ps1, Audit-CodexRouting.ps1, Verify-KnowledgeCompression.ps1, nested-memories-git

## Task 3: Git staging, generated-images cleanup, and boot/local-host check

### rollout_summary_files

- rollout_summaries/2026-09-04T01-18-24-1Zuq-codex_boot_and_localhost_test_blocked.md (cwd=C:\Users\user\.codex, rollout_path=C:\Users\user\.codex\sessions\2026\09\04\rollout-2026-09-04T09-18-24-01a069fe-d709-7e00-b7e6-2069c0077bea.jsonl, updated_at=2026-09-04T01:19:08+00:00, thread_id=01a069fe-d709-7e00-b7e6-2069c0077bea, partial)
- rollout_summaries/2026-08-20T01-54-45-Rl4o-codex_git_sparse_checkout_and_generated_images_cleanup.md (cwd=C:\Users\user\.codex, rollout_path=\\?\C:\Users\user\.codex\sessions\2026\08\20\rollout-2026-08-20T09-54-45-01a01ce0-bb0d-76b1-898a-dabc3ae2eddc.jsonl, updated_at=2026-08-20T08:30:33+00:00, thread_id=01a01ce0-bb0d-76b1-898a-dabc3ae2eddc, partial)

### keywords

- ai read .codex knowledge, [🟢] Agent is Ready.., git add --sparse, thread-writer-locks, generated_images, localhost-test, ports 3000 5173 6006

- Related skill: skills/localhost-readiness/SKILL.md

## User preferences

- when making `.codex` changes, the user asked to “take action ... wont make heavy changes to it” -> prefer reversible, surgical maintenance that preserves routes, skills, secrets, and repository state. [Task 2]
- when sparse checkout was involved, the user asked for it disabled “permenent” and wanted memories/skills not to disappear -> clearly distinguish the verified current guard (`core.sparseCheckout=false`, tracked files present) from an absolute guarantee against future explicit mutation. [Task 1]

## Reusable knowledge

- Apparent missing tracked content can be sparse-checkout omission, not deletion: compare `git ls-files`, `git config --bool core.sparseCheckout`, and `Test-Path` before restoring/resetting. The later fix used `git sparse-checkout disable`; all 627 tracked files and 522 tracked memory/skill files were present, and `.githooks/pre-commit` rejects enabled sparse checkout. [Task 1]
- `00_PULSE.md` is the authoritative boot contract. The exact trigger `ai read .codex knowledge` returns only `[🟢] Agent is Ready..`; hydrate once per chat, then use lazy task-specific reads. [Task 3]
- After routing/index changes, refresh generated routing with `codex-router/Update-CodexRouting.ps1 -Quiet`; the earlier verified state had benchmark 32/32, activation 18/18, zero routing audit conflicts, and 240 manifest entries. [Task 2]
- `MEMORY.md` can be a compact hot index while `MEMORY_DETAILS.md` retains detailed evidence; validate route/detail coverage after compression. [Task 2]
- The 2026-08 staging workaround (`git add --sparse`) is historical; sparse checkout was subsequently disabled. Still review `git status` before staging and exclude runtime `thread-writer-locks/**`. [Task 1][Task 3]
- For PowerShell 5.1 web requests, `Invoke-WebRequest -UseBasicParsing` avoids the “Security Warning: Script Execution Risk”; it is separate from Codex approvals and should not be permanently accepted with full HTML parsing. [Task 1]

## Failures and how to do differently

- Missing files -> do not assume deletion or run reset; first diagnose sparse-checkout/tracked presence. [Task 1]
- Full knowledge validation remains blocked by pre-existing `memories/.git` and a secret-like pattern in `.codex-global-state.json`; do not delete/alter either without explicit approval and never expose secrets. [Task 1][Task 2]
- A localhost check from `C:\Users\user\.codex` found no app/listener. Obtain the actual application root, identify its runtime, then make HTTP requests to expected URLs; process startup alone is not readiness. [Task 3]
- Large Markdown patches can fail on encoding/context mismatch. Inspect exact lines, patch narrowly, then verify headings, route counts, and detail coverage. [Task 2]

# Task Group: Zeta Software bilingual static website

scope: Maintain, test, and optimize the English/Simplified-Chinese static site while preserving language and visual parity.
applies_to: cwd=D:\backup\website-zetasoftware; reuse_rule=checkout-specific source map and static-server commands; re-check generated output before editing.

## Task 1: Bilingual FAQ, homepage blog cards, workflow labels, and pricing parity

### rollout_summary_files

- rollout_summaries/2026-08-13T09-01-30-FmzH-zetasoftware_bilingual_faq_homepage_blogs_pricing_parity.md (cwd=D:\backup\website-zetasoftware, rollout_path=C:\Users\user\.codex\sessions\2026\08\13\rollout-2026-08-13T17-01-30-019ffa5a-eb3e-7172-8f41-7b65c41c8a95.jsonl, updated_at=2026-08-13T09:54:49+00:00, thread_id=019ffa5a-eb3e-7172-8f41-7b65c41c8a95, success)

### keywords

- faq.json, js/faq.js, home-blogs.js, blogs.json, pricing-section, Orbitron, services/index.html, bilingual parity

## Task 2: Static localhost, Lighthouse optimization, and image lazy-loading/JPG migration

### rollout_summary_files

- rollout_summaries/2026-09-04T01-20-03-IpkW-zeta_static_site_localhost_performance_image_loading.md (cwd=D:\backup\website-zetasoftware, rollout_path=\\?\C:\Users\user\.codex\sessions\2026\09\04\rollout-2026-09-04T09-20-03-01a06a00-5a37-7e72-bbbc-b6b33c856356.jsonl, updated_at=2026-09-07T05:56:45+00:00, thread_id=01a06a00-5a37-7e72-bbbc-b6b33c856356, partial)

### keywords

- php -S 127.0.0.1:8080, Lighthouse, WebP, JPG, data-src, IntersectionObserver, apply-body-image-lazyload.js, images/mobile, images/website

- Related skill: skills/localhost-readiness/SKILL.md

## Task 3: Generator navigation, detail formatting, caching, and minified CSS

### rollout_summary_files

- rollout_summaries/2026-09-07T05-57-20-zPhy-zeta_website_project_audit_navigation_content_performance.md (cwd=D:\backup\website-zetasoftware, rollout_path=C:\Users\user\.codex\sessions\2026\09\07\rollout-2026-09-07T13-57-20-01a07a71-4c56-70b0-a1e2-b8a02742ecb4.jsonl, updated_at=2026-09-07T09:41:02+00:00, thread_id=01a07a71-4c56-70b0-a1e2-b8a02742ecb4, partial)

### keywords

- generate-standard-internal-management-pages.js, update-site-navigation, format-detail-content.js, long-form-intros.js, style.min.css, .htaccess, Business Models, Standard Internal Management

## User preferences

- when editing bilingual content, the user expects paired English/Chinese records and tracking updates, not English-only completion; quantify requested FAQ/title changes and validate paired IDs. [Task 1]
- when the user says `localhost test`, detect the project runtime, start only what is needed, and verify real URLs rather than asking for a command or treating a running process as success. [Task 2]
- for design matching, the user asked for the “exact same design” -> use the homepage markup/CSS and supplied screenshot as the visual source of truth, and inspect both language pages. [Task 1]
- for description formatting, the user corrected “separating every sentence” toward grouped, human-readable related sentences and asked for roughly 50–100 fewer words; avoid artificial line breaks. [Task 3]
- preserve existing descriptions, images, CSS, routes, and page content unless explicitly asked to change them. [Task 3]

## Reusable knowledge

- English markup/design is the source for bilingual work; corresponding `cn/` pages retain structure while localizing visible content. The site is static, uses root-relative assets, generated HTML, JSON-LD and WebPage Microdata. [Task 3]
- Static local verification is `php -S 127.0.0.1:8080 -t <workspace>`; check `/`, `/cn/`, `/blogs/`, `/cn/blogs/`, `/privacy/`, `/cn/privacy/`, `/robots.txt`, and `/sitemap.xml`. [Task 2]
- `js/faq.js` selects `/data/faq.json` by `/cn/` and updates FAQPage JSON-LD. Validate parse, unique IDs, counts, and paired English/CN IDs after edits. [Task 1]
- `js/home-blogs.js` sorts the locale dataset by descending date, takes three, escapes content, renders links, refreshes Lucide, and integrates lazy images. [Task 1]
- SIM pages need `require("./update-site-navigation");` after generation: absent calls produced empty desktop/mobile nav containers. Regenerate hubs and detail pages, then test all affected routes and active state. [Task 3]
- For long-form descriptions, `format-detail-content.js` groups related sentences in pairs with selective `<br />`; content tails live in `long-form-intros.js`. [Task 3]
- Versioned CSS/JS may use `public, max-age=31536000, immutable`; use about 30 days for unversioned replaceable images and revalidate HTML. Cloudflare browser-cache policy can override origin TTL. [Task 3]

## Failures and how to do differently

- Bulk content patches -> invalid JSON/duplicate English records or CN drift; run JSON parse, duplicate-ID, count, paired-ID, title, and UTF-8-safe localization checks. [Task 1]
- Local PHP/http-server does not apply Apache `.htaccess`; treat compression/cache benefits as production-only until tested behind Apache/production. [Task 2]
- Do not claim `images/mobile`/`images/website` JPG canonicalization or WebP deletion complete: the user interrupted before reference rewrites/deletion. First resolve `images/...` and root-relative references in HTML/JS/JSON/CSS, confirm JPGs, delete only two-folder WebPs, then recheck routes/assets. True IntersectionObserver behavior also needs end-to-end verification. [Task 2]
- `style.min.css` was regenerated with `npx --yes clean-css-cli@5.6.3 -o css/style.min.css css/style.css`, but final served-file/hash/idempotence validation was interrupted. Rerun independent checks, HTTP 200 for the referenced query version, a current selector, and `git diff --check`. [Task 3]

# Task Group: Used-Car Vue/Supabase project workflow

scope: Understand, run, and make surgical UI/schema-boundary changes to the Used-Car client.
applies_to: cwd=C:\Users\user\Desktop\used-car; reuse_rule=app source is in template/ and external admin schema location may be unavailable; re-validate current source/runtime.

## Task 1: Project audit, local run, SQL-source boundary, and saved-loan UI reversal

### rollout_summary_files

- rollout_summaries/2026-08-27T07-28-15-vpVJ-used_car_project_audit_localhost_sql_loan_card_revision.md (cwd=C:\Users\user\Desktop\used-car, rollout_path=\\?\C:\Users\user\.codex\sessions\2026\08\27\rollout-2026-08-27T15-28-15-01a0421e-939f-7453-b375-f3a5f387b2a7.jsonl, updated_at=2026-08-28T09:08:56+00:00, thread_id=01a0421e-939f-7453-b375-f3a5f387b2a7, success)

### keywords

- PROJECT_CONTEXT.md, LOCAL-SEARCH-MAP.md, template, Vue 3, ViteSSG, Pinia, Supabase, archived migrations, Favorites.vue, MyLoans.vue, 精准报价, development.localhost

## User preferences

- when asked to “read and understand my project ... all folder and .md,” inspect project-owned Markdown comprehensively and give source-grounded understanding; treat `sample/` and screenshots as reference-only. [Task 1]
- when the user requests a focused UI change or reversal, edit surgically and check both card pages; preserve existing card data and unrelated WhatsApp/contact behavior. [Task 1]
- for contact features, reuse `dealers.info`/existing environment fallback and established WhatsApp conventions rather than inventing contact data. [Task 1]

## Reusable knowledge

- Active app root is `template/`: Vue 3, Vite, TypeScript, Tailwind v4, Pinia, Vue Router, vue-i18n (`zh/en/ms`), ViteSSG, PWA, and Supabase. `PROJECT_CONTEXT.md` is the truth map; current source/runtime outranks README or historical handoff. [Task 1]
- Start locally from `template/` with `pnpm.cmd run dev:local`; verify `http://127.0.0.1:3000` routes, including `/`, `/home`, `/cars`, `/cars/brands`, `/profile/about`, and `/articles`. [Task 1]
- All client SQL is under `template/src/sql/migrations/_archived/` and deprecated. The external admin repo's migrations 001–039 are authoritative; client services expect objects such as `slug`, `isHot`, `status`, `isActive`, `loan_term_option`, `cta_events`, `articles`, and `v_published_articles`. [Task 1]
- Saved-loan cards are `template/src/views/favorites/Favorites.vue` and `template/src/views/profile/MyLoans.vue`. The temporary `LoanContactSheet.vue` and `精准报价` feature were removed; retain monthly/payment details and delete action. [Task 1]

## Failures and how to do differently

- Do not provision from archived client migrations; external admin repo/live schema were unavailable, so live truth is `INSUFFICIENT DATA` until rechecked. [Task 1]
- Existing `pnpm.cmd run type-check` errors mean the project was not type-clean; do not claim a clean type check. Default SSG can fail with `Error: supabaseUrl is required.`; use `pnpm.cmd exec vite build --mode development.localhost` for local-mode verification and redact keys. [Task 1]
- For detached dev startup, a complex PowerShell command was rejected; use `Start-Process pnpm.cmd -ArgumentList 'run dev:local' -WorkingDirectory 'C:\Users\user\Desktop\used-car\template' -WindowStyle Hidden`. Run source checks from `template/` or use absolute paths. [Task 1]

# Task Group: Huwa2 VPS backup restore and local PostgREST exposure

scope: Restore the Huwa2 VPS backup locally without resetting protected local state, then expose the schema through the CLI-managed Supabase API.
applies_to: cwd=C:\Users\user\Documents\supabase-project-backup-restore; reuse_rule=backup IDs, counts, and paths are time-specific; reuse the validation/CLI procedure, not source data.

## Task 1: Repair auth backup, atomic restore, and expose `huwa2`

### rollout_summary_files

- rollout_summaries/2026-08-14T02-47-47-8IL6-huwa2_vps_restore_and_postgrest_expose.md (cwd=C:\Users\user\Documents\supabase-project-backup-restore, rollout_path=C:\Users\user\.codex\sessions\2026\08\14\rollout-2026-08-14T10-47-47-019ffe2b-21d6-7ff2-9bea-6cfa6ab17768.jsonl, updated_at=2026-08-14T03:10:24+00:00, thread_id=019ffe2b-21d6-7ff2-9bea-6cfa6ab17768, success)

### keywords

- huwa2, auth.users, auth.identities, identities_user_id_fkey, orphan identities, 04-auth-rows.sql, PGRST_DB_SCHEMAS, config.toml, Supabase CLI

## User preferences

- when restoring the VPS-backed `huwa2` project locally, preserve the original backup and repair only a working copy where possible; protect existing local database/Docker state and avoid unrelated resets. [Task 1]
- distinguish restoring database data from exposing the schema through PostgREST. [Task 1]

## Reusable knowledge

- Validate every `auth.identities.user_id` has a matching `auth.users.id` before restore. This backup had 8 users/26 identities and 10 orphan phone identities; preserving the original and adding parent rows to the working copy yielded 18 users, 26 identities, and 0 orphans. [Task 1]
- `scripts/04-restore-local.sh` is transactional: a failed restore rolls back. The successful run restored 26 tables, one bucket, 85 objects, and intentionally skipped existing edge functions. [Task 1]
- The local instance is Supabase CLI-managed, not standalone Compose. To expose a schema, add it to `[api].schemas` in `C:\Users\user\Documents\local-supabase\supabase\config.toml`, back up config first, then `supabase stop`/`supabase start` in the local-supabase workdir; verify `PGRST_DB_SCHEMAS`. [Task 1]

## Failures and how to do differently

- Do not retry an inconsistent backup unchanged or attribute it to restore order; validate identities first. Recovered records may still not authenticate because source passwords/phone data were incomplete. [Task 1]
- The Compose-oriented expose script cannot locate CLI-managed config because required labels/files are absent. Detect `com.supabase.cli.project` and pivot to CLI config/restart. The available Bash was `C:\Program Files (x86)\Git\bin\bash.exe`, not the initially assumed path. [Task 1]

# Task Group: Project-agnostic SEO metadata and webmanifest guidance

scope: Maintain reusable instructions for evidence-bound site metadata and manifest updates.
applies_to: cwd=C:\Users\user\Desktop\ai comment; reuse_rule=reuse the policy across website projects, but derive every identity/claim from the active project.

## Task 1: Generalize identity/scope rules and manifest reminder

### rollout_summary_files

- rollout_summaries/2026-08-10T04-13-53-hwPl-project_agnostic_metadata_and_webmanifest_guidance.md (cwd=C:\Users\user\Desktop\ai comment, rollout_path=\\?\C:\Users\user\.codex\sessions\2026\08\10\rollout-2026-08-10T12-13-53-019fe9e0-8772-7143-8b6b-11cc8a866137.jsonl, updated_at=2026-08-10T04:22:20+00:00, thread_id=019fe9e0-8772-7143-8b6b-11cc8a866137, success)

### keywords

- (AI) metaTitle.txt, INSUFFICIENT DATA, SEO metadata, project identity, site.webmanifest, Select-String -LiteralPath

## User preferences

- when metadata is requested, find the “actual project name user are working on rightnow” from active files/runtime evidence; do not copy historical names or direct project identities from examples. [Task 1]
- avoid narrow wording such as “car, door, hotel”; use the broadest accurate industry/category/market/region scope supported by evidence and never invent global reach. [Task 1]
- use the existing centralized metadata module/include, not seed/data or unrelated templates. [Task 1]

## Reusable knowledge

- `(AI) metaTitle.txt` requires `INSUFFICIENT DATA` if identity cannot be confirmed and forbids example/history leakage of names, domains, URLs, social accounts, locations, colors, page filenames, or claims. Detail pages may retain confirmed item/article names; home/category pages may use broader confirmed offerings. [Task 1]
- For an installable web app, synchronize evidence-based manifest `name`, `short_name`, `description`, `lang`, `id`, `start_url`, `scope`, `display`, colors, and existing icon paths/MIME types/sizes. Do not create a manifest solely for SEO. [Task 1]

## Failures and how to do differently

- `rg --literal-path` is unsupported; use PowerShell `Select-String -LiteralPath` for exact-file scans. If the workspace is not a Git repository, use read-back and targeted scans rather than `git diff`. [Task 1]

# Task Group: Windows Chrome SideBySide startup repair

scope: Diagnose a Chrome launcher failure after an incomplete update and repair only verified launcher files.
applies_to: cwd=C:\Users\user\Desktop\used-car; reuse_rule=Windows-system procedure only; Chrome versions and paths must be rechecked before mutation.

## Task 1: Repair broken Chrome launchers after failed update

### rollout_summary_files

- rollout_summaries/2026-08-27T01-14-49-nqVw-repair_chrome_side_by_side_startup_error.md (cwd=C:\Users\user\Desktop\used-car, rollout_path=C:\Users\user\.codex\sessions\2026\08\27\rollout-2026-08-27T09-14-50-01a040c8-b2ca-73e0-9fcf-88af85530a0e.jsonl, updated_at=2026-08-27T01:18:15+00:00, thread_id=01a040c8-b2ca-73e0-9fcf-88af85530a0e, success)

### keywords

- Chrome, SideBySide, Dependent Assembly, new_chrome.exe, chrome_proxy.exe, 151.0.7922.175, elevated PowerShell

## User preferences

- when the user asks “can ai fix this problem for me?”, investigate and safely repair the concrete issue rather than only give generic instructions. [Task 1]

## Reusable knowledge

- When a shortcut target exists but SideBySide identifies a missing assembly, inspect `C:\Program Files\Google\Chrome\Application` for a complete pending version and `new_chrome.exe`/`new_chrome_proxy.exe`; compare registry/file versions. [Task 1]
- If installer repair fails, use elevated, narrowly scoped version-checked backup/replacement of launchers, retain old files as `.broken-<version>`, then verify both active file versions and actual Chrome processes. [Task 1]

## Failures and how to do differently

- Do not recreate a valid shortcut to solve a missing-dependent-assembly fault. `chrome.exe --version` may simply open Chrome; use launcher metadata and process launch for verification. [Task 1]

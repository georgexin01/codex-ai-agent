# Task Group: HNP Homestay localhost, MySQL, and EN/CN route-based i18n

scope: Configure and diagnose the PHP/MySQL public site on localhost:8080, including server-side `/cn/...` localization without changing the existing database schema/data.
applies_to: cwd=C:\xampp\htdocs; reuse_rule=checkout-specific; inspect the current PHP/Composer/database runtime before reusing ports, routes, or configuration facts.

## Task 1: Configure localhost:8080 and verify the existing MySQL-backed site

### rollout_summary_files

- rollout_summaries/2026-07-22T06-21-13-XZxW-hnp_homestay_localhost_i18n_routing_debug.md (cwd=\\?\C:\xampp\htdocs, rollout_path=C:\Users\user\.codex\sessions\2026\07\22\rollout-2026-07-22T14-21-22-019f887c-460e-7992-bd16-abac9f629694.jsonl, updated_at=2026-07-22T07:38:05+00:00, thread_id=019f887c-460e-7992-bd16-abac9f629694, localhost/database setup verified)

### keywords

- localhost:8080, php -S 127.0.0.1:8080 index.php, phpMyAdmin, MySQL 3306, airbnb.com_db, mysqli, CORS, api/Website/Config.php, router.php, /properties 404

## Task 2: Add English/Chinese `/cn/...` routing while keeping footer legal text English

### rollout_summary_files

- rollout_summaries/2026-07-22T06-21-13-XZxW-hnp_homestay_localhost_i18n_routing_debug.md (cwd=\\?\C:\xampp\htdocs, rollout_path=C:\Users\user\.codex\sessions\2026\07\22\rollout-2026-07-22T14-21-22-019f887c-460e-7992-bd16-abac9f629694.jsonl, updated_at=2026-07-22T07:38:05+00:00, thread_id=019f887c-460e-7992-bd16-abac9f629694, partial: static/helper validation passed; live database runtime remained HTTP 500)

### keywords

- i18n/en.json, i18n/cn.json, /cn, zh-CN, siteLanguage, sitePath, localizedPath, isCurrentPath, t, Composer autoload.files, Cannot redeclare Website\\siteLanguage(), HTTP 500, template/lib/footer.php

## User preferences

- When serving HNP Homestay locally, the user wanted `http://localhost:8080` while continuing to read the existing MySQL database -> preserve DB schema/data and make only routing/runtime changes unless explicitly asked otherwise. [Task 1]
- For language switching, the user expected navigation/content URLs to switch too, not merely a client-side label toggle -> use route-prefixed URLs and server-side locale loading. [Task 2]
- The user explicitly said footer copyright/provider text must not change with language -> keep `© 2026 HNP Homestay. All rights reserved.` and `Provided by Zeta Capital Sdn. Bhd.` in English on both locales. [Task 2]

## Reusable knowledge

- The known server command is `php -S 127.0.0.1:8080 index.php` from `C:\xampp\htdocs`; root `index.php` is the entrypoint and root `router.php` implements routing. phpMyAdmin is only the management UI; the website reads MySQL directly. [Task 1]
- At rollout time `api/Website/Config.php` used `airbnb.com_db` on `localhost` with `mysqli`, MySQL listened on 3306, and `http://localhost:8080` was added to the development CORS allow-list. [Task 1]
- Locale catalogs are `i18n/en.json` and `i18n/cn.json`; `api/Website/Helper.php` supplies `siteLanguage()`, `sitePath()`, `localizedPath()`, `isCurrentPath()`, and `t()`. `index.php` strips `/cn` before existing matching and sets `zh-CN`; property-detail WhatsApp links must preserve the active locale prefix. [Task 2]
- Verification that passed: changed-PHP lint, locale JSON parsing, CSS asset HTTP 200, and helper mapping `/about` + `About` / `/cn/about` + `关于我们`. Browser-level parity was not verified. [Task 2]

## Failures and how to do differently

- A healthy `/` is insufficient: `/properties` had an existing 404, and after bilingual changes English and `/cn/...` live pages returned HTTP 500 from the database/application runtime. Diagnose the runtime layer before reporting live i18n complete. [Task 1][Task 2]
- `Cannot redeclare Website\siteLanguage()` means `Helper.php` was loaded both directly by `index.php` and through Composer `autoload.files`; remove the direct helper include and load Composer autoload once. [Task 2]
- PowerShell/PHP one-liners repeatedly hit quoting/escaping errors; use a PowerShell here-string or a standalone validation script. [Task 2]

# Task Group: .codex reusable meta-content workflow skill routing

scope: Route evidence-based public website/app metadata work after `.codex` boot, including continuation tracking and the boundary between reusable workflow and project-specific facts.
applies_to: cwd=C:\Users\user\.codex; reuse_rule=reuse the workflow/triggers across projects, but inspect each project's real routes/content and never transfer example brands, locations, or claims.

## Task 1: Create and route the triggerable meta-content workflow

### rollout_summary_files

- rollout_summaries/2026-07-22T02-31-42-4A6x-meta_content_workflow_skill_routing.md (cwd=\\?\C:\Users\user\.codex, rollout_path=C:\Users\user\.codex\sessions\2026\07\22\rollout-2026-07-22T10-31-46-019f87aa-2319-7471-ab82-ee9cbf2f6f95.jsonl, updated_at=2026-07-22T02:42:41+00:00, thread_id=019f87aa-2319-7471-ab82-ee9cbf2f6f95, partial: routing audit passed; validator environment blocker remains)

### keywords

- metaTitle, meta title, meta content, SEO metadata, metaTitle update, SEO meta audit, meta-content-workflow, seo-ai-search, skill_path_router, Update-CodexRouting.ps1, Audit-CodexRouting.ps1, Validate-CodexKnowledge.ps1, ModuleNotFoundError: No module named 'yaml', nested-memories-git, meta.md

## User preferences

- When the same workflow is pasted “in next project,” the user expects `.codex` knowledge and skills to cooperate -> inspect that project's real routes/content; KingsGuard/VIP Billion/Johor Bahru examples are not portable facts. [Task 1]
- The user explicitly limited this workflow to “website or app only, not admin panel” -> exclude admin-panel-only metadata unless explicitly included. [Task 1]
- The user requested a project-root `meta.md` to remember incomplete work -> create/update a continuation checklist when metadata work spans chats. [Task 1]

## Reusable knowledge

- `skills/meta-content-workflow/SKILL.md` covers route inventory, evidence-based optional `A | B | C` titles, unique descriptions/alt text, canonical/robots/sitemap, OG/Twitter, JSON-LD/itemprop, favicon/manifest checks, continuation tracking, and verification. Pair it with `skills/seo-ai-search/SKILL.md` when public search behavior is in scope. [Task 1]
- Trigger mapping exists for `metaTitle`, `meta title`, `meta content`, `SEO metadata`, `metaTitle update`, and `SEO meta audit` in `memories/2_governance/artifacts/skill_path_router.md`. `Update-CodexRouting.ps1 -Quiet` and `Audit-CodexRouting.ps1` completed with zero missing targets and conflicts. [Task 1]
- Treat the pasted workflow as a contract, not a source of business/social/verification facts; report ranking, indexing, and AI citation as unguaranteed. [Task 1]

## Failures and how to do differently

- `generate_openai_yaml.py` and `quick_validate.py` failed with `ModuleNotFoundError: No module named 'yaml'`; a manual `agents/openai.yaml` was added/read back, but do not claim those validators passed without the dependency. [Task 1]
- `Validate-CodexKnowledge.ps1` failed because of pre-existing `C:\Users\user\.codex\memories\.git`; preserve/alter that Git state only with explicit authorization. [Task 1]

# Task Group: VIPBillion public metadata titles and Malaysia service-area wording

scope: Public website metadata for VIPBillion, including concise intent-first titles, record-aware detail pages, and truthful broad-versus-local location wording.
applies_to: cwd=C:\Users\user\Desktop\VIPBillion\website-vipbillion; reuse_rule=checkout-specific; use only after inspecting the live public route/catalog and do not transfer its company, titles, or location wording to another project.

## Task 1: Route VIPBillion metaTitle and SEO metadata work to the public-site workflow

### rollout_summary_files

- rollout_summaries/2026-07-10T01-12-48-4n5P-codex_boot_first_runs_always_wake_five_lanes.md (cwd=\\?\C:\Users\user\Desktop\VIPBillion, rollout_path=C:\Users\user\.codex\sessions\2026\07\10\rollout-2026-07-10T09-12-53-019f4995-980b-7151-9d07-6099590444f5.jsonl, updated_at=2026-07-10T01:38:44+00:00, thread_id=019f4995-980b-7151-9d07-6099590444f5, supporting VIPBillion routing context; title/location contract is from the 2026-07-22 ad-hoc note)

### keywords

- metaTitle, meta title, meta content, SEO metadata, website-vipbillion, lib/metaData.php, VIP BILLION MILESTONE TRAVEL & TOURS SDN BHD, Malaysia, KLIA to Kuala Lumpur, Selangor & Klang, meta-content-workflow

## User preferences

- For VIPBillion public pages, prefer concise `A | C` titles: intent/service first, then `VIP BILLION MILESTONE TRAVEL & TOURS SDN BHD`; use `Premium Transport & Tourism Malaysia | VIP BILLION MILESTONE TRAVEL & TOURS SDN BHD` for the homepage and `Transport Service Pricing Malaysia | VIP BILLION MILESTONE TRAVEL & TOURS SDN BHD` for pricing. [Task 1] [ad-hoc note]
- Keep service-detail and news-detail titles record-specific; apply smooth premium descriptors only where natural, and do not edit Supabase records merely to improve page-side SEO wording because customers may edit those records. [Task 1] [ad-hoc note]
- Use Malaysia for broad service-area metadata; do not insert KL, Kuala Lumpur, Selangor, Johor Bahru, or another state unless the page is intentionally local or the user requests it. Keep `Kuala Lumpur, Malaysia` as the business-address/contact value. [Task 1] [ad-hoc note]

## Reusable knowledge

- Route `metaTitle`, `meta title`, `meta content`, and `SEO metadata` to `C:\Users\user\.codex\skills\meta-content-workflow\SKILL.md`; add `skills/seo-ai-search/SKILL.md` when public search behavior is in scope. The current project note requires real-route/content inspection, separate public work from admin panels, and a project-root `meta.md` only when continuation is needed. [Task 1] [ad-hoc note]
- Keep standalone header-linked pages unique and intent-first. Before finalizing a title, read its complete rendered wording; fluent premium language wins over mechanical keyword repetition. Avoid unnatural labels such as `City-to-City`. [Task 1] [ad-hoc note]
- For the route record `KLIA to KL / Selangor / Klang`, the page-side metadata title may be `KLIA to Kuala Lumpur, Selangor & Klang Premium Airport Transfer`; preserve similarly truthful route/service content when it is visibly local. Verify by reading the centralized `website-vipbillion/lib/metaData.php` catalog and rendered public HTML. [Task 1] [ad-hoc note]

## Failures and how to do differently

- Do not replace real service/article titles with a generic standalone-page pattern or force a descriptor that creates awkward repetition. Keep strong news-detail titles unchanged. [Task 1] [ad-hoc note]
- Do not treat VIPBillion examples as portable SEO facts: use the `A | B | C` pattern only when natural and evidence-supported, and never invent social URLs, handles, contact details, reviews, ratings, verification tokens, or production domains. [Task 1] [ad-hoc note]

# Task Group: .codex knowledge maintenance, routing, and Git health

scope: Safe, route-first maintenance of C:\Users\user\.codex, including compression, cleanup, router validation, GitNexus, and nested-Git diagnosis.
applies_to: cwd=C:\Users\user\.codex; reuse_rule=use commands and historical counts as a proven baseline, but inspect current files/state before deletion, indexing, or claiming the same counts.

## Task 1: Lossless memory compression, Luna governance, and full route/Git health verification

### rollout_summary_files

- rollout_summaries/2026-07-17T01-54-29-PZNu-codex_knowledge_routing_compression_git_health.md (cwd=\\?\C:\Users\user\.codex, rollout_path=C:\Users\user\.codex\sessions\2026\07\17\rollout-2026-07-17T09-54-34-019f6dc8-45a2-77e2-a162-4d60741d8788.jsonl, updated_at=2026-07-17T07:52:38+00:00, thread_id=019f6dc8-45a2-77e2-a162-4d60741d8788, success)

### keywords

- 00_PULSE.md, MEMORY.md, MEMORY_DETAILS.md, KnowledgeHealthReport.ps1, Validate-CodexKnowledge.ps1, Audit-CodexRouting.ps1, GitNexus, nested-memories-git, gitlink, 160000, Luna 5.6

## Task 2: GitNexus, cleanup, ignore synchronization, and route repair

### rollout_summary_files

- rollout_summaries/2026-07-10T06-23-45-F6PQ-codex_deep_maintenance_gitnexus_cleanup_ignore_routing.md (cwd=\\?\C:\Users\user\.codex, rollout_path=C:\Users\user\.codex\sessions\2026\07\10\rollout-2026-07-10T14-23-55-019f4ab2-470b-7d50-ac3a-d49e0258707e.jsonl, updated_at=2026-07-10T07:12:49+00:00, thread_id=019f4ab2-470b-7d50-ac3a-d49e0258707e, success)
- rollout_summaries/2026-07-03T02-34-59-1Seq-codex_cleanup_sandbox_and_rollout_summary_audit.md (cwd=\\?\C:\Users\user\.codex, rollout_path=C:\Users\user\.codex\sessions\2026\07\03\rollout-2026-07-03T10-35-04-019f25d4-5324-7482-af99-a9473dada5ae.jsonl, updated_at=2026-07-03T10:13:39+00:00, thread_id=019f25d4-5324-7482-af99-a9473dada5ae, success)

### keywords

- npx.cmd gitnexus analyze, git check-ignore, Update-CodexRouting.ps1 -Quiet, Audit-CodexRouting.ps1, Test-CodexPerfBenchmark.ps1, .codexignore, .claudeignore, .gitnexus, .sandbox

## Task 3: Repair accidental nested memories/.git

### rollout_summary_files

- rollout_summaries/2026-07-10T07-21-44-KiJe-codex_memories_nested_git_fix.md (cwd=\\?\C:\Users\user\.codex, rollout_path=C:\Users\user\.codex\sessions\2026\07\10\rollout-2026-07-10T15-21-49-019f4ae7-5d93-7650-89ad-42f1ee7502ac.jsonl, updated_at=2026-07-10T07:24:23+00:00, thread_id=019f4ae7-5d93-7650-89ad-42f1ee7502ac, success)

### keywords

- memories/.git, m memories, 160000, git ls-tree HEAD memories, git rm --cached -r -- memories, git add -- memories, .gitmodules

## Task 4: Recheck nested Git after a later knowledge-validation failure

### rollout_summary_files

- rollout_summaries/2026-07-22T02-31-42-4A6x-meta_content_workflow_skill_routing.md (cwd=\\?\C:\Users\user\.codex, rollout_path=C:\Users\user\.codex\sessions\2026\07\22\rollout-2026-07-22T10-31-46-019f87aa-2319-7471-ab82-ee9cbf2f6f95.jsonl, updated_at=2026-07-22T02:42:41+00:00, thread_id=019f87aa-2319-7471-ab82-ee9cbf2f6f95, validator reported `nested-memories-git`; time-sensitive conflict with the earlier repair)

### keywords

- Validate-CodexKnowledge.ps1, nested-memories-git, memories/.git, gitlink, 160000, pre-existing nested Git metadata

## User preferences

- When maintaining `.codex`, the user asked to “preserve the original goal,” keep old content, make it suitable for “5.6 luna,” and “do not modify any skills .md” -> use lossless hot-index/cold-details separation and exclude skill Markdown unless explicitly authorized. [Task 1]
- When requesting cleanup, the user asked for “step by step” work and safe removal -> classify active versus stale content, repair routes, then report measured verification rather than bulk-delete by age or size. [Task 2]
- Important Markdown should not be changed or removed without exact user authorization; prefer additive routing or tiny patches. [ad-hoc note]

## Reusable knowledge

- The historical full memory was preserved in `MEMORY_DETAILS.md`; current `MEMORY.md` is the hot retrieval surface. Treat the details file as cold-routed, not routine prompt input. [Task 1]
- Use `codex-router/KnowledgeHealthReport.ps1 -Json` for combined health checks. Before moving/removing routed Markdown: search references, patch routes, run `Update-CodexRouting.ps1 -Quiet`, then `Audit-CodexRouting.ps1` and validation. [Task 1][Task 2]
- GitNexus must be explicitly authorized; after `npx.cmd gitnexus analyze`, recheck status and generated-file diffs. The known template scope-extraction warning is non-fatal unless it impacts routing. [Task 1][Task 2]
- Nested Git diagnosis: check `Test-Path memories/.git`, `git ls-files -s -- memories` for mode `160000`, and `git rev-parse --show-toplevel`. `m memories` plus `160000` means a gitlink, not normal content. [Task 1][Task 3]

## Failures and how to do differently

- Stale GitNexus status is not permission to auto-index; obtain authorization, run the analysis, then verify outputs. [Task 1]
- The 2026-07-10 repair was reported successful, but `Validate-CodexKnowledge.ps1` on 2026-07-22 again reported `C:\Users\user\.codex\memories\.git`; treat the state as time-sensitive and recheck filesystem plus Git index before claiming it is fixed or changing it. [Task 3][Task 4]
- If `git add` does not expand `memories/`, remove the cached gitlink with `git rm --cached -r -- memories`, re-add it, and verify both Git state and absence of nested `.git`; preserve prior nested metadata externally if its history may matter. [Task 3]
- Do not infer active-route failure from generated or historical references; audit active routing separately. PowerShell JSON parsing can false-positive in runtime/cache paths—confirm questionable JSON with Node. [Task 1][Task 2]

# Task Group: .codex boot routing and self-describing knowledge

scope: Strict `ai read .codex knowledge` behavior, narrow awake-skill routing, boot bundles, and hybrid YAML documentation routing.
applies_to: cwd=C:\Users\user\.codex and callers from project workspaces; reuse_rule=read the current 00_PULSE.md as authority because boot rules may change.

## Task 1: Boot sentinel and always-wake five-lane bundle

### rollout_summary_files

- rollout_summaries/2026-07-10T01-12-48-4n5P-codex_boot_first_runs_always_wake_five_lanes.md (cwd=\\?\C:\Users\user\Desktop\VIPBillion, rollout_path=C:\Users\user\.codex\sessions\2026\07\10\rollout-2026-07-10T09-12-53-019f4995-980b-7151-9d07-6099590444f5.jsonl, updated_at=2026-07-10T01:38:44+00:00, thread_id=019f4995-980b-7151-9d07-6099590444f5, success)
- rollout_summaries/2026-07-08T04-32-07-uUUL-codex_boot_read_pulse_sentinel.md (cwd=\\?\C:\Users\user\Desktop\VIPBillion, rollout_path=C:\Users\user\.codex\sessions\2026\07\08\rollout-2026-07-08T12-32-12-019f3fff-5d23-7c01-9347-1d7d4523048f.jsonl, updated_at=2026-07-08T04:32:42+00:00, thread_id=019f3fff-5d23-7c01-9347-1d7d4523048f, success)

### keywords

- ai read .codex knowledge, 00_PULSE.md, Agent is Ready.., Boot First-Runs, ai project truth doc, ai semantic skill router, ai current lane memory, ai hot cold gate

## Task 2: Hybrid YAML routers and Vben route graph retrofit

### rollout_summary_files

- rollout_summaries/2026-07-01T10-03-57-RcB5-codex_hybrid_metadata_router_vben_priority_retrofit.md (cwd=\\?\C:\Users\user\.codex, rollout_path=C:\Users\user\.codex\sessions\2026\07\01\rollout-2026-07-01T18-04-02-019f1d22-a3ef-7710-830f-87fa8a26a443.jsonl, updated_at=2026-07-01T11:08:01+00:00, thread_id=019f1d22-a3ef-7710-830f-87fa8a26a443, partial)
- rollout_summaries/2026-07-07T06-37-54-1jsr-codex_boot_memory_routing_cleanup_and_protection.md (cwd=\\?\C:\Users\user\.codex, rollout_path=C:\Users\user\.codex\sessions\2026\07\07\rollout-2026-07-07T14-37-59-019f3b4c-2967-7d91-89d5-2e3eded86ef7.jsonl, updated_at=2026-07-07T09:52:15+00:00, thread_id=019f3b4c-2967-7d91-89d5-2e3eded86ef7, success)

### keywords

- hybrid frontmatter, skill_path_router.md, YAML, create-module, generate-views, generate-store, analyze-schema, cold storage promotion policy, awake-skill-routing

## User preferences

- Exact `ai read .codex knowledge` is a table-free boot trigger: read PULSE once and return only the ready sentinel; keep relevant route/skill context awake afterward. [Task 1]
- The user asked to “always wake these 5 immediately after the boot sentinel” so boot should prioritize project truth, exact skill router, current memory, validation, and hot/cold promotion. [Task 1]
- For AI-facing Markdown, the user asked for hybrid YAML at the top with names, titles, options, paths, and functions, and wanted the priority raised so agents understand it faster. [Task 2]

## Reusable knowledge

- PULSE is the authoritative boot file; hydrate once per chat and do not repeatedly fan out the full tree. Keep only the matching skill family awake; re-check the awake set when a new request changes focus. [Task 1][Task 2] [ad-hoc note]
- Canonical hybrid frontmatter includes `name`, `title`, `description`, `aliases`, `triggers`, `priority`, `contains`, `related_skills`, `related_docs`, `use_when`, `do_not_use_when`, and `verification`. [Task 2]
- After major `.codex` maintenance, a fresh chat plus one `ai read .codex knowledge` boot is the established hydration ritual. [Task 1]

## Failures and how to do differently

- Do not answer the boot trigger with explanation or a summary. Patch PULSE only after re-reading the exact surrounding lines; spacing/line-wrap assumptions caused earlier patch failures. [Task 1]
- Promote short, unique, reusable rules; leave broad protocol bundles cold unless a task needs them. [Task 2]

# Task Group: trash-container-app localhost, Cyroro schema, and Supabase connectivity

scope: Start/verify the paired Vue/Vben apps, distinguish schema from endpoint selection, and reason safely about local Docker Supabase access.
applies_to: cwd=C:\Users\user\Desktop\trash-container-app; reuse_rule=ports/commands are current-workspace defaults—inspect package scripts and listeners before starting processes or changing env.

## Task 1: Localhost readiness across admin-panel-trash, web-admin-app, and web-driver-app

### rollout_summary_files

- rollout_summaries/2026-07-17T01-53-56-GETJ-trash_container_localhost_schema_and_supabase_connectivity.md (cwd=\\?\C:\Users\user\Desktop\trash-container-app, rollout_path=C:\Users\user\.codex\sessions\2026\07\17\rollout-2026-07-17T09-54-00-019f6dc7-c3ea-7ef2-8af9-86bc462f2fbf.jsonl, updated_at=2026-07-17T09:06:43+00:00, thread_id=019f6dc7-c3ea-7ef2-8af9-86bc462f2fbf, success)
- rollout_summaries/2026-07-15T01-26-23-lv7P-codex_boot_read_and_localhost_test_verified_three_apps.md (cwd=\\?\C:\Users\user\Desktop\trash-container-app, rollout_path=C:\Users\user\.codex\sessions\2026\07\15\rollout-2026-07-15T09-26-27-019f6361-d5ad-7da2-a6b1-ef6d37cabda9.jsonl, updated_at=2026-07-15T01:29:03+00:00, thread_id=019f6361-d5ad-7da2-a6b1-ef6d37cabda9, success)

### keywords

- localhost test, admin-panel-trash, pnpm.cmd run dev:local, web-admin-app, web-driver-app, npm.cmd run dev, 6006, 5173, 3000, HTTP 200

## Task 2: Cyroro environment selection and copied-project Supabase access

### rollout_summary_files

- rollout_summaries/2026-07-17T01-53-56-GETJ-trash_container_localhost_schema_and_supabase_connectivity.md (cwd=\\?\C:\Users\user\Desktop\trash-container-app, rollout_path=C:\Users\user\.codex\sessions\2026\07\17\rollout-2026-07-17T09-54-00-019f6dc7-c3ea-7ef2-8af9-86bc462f2fbf.jsonl, updated_at=2026-07-17T09:06:43+00:00, thread_id=019f6dc7-c3ea-7ef2-8af9-86bc462f2fbf, success)

### keywords

- VITE_SUPABASE_SCHEMA=cyroro, VITE_SUPABASE_URL, dev:vps, development.supabase, npm run build, localhost:54321, Docker, RLS, service_role

## User preferences

- When the user says exactly `localhost test`, stay in read/start/verify mode, reuse healthy listeners, avoid app patches, and report each raw URL with its HTTP status. [Task 1]
- For paired-app Pinia work, preserve exact `PiniaStore -> Function -> Input` names; read the live `Trash -> Pinia` sheet first and keep intentional spellings such as `getAllBinWIthOrder`. [ad-hoc note]
- Keep app implementation scope to the affected route/store/util/type/caller set; avoid unrelated refactors. [ad-hoc note]

## Reusable knowledge

- Runnable defaults: `admin-panel-trash` uses `pnpm.cmd run dev:local` on 6006; `web-admin-app` uses `npm.cmd run dev` on 5173; `web-driver-app` uses `npm.cmd run dev` on 3000. Process spawn is not success—poll each raw URL for HTTP 200. [Task 1]
- `VITE_SUPABASE_SCHEMA=cyroro` chooses a schema but does not prove VPS access. Build only compiles; runtime connects using bundled URL values. VPS access needs an actual reachable VPS API URL. [Task 2]
- `localhost` is relative to the browser/client machine. A clone on another computer points to its own localhost; `.env`/`.env.*` are ignored and clients remain subject to RLS/auth. Never expose service-role credentials. [Task 2]
- Related skills: `skills/localhost-test/SKILL.md`; `skills/pinia-contract-workflow/SKILL.md`.

## Failures and how to do differently

- Vben readiness can lag: an initial “Unable to connect to the remote server” after process start needs one extra listener/HTTP pass, not an immediate failure report. [Task 1]
- Avoid PowerShell `?:` syntax and complex mismatched braces when compatibility is uncertain; rerun simpler PowerShell commands. [Task 2]

# Task Group: VIPBillion Vben module reuse and FIUU payment routing

scope: Clone-first admin CRUD, soft-delete-safe booking flows, table/drawer presentation, ordering, and website FIUU mapping.
applies_to: cwd=C:\Users\user\Desktop\VIPBillion; reuse_rule=ad-hoc project notes are guidance only—inspect the live module, API, and payment configuration before changes.

## Task 1: Booking/driver admin module conventions and FIUU mapping

### rollout_summary_files

- rollout_summaries/2026-07-10T01-12-48-4n5P-codex_boot_first_runs_always_wake_five_lanes.md (cwd=\\?\C:\Users\user\Desktop\VIPBillion, rollout_path=C:\Users\user\.codex\sessions\2026\07\10\rollout-2026-07-10T09-12-53-019f4995-980b-7151-9d07-6099590444f5.jsonl, updated_at=2026-07-10T01:38:44+00:00, thread_id=019f4995-980b-7151-9d07-6099590444f5, supporting routing context)

### keywords

- admin-vipbillion, Booking Management, clone-first, deleted_at, isDelete, checkSlugExists, Vben table, drawer scroll, FIUU, htdocs_wiper, returnipn.php

## User preferences

- When the user says “copy and paste,” “duplicate,” or “same modules,” duplicate the whole module first, then change only the requested interior content. [ad-hoc note]
- When asking for options or rankings, lead with the recommended answer first, then short numbered options. [ad-hoc note]

## Reusable knowledge

- Preserve soft-delete semantics in reused CRUD: treat `deleted_at`/`isDelete` and slug uniqueness as live contract behavior, not cosmetic implementation detail. [ad-hoc note]
- Default admin sort-field steps are 1000, 2000, 3000… unless the user specifies otherwise. [ad-hoc note]
- For FIUU, inspect `htdocs_wiper`, booking payload mapping, callback/notification handling, and merchant configuration together; do not put payment secrets in memory or responses. [ad-hoc note]

## Failures and how to do differently

- Do not recreate a requested matching module from scratch: it risks layout/scroll/action drift. Clone the shell, reset drawers to top if needed, and only then swap content. [ad-hoc note]

# Task Group: Angel Interior local Supabase, admin RPC, and paid-download website flows

scope: Related but separate Angel admin/website runtime systems, protected local Docker Supabase, schema/RLS troubleshooting, Stripe checkout/download verification, and surgical website fixes.
applies_to: cwd=C:\Users\user\Desktop\angel-interior; reuse_rule=all details are ad-hoc notes and must be revalidated against current repo/env; never expose secrets.

## Task 1: Local Supabase protection, RPC/schema drift, public content, and Stripe flow

### rollout_summary_files

- rollout_summaries/2026-07-01T10-03-57-RcB5-codex_hybrid_metadata_router_vben_priority_retrofit.md (cwd=\\?\C:\Users\user\.codex, rollout_path=C:\Users\user\.codex\sessions\2026\07\01\rollout-2026-07-01T18-04-02-019f1d22-a3ef-7710-830f-87fa8a26a443.jsonl, updated_at=2026-07-01T11:08:01+00:00, thread_id=019f1d22-a3ef-7710-830f-87fa8a26a443, indirect routing context only)

### keywords

- local-supabase, role_table_grants, permission denied for table awards, create_user, 064_angel_make_user_rpc_role_status_agnostic.sql, Stripe Checkout, session_id, resource_type, resource_id, hidden tester account

## User preferences

- `C:\Users\user\Documents\local-supabase` is the protected canonical local Docker project for Angel local work: do not switch, stop, reset, recreate, migrate, relabel, or repoint it without explicit same-turn confirmation. [ad-hoc note]
- For screenshot/design work, change only the named page/component/property; “design only” must not change content, DB mapping, status logic, or navigation. [ad-hoc note]

## Reusable knowledge

- For `permission denied for table awards`, check `information_schema.role_table_grants`; correct RLS alone did not grant PostgreSQL access. A public module needs table/index/trigger, authenticated policies, appropriate anon read policy, explicit grants, business permissions, and compatible storage paths. [ad-hoc note]
- When Angel website appears empty, trace env selection, runtime host detection, and Supabase URL together: admin may write local while website reads VPS. [ad-hoc note]
- User-creation `status` errors were schema drift in RPC/migrations, not necessarily the Vue drawer; inspect migrations and actual DB schema before UI edits. Keep numbered migrations and README index aligned. [ad-hoc note]
- Paid downloads now require checking checkout route, download route, `lib/downloadData.php`, runtime Stripe configuration presence, session `payment_status=paid`, and metadata identity. Confirm configuration without copying keys. [ad-hoc note]

## Failures and how to do differently

- Do not alter any Docker/Supabase target merely to debug an Angel app; pause for confirmation if the operation could affect stack identity or database state. [ad-hoc note]
- Filter extension/TikTok/embed console noise from first-party PHP/site issues; only patch owned warnings unless third-party behavior is in scope. [ad-hoc note]

# Task Group: workflow-wide reporting, screenshot replication, and public SEO

scope: Cross-project presentation defaults, high-fidelity replica procedure, and production SEO/AI-search safeguards.
applies_to: cwd=workflow-global; reuse_rule=apply when the user asks for the named reporting/design/SEO style, while verifying project-specific constraints first.

## Task 1: Reporting/status table, replica, and SEO operating rules

### rollout_summary_files

- rollout_summaries/2026-07-17T01-54-29-PZNu-codex_knowledge_routing_compression_git_health.md (cwd=\\?\C:\Users\user\.codex, rollout_path=C:\Users\user\.codex\sessions\2026\07\17\rollout-2026-07-17T09-54-34-019f6dc8-45a2-77e2-a162-4d60741d8788.jsonl, updated_at=2026-07-17T07:52:38+00:00, thread_id=019f6dc8-45a2-77e2-a162-4d60741d8788, supporting governance context)

### keywords

- task | changes | complete, &#10003;, &#10007;, &#9888;, Hierarchical Replica Chunking, design DNA, metaTitle, meta content, robots.txt, sitemap.xml, JSON-LD, OAI-SearchBot, itemprop, Open Graph, Twitter, canonical, meta-content-workflow, seo-ai-search

## User preferences

- For multi-step work, use a compact `task | changes | complete` table; number user-numbered missions and page-wide rows, with completion marks grounded in evidence. [ad-hoc note]
- When comparison/optimization or “more info in tables” is requested, retain the compact status table and add before/after metrics; label token, speed, and quality figures as estimates unless measured. [ad-hoc note]

## Reusable knowledge

- For screenshot replica/clone requests, use Hierarchical Replica Chunking: nested visual bands/chunks, inspect the reference before and throughout implementation, and compare size, spacing, palette, typography, framing, and section order continuously. [ad-hoc note]
- Production SEO/AI-search work needs rendered HTML/HTTP validation, canonical URLs, robots, sitemap, structured data, and truthful original content; do not invent local claims or promise rankings/citations. Related skill: `skills/seo-ai-search/SKILL.md`. [ad-hoc note]
- After `.codex` boot, route `metaTitle`, `meta title`, `meta content`, or `SEO metadata` to `C:\Users\user\.codex\skills\meta-content-workflow\SKILL.md`; pair it with `skills/seo-ai-search/SKILL.md` when public search behavior is in scope. The pasted workflow is a contract, not a source of business facts. [ad-hoc note]
- For public PHP, HTML, and SSR/SSG routes: inventory real routes, classify indexable/duplicate/private/error pages, and give every indexable canonical family a unique title, description, canonical, H1, useful visible content, alt text, and internal links. Visual duplicates should share or redirect to one canonical identity. [ad-hoc note]
- Use production `index, follow, max-snippet:-1, max-image-preview:large, max-video-preview:-1` only after the public domain is confirmed; localhost/staging must be `noindex, nofollow`. Root `robots.txt` should allow public crawling, protect internal paths, and use an absolute confirmed-domain sitemap URL; do not expose private routes. [ad-hoc note]
- Add JSON-LD only for visible, truthful entities; use `itemprop` Microdata only when requested or required for compatibility, and keep it consistent with visible content and JSON-LD. Open Graph/Twitter URLs and images must be absolute; social `sameAs`, `twitter:site`, reviews, ratings, verification tokens, and business claims require confirmed real values. [ad-hoc note]
- Keep `404.php` and icon-reference pages out of the indexable sitemap (`noindex, nofollow` for the error route). Separate code/content work from user-only production actions: domain/DNS and Search Console ownership, real social URLs, branch facts, reviews, prices, and legal approval. Report those as pending until externally verified. [ad-hoc note]
- Completion evidence for metadata work: changed files, route inventory, title/description coverage, robots/sitemap and canonical checks, JSON-LD/Microdata validation, PHP/HTML lint, HTTP status, broken-link result, unverified facts, and production-only steps. [ad-hoc note]

## Failures and how to do differently

- Do not treat a screenshot reference as a one-time read or blindly crop imagery to force a box; preserve composition or use an appropriate replacement. [ad-hoc note]
- Do not add `keywords`, AI.txt, fake verification tokens, fake social URLs, fake reviews, unsupported ratings, or arbitrary Microdata merely to satisfy a checklist. Do not merge conflicting business addresses; confirm LocalBusiness name, address, contacts, hours, service area, social profiles, warranty, technical claims, and prices first. [ad-hoc note]

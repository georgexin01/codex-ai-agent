# Task Group: Angel Interior local debugging, hidden tester-account safety, and surgical flow protection
scope: Use when work is in `C:\Users\user\Desktop\angel-interior` and the user wants Angel localhost/admin behavior debugged safely, hidden tester-account flows preserved without secret leakage, or a visible user flow fixed without redesigning unrelated areas.
applies_to: cwd=\\?\C:\Users\user\Desktop\angel-interior; reuse_rule=safe for this Angel Interior workspace while `website-angel-interior`, `admin-panel-angel`, shared helper/download paths, and `C:\Users\user\Documents\local-supabase` remain the active local truth surfaces

## Task 1: Protect Angel local Supabase/env routing and hidden tester-account workflow, extension-backed

### rollout_summary_files

- extensions/ad_hoc/notes/20260603-172645-protect-local-supabase.md (cwd=\\?\C:\Users\user\Desktop\angel-interior, rollout_path=C:\Users\user\.codex\memories\extensions\ad_hoc\notes\20260603-172645-protect-local-supabase.md, updated_at=2026-06-03T17:26:45, thread_id=extension-ad-hoc-protect-local-supabase, authoritative extension note) [ad-hoc note]
- extensions/ad_hoc/notes/20260603-184421-angel-awards-local-supabase-lessons.md (cwd=\\?\C:\Users\user\Desktop\angel-interior, rollout_path=C:\Users\user\.codex\memories\extensions\ad_hoc\notes\20260603-184421-angel-awards-local-supabase-lessons.md, updated_at=2026-06-03T18:44:21, thread_id=extension-ad-hoc-awards-local-supabase, authoritative extension note) [ad-hoc note]
- extensions/ad_hoc/notes/2026-06-30T15-51-12-angel-hidden-tester-account.md (cwd=\\?\C:\Users\user\Desktop\angel-interior, rollout_path=C:\Users\user\.codex\memories\extensions\ad_hoc\notes\2026-06-30T15-51-12-angel-hidden-tester-account.md, updated_at=2026-06-30T15:51:12, thread_id=extension-ad-hoc-hidden-tester-account, authoritative extension note; secret redacted in consolidated memory) [ad-hoc note]
- extensions/ad_hoc/notes/2026-06-30T15-54-24-angel-auth-sql-template.md (cwd=\\?\C:\Users\user\Desktop\angel-interior, rollout_path=C:\Users\user\.codex\memories\extensions\ad_hoc\notes\2026-06-30T15-54-24-angel-auth-sql-template.md, updated_at=2026-06-30T15:54:24, thread_id=extension-ad-hoc-angel-auth-sql-template, authoritative extension note; secret redacted in consolidated memory) [ad-hoc note]
- extensions/ad_hoc/notes/2026-06-30T17-00-08-angel-history-verified-secret.md (cwd=\\?\C:\Users\user\Desktop\angel-interior, rollout_path=C:\Users\user\.codex\memories\extensions\ad_hoc\notes\2026-06-30T17-00-08-angel-history-verified-secret.md, updated_at=2026-06-30T17:00:08, thread_id=extension-ad-hoc-history-verified-secret, authoritative extension note) [ad-hoc note]

### keywords

- angel-interior, local-supabase, hidden tester account, active_project_id, role_table_grants, permission denied for table awards, award_date, .env.production, localhost, cPanel, auth.users, auth.identities, public."user"

## Task 2: Keep Angel fixes surgical, verify visible flow, and protect shared download routes, extension-backed

### rollout_summary_files

- extensions/ad_hoc/notes/2026-07-06T18-49-14-angel-behavior-pattern.md (cwd=\\?\C:\Users\user\Desktop\angel-interior, rollout_path=C:\Users\user\.codex\memories\extensions\ad_hoc\notes\2026-07-06T18-49-14-angel-behavior-pattern.md, updated_at=2026-07-06T18:49:14, thread_id=extension-ad-hoc-angel-behavior-pattern, authoritative extension note) [ad-hoc note]
- extensions/ad_hoc/notes/2026-07-06T18-53-01-angel-codex-behavior-rules.md (cwd=\\?\C:\Users\user\Desktop\angel-interior, rollout_path=C:\Users\user\.codex\memories\extensions\ad_hoc\notes\2026-07-06T18-53-01-angel-codex-behavior-rules.md, updated_at=2026-07-06T18:53:01, thread_id=extension-ad-hoc-angel-codex-behavior-rules, authoritative extension note) [ad-hoc note]

### keywords

- angel-interior, visible flow, localhost vs cPanel, surgical fix, preserve unrelated flows, busy lock state, duplicate clicks, shared helpers, download routes, stream files

## User preferences

- when Angel live debugging spans localhost vs cPanel or other environment differences, keep the original user goal in focus, avoid broad redesigns when a surgical fix works, verify the visible flow, and report what actually happened on screen [Task 2] [ad-hoc note]
- when the active Angel fix touches one page or flow, preserve unrelated page flows while fixing the active one instead of widening scope during the same pass [Task 2] [ad-hoc note]
- when Angel work could change which local Docker/Supabase project is active, pause before changing the protected `C:\Users\user\Documents\local-supabase` stack and adapt app/site config to it when possible [Task 1] [ad-hoc note]
- when Angel hidden tester-account work comes up, prefer the most recent historically verified credential source, keep the secret out of memory/skills, and only auto-run the workflow when the request clearly matches that pattern [Task 1] [ad-hoc note]

## Reusable knowledge

- `C:\Users\user\Documents\local-supabase` is the canonical local Supabase Docker project for Angel local work; do not silently switch testing to `website-angel-interior` or another stack [Task 1] [ad-hoc note]
- For Angel website debugging, treat env file selection, runtime host detection, and the actual Supabase project URL as one evidence chain; an `empty` website can be a local `.env` vs `.env.production` / VPS mismatch rather than a rendering bug [Task 1] [ad-hoc note]
- A new Angel content module is not complete with only table creation and RLS; the working stack may also need indexes/triggers, anon/public-read policy alignment, explicit SQL GRANTs, business permission rows, and storage bucket/path compatibility [Task 1] [ad-hoc note]
- If policies look right but CRUD still fails, check `information_schema.role_table_grants` immediately; `permission denied for table awards` was caused by missing PostgreSQL GRANTs, not missing RLS alone [Task 1] [ad-hoc note]
- For Angel public website content that already filters by `project_id`, anon-read policies tied to `angelinterior.is_current_project(project_id)` can block valid public rows; a simpler active-row policy may fit the site architecture better [Task 1] [ad-hoc note]
- For year-only fields like Awards `award_date`, plain text plus first-4-digit normalization is safer than a year/date picker when timezone conversion can skew the saved year [Task 1] [ad-hoc note]
- Keep shared helpers and download routes as source-of-truth paths; if the endpoint is meant to stream files, do not bypass it with a direct remote URL [Task 2] [ad-hoc note]
- Use a simple busy/lock state to prevent duplicate clicks while a download or request is in progress [Task 2] [ad-hoc note]
- Related skill: skills/angel-hidden-tester-account/SKILL.md
- Related skill: skills/angel-interior-local-dev/SKILL.md

## Failures and how to do differently

- If the Angel website looks empty on localhost, do not jump straight to frontend rendering bugs; verify which env file and Supabase project the website is actually reading, especially if admin writes and website reads are landing in different projects [Task 1] [ad-hoc note]
- Do not assume RLS explains every Supabase CRUD failure. When table access errors like `permission denied for table awards` appear, audit GRANTs before rewriting frontend/store logic [Task 1] [ad-hoc note]
- Do not store or restate hidden-account secrets in durable memory. Preserve only the rule that history-backed credentials win over newly guessed ones, using `[REDACTED_SECRET]` if a literal value must be referenced locally [Task 1] [ad-hoc note]
- If the user wants a flow fixed without collateral drift, do not widen the task into a redesign. Confirm the visible user journey, apply the smallest working fix, and re-check that nearby pages still behave normally [Task 2] [ad-hoc note]
- If a download/request action can be clicked repeatedly, prevent the repeat at the UI level with a busy/lock state instead of relying on backend timing or duplicate remote URLs to absorb extra clicks [Task 2] [ad-hoc note]
- If an endpoint is designed to stream a file through shared helpers or project routes, bypassing it with a direct remote URL is the wrong fix; trace and repair the real helper/route path instead [Task 2] [ad-hoc note]

# Task Group: .codex routing hygiene, cleanup, and verification
scope: Use when work is inside `C:\Users\user\.codex` and the user wants boot/routing overhead reduced, broad skills converted to lighter front doors, cold notes audited for promotion, or post-cleanup routing verified and rated.
applies_to: cwd=\\?\C:\Users\user\.codex; reuse_rule=safe for `.codex` knowledge/routing cleanup in this checkout while `00_PULSE.md`, `AGENTS.md`, `CODEX_DYNAMIC_ROUTING.md`, `memories/2_governance`, and the router scripts remain the routing truth sources

## Task 1: Audit safe `.codex` cleanup targets, prune stale `.sandbox` logs, and keep rollout summary references intact, success

### rollout_summary_files

- rollout_summaries/2026-07-03T02-34-59-1Seq-codex_cleanup_sandbox_and_rollout_summary_audit.md (cwd=\\?\C:\Users\user\.codex, rollout_path=C:\Users\user\.codex\sessions\2026\07\03\rollout-2026-07-03T10-35-04-019f25d4-5324-7482-af99-a9473dada5ae.jsonl, updated_at=2026-07-03T10:13:39+00:00, thread_id=019f25d4-5324-7482-af99-a9473dada5ae, evidence-based cleanup audit covering route integrity, `.sandbox` shrink, and rollout-summary safety)

### keywords

- .codex, cleanup, sandbox, rollout_summaries, Update-CodexRouting.ps1, Audit-CodexRouting.ps1, zero usage, safe deletion, route integrity, filesystem shrink, googlesheet-email-integration, LAA_PROJECT_SNAPSHOT.md

## Task 2: Reduce duplicate `.codex` boot/routing prose and keep the boot path lean, success

### rollout_summary_files

- rollout_summaries/2026-07-07T06-37-54-1jsr-codex_boot_memory_routing_cleanup_and_protection.md (cwd=\\?\C:\Users\user\.codex, rollout_path=C:\Users\user\.codex\sessions\2026\07\07\rollout-2026-07-07T14-37-59-019f3b4c-2967-7d91-89d5-2e3eded86ef7.jsonl, updated_at=2026-07-07T09:52:15+00:00, thread_id=019f3b4c-2967-7d91-89d5-2e3eded86ef7, boot self-check, small always-active rules, and sentinel-preserving boot refinement)
- rollout_summaries/2026-06-23T01-21-40-OmVb-codex_cleanup_routing_checkpoint_skill_frontdoors.md (cwd=\\?\C:\Users\user\.codex, rollout_path=C:\Users\user\.codex\sessions\2026\06\23\rollout-2026-06-23T09-21-47-019ef211-9b91-7493-8298-29bbba8d21d1.jsonl, updated_at=2026-06-23T03:55:01+00:00, thread_id=019ef211-9b91-7493-8298-29bbba8d21d1, lean boot/routing cleanup plus validation and rating review)

### keywords

- .codex, 00_PULSE.md, 00_CODEX_START_HERE.md, AGENTS.md, CODEX_DYNAMIC_ROUTING.md, ai read .codex knowledge, boot self-check, 10/10 gate, personalized behavior rules, README-first, skill router, starting-point, Audit-CodexRouting.ps1, Update-CodexRouting.ps1, PREFLIGHT_CHECKLIST.md, legacy history, empty folders, git show HEAD, token cost, speed, comparison tables

## Task 3: Convert broad skills to README-first front doors and verify routing after cleanup, success

### rollout_summary_files

- rollout_summaries/2026-06-23T01-21-40-OmVb-codex_cleanup_routing_checkpoint_skill_frontdoors.md (cwd=\\?\C:\Users\user\.codex, rollout_path=C:\Users\user\.codex\sessions\2026\06\23\rollout-2026-06-23T09-21-47-019ef211-9b91-7493-8298-29bbba8d21d1.jsonl, updated_at=2026-06-23T03:55:01+00:00, thread_id=019ef211-9b91-7493-8298-29bbba8d21d1, README-first routing conversion, cleanup checkpoints, and routing repair)

### keywords

- skills/starting-point/README.md, skills/starting-point/skill.md, skills/claude/README.md, memories/2_governance/artifacts/skill_path_router.md, missing_mandatory_count, missing_fallback_count, missing_roots_count, legacy_ref_count, Missing Entries, - None, batch with checkpoints, supabase-rls-rbac-design.md

## Task 4: Audit whether cold memory/skill notes deserve promotion into the hot path, extension-backed

### rollout_summary_files

- rollout_summaries/2026-07-07T06-37-54-1jsr-codex_boot_memory_routing_cleanup_and_protection.md (cwd=\\?\C:\Users\user\.codex, rollout_path=C:\Users\user\.codex\sessions\2026\07\07\rollout-2026-07-07T14-37-59-019f3b4c-2967-7d91-89d5-2e3eded86ef7.jsonl, updated_at=2026-07-07T09:52:15+00:00, thread_id=019f3b4c-2967-7d91-89d5-2e3eded86ef7, selective promotion, `(ai manage)` anchors, and hot-path policy validation)
- extensions/ad_hoc/notes/2026-07-07T00-00-00-cold-storage-promotion-policy.md (cwd=\\?\C:\Users\user\.codex, rollout_path=C:\Users\user\.codex\memories\extensions\ad_hoc\notes\2026-07-07T00-00-00-cold-storage-promotion-policy.md, updated_at=2026-07-07T00:00:00, thread_id=extension-ad-hoc-cold-storage-promotion-policy, authoritative extension note) [ad-hoc note]

### keywords

- cold storage audit, memory promotion policy, route promotion policy, ai cold storage audit, ai promote memory, ai memory promotion, 00_PULSE.md, hot boot path, hybrid frontmatter, reusable knowledge, historical context

## Task 5: Protect important routed markdown, measure hot-vs-cold memory, and keep ignore cleanup route-safe, success

### rollout_summary_files

- rollout_summaries/2026-07-07T06-37-54-1jsr-codex_boot_memory_routing_cleanup_and_protection.md (cwd=\\?\C:\Users\user\.codex, rollout_path=C:\Users\user\.codex\sessions\2026\07\07\rollout-2026-07-07T14-37-59-019f3b4c-2967-7d91-89d5-2e3eded86ef7.jsonl, updated_at=2026-07-07T09:52:15+00:00, thread_id=019f3b4c-2967-7d91-89d5-2e3eded86ef7, protected-markdown rule, hot/cold coverage measurement, folder classification, and ignore-file safety)

### keywords

- Protected Markdown Rule, important .md, 00_PULSE.md, 0.1.3, hot vs cold, 0_apex, 1_core, 2_governance, .gitignore, .codexignore, .openaiignore, .claudeignore, .geminiignore, 125 content files, 18 direct references

## User preferences

- when the user asked to reduce `.codex` size/noise and later said `check this only other dont cause danger` -> keep cleanup narrow, evidence-based, and route-safe instead of doing blind pruning [Task 1]
- when the user asked to find `10 parts that are a waste or unnecessary content` in `.codex` knowledge/memories/skills -> keep the boot path lean and remove duplicate routing prose by default [Task 2]
- when the user asked `show me comparison tables on what changes and rating 1/10` and later asked for the smallest change that could raise the score by `0.5` -> include before/after scoring and leverage-first recommendations, not just edits [Task 2]
- when the user repeatedly confirmed stepwise cleanup, then later asked for `Batch with checkpoints` -> do incremental cleanup with checkpoints and verification rather than one blind bulk trim [Task 2][Task 3]
- when the user asked `make sure all the router routing are working correctly after all this edit and cleaning` and `if anything wrong on routing ai please help me fix` -> repair and re-validate routing as part of the task, not just report issues [Task 3]
- when a `.codex`-managed project starts, the user confirmed `ai read .codex knowledge` should stay a small boot read, not a full tree scan -> route with the smallest viable entrypoint first and only expand if the route is still unclear [ad-hoc note]
- when the user asked how to get from `9/10` to `10/10` and wanted AI behavior to be `faster and smarter` -> tighten the boot layer with compact self-checking rules and evidence-first defaults instead of adding broader protocol prose [Task 2]
- when future work stays in the same project area, the user confirmed the matching skill family should stay awake across later chats/turns -> reuse the proven route until the user changes focus or the area is mostly complete [ad-hoc note]
- when `.codex` or project maintenance work spans `3+` changes, multiple files, or DB+code mixed work -> list numbered steps first and coordinate one step per response when the task needs active coordination [ad-hoc note]
- when the user said `for important .md please do not ever change or remove to those very important` -> protect routed markdown by default and prefer additive routing or tiny patches over deletion unless the user explicitly targets that exact file [Task 5]

## Reusable knowledge

- For `.codex` cleanup, start from routed surfaces and exact reference checks before broad scans; `skills/website/googlesheet-email-integration/` was safe to remove only after confirming there were no live route references, while `memories/3_domains/claude/LAA_PROJECT_SNAPSHOT.md` had to stay because active skills still referenced it [Task 1]
- The current low-risk `.sandbox` cleanup target is dated history logs; keep runtime markers like `deny_read_acl_state.json` and `setup_marker.json`, and note that ignore contracts already cover `.sandbox/`, `.sandbox-bin/`, and `.sandbox-secrets/` [Task 1]
- `rollout_summaries/` is still live reference material for `memories/MEMORY.md`; if space needs to be reclaimed later, check underlying `sessions/` JSONL history before deleting summaries [Task 1]
- `00_PULSE.md` is the authoritative single boot read for `.codex` routing; `00_CODEX_START_HERE.md` should stay deferred/short, `AGENTS.md` should stay a compact bridge, and `CODEX_DYNAMIC_ROUTING.md` should act like a snapshot/index rather than a long log [Task 2]
- `00_PULSE.md` now carries small always-active boot additions like `0.1 Personalized Behavior Rules`, `0.1.1 Boot Self-Check (10/10 gate)`, and the sentinel-preserving `ai read .codex knowledge` trigger; keep new boot rules compact enough to fit as one-line defaults when possible [Task 2]
- For `.codex` routing, stop at the first valid trigger match and avoid over-reading extra files during normal boot; rollout summaries and archive/history should stay out of the normal route [Task 2]
- Broad bootstrap skills benefit most from README-first front doors because they are common entry points and expensive if the executor loads too early; `starting-point` was the right next candidate after `skills/claude` [Task 3]
- `memories/2_governance/PREFLIGHT_CHECKLIST.md` is a required tier-1 route target, and `Audit-CodexRouting.ps1` plus `Update-CodexRouting.ps1` are the authoritative verification/regeneration tools after routing edits [Task 3]
- The current `.codex` bottleneck is no longer the boot layer; the remaining token/speed cost lives mostly in large skill docs, with `skills/claude/supabase-rls-rbac-design.md` called out as the largest file discussed here [Task 3]
- `(ai manage)` marks maintenance-owned durable notes/skills, and the short promoted rules from this lane were `READ_BEFORE_ANSWER_PROTOCOL.md`, `SINGLE_TRUTH_SOURCE_PROTOCOL.md`, and `skills/awake-skill-routing/SKILL.md`; large bundles like `0_apex/ENGINEERING_PROTOCOLS.md` and `2_governance/SESSION_START_PROTOCOL.md` should stay cold unless one unique rule is extracted [Task 4]
- For cold memory/skill audits, compare the candidate against current boot routes and current project files before promoting it; promote only when it is reusable, correct, current, and not already represented more cleanly in a hotter note [Task 4] [ad-hoc note]
- If a cold file is valuable but not discoverable enough, prefer adding a small trigger in `00_PULSE.md` or converting the principle into a short hybrid-frontmatter note instead of promoting a bulky historical file directly [Task 4] [ad-hoc note]
- The hot set should be measured from direct boot references, not from total stored files: one audit counted about 18 direct `00_PULSE.md` memory targets across roughly 125 `memories` content files, with `0_apex` and `2_governance` active and `1_core` mostly cold [Task 5]
- The root ignore surface currently spans `.gitignore`, `.codexignore`, `.openaiignore`, `.claudeignore`, and `.geminiignore`; the current risk is not missing ignores so much as hiding or deleting routed markdown that is still referenced by `00_PULSE.md`, `AGENTS.md`, `CODEX_DYNAMIC_ROUTING.md`, `memories/MEMORY.md`, or `skills/*` [Task 5]
- Use a small project fingerprint to decide which skill family to wake, then load only that family for the current request; the note-backed examples were `skills/claude`, `skills/claude-website`, and `skills/claude-app` [ad-hoc note]
- Prefer current file state, tests, logs, and schema over older memory or assumptions when cleanup/routing evidence conflicts; the note-backed default is truth before speed and verify before done [ad-hoc note]
- Related skill: skills/awake-skill-routing/SKILL.md

## Failures and how to do differently

- Broad recursive scans create noisy output and PowerShell friction in `.codex`; start with exact-text route/reference checks and simpler control flow when validating cleanup candidates [Task 1]
- Do not delete runtime markers just because they are small, and do not prune rollout summaries while `MEMORY.md` still depends on every file [Task 1]
- Patch matching against `memories/MEMORY.md` can fail when punctuation/encoding differs; use smaller, line-preserving replacements and read the file back immediately after each change [Task 2]
- Over-trimming `memories/MEMORY.md` can corrupt structure; if cleanup collapses the file, restore from `git show HEAD` before retrying smaller edits [Task 2]
- Do not over-expand the boot layer when the user only wants a small update; if a rule fits in one line, keep it as a compact `00_PULSE.md` default instead of rewriting larger sections [Task 2]
- Do not treat every old-looking `.codex` file as disposable; some files are routing-critical, so remove obvious history first, prune empty folders second, then stop and audit [Task 3]
- If routing breaks after cleanup, assume a missing file before assuming a logic bug: audit first, restore the missing target, regenerate the router snapshot, and audit again until the counts are clean [Task 3]
- Do not promote a cold file just because it exists; keep it cold when it is historical, project-specific, duplicated by a hotter note, sensitive, or likely to bloat the boot path without improving decisions [Task 4] [ad-hoc note]
- If a file is useful mainly as historical context or cleanup evidence, leave it cold and point to it from memory summaries instead of making it part of the hot route [Task 4] [ad-hoc note]
- Do not delete or rewrite important routed markdown just because it looks old or duplicative; protect route-critical `.md` files by default and verify whether they are still referenced before touching them [Task 5]
- Do not confuse total memory tree size with what the model actually reads on boot; use direct `00_PULSE.md` references as the hot-set proxy and treat runtime DB/log/state files as storage unless a route explicitly reads them [Task 5]
- Over-reading unrelated skills or knowledge paths adds avoidable boot cost; if the task is still within one project lane, keep one matching skill family awake and defer the rest [ad-hoc note]

# Task Group: .codex hybrid metadata routing and Vben route graph retrofit
scope: Use when work is inside `C:\Users\user\.codex` and the user wants AI-facing knowledge/skills to be faster to route, more self-describing, or easier to prioritize across `.md` notes, Vben docs, and skill front doors.
applies_to: cwd=\\?\C:\Users\user\.codex; reuse_rule=safe for this `.codex` checkout while `00_PULSE.md`, `memories/2_governance/artifacts/skill_path_router.md`, the Vben skill/docs tree, and the hybrid-router note remain the active routing surfaces

## Task 1: Explain the `.codex` routing contract and preserve the boot sentinel behavior, success

### rollout_summary_files

- rollout_summaries/2026-07-01T10-03-57-RcB5-codex_hybrid_metadata_router_vben_priority_retrofit.md (cwd=\\?\C:\Users\user\.codex, rollout_path=C:\Users\user\.codex\sessions\2026\07\01\rollout-2026-07-01T18-04-02-019f1d22-a3ef-7710-830f-87fa8a26a443.jsonl, updated_at=2026-07-01T11:08:01+00:00, thread_id=019f1d22-a3ef-7710-830f-87fa8a26a443, routing-contract explanation plus durable principle capture)

### keywords

- .codex, ai read .codex knowledge, 00_PULSE.md, skill_path_router.md, ready sentinel, 5 improvement, 100/100, one boot doc, one trigger per task, one file per purpose, one verification step per action, one source of truth per project

## Task 2: Add the hybrid YAML metadata router and project knowledge template, success

### rollout_summary_files

- rollout_summaries/2026-07-01T10-03-57-RcB5-codex_hybrid_metadata_router_vben_priority_retrofit.md (cwd=\\?\C:\Users\user\.codex, rollout_path=C:\Users\user\.codex\sessions\2026\07\01\rollout-2026-07-01T18-04-02-019f1d22-a3ef-7710-830f-87fa8a26a443.jsonl, updated_at=2026-07-01T11:08:01+00:00, thread_id=019f1d22-a3ef-7710-830f-87fa8a26a443, canonical router-schema and template rollout)

### keywords

- hybrid metadata router, YAML frontmatter, project knowledge template, ai hybrid metadata router, ai metadata router, ai project knowledge template, name, title, aliases, triggers, priority, contains, related_skills, related_docs, use_when, do_not_use_when, verification

## Task 3: Retrofit Vben docs/subskills and expand the route graph, partial

### rollout_summary_files

- rollout_summaries/2026-07-01T10-03-57-RcB5-codex_hybrid_metadata_router_vben_priority_retrofit.md (cwd=\\?\C:\Users\user\.codex, rollout_path=C:\Users\user\.codex\sessions\2026\07\01\rollout-2026-07-01T18-04-02-019f1d22-a3ef-7710-830f-87fa8a26a443.jsonl, updated_at=2026-07-01T11:08:01+00:00, thread_id=019f1d22-a3ef-7710-830f-87fa8a26a443, high-signal Vben route graph expanded; deeper cleanup deferred)

### keywords

- Vben Admin, skills/claude/README.md, VBEN_ADMIN_MANDATORY_CHECKLIST.md, ANTI_DOUBLE_SUBMIT_PATTERN.md, SOFT_DELETE_GUARD.md, create-module, generate-views, generate-store, generate-supabase-schema, generate-route, generate-i18n, generate-e2e, workflow-test, analyze-schema, supabase-auth-architecture, seo-tables-planner, database-markmap-sync, VBEN_RELATION_AUTOGUARD_PLAYBOOK

## User preferences

- when the user asked `ai read .codex knowledge` and then `what your understanding here?` -> answer from the actual routing contract and trigger map, not from a generic explanation [Task 1]
- when the user asked for `5 improvement` and `if current is 80/100 point, how to make this 100/100` -> give structured, ranked improvement paths instead of vague guidance [Task 1]
- when the user asks for options, rankings, or choices -> lead with the best answer or recommended option first, then present short numbered options so selection is faster [Task 1][ad-hoc note]
- when the user asked to write the `Best practical 5 formula` into AI knowledge/principles and later said `yes turn` -> convert accepted operating rules into durable routed notes/templates, not just chat prose [Task 1][Task 2]
- when the user said `.md should be hybrid using yaml at top recording every possible name, title, option, setting, url, path, or others "function"` and asked to `increase this piority level more important to read this` -> prefer self-describing frontmatter and explicit priority routing on important AI-facing docs [Task 2]
- when the user said `yes can wired this and other vben admin panel relared knowledge and skills..` and kept replying `yes do it` / `yes next` -> continue expanding the proven Vben route graph proactively until the high-signal docs are covered [Task 3]

## Reusable knowledge

- `00_PULSE.md` remains the boot/read-first routing contract and `memories/2_governance/artifacts/skill_path_router.md` remains the semantic skill index; `ai read .codex knowledge` should still return the ready sentinel rather than a summary [Task 1]
- The 5-point formula captured here is: one boot doc, one trigger per task, one file per purpose, one verification step per action, one source of truth per project [Task 1][Task 2]
- The reusable project knowledge template the user wanted should cover source of truth, routing, rules, examples, verification, exceptions, and reusable principle [Task 2]
- The canonical hybrid frontmatter should advertise `name`, `title`, `description`, `aliases`, `triggers`, `priority`, `contains`, `related_skills`, `related_docs`, `use_when`, `do_not_use_when`, and `verification`; use it as a router aid, not a replacement for project truth docs [Task 2]
- The route graph retrofit now covers the main Vben flow from analysis -> generation -> testing -> planning -> guardrails, with `analyze-schema` as the early gate before generating store/schema/views/routes/i18n and `supabase-auth-architecture` as the auth reference when JWT-claim decisions matter [Task 3]
- The main Vben docs that should self-identify at the top include `skills/claude/README.md`, `VBEN_ADMIN_MANDATORY_CHECKLIST.md`, `ANTI_DOUBLE_SUBMIT_PATTERN.md`, and `SOFT_DELETE_GUARD.md`; planner/guard docs like `seo-tables-planner`, `database-markmap-sync`, and `VBEN_RELATION_AUTOGUARD_PLAYBOOK` also belong in direct routing [Task 3]
- Related skill: skills/project-handoff-doc-stack/SKILL.md

## Failures and how to do differently

- Do not answer `ai read .codex knowledge` with a summary; preserve the special sentinel/route-first behavior and pull the actual trigger map first [Task 1]
- If the user wants a reusable principle or formula, do not leave it as discussion text. Route it into a note/template immediately so future AI runs can discover it [Task 2]
- Add the router entry before or alongside the new note so the idea is discoverable as soon as it exists; a good note that is not routed is still easy to miss [Task 2]
- When retrofitting many docs, wire router surfaces first and then patch file headers conservatively; the safer pattern here was to prioritize the highest-leverage docs instead of mass-editing everything [Task 2][Task 3]
- Batch patches can fail on encoded or format-mismatched docs like `SOFT_DELETE_GUARD.md`; inspect the exact bytes/heading form and patch smaller files individually instead of rewriting whole bodies just to add headers [Task 3]
- Remaining incomplete coverage is a gap, not a rollback trigger: keep the high-signal route graph working first, then extend to adjacent docs and body-level cleanup later [Task 3]

# Task Group: .codex GitHub push troubleshooting and side-effect remote sync
scope: Use when work is in `C:\Users\user\.codex` and the user wants a local commit pushed to GitHub, especially if `git` reports the branch is ahead but push output is confusing because network errors and extra push-hook automation appear together.
applies_to: cwd=\\?\C:\Users\user\.codex; reuse_rule=safe for this `.codex` checkout while `origin` remains the GitHub remote, `skills-origin` remains the secondary sync target, and push behavior still includes the skills mirroring hook

## Task 1: Diagnose failed push to `origin/main` with HTTP 408 and skills sync side effect, fail

### rollout_summary_files

- rollout_summaries/2026-06-30T03-12-06-Hjah-push_to_github_failed_http_408_with_skills_sync_hook.md (cwd=\\?\C:\Users\user\.codex, rollout_path=C:\Users\user\.codex\sessions\2026\06\30\rollout-2026-06-30T11-12-12-019f1683-3a1e-7ec2-9ace-96c9a1ca52e1.jsonl, updated_at=2026-06-30T03:18:41+00:00, thread_id=019f1683-3a1e-7ec2-9ace-96c9a1ca52e1, one local commit remained unpushed because GitHub disconnected mid-transfer)

### keywords

- C:\Users\user\.codex, git push origin main, origin/main, ahead 1, HTTP 408, RPC failed, send-pack, remote end hung up unexpectedly, skills-origin, Also pushing skills, rules/default.rules, git rev-list --left-right --count

## User preferences

- when the user said `i see what is this happening and i want to save to github` and then `retry` -> diagnose the push problem and retry in the same session instead of stopping at an explanation [Task 1]

## Reusable knowledge

- `git rev-list --left-right --count origin/main...HEAD` returning `0	1` is the quickest proof here that the local branch still has exactly one unpushed commit [Task 1]
- `git branch -vv` showed `main` as `ahead 1`, so the later `Everything up-to-date` text in the failed push output was not the source of truth for whether GitHub actually received the commit [Task 1]
- In this repo, `git push origin main` also triggers extra automation that mirrors `skills/` to `skills-origin`, so push output can include `Also pushing skills` / `Skills synced` even when the main GitHub push fails [Task 1]
- `git remote -v` showed `origin=https://github.com/georgexin01/codex-ai-skills.git` and `skills-origin=https://github.com/ZetaTech-zt/skills-codex-xin.git`, which explains why one push command emitted two remote-related outputs [Task 1]

## Failures and how to do differently

- If the push ends with `error: RPC failed; HTTP 408`, `send-pack: unexpected disconnect while reading sideband packet`, or `fatal: the remote end hung up unexpectedly`, treat it as a network/remote disconnect and re-check branch state before assuming the `Everything up-to-date` footer means success [Task 1]
- After any failed push in this repo, run `git status --short --branch` again. This session surfaced a new local modification in `rules/default.rules`, so retry logic should not assume the working tree is unchanged [Task 1]
- `git remote show origin` also failed to connect to `github.com:443`, which is a strong clue to pause on network instability rather than repeatedly retrying the same push blindly [Task 1]

# Task Group: admin-panel-Thongthai build repair and CSS regression-safe verification
scope: Use when work is in `C:\Users\user\Desktop\New folder\admin-panel-Thongthai` and the user wants `npm run build` failures fixed without changing the admin panel's existing design.
applies_to: cwd=\\?\C:\Users\user\Desktop\New folder\admin-panel-Thongthai; reuse_rule=safe for this Vue/Vite checkout while `src/main.ts`, `src/style.scss`, `tsconfig.json`, and `vite.config.ts` remain the main build and style entry points

## Task 1: Fix Vite/TypeScript config build errors, success

### rollout_summary_files

- rollout_summaries/2026-06-30T06-23-05-5JOj-fix_vite_tsconfig_and_broken_table_primary_css.md (cwd=\\?\C:\Users\user\Desktop\New folder\admin-panel-Thongthai, rollout_path=C:\Users\user\.codex\sessions\2026\06\30\rollout-2026-06-30T14-23-10-019f1732-11d7-7a81-98b4-3f324af1bc0b.jsonl, updated_at=2026-06-30T06:27:29+00:00, thread_id=019f1732-11d7-7a81-98b4-3f324af1bc0b, ESM-safe Vite/TypeScript repair for build startup)

### keywords

- C:\Users\user\Desktop\New folder\admin-panel-Thongthai, npm run build, vite, vue-tsc -b, tsconfig.json, vite.config.ts, moduleResolution bundler, vite/client, node types, fileURLToPath, __dirname

## Task 2: Fix malformed `.table-primary` CSS and re-verify build, success

### rollout_summary_files

- rollout_summaries/2026-06-30T06-23-05-5JOj-fix_vite_tsconfig_and_broken_table_primary_css.md (cwd=\\?\C:\Users\user\Desktop\New folder\admin-panel-Thongthai, rollout_path=C:\Users\user\.codex\sessions\2026\06\30\rollout-2026-06-30T14-23-10-019f1732-11d7-7a81-98b4-3f324af1bc0b.jsonl, updated_at=2026-06-30T06:27:29+00:00, thread_id=019f1732-11d7-7a81-98b4-3f324af1bc0b, second-stage CSS repair after the config fix exposed a minification error)

### keywords

- C:\Users\user\Desktop\New folder\admin-panel-Thongthai, table-primary, lightningcss, vite:css-post, src/assets/scss/bootstrap/_tables.scss, src/assets/css/styles.css, var(--primary-rgb), style.scss, bootstrap.css, icons.css, dist

## User preferences

- when the user asked `ai check i npm run build but some error happen see can this be fixed?` -> investigate and fix the build, not just explain the error [Task 1]
- when the user asked `make sure these change wont change any design or others broken my admin panel` -> treat regression safety, especially design/styling impact, as part of completion for similar fixes [Task 1][Task 2]

## Reusable knowledge

- This repo is an ESM Vite app, so `vite.config.ts` needed `moduleResolution: "bundler"` plus `"types": ["vite/client", "node"]` in `tsconfig.json` to resolve the Vite and Node imports correctly [Task 1]
- `vite.config.ts` cannot rely on raw `__dirname` here; derive it with `path.dirname(fileURLToPath(import.meta.url))` [Task 1]
- `src/main.ts` imports `src/style.scss`, and `src/style.scss` imports the generated CSS bundle `src/assets/css/styles.css`, so a build-breaking CSS bug can come from the generated CSS path the app actually consumes, not only from SCSS sources [Task 2]
- The broken theme token was localized to `.table-primary`; repairing both `src/assets/scss/bootstrap/_tables.scss` and the generated `src/assets/css/styles.css` restored `var(--primary-rgb)` / `rgba(var(--primary-rgb), ...)` and kept source plus consumed output aligned [Task 2]
- Final verification was `npm run build` succeeding and emitting `dist/` artifacts; remaining unresolved-image and large-chunk warnings were non-fatal and not part of the regression fix [Task 2]

## Failures and how to do differently

- Re-run the full build after each fix. The first patch cleared the TypeScript/Vite error layer, but a second CSS minification failure only appeared afterward [Task 1][Task 2]
- If PowerShell file-window reading fails with `Select-Object -Index 220..245`, switch to `-Skip N -First M`; range-style `-Index` was the wrong tool here [Task 2]
- When the user worries about design breakage, do not stop at "build passes." Check whether the repaired values match the repo's existing variable convention so the change is a repair, not a redesign [Task 2]

# Task Group: thongthaimassage reservation modal provenance tracing
scope: Use when work is in `C:\Users\user\Desktop\New folder\thongthaimassage_v2` and the user wants to know where a jQuery/Bootstrap modal call comes from in the reservation flow.
applies_to: cwd=\\?\C:\Users\user\Desktop\New folder\thongthaimassage_v2; reuse_rule=safe for this checkout while `src/admin/reservation.js`, `admin/reservation.php`, and `admin/js/reservation_vendor.min.js` remain the reservation page truth sources

## Task 1: Trace `.modal('show')` from reservation.js to page markup and vendor bundle, success

### rollout_summary_files

- rollout_summaries/2026-06-30T06-08-35-x1Vn-trace_bootstrap_modal_source_reservation_page.md (cwd=\\?\C:\Users\user\Desktop\New folder\thongthaimassage_v2, rollout_path=C:\Users\user\.codex\sessions\2026\06\30\rollout-2026-06-30T14-08-43-019f1724-ce85-70b2-9a6e-a4bd83b30031.jsonl, updated_at=2026-06-30T06:10:44+00:00, thread_id=019f1724-ce85-70b2-9a6e-a4bd83b30031, traced the modal call to both the PHP markup and the Bootstrap/jQuery bundle)

### keywords

- C:\Users\user\Desktop\New folder\thongthaimassage_v2, reservation.js, reservation.php, reservation_vendor.min.js, .modal('show'), open-floor-plan, Bootstrap 4.6.2, jQuery 3.7.1, modal fade, PowerShell quoting

## User preferences

- when the user asked `find this .modal where are they come from` -> answer provenance questions by tracing the exact code path and source files, not by giving a generic library explanation [Task 1]
- when the user pointed at the snippet in `src/admin/reservation.js` -> start from the selected code and trace outward through template markup plus bundled runtime files [Task 1]

## Reusable knowledge

- `src/admin/reservation.js` binds the `.open-floor-plan` click handler and calls `$('.modal').modal('show')`, but the actual modal element lives in `admin/reservation.php` as `<div class="modal fade" ...>` [Task 1]
- `admin/reservation.php` loads both `./js/reservation_vendor.min.js` and `./js/reservation.min.js`, so the reservation page's behavior is split between the PHP template and the compiled vendor/app scripts [Task 1]
- In this repo, `.modal()` is Bootstrap's jQuery plugin supplied by `admin/js/reservation_vendor.min.js`, which bundled Bootstrap 4.6.2 and jQuery 3.7.1 [Task 1]

## Failures and how to do differently

- If `rg` trips a PowerShell quoting/parser error, simplify the pattern or switch to direct file reads / targeted `Select-String` instead of fighting the shell syntax [Task 1]
- Broad greps across a large minified vendor bundle can time out; use the page include path plus a few identifying strings like Bootstrap or jQuery version text to confirm provenance faster [Task 1]

# Task Group: 86cara homepage metadata branding and SEO copy updates
scope: Use when work is in `C:\xampp\htdocs_86cara` and the user wants homepage brand/title/description text changed consistently across SEO, social, and install metadata without drifting into unrelated URL or asset renames.
applies_to: cwd=\\?\C:\xampp\htdocs_86cara; reuse_rule=safe for this checkout family while `index.html` remains the homepage entry point and `assets/favicon/site.webmanifest` remains the mirrored app-name source

## Task 1: Update homepage SEO/social metadata to the full company name with fuller descriptions, success

### rollout_summary_files

- rollout_summaries/2026-06-29T07-44-23-O0PA-update_homepage_meta_branding_and_description.md (cwd=\\?\C:\xampp\htdocs_86cara, rollout_path=C:\Users\user\.codex\sessions\2026\06\29\rollout-2026-06-29T15-44-28-019f1256-24bf-7820-938f-97654486fdbe.jsonl, updated_at=2026-06-29T07:47:00+00:00, thread_id=019f1256-24bf-7820-938f-97654486fdbe, full-company-name metadata pass with expanded descriptions)

### keywords

- C:\xampp\htdocs_86cara, index.html, site.webmanifest, meta title, meta description, og:title, og:description, twitter:title, twitter:description, Lapan Enam Car Window Film & Acessories (M) SDN BHD, SEO, rg, regex parse error

## Task 2: Update site metadata branding from Eighty Six Car Accessories to LAPAN ENAM Car Accessories, success

### rollout_summary_files

- rollout_summaries/2026-06-29T07-27-43-KIoY-update_homepage_meta_branding_to_lapan_enam.md (cwd=\\?\C:\xampp\htdocs_86cara, rollout_path=C:\Users\user\.codex\sessions\2026\06\29\rollout-2026-06-29T15-27-48-019f1246-e53e-72f0-a469-5116c511793c.jsonl, updated_at=2026-06-29T07:29:44+00:00, thread_id=019f1246-e53e-72f0-a469-5116c511793c, exact-match brand rename across head metadata and manifest)

### keywords

- C:\xampp\htdocs_86cara, Eighty Six Car Accessories, LAPAN ENAM Car Accessories, index.html, assets/favicon/site.webmanifest, application-name, apple-mobile-web-app-title, og:site_name, twitter:title, rg -n -F

## User preferences

- when the user asked to change `all meta related text` and to `find all and changes here` -> do a full project search for metadata-brand occurrences before editing, not just the visible `<title>` [Task 2]
- when the user supplied the exact new brand string `LAPAN ENAM Car Accessories` -> preserve that capitalization in metadata unless the user says otherwise [Task 2]
- when the user asked for the exact full company name `Lapan Enam Car Window Film & Acessories (M) SDN BHD` -> treat that full string as the preferred metadata branding target for similar requests in this repo [Task 1]
- when the user said `update all description to alittle more complete` -> expand descriptions across SEO/social tags instead of updating title only or leaving short copy in place [Task 1]

## Reusable knowledge

- In this repo, the live homepage metadata is centralized in `index.html`, and install/PWA naming is mirrored in `assets/favicon/site.webmanifest` [Task 1][Task 2]
- The metadata sweep needs to cover the page `<title>`, `meta author`, `application-name`, `apple-mobile-web-app-title`, `keywords`, `description`, `og:*`, and `twitter:*` fields; updating only one of them leaves the branding inconsistent [Task 1]
- Exact-string verification is reliable here: `rg -n -F "Eighty Six Car Accessories" .` confirmed the earlier brand was fully removed after the rename pass [Task 2]
- The later verification also worked by searching for the exact old title/description strings in `index.html` and `assets/favicon/site.webmanifest`, which confirmed the fuller company-name copy replaced the previous LAPAN ENAM metadata set [Task 1]
- Canonical URLs and OG image paths can look brand-related but may still be file/domain identifiers. In the first pass they were intentionally left unchanged, so future full rebrands should decide explicitly whether URL slugs and asset filenames are in scope [Task 2]
- Related skill: skills/static-site-metadata-sweep/SKILL.md

## Failures and how to do differently

- Searching HTML meta fields with a more complex regex in PowerShell triggered `regex parse error ... unclosed group`; rerun with a simpler literal search (`rg -F`) or a narrower pattern instead of pushing the regex harder [Task 1]
- If the request says `all meta related text`, do not stop after patching the visible title or one description tag; sweep the whole head plus the manifest so branding stays aligned across SEO, social, and install surfaces [Task 1][Task 2]
- If the user wants a full rebrand next time, check whether canonical URLs, OG image filenames, and domain references should also change, because those were deliberately left alone in the first pass [Task 2]
- `PROJECT_CONTEXT.md` was not present in this repo, so do not rely on an extra repo fingerprint file existing before you inspect the actual entry files [Task 1]

# Task Group: C:\xampp\htdocs root repo hygiene and conservative .gitignore
scope: Use when the user wants a root `.gitignore` added or adjusted in `C:\xampp\htdocs`, especially when the workspace mixes PHP, static assets, uploads, and checked-in dependency folders that make broad ignore templates risky.
applies_to: cwd=\\?\C:\xampp\htdocs; reuse_rule=safe for root ignore-rule work in this checkout family while the repo still has mixed root content such as `api/`, `assets/`, `uploads/`, and `vendor/`

## Task 1: Add a suitable root `.gitignore`, success

### rollout_summary_files

- rollout_summaries/2026-06-29T06-43-32-p0Jf-root_gitignore_added_for_xampp_htdocs.md (cwd=\\?\C:\xampp\htdocs, rollout_path=C:\Users\user\.codex\sessions\2026\06\29\rollout-2026-06-29T14-43-37-019f121e-6e58-7773-86dd-ecfdac19695d.jsonl, updated_at=2026-06-29T06:45:05+00:00, thread_id=019f121e-6e58-7773-86dd-ecfdac19695d, conservative root ignore file based on live layout and git status)

### keywords

- C:\xampp\htdocs, .gitignore, git status --short, uploads, vendor, api/logs, assets, composer.phar, node_modules, dist, build, coverage

## User preferences

- when the user asked for a `.gitignore` for the `project root folder` -> inspect the actual root layout before proposing ignore rules instead of dropping in a generic template [Task 1]
- when the request was for a `suitable` `.gitignore` in a repo with mixed content (`api/`, `assets/`, `uploads/`, checked-in `vendor/`) -> stay conservative and avoid broad ignores that could hide real source or required checked-in assets [Task 1]

## Reusable knowledge

- `git status --short` is the fastest validation step here. Before the patch it showed `api/`, `assets/`, root static files, `uploads/`, and `vendor/` as untracked; after the patch, `vendor/`, `uploads/`, and `api/logs/` disappeared from status while source assets stayed visible [Task 1]
- The root layout at the time of the rollout included `.git`, `api/`, `assets/`, `cgi-bin/`, `uploads/`, `vendor/`, `index.html`, `loading.gif`, `no-images.jpg`, `README.md`, and `vite.svg`, which is why blanket ignores would have been risky [Task 1]
- The validated root `.gitignore` ignored OS/editor noise, env files, logs, Composer/PHP caches, Node build/cache folders, and uploads. The concrete entries were `.DS_Store`, `Thumbs.db`, `desktop.ini`, `.idea/`, `.vscode/`, `*.swp`, `*.swo`, `.env`, `.env.*`, `!.env.example`, `*.log`, `api/logs/`, `/.phpunit.result.cache`, `/vendor/`, `composer.phar`, `/node_modules/`, `/dist/`, `/build/`, `/coverage/`, `/.cache/`, `/tmp/`, `/temp/`, `/uploads/` [Task 1]

## Failures and how to do differently

- The main failure risk was over-ignoring source under `assets/` or other mixed root folders. Use the live root listing plus `git status --short` as the source of truth before deciding what is disposable [Task 1]
- Future ignore-rule edits in this workspace should be driven by current layout and repo state, not assumptions about what a PHP/static root `should` ignore [Task 1]

# Task Group: VIPBillion admin shared module workflows, assignment guards, and resume flow
scope: Use when work is in `admin-vipbillion` and the user wants shared drawer/form behavior kept consistent, booking-to-driver assignment rules enforced across `/drivers/jobs` and `/bookings/list`, clone-first module reuse, soft-delete-safe CRUD behavior, or paused admin work resumed without re-discovery.
applies_to: cwd=\\?\C:\Users\user\Desktop\VIPBillion; reuse_rule=safe for `admin-vipbillion` shared drawer/form and CRUD flows in this workspace while the shared driver-job form/store, adjacent Vben CRUD patterns, and migration `133_vipbillion_drivers.sql` remain the main truth sources

## Task 1: Prevent duplicate booking assignment in shared driver-job flows, success

### rollout_summary_files

- rollout_summaries/2026-06-24T01-18-20-2Q66-vipbillion_codex_routing_localhost_and_duplicate_booking_gua.md (cwd=\\?\C:\Users\user\Desktop\VIPBillion, rollout_path=C:\Users\user\.codex\sessions\2026\06\24\rollout-2026-06-24T09-18-25-019ef734-e7c1-7690-beac-70590fe4c55a.jsonl, updated_at=2026-06-25T04:26:11+00:00, thread_id=019ef734-e7c1-7690-beac-70590fe4c55a, shared-source-of-truth fix for duplicate booking assignment and unassigned-booking filtering)

### keywords

- admin-vipbillion, /drivers/jobs, /bookings/list, driver-job.ts, driver-job-form.vue, booking-list.vue, booking-detail-drawer.vue, assertBookingAssignable, This booking already has a driver assigned, uq_driver_jobs_booking, 23505, unassigned bookings, edit mode

## Task 2: Pause and resume unfinished driver-job assignment work, success

### rollout_summary_files

- rollout_summaries/2026-06-24T01-18-20-2Q66-vipbillion_codex_routing_localhost_and_duplicate_booking_gua.md (cwd=\\?\C:\Users\user\Desktop\VIPBillion, rollout_path=C:\Users\user\.codex\sessions\2026\06\24\rollout-2026-06-24T09-18-25-019ef734-e7c1-7690-beac-70590fe4c55a.jsonl, updated_at=2026-06-25T04:26:11+00:00, thread_id=019ef734-e7c1-7690-beac-70590fe4c55a, saved unfinished assignment context for later resume)

### keywords

- save first, continue yesterday task, resume with these unfinish task, shared driver-job flow, booking picker, create drawer, edit drawer, workspace state

## Task 3: Reuse existing booking CRUD modules and keep Vben tables/drawers structurally aligned, extension-backed

### rollout_summary_files

- extensions/ad_hoc/notes/2026-07-09-vben-drawer-scroll-top-rule.md (cwd=\\?\C:\Users\user\Desktop\VIPBillion, rollout_path=C:\Users\user\.codex\memories\extensions\ad_hoc\notes\2026-07-09-vben-drawer-scroll-top-rule.md, updated_at=2026-07-09T15:35:41, thread_id=extension-ad-hoc-vben-drawer-scroll-top-rule, authoritative extension note) [ad-hoc note]
- extensions/ad_hoc/notes/2026-07-09T10-07-49-vben-table-column-alignment-rule.md (cwd=\\?\C:\Users\user\Desktop\VIPBillion, rollout_path=C:\Users\user\.codex\memories\extensions\ad_hoc\notes\2026-07-09T10-07-49-vben-table-column-alignment-rule.md, updated_at=2026-07-09T10:07:49, thread_id=extension-ad-hoc-vben-table-column-alignment-rule, authoritative extension note) [ad-hoc note]
- extensions/ad_hoc/notes/2026-07-09T10-06-06-vipbillion-share-existing-booking-modules.md (cwd=\\?\C:\Users\user\Desktop\VIPBillion, rollout_path=C:\Users\user\.codex\memories\extensions\ad_hoc\notes\2026-07-09T10-06-06-vipbillion-share-existing-booking-modules.md, updated_at=2026-07-09T10:06:06, thread_id=extension-ad-hoc-vipbillion-share-existing-booking-modules, authoritative extension note) [ad-hoc note]

### keywords

- admin-vipbillion, Booking Management, report views, booking-related CRUD modules, shared booking CRUD path, Vben table, new column, body cells, summary row cells, horizontal scroll width, action offsets, checkbox offsets, CRUD drawer, module shell, reopen at top scroll position, reset on open, reset on opened, nested content mount, persisted mount state, shared scroll reset helper

## User preferences

- when the user asked `will not repeated.. select same booking when submit if booking is allready asign driver will also prevent submit will show error` -> enforce uniqueness at submit time with a friendly message, not only through dropdown filtering [Task 1]
- when the user asked for `only show non assigned drivers booking` and wanted it on both `/drivers/jobs` and `/bookings/list` -> treat shared assignment flows as one source of truth and apply the same rule across all assign-driver entry points [Task 1]
- when the user said `yes for both all assign driver modules please check booking never repeat same booking option` -> default to cross-screen consistency rather than page-specific one-off fixes [Task 1]
- when future VIPBillion admin work touches booking tables/CRUD and driver-job tables/CRUD together -> keep those surfaces in focus as one evolving area and proactively look for stale relation wiring or cleanup needs after the latest changes settle [ad-hoc note]
- when VIPBillion admin work already has a booking-related CRUD flow, prefer reusing the existing module/drawer path instead of recreating it; only split when the data flow or UI behavior is genuinely different [Task 3] [ad-hoc note]
- when the user says `copy and paste`, `duplicate`, `clone`, or `same modules` for VIPBillion admin work -> duplicate the whole source module shell first, then edit only the inside content they asked to change; do not reinterpret the layout before the clone exists [ad-hoc note]
- when VIPBillion admin work reuses or clones a CRUD drawer/module shell -> reopen it at the top scroll position every time, and for drawers launched directly from booking flows also clear persisted mount state on close so the next open starts fresh [Task 3] [ad-hoc note]
- when the user asked `save first` and later `continue yesterday task, resume with these unfinish task` -> preserve unfinished context cleanly and resume from the same edited workspace state instead of re-scoping from scratch [Task 2]

## Reusable knowledge

- Both `/drivers/jobs` and `/bookings/list` rely on the same shared driver-job create/edit drawers, so the durable fix belongs in the shared store/form path rather than in separate page files [Task 1]
- `admin-vipbillion/apps/web-antd/src/stores/driver-job.ts` now has `assertBookingAssignable(bookingId, currentJobId?)`; calling it from both `create()` and `update()` blocks duplicate assignment before insert/update and gives the user a booking-specific error instead of a raw DB failure [Task 1]
- `admin-vipbillion/apps/web-antd/src/views/driver-jobs/driver-job-form.vue` should load only unassigned bookings by default, dedupe options by booking id, and preserve the currently selected booking in edit mode so existing assignments still render [Task 1]
- `booking-list.vue` and `booking-detail-drawer.vue` both open the same shared driver-job drawers, so one store/form fix covers booking-side assignment too [Task 1]
- The schema already enforces `CONSTRAINT uq_driver_jobs_booking UNIQUE (booking_id)` in `admin-vipbillion/apps/web-antd/src/sql/migrations/133_vipbillion_drivers.sql`; the UI/store guard complements an existing DB invariant instead of replacing it [Task 1]
- In VIPBillion admin follow-up work, keep booking tables/CRUD and driver-job tables/CRUD in the same search lane; these surfaces are expected to keep changing together across Supabase schemas, select options, relation wiring, and legacy cleanup [ad-hoc note]
- For driver-job relation drawer work, clone the existing driver-job list drawer/module shell first and preserve the same shell, spacing, drawer/grid behavior, and component structure before swapping the inner table/content for the new use case [ad-hoc note]
- For Booking Management/report views, share the existing booking CRUD path as much as possible; reuse the existing booking-related CRUD modules and drawers when the workflow already exists, and only branch into a new module when the data flow or UI behavior is genuinely different [Task 3] [ad-hoc note]
- When adding a new column to an existing Vben table, update the body cells, summary row cells, and horizontal scroll width together so the table structure stays aligned after the insert [Task 3] [ad-hoc note]
- Keep action, checkbox, and summary offsets aligned after inserting or removing Vben table columns; column edits are not complete until those offsets still line up [Task 3] [ad-hoc note]
- Any CRUD drawer or module shell should reopen at the top scroll position; apply the reset on open, on opened, and again after nested content mount when needed so reused shells do not keep a stale scroll offset [Task 3] [ad-hoc note]
- Drawers launched directly from booking flows need one extra reset rule: clear persisted mount state on close so reopening starts fresh instead of restoring the previous nested state [Task 3] [ad-hoc note]
- Prefer a shared scroll reset helper for Vben admin drawers/modules instead of one-off per-screen fixes so the reset stays consistent across reused CRUD shells [Task 3] [ad-hoc note]
- For Vben Admin CRUD modules that auto-generate a slug/url from title and use soft delete (`deleted_at` or equivalent), duplicate checks should only consider active rows, submit should hard-check slug again, and the database uniqueness should be a partial unique index on active rows only (`WHERE deleted_at IS NULL`) [ad-hoc note]
- For new VIPBillion business tables, prefer `isDelete boolean NOT NULL DEFAULT false` unless the table already uses legacy `deleted_at`; admin CRUD reads, relation lookups, dropdown options, drawers, and workflow queries should all filter active rows with `isDelete = false` [ad-hoc note]
- VIPBillion delete actions should soft-delete with `isDelete = true`, and if direct row updates are unreliable under RLS or trigger behavior, move the mutation into a `SECURITY DEFINER` RPC called from the store [ad-hoc note]
- If resumed later, re-check both create and edit drawers plus the booking picker because the unfinished area stayed centered on the shared assignment flow, not on a separate booking-only implementation [Task 2]
- Related skill: skills/clone-first-module-duplication/SKILL.md

## Failures and how to do differently

- Filtering only in the dropdown was not enough; put the duplicate-booking guard in the store so every entry point gets the same protection and the user sees a friendly error before the DB unique violation path [Task 1]
- When filtering relational options, test both create and edit mode. The first pass hid already assigned bookings correctly but needed a refinement so the current booking stayed visible in edit mode [Task 1]
- After booking/driver-job changes, actively flag stale SQL, Vue components, helper functions, and select-option values that may need removal once the new flow settles instead of leaving legacy debris hidden nearby [ad-hoc note]
- If a Booking Management/report view already exposes the same record workflow, do not recreate a second CRUD module just to surface one more column or action; extend the existing booking path first [Task 3] [ad-hoc note]
- If a new Vben table column is inserted but summary totals, action cells, checkboxes, or horizontal scrolling shift out of place, treat it as an incomplete table-structure update rather than a styling-only bug [Task 3] [ad-hoc note]
- If a reused Vben CRUD drawer reopens in the old scroll position or restores stale nested booking content, treat it as an incomplete reset flow: add scroll reset on open/opened/post-mount, and clear persisted mount state on close for booking-launched drawers [Task 3] [ad-hoc note]
- If new admin CRUD work mixes legacy `deleted_at` tables with newer `isDelete` tables, do not assume the soft-delete predicate is interchangeable; align query filters, uniqueness checks, and delete mutations to the table's actual convention before debugging UI symptoms [ad-hoc note]
- If UI says a slug is available but submit still fails with a unique constraint like `uq_news_project_slug_en`, suspect old DB uniqueness drift first: drop the stale full-table slug/title constraint/index and recreate partial unique indexes with `WHERE deleted_at IS NULL` instead of defaulting to `_del` or random suffix mutation on deleted rows [ad-hoc note]
- If a verification command like `git diff` fails because the shell is outside an initialized repo, switch to direct file reads or move to the repo root before using git for evidence [Task 1]
- The work was paused before a full build/test pass; on resume, run a focused verification on both booking-side and driver-job-side flows before calling the task complete [Task 2]

# Task Group: VIPBillion website localhost startup and PHP front-controller debugging
scope: Use when the user wants `website-vipbillion` running on localhost or wants a quick diagnosis for why the PHP site on `127.0.0.1:8000` stopped responding.
applies_to: cwd=\\?\C:\Users\user\Desktop\VIPBillion; reuse_rule=safe for `website-vipbillion` local PHP startup/debugging in this workspace while the site root, `index.php`, `router.php`, and current boot files remain the front-controller truth sources

## Task 1: Start `website-vipbillion` on `http://127.0.0.1:8000/` and diagnose startup failures, success

### rollout_summary_files

- rollout_summaries/2026-06-24T01-18-20-2Q66-vipbillion_codex_routing_localhost_and_duplicate_booking_gua.md (cwd=\\?\C:\Users\user\Desktop\VIPBillion, rollout_path=C:\Users\user\.codex\sessions\2026\06\24\rollout-2026-06-24T09-18-25-019ef734-e7c1-7690-beac-70590fe4c55a.jsonl, updated_at=2026-06-25T04:26:11+00:00, thread_id=019ef734-e7c1-7690-beac-70590fe4c55a, localhost launch/debug flow for the PHP website)

### keywords

- website-vipbillion, php -S 127.0.0.1:8000 index.php, php -S 127.0.0.1:8001 router.php, localhost:8000, router.php, session_start, scratch/sessions, sys_get_temp_dir, 500, homepage 200, seoData.php, lib/initData.php

## User preferences

- when the user clarified `that i want localhost this php website website-vipbillion` and wanted `http://127.0.0.1:8000/` -> use the PHP built-in server from the website root as the default local launch path [Task 1]
- when the user asked why it `suddenly stop` -> check whether the PHP process/listener is still running before assuming a code regression [Task 1]

## Reusable knowledge

- The reliable launch shape is from `C:\Users\user\Desktop\VIPBillion\website-vipbillion` with the front controller, not from a parent folder. The validated command shape here was `php -S 127.0.0.1:8000 index.php` from the website root [Task 1]
- `router.php` starts sessions and needed a writable fallback session directory on this Windows environment: prefer `scratch/sessions`, then `sys_get_temp_dir()` if needed [Task 1]
- The built-in PHP server is just a process. If localhost disappears, the likely first cause is that the shell or PHP process closed, not that the code changed [Task 1]
- The site boot path reads `seoData.php` and Supabase-backed data via `lib/initData.php`, so runtime 500s can also come from data/bootstrap failures after the server itself is running [Task 1]
- For VIPBillion website FIUU checkout work, follow the `htdocs_wiper` routing pattern: do not send checkout directly to `pg.e2pay.co.id`; build the payment redirect from the booking payload and send it to `pay.fiuu.com/RMS/pay/{merchantId}` with query parameters instead [ad-hoc note]
- Keep `returnipn.php?treq=0&sa=...` only on the return/result pages as the IPN acknowledgement step, not as the outbound checkout target [ad-hoc note]
- Convert VIPBillion booking data into the FIUU request shape when sending to FIUU, then map FIUU return/notify fields back into the booking data structure and update the booking row; keep this mapping internal to the website flow [ad-hoc note]
- Never extract or reuse merchant/verify/secret keys from another site; keep the project's own FIUU config values server-side and out of the booking form or client code [ad-hoc note]

## Failures and how to do differently

- The first localhost attempt returned `500` because PHP was started from the wrong working directory / bad front-controller context. Confirm the working directory first and launch from the website root [Task 1]
- A session temp-path issue showed up during CLI testing, but the functional localhost `200` fix was still starting PHP from the correct website root; keep root/launch context checks ahead of deeper debugging [Task 1]
- Heavy Windows process/network probes timed out during diagnosis; prefer lightweight process checks and direct localhost requests first [Task 1]
- If a VIPBillion FIUU integration tries to post the website checkout straight to `pg.e2pay.co.id` or exposes FIUU credential fields client-side, treat it as the wrong pattern: route through the website-side booking-payload mapper, use `pay.fiuu.com/RMS/pay/{merchantId}`, and keep secrets in project config only [ad-hoc note]

# Task Group: VIPBillion cross-project boot routing and knowledge capture
scope: Use when the user says `ai read .codex knowledge`, wants VIPBillion project routing decided automatically, or asks to preserve routing/knowledge-capture learnings for future runs across `website-vipbillion` and `admin-vipbillion`.
applies_to: cwd=\\?\C:\Users\user\Desktop\VIPBillion; reuse_rule=safe for VIPBillion route-first boot work in this workspace while both `website-vipbillion` and `admin-vipbillion` remain the active project split and `.codex` routing triggers stay unchanged

## Task 1: Read `.codex` knowledge and route VIPBillion work by project shape, success

### rollout_summary_files

- rollout_summaries/2026-07-08T04-32-07-uUUL-codex_boot_read_pulse_sentinel.md (cwd=\\?\C:\Users\user\Desktop\VIPBillion, rollout_path=C:\Users\user\.codex\sessions\2026\07\08\rollout-2026-07-08T12-32-12-019f3fff-5d23-7c01-9347-1d7d4523048f.jsonl, updated_at=2026-07-08T04:32:42+00:00, thread_id=019f3fff-5d23-7c01-9347-1d7d4523048f, repeated boot-read request confirmed the sentinel-only response path)
- rollout_summaries/2026-06-24T01-18-20-2Q66-vipbillion_codex_routing_localhost_and_duplicate_booking_gua.md (cwd=\\?\C:\Users\user\Desktop\VIPBillion, rollout_path=C:\Users\user\.codex\sessions\2026\06\24\rollout-2026-06-24T09-18-25-019ef734-e7c1-7690-beac-70590fe4c55a.jsonl, updated_at=2026-06-25T04:26:11+00:00, thread_id=019ef734-e7c1-7690-beac-70590fe4c55a, route-first boot read and VIPBillion project split)

### keywords

- ai read .codex knowledge, [🟢] Agent is Ready.., 00_PULSE.md, website-vipbillion, admin-vipbillion, claude-website, claude-app, CLAUDE.md, index.php, router.php, lib/initData.php, auto find solution, automatic run the skills or knowledge if needed

## User preferences

- when the user said `ai read .codex knowledge` and later asked to `capture all above request that i made and chat` -> treat boot/routing and memory capture as durable work worth preserving, not as one-off setup chatter [Task 1]
- when the user repeats `ai read .codex knowledge` after an aborted or failed earlier attempt -> treat it as a strict boot-read request and keep the response minimal/sentinel-only rather than turning it into an explanation [Task 1]
- when the user asked to `help me ai performance alot more` and to `automatic run the skills or knowledge if needed` -> proactively route to the right skill based on project shape without making the user restate the PHP-vs-admin distinction [Task 1]

## Reusable knowledge

- `ai read .codex knowledge` is a special trigger that should return the ready sentinel after the route-first boot read; do not replace it with a summary [Task 1]
- In this workspace, the boot read still starts at `C:\Users\user\.codex\00_PULSE.md`; hydrate once per chat session, then reuse that distilled route context instead of re-reading `.codex` on every message [Task 1]
- In this workspace, `website-vipbillion` is the PHP/Sovereign site and `admin-vipbillion` is the Vben/Vue admin monorepo. Route based on which tree the user names or opens [Task 1]
- The admin repo has its own `CLAUDE.md` conventions, while the website route is driven by PHP front-controller files like `index.php`, `router.php`, and `lib/initData.php` [Task 1]
- Related skill: skills/awake-skill-routing/SKILL.md

## Failures and how to do differently

- A cached skill-path probe failed because the path did not exist; locate cached skill copies dynamically rather than hardcoding plugin hashes or stale cache paths [Task 1]
- Do not answer `ai read .codex knowledge` with extra explanation or repeated re-reads after boot succeeds; return the sentinel, keep the route awake, and expand only if the user asks for more than the boot read [Task 1]
- When the request is about routing/knowledge capture rather than code changes, stop after extracting and storing reusable routing evidence instead of forcing an implementation task [Task 1]

# Task Group: Kushiro PHP API domain routing and upload endpoint swaps
scope: Use when the user wants Kushiro public/staging hostnames updated without breaking localhost, or when a PHP domain swap needs the real runtime touchpoints and verification path.
applies_to: cwd=\\?\C:\xampp\htdocs; reuse_rule=safe for Kushiro PHP API domain/config work in this checkout family while `api/KushiroBBQ`, `api/upload_receiver.php`, and the current deployment path conventions remain the truth sources

## Task 1: Update Kushiro API staging/production domains to `kushiro.my` while preserving localhost, success

### rollout_summary_files

- rollout_summaries/2026-06-18T10-09-14-L9so-kushiro_api_domain_swap_localhost_preserved.md (cwd=\\?\C:\xampp\htdocs, rollout_path=C:\Users\user\.codex\sessions\2026\06\18\rollout-2026-06-18T18-09-23-019eda34-cf7c-7a73-a898-44036512f0ac.jsonl, updated_at=2026-06-18T10:11:50+00:00, thread_id=019eda34-cf7c-7a73-a898-44036512f0ac, updated runtime domains and upload endpoints with localhost left intact)

### keywords

- KushiroBBQ, Config.php, Helper.php, upload_receiver.php, RedirectController.php, APP_ENV, localhost, kushiro.my, kushirobbq.com.my, CORS, cookieDomain, attachmentUrl, VPS_UPLOAD_URL, php -l, rg

## User preferences

- when the user said `dev is ok.. localhost.. but publish or staging are using kushiro.my this is my official website` -> preserve localhost behavior and only swap the published/staging hostnames the user named [Task 1]
- when the user clarified `for any kushirobbq.com.my better to help me update to kushiro.my` -> treat the old public host family as a bulk replacement target and do a sweep instead of editing a single file [Task 1]

## Reusable knowledge

- `api/KushiroBBQ/Config.php` holds the environment-specific URL/origin settings, and `APP_ENV` is read from `api/KushiroBBQ/.env` in `Helper.php` [Task 1]
- The real runtime touchpoints for this swap were `allowedOrigins`, `cookieDomain`, `domain`, `attachmentUrl`, `VPS_UPLOAD_URL`, `VPS_DOMAIN`, `VPS_SERVER_NAME`, host checks in `getCorporateIdByHost()`, `api/upload_receiver.php` public URL/path handling, and the default redirect link in `RedirectController.php` [Task 1]
- `php -l` on the touched PHP files was a fast verification step here, followed by a final workspace `rg` sweep to confirm no live runtime `kushirobbq` hostnames remained [Task 1]

## Failures and how to do differently

- The old domain was scattered across multiple files, so start with a workspace-wide `rg` sweep before patching instead of assuming one central config owns all public URLs [Task 1]
- The upload receiver path changed to `/home/zetagrp/public_html/kushiro.my/uploads/images/`; if uploads still fail after a domain swap, verify the real deployment folder before assuming the hostname edit was enough [Task 1]

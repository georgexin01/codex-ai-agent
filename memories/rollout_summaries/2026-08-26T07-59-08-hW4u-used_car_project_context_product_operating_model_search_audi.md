thread_id: 01a03d14-7cf8-7140-a996-b323c2e5e046
updated_at: 2026-08-26T11:02:31+00:00
rollout_path: C:\Users\user\.codex\sessions\2026\08\26\rollout-2026-08-26T15-59-08-01a03d14-7cf8-7140-a996-b323c2e5e046.jsonl
cwd: \\?\C:\Users\user\Desktop\used-car
git_branch: cars-second-half

# Used-Car project knowledge and product-operating-model rollout

Rollout context: Work occurred in `C:\Users\user\Desktop\used-car`, with supporting Codex files under `C:\Users\user\.codex`. The user wanted comprehensive project understanding, a durable project map, improved product/SEO/AI-search operating guidance, additional triggers, and an audit of actual search visibility.

## Task 1: Whole-project understanding and project context

Outcome: success

Preference signals:
- The user asked AI to “understand all my project” and explicitly said sample folders are “for reference only” -> future agents should distinguish current source evidence from visual references and avoid treating samples as live inventory or company facts.
- The user wanted “all possible information” documented for future AI sessions -> future agents should maintain a durable project handoff rather than repeatedly rediscovering routes, UX, data flow, and business purpose.

Key steps:
- Inspected `requirement.md`, `template/blueprint.md`, `HANDOFF-SECOND-HALF.md`, router, views, stores, services, SEO files, migration README, and generated output.
- Created `PROJECT_CONTEXT.md` as the project entry point and source-of-truth map.
- Documented confirmed product boundaries, route families, architecture, UX funnel, Supabase boundary, SEO/GEO implementation, and known drift.

Reusable knowledge:
- The app is a Malaysia-focused used-car buyer/dealer presentation PWA, not proven to be a rental app or Johor-specific business.
- Current routes and code support browsing, filtering, vehicle details, inspection, loan estimation, favourites, contact, bookings, articles, and multilingual `zh/en/ms` content.
- Important current drift includes README claiming `#root` while `index.html` has `#app`, placeholder canonical domain, absent `VITE_DATA_MODE` consumption, and archived client migrations differing from the authoritative external admin migrations.

References:
- `C:\Users\user\Desktop\used-car\PROJECT_CONTEXT.md`
- `template/src/router/index.ts`
- `template/src/composables/useSEO.ts`
- `template/src/sql/migrations/README.md`

## Task 2: Local search and AI visibility map

Outcome: success

Key steps:
- Created project-level `LOCAL-SEARCH-MAP.md` covering market evidence, multilingual audience segments, query intent, page-to-product links, article workflow, crawl/index/citation/visit/lead measurement, and an open evidence queue.
- Linked it from `PROJECT_CONTEXT.md` source-of-truth order.

Failures and how to do differently:
- Johor/Johor Bahru, legal identity, production domain, real address, inventory, search volume, and AI citations were not proven. Future agents must mark these `INSUFFICIENT DATA` until verified.

References:
- `LOCAL-SEARCH-MAP.md` is English-only, 181 lines, with zero CJK characters and zero trailing whitespace.

## Task 3: Product-development operating model improvement and trigger routing

Outcome: success

Key steps:
- Updated the canonical operating note with task modes (`inspect`, `research`, `plan`, `generate`, `audit`, `update`, `implement`, `verify`), a unified output contract, automation levels, stop conditions, qualitative decision scoring, and experiment records.
- Added trigger aliases such as `meta update`, `meta seo`, `ai research`, `ai google research`, `google research`, `bing research`, `gemini research`, `chatgpt search`, `ai search result`, `ai news generate`, `ai news articles generate`, `keyword catch`, `content gap research`, and `search visibility audit`.
- Removed the standalone `meta` trigger at the user’s request.
- Updated PULSE and MEMORY routing while keeping project-specific Johor/Used-Car facts out of global rules.

Validation:
- `quick_validate.py` reported `Skill is valid!`.
- PULSE route duplicate count was `0`; standalone `meta` was absent; `meta update` and `meta seo` remained.
- Relevant Codex files were English-only with zero CJK characters and zero trailing whitespace.

Failures and how to do differently:
- The first attempt added unsupported `triggers` frontmatter to the skill; the validator rejected it. Triggers belong in PULSE, while the skill contains explanatory routing text. Preserve this frontmatter constraint.
- The configured compression protocol and some router scripts were absent, so they could not be run.

References:
- `C:\Users\user\.codex\memories\extensions\ad_hoc\notes\2026-08-26-product-development-operating-model.md`
- `C:\Users\user\.codex\skills\product-development-operating-model\SKILL.md`
- `C:\Users\user\.codex\00_PULSE.md`

## Task 4: Read-only search visibility audit

Outcome: partial

Key steps:
- Ran the new `search visibility audit` workflow against source, route declarations, SSG route collection, SEO helpers, sitemap/robots generation, CTA tracking, generated `dist` HTML, and local HTTP responses.
- Local dev server returned HTTP 200 for `/`, `/home`, `/cars`, and `/news`.
- Existing generated pages contained page SEO, but `template/dist/robots.txt` and `template/dist/sitemap.xml` were absent in the inspected output.

Findings:
- SEO/SSG/Schema/CTA mechanisms exist, but production visibility is not proven.
- Generated canonical URLs still use `https://carmvp.example.my`.
- `useSEO.ts` emits `/zh...` and `/en...` alternates although explicit language-prefixed router routes were not found; this requires a deliberate URL strategy decision.
- Fallback dealer identity/address/contact data must not be treated as production SEO facts.
- Article-to-inventory linking is conditional on related inventory or filters.
- A dev-server 200 is only SPA-shell evidence; rendered SSG HTML and deployed crawler access must be checked separately.

Failures and how to do differently:
- One PowerShell HTML-inspection command failed due to quoting syntax; use safer quoting or separate variables for regex checks.
- Do not claim Google ranking, ChatGPT citation, or production crawlability from source comments or local dev responses.

Reusable knowledge:
- Correct verification chain: `source -> vite-ssg build -> preview server -> inspect rendered HTML -> inspect robots/sitemap -> production crawler check`.
- Current audit ratings were approximately SEO foundation `7.5/10`, AI-search readiness `6.5/10`, and production proof `INSUFFICIENT DATA`.

References:
- `template/scripts/generate-sitemap-robots.mjs`
- `template/src/sitemap/included-routes.ts`
- `template/dist/home.html`, `template/dist/news.html`
- Placeholder canonical: `https://carmvp.example.my`
- Missing inspected artifacts: `template/dist/robots.txt`, `template/dist/sitemap.xml`

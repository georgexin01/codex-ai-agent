---
name: meta-skills
description: Orchestrate complete, evidence-based public website and app metadata work across titles, descriptions, canonical URLs, Open Graph and Twitter cards, favicons, site.webmanifest, robots directives, robots.txt, sitemap.xml, JSON-LD, and search verification. Use when the user says "update meta skills", "use meta skills", "update website metadata", "full metadata audit", "apply metadata pack", or otherwise requests a comprehensive metadata or public-search update; exclude admin-panel-only metadata unless explicitly included.
---

# Website Metadata Pack

Use this skill as a front door. Do not duplicate or replace the canonical workflows.

## Required sources

1. Read [`../meta-content-workflow/SKILL.md`](../meta-content-workflow/SKILL.md) completely for route inventory, metadata content, asset truth, and verification.
2. Read [`../seo-ai-search/SKILL.md`](../seo-ai-search/SKILL.md) completely for indexing, crawler, sitemap, structured-data, SSR/SSG, and AI-search guardrails.
3. Read [`../../memories/archive/PWA_FAVICON_META_SETUP.md`](../../memories/archive/PWA_FAVICON_META_SETUP.md) (archived, wRider-project-scoped) only when favicon, Apple icon, PWA install, theme-color, or manifest creation is in scope. Reuse only generic asset and manifest guidance; do not copy its wRider brand, colors, routes, analytics query parameters, or project-specific defaults.
4. For current platform rules or validation links, read [`../seo-ai-search/references/platform-guidance.md`](../seo-ai-search/references/platform-guidance.md).

Current project files, rendered output, the two canonical skills above, and current official platform guidance outrank older recipes and examples.

## Execution workflow

1. Classify the request. For update/apply requests, implement and verify. For audit, review, explain, or plan requests, remain read-only.
2. Resolve the project root:
   - Prefer an explicit path from the user.
   - Otherwise start from the current working directory and inspect the nearest project instructions and runnable roots.
   - Identify public routes and metadata surfaces from current files such as `AGENTS.md`, `PROJECT_CONTEXT.md`, `package.json`, `composer.json`, `index.php`, route definitions, head partials, and public asset folders.
   - Do not scan unrelated drives. If multiple public projects remain equally plausible, inspect safely and ask before editing the wrong target.
3. Exclude admin panels, authenticated screens, private APIs, staging-only pages, duplicates, and error routes unless the user explicitly includes them.
4. Inventory every real public route or page family and its source file, title, description, canonical, robots state, H1, images, visible content, and data source.
5. Classify each route as production-indexable, non-production, private, duplicate, or error.
6. Plan per-page or per-family metadata before broad edits.
7. Apply the relevant surfaces in this order:
   - unique title, description, canonical, robots, viewport, H1, and image alt text;
   - Open Graph and Twitter/X title, description, URL, locale, image, and image alt;
   - favicon, Apple touch icon, application name, theme color, and `site.webmanifest` when real assets exist or creation is in scope;
   - root `robots.txt` and `sitemap.xml` using confirmed absolute production URLs;
   - truthful JSON-LD synchronized with visible content;
   - crawler and initial-HTML support, including SSR/SSG where the project requires it.
8. Create or update project-root `meta.md` only when work needs continuation across chats.
9. Read back changed files and run the smallest useful verification: syntax/lint/build, manifest and JSON parsing, sitemap XML validation, route-by-route HTTP, initial/rendered HTML checks, canonical/robots checks, asset/link checks, and structured-data validation where available.

## Safety and precedence

- Keep localhost, staging, private, duplicate, and error routes at `noindex, nofollow`.
- Do not switch a production site to `index, follow` unless public discovery is requested and the canonical production domain and deployment state are confirmed.
- Never invent brands, locations, services, social profiles, phone numbers, addresses, hours, reviews, ratings, prices, awards, verification tokens, production domains, or image URLs.
- Do not add meta `keywords`, fake AI files, arbitrary Microdata, hidden structured data, or duplicate keyword pages.
- Add `LocalBusiness`, `ContactPoint`, `sameAs`, reviews, ratings, and similar JSON-LD only when visible and verified.
- Preserve the mobile viewport `width=device-width, initial-scale=1.0, viewport-fit=cover`.
- Keep framework-specific implementation consistent with the current project instead of forcing PHP, Vue, React, PWA, or Supabase patterns onto another stack.
- Search eligibility does not guarantee crawling, indexing, ranking, rich results, or AI citation.

## Completion report

- Begin with the required `task | action | status` table.
- State the resolved project root and public-route scope.
- Report changed files, verification evidence, blocked confirmations, production-only actions, and intentionally untouched admin/private routes.
- If project-root selection, business facts, production domain, authentication, deployment, or external search-console state is unverified, state the exact limitation rather than claiming completion.

---
name: meta-content-workflow
description: Audit and update public website or app meta titles, descriptions, image alt text, canonical and crawler metadata, Open Graph/Twitter data, favicons, JSON-LD, itemprop, robots.txt, and sitemap content from current project evidence. Use when the user says metaTitle, meta title, meta content, SEO metadata, or pastes the metaTitle workflow for a website or app; do not use for admin-panel-only metadata.
---

# Meta Content Workflow

Use this skill after `.codex` boot when a user asks to improve public website or app metadata. Treat the live project as authoritative: inspect its routes, rendered/content sources, brand identity, assets, environment, and existing SEO implementation before writing anything. The pasted metaTitle workflow is a reusable contract, not a source of facts for a new project.

## Required workflow

1. Identify the actual website/app project root and read its project instructions. Exclude admin panels unless the user explicitly includes a public-facing route.
2. Inventory every real public route/page family, including static pages, listings, dynamic Supabase/API records, mock-data pages, error pages, and duplicate visual routes. Record the route, source file/component, current title, description, canonical, robots state, H1, images, and data source. Never assume the example's 20 PHP pages exist.
3. Separate indexable production pages from localhost, staging, authenticated, private, duplicate, and error routes. Use `noindex, nofollow` for non-production or non-indexable routes unless current project policy proves otherwise.
4. For each indexable page, produce a unique title and description based on visible content. Use the requested title shape when suitable:
   `A | B | C`
   - `A`: the page's service, product, news, article, or intent phrase; use the current record name for detail pages.
   - `B`: a truthful benefit/service plus location phrase appropriate to this project.
   - `C`: the confirmed primary company/app identity.
   Do not force the three-part pattern when it creates an unnatural, duplicate, or overlong title; explain the exception. Never carry KingsGuard, VIP Billion, Johor Bahru, or any other example fact into a new project without evidence.
5. Update only the project's existing metadata surface: PHP head partials, Vue head manager/static route map, app manifest, or equivalent. Keep title, description, canonical, Open Graph/Twitter values, visible H1/content, and JSON-LD synchronized. Use `en-MY`/`en_MY` only when the project and audience support it. Preserve the required mobile viewport: `width=device-width, initial-scale=1.0, viewport-fit=cover`.
6. Add or repair robots.txt and sitemap.xml only when their project/runtime location is known. Allow relevant public crawlers, including `OAI-SearchBot` when ChatGPT Search visibility is wanted, while protecting internal/private paths. Use absolute confirmed production canonical URLs; do not publish localhost or placeholder domains as production SEO values.
7. Add JSON-LD only for entities visibly represented and factually confirmed: `WebSite`, `Organization`, `WebPage`, `BreadcrumbList`, relevant `Service`, and `FAQPage` only for visible FAQs. Add `LocalBusiness`, `ContactPoint`, `sameAs`, reviews, ratings, address, hours, phone, prices, awards, and verification tokens only from current project evidence or explicit user confirmation. Itemprop Microdata is optional and should be added only when requested or already part of the project contract.
8. Use existing real social links and image assets only. Do not invent social accounts, Twitter/X handles, phone numbers, business facts, verification tokens, or image URLs. Add favicon/manifest links only for files that exist or are intentionally created in scope.
9. Create or update a project-root `meta.md` (or the project's established equivalent) as a progress checklist when the user wants continuation across chats. Track route inventory, completed metadata surfaces, pending confirmation items, verification evidence, and next step. Do not put secrets in it.
10. Read back changed files and verify with the smallest useful checks: route/page inventory, grep/read-back, PHP lint or TypeScript/build checks, rendered HTML/HTTP checks when a server is available, canonical/robots/sitemap checks, JSON-LD parsing, and broken-link checks where practical. Report unverified production-only actions separately; SEO improvements do not guarantee ranking, indexing, or AI citation.

## Output contract

- Begin with the required status table for non-sentinel work.
- State the discovered project root and public-route scope.
- Give a per-page or per-family metadata plan before broad edits.
- Preserve exact route names, component/file names, API fields, and user-provided title/company strings when they are confirmed contracts.
- Report changed files, verification evidence, blocked confirmations, intentionally untouched admin/private routes, and the safest next action.

## Guardrails

- Combine this skill with `skills/seo-ai-search/SKILL.md` for crawlability, structured-data, and AI-search guardrails.
- For Vue/Capacitor app metadata, respect the app's existing head manager, manifest, route map, and mobile rules. For PHP, inspect the real front-controller/template routing before editing.
- Public SEO work is evidence-bound. Use live web research only when explicitly requested or needed to verify current external platform guidance or a confirmed public identity; never use it to fill unknown business facts.
- Do not add `keywords`, fake AI files, fake reviews, unsupported ratings, arbitrary Microdata, or duplicate keyword pages.

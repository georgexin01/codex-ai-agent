---
name: meta-content-workflow
description: Audit and update public website or app meta titles, descriptions, image alt text, canonical and crawler metadata, Open Graph/Twitter data, favicons, JSON-LD, itemprop, robots.txt, and sitemap content from current project evidence. Use when the user says metaTitle, meta title, meta content, SEO metadata, or pastes the metaTitle workflow for a website or app; do not use for admin-panel-only metadata.
---

# Meta Content Workflow

Use this skill after `.codex` boot when a user asks to improve public website or app metadata. Treat the live project as authoritative: inspect its routes, rendered/content sources, brand identity, assets, environment, and existing SEO implementation before writing anything. The pasted metaTitle workflow is a reusable contract, not a source of facts for a new project.

## Required workflow

1. Identify the actual website/app project root and read its project instructions. Exclude admin panels unless the user explicitly includes a public-facing route.
2. Inventory every real public route/page family, including static pages, listings, dynamic Supabase/API records, mock-data pages, error pages, and duplicate visual routes. Record the route, source file/component, current title, description, canonical, robots state, H1, images, and data source. Never assume the example's 20 PHP pages exist.
3. Separate indexable production pages from localhost, staging, authenticated, private, duplicate, stale, and error routes. Keep development hosts non-indexable without adding production-wide indexing blocks. Use `noindex` only for routes that should not appear in search; keep those routes crawlable so the directive can be read.
4. For each indexable page, produce a unique title and description based on visible content. Preserve explicit title constraints. If the user says existing title wording must remain, keep every existing title word and add only useful words; leave an already-long title unchanged when additions would make it worse. Without a user title contract, prefer concise, descriptive titles. The optional shape
   `A | B | C`
   - `A`: the page's service, product, news, article, or intent phrase; use the current record name for detail pages.
   - `B`: a truthful benefit/service or relevant location, only if it adds value.
   - `C`: the confirmed primary company/app identity, usually once.
   Do not force the pattern when it creates an unnatural, duplicate, or overlong title. Never carry example project names or facts into another project.
5. Update only the project's existing metadata surface: PHP head partials, Vue head manager/static route map, app manifest, or equivalent. Keep title, description, canonical, Open Graph/Twitter values, visible H1/content, and JSON-LD aligned. Escape dynamic values for their output context. Preserve the required mobile viewport: `width=device-width, initial-scale=1.0, viewport-fit=cover`.
6. Add or repair root `robots.txt` and `sitemap.xml` only when their runtime location and production domain are confirmed. Allow intended public crawlers, including `OAI-SearchBot` when ChatGPT Search visibility is wanted. `robots.txt` controls crawling, not security or guaranteed de-indexing. Use absolute canonical URLs; omit localhost, query variants, errors, `noindex` pages, and unreachable templates from sitemaps. Do not fabricate `lastmod` dates.
7. Add or repair JSON-LD only for visible, confirmed entities: `WebSite`, `Organization`, `WebPage`, `BreadcrumbList`, relevant `Service`, and `FAQPage` only for visible FAQs. Extend valid existing JSON-LD instead of duplicating it. Add `LocalBusiness`, `ContactPoint`, `sameAs`, reviews, ratings, addresses, hours, phone numbers, prices, awards, or verification tokens only from current evidence or explicit confirmation. Microdata (`itemscope`/`itemprop`) is optional; do not duplicate an accurate JSON-LD graph.
8. Use existing real social links and image assets only. Write `alt` text to describe the image's actual informative content and context; use empty alt for decorative images. Do not keyword-stuff alt text. Verify all favicon and manifest icon paths, names, and MIME types against existing files before changing them.
9. Create or update a project-root `meta.md` (or the project's established equivalent) only when the user wants continuation across chats. Track route inventory, completed surfaces, pending confirmation items, verification evidence, and next step. Do not put secrets in it.
10. Read back changed files and verify the smallest useful checks: route/page inventory, title constraint, descriptions, PHP lint/build, rendered HTML/HTTP status, canonical/robots/sitemap, manifest JSON and icons, JSON-LD parsing, and broken links where practical. Report unverified production-only actions separately; metadata cannot guarantee ranking, indexing, rich results, or AI citation.

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

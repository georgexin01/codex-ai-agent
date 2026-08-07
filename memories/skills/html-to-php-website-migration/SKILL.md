---
name: html-to-php-website-migration
description: Use when migrating copied HTML/reference pages into reusable PHP templates, front-controller routes, shared includes, local assets, data-driven catalog pages, or when verifying an HTML-to-PHP website transition.
---

# HTML-to-PHP Website Migration

Use this skill for replica-style marketing, storefront, and content websites that are moving from copied `.html` pages to a reusable PHP shell. Preserve the requested visual source structure while making routes, assets, data, and behavior truthful to the target project.

## When to use

Use when the request mentions HTML-to-PHP conversion, a copied/reference storefront, shared PHP includes, extensionless PHP routes, or verification of an existing PHP migration.

Do not use for a purely static visual tweak that does not change routes/templates, or as permission to copy source-site APIs, analytics, legal identity, or vendor integrations.

## Inputs / context to gather

1. Read the current project context/knowledge and status documentation, plus the target shell and the chosen reference source.
2. Identify the public routes, runtime/server model, and whether Apache or a mobile WebView is actually in scope.
3. Inventory current local assets, data sources, shared fragments, and the exact user-requested content boundary before changing templates.

## Workflow

1. Read the project context/knowledge file, current status file, and the chosen reference shell. Prefer current files and runtime evidence over old notes.
2. Inventory the source page before editing: section order, shared header/footer/head/body fragments, route links, CSS/JS imports, images/fonts, embedded data, external endpoints, copied router/i18n blocks, and body classes.
3. Clone the complete source shell first. Then replace only content the user excludes or owns; do not rebuild a partial page from memory.
4. Establish the PHP contract:
   - `index.php` or a documented front controller dispatches public extensionless routes.
   - `router.php` supports the local PHP server; `.htaccess` is checked separately for Apache.
   - `lib/` contains reusable `initData`, `htmlhead`, `header`, `footer`, and `htmlBody` fragments.
   - `template/` contains page-specific PHP.
   - `css/`, `js/`, `assets/`, and `data/` are project-owned resource boundaries.
5. Normalize every active local import to `/assets/...`, `/css/...`, `/js/...`, or `/data/...`. Remove stale `.html`/`.php` paths and copied external source URLs from active controls.
6. Move reusable behavior into shared CSS/JS. Keep page-specific selectors isolated. Preserve body classes, title/description, canonical data, and JSON-LD only when they describe the target site truthfully.
7. Put repeated content in PHP arrays or project JSON and render it through one template. For products, validate count, IDs, slugs, prices/status, category fields, and every image path before adding UI.
8. Make interactions explicit: buttons need a real implementation, an accessible coming-soon state, or removal. For drag sliders, use pointer capture, release/cancel cleanup, click suppression after movement, passive images, and keyboard/arrow alternatives.
9. Verify proportional to the change:
   - `php -l` for every PHP file;
   - `node --check` for changed JavaScript;
   - HTTP 200 for pages and local assets plus expected 404s and redirects;
   - JSON/catalog count, unique ID/slug, and local-media audit;
   - browser DOM/runtime checks for modals, filters, sliders, accordions, and detail navigation;
   - same-viewport reference/target screenshots at desktop and mobile widths;
   - Apache and Android/iOS WebView checks when those deployments are in scope.
10. Update the project status with changed files, evidence, open blockers, intentionally untouched areas, and the safest next action. Promote only durable, repeatable rules to the project knowledge file.

## Efficiency plan

1. Inventory one complete reference shell before editing rather than repeatedly rediscovering header/footer/import behavior.
2. Reuse shared fragments and one data-rendering path; validate record/media counts before building UI around them.
3. Run syntax and route checks early, then reserve screenshots, browser interactions, Apache, and mobile gates for changes where they apply.
4. Stop and report a boundary when a requested claim, external endpoint, deployment target, or product fact has no project evidence.

## Guardrails

- Treat copied websites as visual/content references, not as a source of target APIs, analytics, vendor routes, locale blocks, credentials, or legal identity.
- Do not copy `window.router`, i18n placeholders, reciprocal `hreflang`, analytics, or external CMS endpoints unless matching target behavior and routes exist.
- Keep product category names and taxonomy data-owned. Name-based inference is a temporary implementation fallback and must be labeled as such.
- Never invent ratings, reviews, color counts, discounts, category names, legal claims, contact details, or structured-data facts absent from project evidence.
- Escape product fields and allowlist any stored HTML. Do not pass unrestricted catalog/CMS markup into the page.
- Keep all external media downloads inside the project asset boundary and record missing/fallback results.
- Do not claim pixel-perfect, Apache, or mobile-platform success from static inspection or PHP built-in-server checks alone.
- Keep `knowledge.md` concise and current; keep chronological evidence in `status.md`; preserve unique historical facts rather than deleting them to shorten a document.

## Fast acceptance checklist

- [ ] Shared PHP shell is used by the new page.
- [ ] Public route and 404 behavior are verified.
- [ ] All active local imports resolve from the target root.
- [ ] No stale copied router/i18n/hreflang/vendor endpoints remain in active UI.
- [ ] Dynamic records and media pass count/uniqueness/existence checks.
- [ ] Visible controls have truthful behavior and accessible states.
- [ ] Desktop/mobile visual comparison and relevant platform gates are recorded.
- [ ] `knowledge.md` and `status.md` reflect the verified current state.

---
name: template-to-php-project
description: "High-priority workflow for copying a downloaded HTML template into a PHP website. Activate for copy/duplicate template pages, HTML-to-PHP conversion, or requests for shared htmlHead/header/footer/htmlBody widgets; inventory pages, preserve the selected source, and verify the result."
metadata:
  short-description: "Faithful HTML-template to PHP workflow"
  priority: high
---

# Template-to-PHP Project Workflow

Use this skill when a user starts a PHP website from a downloaded HTML template, provides an empty target folder, and asks for pages, assets, routing, and/or `lib/template` PHP structure to be copied or duplicated.

The goal is a verified conversion that follows the user's requested fidelity and PHP composition contract. Do not silently redesign, rewrite template copy, inject company facts, or choose a different homepage variant.

## Activation and first checkpoint

Activate automatically for requests such as "copy project template", "duplicate the HTML pages into PHP", "convert this downloaded template to my new PHP website", "start website-edsb from downloaded-template", "HTML template to PHP", or equivalent wording. This is a high-priority route: when a downloaded template and a PHP target are both present, load this workflow before generic PHP guidance. Before editing:

1. Identify the active project root, the downloaded-template folder, and the target website folder.
2. Read the project `AGENTS.md`, existing `README.md`/`BLUEPRINT.md`, and any user-provided reference PHP projects.
3. Inventory the source HTML pages, asset folders, CSS, JavaScript, fonts, and existing target files.
4. Record the user's exact homepage choice. A filename such as `index-white-5.html` is authoritative when provided; do not substitute `index.html` or another variant.
5. Classify source files into the selected homepage, reusable inner pages, alternate homepage variants, utility pages, and unsupported/demo pages.

Do not overwrite an existing target until the requested source-to-target map and composition contract are clear. If the user has explicitly ordered the conversion, proceed with that map and report any intentional deletions or retired routes.

## Study reference PHP projects correctly

When examples such as GenieSkinBeauty or VIPBillion are supplied, study their current files before copying a structure:

- `index.php`: front-controller boot and route registration.
- `router.php`: clean-path handling, static-file bypass, and 404 behavior.
- `lib/`: `header.php`, `footer.php`, `htmlHead.php`/`htmlhead.php`, `htmlBody.php`, `initData.php`, language/config helpers, and their exact output boundaries.
- `template/` or `template/pages/`: whether each page owns a complete document or only a body fragment.
- project documentation: route names, page ownership, and known verification commands.

Copy structural lessons only. Never copy reference-project brand facts, client names, credentials, database rows, or content into the new project.

## Choose the composition contract explicitly

There are two valid modes. The newest explicit user instruction wins when they conflict.

### Mode A: standalone template-fidelity pages

Use this when the user says the page should be copied directly, all template head/body/header/footer/scripts should remain, content should stay hardcoded, or the template should look unchanged.

- Copy the complete source document into a `.php` page: doctype, `<html>`, `<head>`, `<body>`, header, footer, every section/div, styles, imports, scripts, and hardcoded text.
- Keep the source classes, IDs, AOS attributes, data attributes, DOM nesting, and generic template copy.
- Do not wrap the page with `htmlHead.php`, `header.php`, `footer.php`, or `htmlBody.php`; that would duplicate or replace the source document.
- Do not create `template/converted/` wrappers or use `require __DIR__ . '/../pages/...';` when the user requests page-owned content.
- Perform only mechanical corrections: local asset paths, clearly broken relative URLs, and navigation targets that must reach the new PHP routes.

### Mode B: modular PHP pages

Use this only when the user asks for shared PHP widgets or the reference project's modular composition:

- Keep page-owned complete content in the page file, with shared widgets around it in the order established by the reference project.
- Separate document head/opening body, header, footer, bottom scripts/closing tags, and initialization data according to the studied boundaries.
- Never put the header inside `htmlBody.php`, put scripts inside the footer when the reference separates them, or make a page a thin wrapper around another page when the user requested full page content.
- Preserve the exact casing of existing widget filenames on case-sensitive hosting.

For the user's preferred modular contract, keep the complete downloaded-template body sections and hardcoded markup in each page file, but centralize repeated shell code as follows:

- `lib/htmlHead.php`: doctype, `<html>`, metadata, shared stylesheet imports, schema, and opening `<body>`.
- `lib/bodyStart.php` (or the project's equivalent body-start widget): repeated preloader, magic cursor, overlay, toast, back-to-top, off-canvas, floating contact button, and similar controls. Do not duplicate these blocks in every page.
- `lib/header.php` and `lib/footer.php`: shared navigation and footer only.
- `lib/htmlBody.php`: common bottom scripts, custom JavaScript import, and closing `</body></html>`.
- `css/style.css` and `js/main.js`: project-owned CSS/JavaScript overrides; import them from the shared shell instead of adding per-page copies.

Never make a page a thin `require __DIR__ . '/../pages/home.php';` wrapper when the user asks for full page content. A page should contain its own copied body sections, while only the shared shell is required. Promote a CTA, contact form, card grid, or other section to a widget only after an inventory confirms the markup/behavior is genuinely reused on multiple active pages; preserve one-off sections in their page.

If a user asks for both "copy all template head/body/header/footer exactly" and "use shared widgets", treat the full source document as the page contract and create reusable widgets only when they can remain unused/reference-only without changing that document. Explain the boundary in `BLUEPRINT.md`.

## Copy and route pages one by one

Create a conversion map before or during implementation. It should record:

| Source | Target | Route | Decision |
|---|---|---|---|
| selected homepage HTML | `template/pages/home.php` or equivalent | `/` | authoritative homepage |
| inner HTML page | matching `.php` page | clean route | copied or modularized |
| alternate homepage | usually none | none | skipped unless requested |
| utility/unsupported page | explicit decision | 404/omitted | never silently published |

For each selected page:

1. Copy its full source content into the target PHP file.
2. Preserve page-specific CSS imports, JavaScript imports, inline scripts, styles, header, footer, sections, and hardcoded text.
3. Change `assets/...` to the target's verified asset base path, such as `/assets/...`, only when required by the new route depth.
4. Map template `.html` links to the new clean PHP routes. Map skipped homepage variants to the one approved homepage only when those links are genuinely navigation links.
5. Leave forms, demo links, placeholder copy, external URLs, and template behavior unchanged unless the user explicitly asks for functional replacement.
6. Read back the written file and check that it is still a complete document.

For modular pages, read back the page and shared shell together: the page must contain its body content without a duplicate doctype/head/bottom-script shell, and each page must import each shared shell boundary exactly once.

Copy the template asset tree 1:1 before changing page paths. Report missing files rather than silently substituting generated or competitor imagery. Do not download or reuse competitor assets unless the user explicitly authorizes that exact use and the project's provenance rules permit it.

## Content and scope boundary

When the user says "do not update data yet" or "keep it hardcoded":

- Do not research or inject the client's original website facts.
- Do not translate, rewrite, modernize, or replace generic template copy.
- Do not invent company names, emails, phone numbers, locations, testimonials, metrics, team identities, portfolio claims, or video URLs.
- Do not remove generic template sections merely because they are generic; preserve them in fidelity mode.
- Keep competitor research, business content, and later redesign work outside this conversion pass.

Only begin content replacement after the user makes it a separate explicit request.

## Documentation to leave behind

Update the target project's `README.md` or `BLUEPRINT.md` with:

- selected homepage source and skipped variants;
- source-to-target page and route map;
- standalone versus modular composition decision;
- asset-copy and path rules;
- reference projects studied, without copying their facts;
- known demo/placeholder behavior;
- verification results and the next safe action.

Keep this documentation factual. It must not claim that a page is EDSB/company-specific when the page still contains template copy.

## Verification gate

Before reporting completion, run the smallest checks that prove the requested result:

- `php -l` on every target `.php` file.
- HTTP checks for every selected English route, the requested language aliases if present, assets, `robots.txt`, and `sitemap.xml`.
- A real 404 check for an unknown route and any intentionally retired route.
- Internal `href`, `src`, `data-src`, and background-image checks; every local reference must resolve.
- No unintended remaining `.html` navigation targets after route conversion.
- Full-document checks: doctype, head, body, closing tags, and balanced `div`/`section` pairs.
- Source-content check: in standalone mode, copied pages must not include shared widgets or injected project data.
- UTF-8 scan for replacement characters and literal `???` runs when non-ASCII content exists.
- For media collection or optimization, deduplicate responsive variants by content, keep the highest useful source no larger than 1600px on either dimension and under 1MB when the user specifies that limit, and record source/page/title/license notes in a provenance Markdown file.
- For shared-shell conversions, scan rendered HTML for duplicate preloader, overlay, cursor, back-to-top, off-canvas, WhatsApp/contact, and common script blocks; each shared control should render once.
- Browser desktop/mobile inspection when browser access is available; otherwise report visual sign-off as pending.

Do not call the work complete from file copying alone. Report completed, partially verified/blocked, intentionally unchanged, and the next safest action separately.

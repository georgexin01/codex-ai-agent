---
name: html-to-php-website-workflow
description: Reusable lessons from the motorcycle project for converting copied HTML/reference storefront pages into verified PHP sites.
triggers: ["HTML to PHP", "PHP website migration", "replica website PHP", "shared PHP includes", "extensionless PHP routes"]
---

# HTML-to-PHP website workflow promotion

- Prefer the current project shell and runtime evidence over copied source assumptions.
- Clone the complete reference shell first, then migrate through `index.php`/`router.php`, shared `lib/` fragments, `template/`, and project-owned `css/`, `js/`, `assets/`, and `data/` boundaries.
- Normalize active imports to `/assets`, `/css`, `/js`, and `/data`; remove stale external `window.router`, i18n, hreflang, analytics, and vendor endpoints unless the target implements them.
- Validate PHP/JS syntax, route matrix, expected 404s, JSON/catalog counts, duplicate-safe slugs, local media, browser interactions, and relevant mobile/Apache gates.
- Keep taxonomy data-owned, escape dynamic fields, allowlist stored HTML, and never invent product or legal metadata.
- Make every visible control truthful and record durable rules in project knowledge while keeping chronological evidence in status documentation.

Reusable skill: `memories/skills/html-to-php-website-migration/SKILL.md`.

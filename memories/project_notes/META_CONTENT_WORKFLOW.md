---
name: meta-content-workflow-route
title: Public website and app meta content workflow
description: Route for evidence-based metaTitle, SEO metadata, crawlability, and structured-data updates.
aliases: [metaTitle, meta title, meta content, SEO metadata, public page metadata]
triggers: [metaTitle update, meta title update, update meta content, SEO meta audit]
priority: high
contains: [public route inventory, A|B|C title formula, descriptions, alt text, canonical, robots, sitemap, Open Graph, Twitter, JSON-LD, itemprop, meta.md progress]
related_skills: [skills/meta-content-workflow/SKILL.md, skills/seo-ai-search/SKILL.md]
use_when: User boots .codex and then asks to apply the pasted metaTitle workflow to a website or app project.
do_not_use_when: Admin-panel-only metadata, invented business facts, or unrelated code work.
verification: Read back changed files and run the nearest lint, build, HTTP, route, structured-data, robots, and sitemap checks.
status: authoritative
---

# Meta content route

After `ai read .codex knowledge`, route a request containing `metaTitle`, `meta title`, `meta content`, or the pasted workflow to `skills/meta-content-workflow/SKILL.md`, together with `skills/seo-ai-search/SKILL.md` when public search behavior is in scope.

The skill must inspect the current project's real public routes and content before editing. Apply the `A | B | C` title pattern only when natural and evidence-supported: page intent or record name, truthful benefit/service plus location, and the confirmed primary identity. Examples in the user's workflow (KingsGuard, VIP Billion, car services, Johor Bahru) are not portable facts.

Keep public website/app work separate from admin panels. Generate unique page metadata, synchronized visible content and structured data, truthful crawler/social/sitemap values, and a project-root `meta.md` progress checklist when continuation is needed. Never invent social URLs, handles, contact details, reviews, ratings, verification tokens, or production domains.

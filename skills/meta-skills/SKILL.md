---
name: meta-skills
description: Audit and improve public website metadata from current project evidence while preserving user title constraints and avoiding unnecessary rewrites.
metadata:
  short-description: Evidence-based public website metadata audit
---

# Public Metadata Audit

Use this skill for public website or app metadata audits and improvements. Inspect current source and runtime first. Treat existing metadata as adequate when it is accurate, unique, complete, and verified; change only evidence-backed gaps.

## Titles

- Give every indexable page a distinct, descriptive title that matches its visible topic and primary intent.
- Follow explicit title-preservation instructions. When the user says to retain existing title wording, preserve every existing word and add only when useful. If additions would make a title too long or repetitive, leave it unchanged and report why.
- Do not require a fixed `A | B | C` structure or an exact keyword count. Use a short brand label once when it helps identify the site.
- Avoid keyword stuffing, repeated boilerplate, unsupported claims, and prices that may change.

## Descriptions

- Write a distinct, accurate summary for each important page from its visible content.
- Keep descriptions concise and useful; there is no universal character maximum. A rough 120–160 character draft can be a starting point, not a pass/fail rule.
- Do not add unsupported prices, locations, capabilities, rankings, reviews, or trust claims.

## Audit and update workflow

1. Confirm the project root, instructions, production identity/domain, metadata owner, route table, templates/generators, and available runtime.
2. Inventory real public routes and route families. Record each route's source, title, description, canonical, robots state, H1, image alternatives, structured data, and data dependencies. Exclude unreachable templates, private routes, errors, and query variants from indexable route inventories.
3. Classify pages as indexable, non-indexable, stale, duplicate, or blocked using current content and production state. Do not infer that a route is public or indexable from a template filename alone.
4. Check page titles, descriptions, visible headings, image `alt`, canonical URLs, robots directives, Open Graph/Twitter data, favicons, web manifests, JSON-LD, `robots.txt`, sitemap, and HTTP status.
5. Preserve valid existing implementation. Fill or correct only gaps; do not add duplicate Microdata when accurate JSON-LD already represents the same entity. Do not add `meta keywords`, fake AI files, fake reviews, arbitrary Microdata, or duplicate keyword pages.
6. Use confirmed production canonical URLs. Remove query strings and fragments from canonical URLs. Keep localhost and staging non-indexable without changing production indexing behavior.
7. Build sitemap entries only from canonical, public, indexable routes that resolve successfully. Exclude errors, unrouted templates, query variants, and pages marked `noindex`. Omit `lastmod` unless a reliable content-change date exists. Reference the sitemap from root `robots.txt`.
8. Add JSON-LD only for entities and facts visible on the site. Prefer a small, accurate `WebSite`/`Organization` setup; use `LocalBusiness`, contact details, social profiles, reviews, ratings, hours, addresses, or prices only when confirmed. Add `FAQPage` only for visible FAQs.
9. Check manifest and favicon paths against real files before editing. Do not create a manifest just for SEO; update an existing manifest only when its installability and project identity are supported.
10. Read back changed files and verify page/source coverage, title wording constraints, description usefulness, canonical and robot output, XML validity, manifest JSON and icon paths, JSON-LD parsing, PHP/build checks, and representative HTTP responses. Report failed or production-only checks.

## Research and claims

- Re-check current official search-engine documentation for changing platform behavior. Use primary sources such as Google Search Central and platform-owner guidance.
- Structured data, sitemaps, metadata, and crawler access can help search engines interpret or discover a site; none guarantees rankings, indexing, rich results, traffic, or AI citations.
- Metadata does not replace useful visible page content or a healthy HTTP response.

## Scope boundary

This skill does not authorize production deployment, Search Console submission, external profile edits, or publication. Preserve article-owned metadata when those routes are excluded by the user or project contract. Mark missing evidence as `INSUFFICIENT DATA`.

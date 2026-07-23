---
name: seo-ai-metadata-auto-checklist
title: SEO, AI Search and Metadata Auto Checklist
description: "Reusable checklist for public PHP, HTML and web-app pages: metadata, robots, sitemap, JSON-LD, Microdata compatibility, social identity and search verification."
aliases:
  - SEO metadata checklist
  - AI search metadata
  - website meta update
  - robots JSON-LD setup
triggers:
  - website SEO
  - meta SEO
  - AI search visibility
  - robots.txt
  - JSON-LD
  - itemprop
  - Google Search Console
priority: high
version: 1.0
status: reusable-reference
applies_to:
  - public PHP websites
  - public HTML websites
  - public SSR/SSG web-app routes
source_of_truth:
  - current project files and rendered HTTP output
  - skills/seo-ai-search/SKILL.md
  - official platform documentation
related_skills:
  - skills/seo-ai-search/SKILL.md
  - skills/design/website/SKILL.md
  - skills/claude-website/SKILL.md
use_when:
  - building or updating a public website or public web-app route
  - writing or auditing title, description, robots, Open Graph, Twitter or JSON-LD metadata
  - preparing Google, Bing or ChatGPT Search crawlability
do_not_use_when:
  - authenticated/private application screens
  - staging or localhost pages that must remain non-indexable
  - business facts, branches, reviews, prices or claims are unverified
---

# Purpose

For public pages, automatically inspect and prepare a complete search-discoverability layer. Do not promise rankings, indexing or AI citation. Google AI features use normal SEO foundations; there is no special AI-only tag or file.

# Automatic workflow

1. Inventory real public routes and collapse visual duplicates into one canonical content family.
2. Classify each route as public indexable, duplicate/noindex, private/noindex or error.
3. Create unique page title, description, canonical, H1, visible answer content, image alt text and internal links.
4. Add production robots preview controls only when the real public domain is confirmed:
   `index, follow, max-snippet:-1, max-image-preview:large, max-video-preview:-1`.
5. Keep localhost/staging at `noindex, nofollow`.
6. Add root `robots.txt` with public crawl permission, protected internal paths and an absolute sitemap URL. Permit relevant Googlebot, Bingbot and OAI-SearchBot access; never expose private routes.
7. Add JSON-LD only for visible, truthful entities: Organization, WebSite, WebPage, LocalBusiness, ContactPoint, Service, BreadcrumbList, Article and FAQPage when applicable.
8. Use Microdata/itemprop only when requested or required for compatibility. Keep it small, visible-content-backed and consistent with JSON-LD; never generate arbitrary properties to reach a number.
9. Add Open Graph and Twitter metadata using absolute URLs. Add confirmed social identities through visible links and JSON-LD `sameAs`.
10. Add favicon, manifest, sitemap and verification placeholders only when real values/assets exist.
11. Validate PHP/HTML, HTTP status, canonical URLs, robots, sitemap XML, JSON-LD parsing, links and initial rendered HTML.
12. Separate AI-completable code/content work from user-only production actions: domain/DNS verification, Search Console ownership, real social URLs, correct branch facts, genuine reviews, live prices and legal approval.

# Safe baseline metadata

```html
<meta name="robots" content="index, follow, max-snippet:-1, max-image-preview:large, max-video-preview:-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0, viewport-fit=cover">
<meta name="theme-color" content="#1c63b8">
<meta name="referrer" content="strict-origin-when-cross-origin">
```

Localhost/staging:

```html
<meta name="robots" content="noindex, nofollow">
```

# Robots baseline

```txt
User-agent: *
Allow: /
Disallow: /lib/
Disallow: /template/

User-agent: Googlebot
Allow: /

User-agent: Bingbot
Allow: /

User-agent: OAI-SearchBot
Allow: /

Sitemap: https://PRIMARY-CONFIRMED-DOMAIN.example/sitemap.xml
```

# Metadata families

Required per indexable page: unique `title`, `description`, `robots`, canonical, viewport, H1, visible useful content and internal links.

Open Graph: `og:type`, `og:site_name`, `og:title`, `og:description`, `og:url`, `og:locale`, `og:image`, `og:image:alt`; add actual image type/dimensions only after checking the asset.

Twitter/X: `twitter:card`, `twitter:title`, `twitter:description`, `twitter:url`, `twitter:image`, `twitter:image:alt`; add `twitter:site`/`twitter:creator` only for a confirmed account.

Social: WhatsApp is a contact link/ContactPoint, not a special meta tag. Facebook, Instagram, TikTok, YouTube, Telegram, X, LinkedIn and Reddit belong in visible links and JSON-LD `sameAs` only when officially confirmed.

Do not add `itemprop` Microdata, Angular metadata, `keywords`, AI.txt, fake verification tokens, fake social URLs, fake reviews or unsupported ratings unless a real project requirement proves they are needed. If itemprop is requested, use `WebPage` on public pages and `Service`, `Article`, `FAQPage`, `BreadcrumbList` or `LocalBusiness` only where the visible content supports it.

# Canonical page-family model

Keep every required PHP file, but do not write duplicate SEO content for visual variants. Use one canonical identity for each family:

1. Home `/`
2. About `/about`
3. Contact `/contact`
4. FAQ `/faq`
5. Portfolio `/portfolio` (portfolio variants share or redirect to this family)
6. Portfolio project detail `/project-detail`
7. Services `/services`
8. Car Tinting `/services/air-conditioning`
9. Car Coating `/services/belt-and-hoses`
10. Paint Protection Film `/services/brake-repair`
11. Car Detailing `/services/engine-diagnostics`
12. Car Polish and Wax `/services/lube-oil-and-filter`
13. Car Wrapping `/services/tire-and-wheel-services`
14. Our Team `/our-team`
15. Blog `/blog` (grid/listing/masonry variants share this family)
16. Blog Article `/blog/article`
17. News `/news`
18. News Article `/news/article`
19. Privacy Policy `/privacy-policy`
20. Terms and Conditions `/terms-and-conditions`

Keep `404.php` as a functional error route with `noindex, nofollow`; do not treat it as an indexable SEO page. Keep icon-reference pages out of the sitemap and normally `noindex` them.

# Business and legal safeguards

Before LocalBusiness JSON-LD, confirm the official name, main address, active branches, phone, email, hours, service area, social profiles, warranty, technical claims and current prices. Do not merge conflicting reference-site addresses. AI may draft Privacy Policy and Terms pages, but the business owner must review and approve them.

# Verification handoff

After public deployment, the user must verify Search Console ownership, submit `https://PRIMARY-CONFIRMED-DOMAIN.example/sitemap.xml`, inspect important URLs, request indexing and maintain the Google Business Profile. Report these as pending until externally verified.

# Completion evidence

Report changed files, route inventory, titles/descriptions, robots/sitemap output, canonical checks, JSON-LD/Microdata validation, PHP/HTML lint, HTTP status, broken links, remaining unverified facts and production-only steps.

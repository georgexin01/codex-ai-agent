---
name: seo-ai-search
description: Build and audit crawlable, citation-ready SEO for Google Search, Google AI features, Bing, ChatGPT Search, and other answer engines. Use for robots/indexing, Vue SSR/SSG metadata, sitemaps, canonical URLs, JSON-LD, local search pages, answer blocks, and search verification.
---

# SEO and AI-search implementation

Use this skill for public-search discoverability work. Treat current platform documentation and live HTTP output as the source of truth.

## Core truth

- There is no special AI-only markup, “AI file,” or guaranteed ranking switch.
- Google AI Overviews and AI Mode use the same foundational SEO requirements: crawlable, indexable pages, useful people-first content, internal links, textual content, strong page experience, and structured data that matches visible content.
- ChatGPT Search can use public sites when `OAI-SearchBot` is not blocked. A page may still be surfaced by title/link only if its content is disallowed.
- Eligibility never guarantees crawling, indexing, ranking, citation, or inclusion in an answer.

## Workflow

1. Inventory every public route and classify it as static, listing family, or record detail. Keep canonical URLs stable and avoid duplicate route variants.
2. Check the production HTTP response, `robots.txt`, `sitemap.xml`, canonical tags, robots meta/header, and whether important text is present in initial HTML. Prefer SSR/SSG for public content; do not rely on client-only fetches for critical copy.
3. Give each indexable page a unique title, description, canonical URL, H1, useful H2/H3 sections, descriptive links, image alt text, and Open Graph/Twitter metadata. Keep claims and local facts accurate.
4. Write answer-ready sections: one intent per section, direct answer first, supporting details next, tables/comparisons where useful, and visible FAQs only when the page genuinely answers them. Do not create pages solely for keyword variants.
5. Add JSON-LD only for entities visibly represented on the page. Prefer `WebSite`, `Organization` or a factual `LocalBusiness`, `WebPage`, `BreadcrumbList`, and relevant `Service`; use `FAQPage`, `Review`, or `AggregateRating` only when the visible content and platform rules support them. Never invent reviews, address, hours, prices, awards, or ratings.
6. Add a root sitemap with absolute canonical URLs and reference it from `robots.txt`. Submit it to Google Search Console and Bing Webmaster Tools. Use IndexNow for Bing-supported update notifications when credentials and deployment are available.
7. Permit relevant crawlers through robots/WAF/CDN: Googlebot, Bingbot, and `OAI-SearchBot` for ChatGPT Search. Do not expose private routes, credentials, staging data, or authenticated content.
8. Verify with route-by-route HTTP checks, rendered/initial HTML inspection, JSON parsing, Rich Results Test, Google URL Inspection, Search Console coverage/performance, Bing Webmaster reports, and crawler/server logs. Report ranking/citation as unguaranteed external outcomes.

## Indexing safety

The global website-design default remains `noindex, nofollow` for dev/staging and for tasks that do not explicitly request discovery. A direct request to make a named production site public may override it only for that project, after checking canonical domain, robots, sitemap, and deployment state.

## Vue SSR/SSG pattern

- Keep route SEO in a typed static map or API boundary keyed by route path.
- Use `useHead`/the project's head manager for title, description, canonical, OG, Twitter, robots, and JSON-LD.
- Confirm SSG output contains the metadata in each generated route HTML; client-only `onMounted` updates are not sufficient for first-pass crawler evidence.
- Keep the visible body content and JSON-LD values synchronized.

## Local-search and AI-answer guardrails

- Match a query only when the business genuinely serves that need. “Top 10 tinted car shops in JB” requires original, useful, current tint content or a real partnership/service—not transport keywords inserted into unrelated pages.
- Use local place names naturally in titles, headings, service areas, route copy, image alt text, and structured data only when true.
- Build topical authority with genuinely useful pages, internal links, business identity consistency, and real third-party references. Do not promise “rank #1,” “guaranteed AI citation,” or instant indexing.

## Direct references

Read [`references/platform-guidance.md`](references/platform-guidance.md) when platform-specific details or current validation links are needed.

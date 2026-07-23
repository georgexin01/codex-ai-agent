---
name: seo-ai-search-discoverability
description: "Durable rules for Google, Bing, ChatGPT Search, and AI-answer discoverability across public Vue/PHP sites."
triggers: ["SEO", "AI search", "Google AI Overview", "ChatGPT Search", "Gemini search", "robots.txt", "sitemap", "JSON-LD", "structured data", "citation-ready content"]
status: active
---

# SEO and AI-search discoverability

## Verified platform truth

- Google says AI Overviews/AI Mode use existing SEO fundamentals and require an indexed, snippet-eligible page; there is no special AI schema or AI text file.
- Google processes JavaScript through crawl, render, and index phases; SSR/SSG is preferred for important public text because not every crawler runs JavaScript.
- Google recommends unique titles/descriptions, canonical URLs, crawlable links, useful text, and valid JSON-LD that matches visible content. Structured data enables eligibility but does not guarantee ranking or rich results.
- ChatGPT Search requires allowing `OAI-SearchBot` when publishers want content included in summaries/snippets and clear citations.
- Bing IndexNow can notify participating engines of URL updates but does not guarantee ranking.

## Reusable implementation rules

1. Inventory public routes before writing SEO data. Use `route_path` as the lookup key; keep dynamic detail pages separate when they have custom metadata.
2. For Vue, use SSG/SSR and a typed route-keyed SEO map. Verify generated HTML contains title, description, canonical, robots, OG/Twitter, and JSON-LD; client-only mounted metadata is insufficient as the only source.
3. Make each page an answer-ready set of self-contained sections with direct answers, clear H2/H3 headings, tables/FAQs only when visibly accurate, descriptive links, and useful alt text.
4. Add root `robots.txt` and absolute-URL `sitemap.xml`; allow Googlebot/Bingbot/OAI-SearchBot for public production pages and keep dev/staging noindex.
5. Do not invent local facts, addresses, prices, reviews, ratings, hours, awards, or service claims. Do not keyword-stuff unrelated queries or mass-produce low-value AI pages.
6. Measure with HTTP/rendered HTML checks, Search Console, Bing Webmaster Tools, Rich Results Test, URL Inspection, and crawler logs. Ranking and AI citation remain external, probabilistic outcomes.

## Project note

`sgmy168transport` explicitly requests public discoverability, so its production SEO can use `index, follow` after canonical domain/deployment checks. Its current source proves transport/service content; a tint-shop query requires genuinely relevant original content before targeting that query.

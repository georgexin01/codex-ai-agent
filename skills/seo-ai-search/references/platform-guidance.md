# Platform guidance

Use these primary references for current decisions; re-check them when platform behavior may have changed.

- Google AI features: <https://developers.google.com/search/docs/appearance/ai-features>
  - No additional AI-specific technical requirements; indexed, snippet-eligible pages and foundational SEO still apply.
  - No special AI markup or AI text file is required.
- Google JavaScript SEO: <https://developers.google.com/search/docs/crawling-indexing/javascript/javascript-seo-basics>
  - Google crawls, renders, then indexes; server-side or pre-rendering helps speed and crawler compatibility.
  - Unique titles/descriptions, canonical URLs, crawlable links, and rendered visible content matter.
- Google structured data: <https://developers.google.com/search/docs/appearance/structured-data/intro-structured-data>
  - JSON-LD is generally recommended for maintainability; valid markup does not guarantee rich-result display.
- Google structured-data policies: <https://developers.google.com/search/docs/appearance/structured-data/sd-policies>
  - Markup must match visible content; do not mark up hidden, misleading, fake, or irrelevant data.
- Google sitemap: <https://developers.google.com/search/docs/crawling-indexing/sitemaps/build-sitemap>
  - Use absolute canonical URLs, publish the sitemap at the root, reference it in robots.txt, and submit it in Search Console. A sitemap is a hint, not an indexing guarantee.
- Google robots meta: <https://developers.google.com/search/docs/crawling-indexing/robots-meta-tag>
  - Crawler access is required before robots directives can be read and followed.
- OpenAI publisher FAQ: <https://help.openai.com/en/articles/12627856-publishers-and-developers-faq>
  - Public sites can appear in ChatGPT Search; do not block `OAI-SearchBot` when you want content included in summaries/snippets and citations.
- Bing IndexNow: <https://www.bing.com/webmasters/help/indexnow-0z209wby>
  - IndexNow can notify participating search engines about published, updated, or deleted URLs; it does not guarantee ranking.

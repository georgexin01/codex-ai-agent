# Platform guidance

Last checked against current primary documentation: 2026-10-19.

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
- Google title links: <https://developers.google.com/search/docs/appearance/title-link>
  - Write distinct, descriptive titles; there is no fixed character maximum, but result links can be truncated. Avoid repeated boilerplate and keyword stuffing. Preserve explicit user title constraints; do not add words when they would make a title worse.
- Google snippets and meta descriptions: <https://developers.google.com/search/docs/appearance/snippet>
  - Google may use the page text or its meta description. There is no fixed description character limit; write a unique, concise summary for each important page.
- Google site names: <https://developers.google.com/search/docs/appearance/site-names>
  - Put one `WebSite` node with confirmed `name` and canonical homepage `url` on the domain homepage. Extend an existing node instead of adding a duplicate block.
- Google image SEO: <https://developers.google.com/search/docs/appearance/google-images>
  - Use useful, contextual alt text that describes the image; avoid keyword stuffing. Decorative images can have empty alt text.
- Google favicon guidance: <https://developers.google.com/search/docs/appearance/favicon-in-search>
  - Use a crawlable, stable favicon URL and a square icon at least 48 pixels wide. Verify that the file exists and is allowed to be crawled.
- Google meta-tag support: <https://developers.google.com/search/docs/crawling-indexing/special-tags>
  - Google ignores the `meta keywords` tag. Do not add it as an SEO task.
- Google robots meta: <https://developers.google.com/search/docs/crawling-indexing/robots-meta-tag>
  - Crawler access is required before robots directives can be read and followed.
- OpenAI publisher FAQ: <https://help.openai.com/en/articles/12627856-publishers-and-developers-faq>
  - Public sites can appear in ChatGPT Search; do not block `OAI-SearchBot` when you want content included in summaries/snippets and citations.
- Bing IndexNow: <https://www.bing.com/webmasters/help/indexnow-0z209wby>
  - IndexNow can notify participating search engines about published, updated, or deleted URLs; it does not guarantee ranking.

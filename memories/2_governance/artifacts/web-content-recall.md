---
name: web-content-recall
description: "Compact retrieval guide for drafting or updating public website news, blog, and article content from verified project sources."
triggers: ["write article", "generate article", "news article content", "blog post content"]
contains: ["editorial copy", "website article", "news post", "blog post", "article page"]
phase: content
status: active
related:
  - memories/2_governance/artifacts/skill_path_router.md
  - skills/meta-content-workflow/SKILL.md
  - skills/claude-website/14-seo-structured-data/skill.md
  - skills/seo-ai-search/SKILL.md
---

# Web Article Content Recall

Use this note when the user asks to write, generate, or revise public news, blog, or article content. It is a retrieval guide, not a fixed article template.

1. Identify the active project, intended page/route, audience, language, and canonical content source. Follow the project’s existing fields, format, and publishing workflow.
2. Ground factual claims in supplied material or current authoritative sources when research is requested or needed. Do not invent dates, quotations, numbers, products, prices, locations, credentials, or outcomes. Mark missing facts instead of filling gaps.
3. Write clear, useful copy for the reader. Use relevant headings and terms naturally; do not keyword-stuff or add unsupported search claims.
4. Preserve existing slugs, IDs, locale pairs, schemas, and CMS/API contracts. For bilingual content, update the corresponding language entry when the project requires paired records.
5. Separate the requested work: article copy, article-page/CMS implementation, metadata/schema, and image generation are distinct. Retrieve metadata, structured-data, crawlability, or image guidance only when that surface is in scope or required by the project contract.
6. Verify the result against its content source and renderer. Check language pairing and route/output when applicable; confirm visible article facts match metadata and structured data. Do not publish, deploy, or submit externally unless requested.

For a news listing with progressive loading, use the matching project’s implementation notes only after confirming the project identity; Zeta Capital’s loading counts and routes are project-specific, not universal defaults.

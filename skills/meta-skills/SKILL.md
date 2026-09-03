---
name: meta-skills
description: Audit and update public website metadata with one specific title contract and short topic-matched descriptions; preserve article-owned metadata when excluded.
metadata:
  short-description: Public page title and description audit
---

# Public Metadata Contract

Use this skill for website metadata audits or updates when the user asks for specific page titles, keyword structure, or description limits.

## Title format

Every eligible page title must use:

`A | B | C`

- `A` is the page's specific main topic. Keep it concise and below 10 whitespace-separated words; use an equally short natural phrase for CJK pages.
- `B` contains exactly two keyword words, not a keyword list or sentence.
- `C` is the current verified company or product entity name from the project's source of truth. Never replace it with an example identity or a guessed spelling.
- Keep the title short, readable, and aligned with the page's visible H1 and primary intent.

## Description format

- Write a page-specific description that explains the actual topic and useful scope.
- Maximum length is 160 characters, counting characters rather than words. Never exceed the limit.
- Do not add unsupported prices, locations, capabilities, rankings, reviews, results, or other trust-sensitive claims.

## Audit and update workflow

1. Find the project's canonical metadata owner, generators, route list, language pairs, and rendered HTML.
2. Audit every eligible page and report excluded paths explicitly.
3. Preserve article detail metadata when the project owns it in article data or the user excludes those routes.
4. Update the shared source first, then regenerate or apply it to rendered pages; do not hand-edit generated HTML when a source contract exists.
5. Keep title, description, H1, canonical URL, language links, structured data, and visible page topic aligned.
6. Verify title parts, keyword count, entity spelling, description character count, language parity, generated output, and representative HTTP routes.

## Scope boundary

This skill governs metadata only. It does not authorize production deployment, Search Console submission, external profile edits, or claims that ranking or AI citation is guaranteed. Mark missing live evidence as `INSUFFICIENT DATA`.

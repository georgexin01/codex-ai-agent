thread_id: 019ff9c5-febf-7151-a502-860618d376c8
updated_at: 2026-08-13T09:01:23+00:00
rollout_path: C:\Users\user\.codex\sessions\2026\08\13\rollout-2026-08-13T14-18-50-019ff9c5-febf-7151-a502-860618d376c8.jsonl
cwd: \\?\D:\backup\website-zetasoftware
git_branch: main

# Zeta Software bilingual FAQ system was completed, then a follow-up FAQ rewrite was interrupted

Rollout context: Work occurred in `D:\backup\website-zetasoftware`, a static bilingual HTML site. The user requires English pages to be the design source and Chinese `cn/` pages to be kept structurally synchronized with localized text.

## Task 1: Implement and expand bilingual FAQ data system

Outcome: success

Preference signals:
- The user asked for FAQ content to be long, human-friendly, related to blog/search questions, and useful for people around Johor Bahru -> future content should prioritize readable answer paragraphs and accurate search intent rather than keyword stuffing.
- The user explicitly requested five additional Zeta-company questions -> company-specific questions should be included alongside general service questions when building FAQ content.

Key steps:
- Created `data/faq.json` as the bilingual source of truth with 30 English and 30 Chinese records: 25 regional/service questions plus five Zeta Software company questions.
- Added `js/faq.js` to load the correct language, render FAQ accordions, update FAQPage JSON-LD, and preserve server-rendered fallback content if fetch fails.
- Regenerated `faq/index.html` and `cn/faq/index.html` with 30 visible questions, answers, and matching structured-data questions.
- Fixed a malformed JSON edit during the process and verified the final JSON.

Reusable knowledge:
- The FAQ pages use crawlable fallback HTML plus client-side hydration from `/data/faq.json`; the source data, visible HTML, and schema must remain aligned.
- English and Chinese FAQ records use paired stable IDs and the same ordering.
- Answers are escaped by `js/faq.js` and rendered as normal text paragraphs.

References:
- `data/faq.json`
- `js/faq.js`
- `faq/index.html`
- `cn/faq/index.html`
- Verification: 30 records per language, unique paired IDs, 30 visible questions/answers per page, 30 schema questions per page; `node --check` passed; local HTTP 200 for `/faq/`, `/cn/faq/`, `/data/faq.json`, and `/js/faq.js?v=1.0`.

## Task 2: Follow-up FAQ wording/order/globalization request

Outcome: partial

Preference signals:
- The user asked to reduce roughly 30% of explicit Johor Bahru references, move at least five Zeta/company questions to the top, move more global questions upward, and revise at least 20% of question titles toward global wording -> future FAQ revisions should balance local discoverability with broader global search intent.

Key steps:
- Read current FAQ data and identified explicit local references in English and Chinese.
- Loaded the SEO/AI-search guidance, which confirms there is no guaranteed AI markup or ranking switch and emphasizes crawlable, people-first content.
- No edits to `data/faq.json` were completed before the user intentionally aborted the turn.

Failures and how to do differently:
- The requested FAQ rewrite remains unimplemented; do not assume the ordering or wording changed.
- The prior inspection output showed some Chinese text rendered as mojibake in PowerShell, but direct UTF-8/node checks confirmed the actual JSON/page files contained readable Chinese. Use UTF-8-aware reads when validating multilingual content.
- Before editing, preserve the 30/30 count, paired IDs, schema alignment, and bilingual order; then run the existing data-to-page comparison and route smoke checks.

Reusable knowledge:
- Project-specific instruction in `status.md`: read it before work; update both English and Chinese counterparts; English is the main markup/design source.
- Current FAQ order starts with local/regional questions and places the five Zeta-specific questions at positions 26–30, so the follow-up request specifically requires reordering.

References:
- User request: “reduce some 30% of johor bahru title, and description… move some question that are focus n more on zeta software company to top (atleast 5 move to top..) more global question move to top.. change 20% of question atleast”
- Relevant files: `data/faq.json`, `faq/index.html`, `cn/faq/index.html`, `js/faq.js`, `status.md`, `meta.md`

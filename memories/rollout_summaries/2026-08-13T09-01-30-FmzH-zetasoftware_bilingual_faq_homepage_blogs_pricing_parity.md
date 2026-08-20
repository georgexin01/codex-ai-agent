thread_id: 019ffa5a-eb3e-7172-8f41-7b65c41c8a95
updated_at: 2026-08-13T09:54:49+00:00
rollout_path: C:\Users\user\.codex\sessions\2026\08\13\rollout-2026-08-13T17-01-30-019ffa5a-eb3e-7172-8f41-7b65c41c8a95.jsonl
cwd: \\?\D:\backup\website-zetasoftware
git_branch: main

# Zeta Software bilingual website content and design updates

Rollout context: Work was performed in `D:\backup\website-zetasoftware`, with a standing requirement to preserve English/Chinese parity, read/update `status.md`, and verify edits.

## Task 1: Rebalance bilingual FAQ data

Outcome: success

Preference signals:
- The user asked to reduce location-specific Johor Bahru wording, move at least five Zeta Software questions to the top, and broaden at least 20% of titles -> future FAQ edits should quantify requested proportions and apply them symmetrically to English and Chinese records.
- Existing bilingual pairing was preserved rather than treating `cn/` as optional.

Key steps:
- Edited `data/faq.json` only for the content change, then updated `status.md` and `meta.md`.
- Moved five Zeta company records to positions 1–5 in both language arrays.
- Broadened nine paired question titles and reduced explicit location wording in nine paired records.

Failures and how to do differently:
- A large patch temporarily created invalid JSON and duplicate English records. JSON parsing and duplicate-ID checks caught this; remove/repair structural issues before final reporting.
- A parity check initially found Chinese titles had not all been broadened; always compare paired IDs and title changes per language.

Reusable knowledge:
- FAQ pages consume the shared `/data/faq.json` through `js/faq.js`; the same records also refresh FAQPage JSON-LD.
- The final dataset contains 30 unique English and 30 unique Chinese records with paired stable IDs and plain-text answers.

References:
- `data/faq.json`, `js/faq.js`, `status.md`, `meta.md`
- Verification: `en: count=30, unique=true, pairedIds=true, titleChanges=9`; same for `cn`; both arrays begin with the same five Zeta IDs.

## Task 2: Add latest three blog cards to bilingual homepages

Outcome: success

Preference signals:
- The user specified exact Bootstrap-style classes `col-12 col-md-6 col-lg-4`, placement below `// OUR CAPABILITIES`, language-specific JSON sources, and a centered red “View More Articles” button with a right arrow -> preserve exact placement, class contracts, and CTA styling in similar homepage additions.

Key steps:
- Added a homepage blog section to `index.html` and `cn/index.html`.
- Added `js/home-blogs.js` to select the language dataset, sort by date descending, take exactly three records, escape text, render links, and refresh icons.
- Added responsive styling in `css/style.css`.

Reusable knowledge:
- Latest-three selection matched the 13 Aug, 11 Aug, and 9 Aug 2026 blog records in both language datasets.

References:
- `index.html`, `cn/index.html`, `js/home-blogs.js`, `data/blogs.json`, `data/blogs-cn.json`
- `node --check js/home-blogs.js`; local HTTP 200 for `/`, `/cn/`, and both blog JSON files.

## Task 3: Change services workflow labels from days to weeks

Outcome: success

Preference signals:
- The user required exact labels: English `Week 1, Week 2, Week 2, Week 3, Week 3, Week 4`, with localized Chinese equivalents -> use exact requested ordering and update both language pages.

Key steps:
- Updated workflow labels in `services/index.html` and `cn/services/index.html` without changing descriptions or card order.

Failures and how to do differently:
- An initial Chinese verification comparison failed because the test script’s Unicode literals were mangled, not because the page was wrong. Use Unicode escapes or UTF-8-safe scripts for Chinese assertions.

References:
- Final Chinese labels: `第 1 周, 第 2 周, 第 2 周, 第 3 周, 第 3 周, 第 4 周`
- Both service URLs returned HTTP 200; no old `Day`/`天` labels remained.

## Task 4: Match services pricing design and font loading to homepage

Outcome: success

Preference signals:
- The user provided screenshots and asked for the services pricing cards to look exactly like the homepage -> treat the reference screenshot and homepage markup/CSS as the active source of truth, and compare both English and Chinese pages.

Key steps:
- Normalized both service pricing sections to the shared `pricing-section`, `pricing-grid`, glass-card, featured badge, and centered full-width button structure.
- Preserved localized plan names, prices, feature lists, and CTA labels.
- Diagnosed the font issue: services pages used `var(--font-heading)`/Orbitron in CSS but did not load the Google Fonts stylesheet.
- Added the same Plus Jakarta Sans, Orbitron 700/900, and Space Mono links to both services pages.

Reusable knowledge:
- Shared pricing CSS has duplicated/overriding pricing rules later in `css/style.css`; visual parity depends on both matching markup and loading the same font stylesheet.
- The service pages use `<base href="/">`, so root-relative asset paths are appropriate.

References:
- `services/index.html` and `cn/services/index.html`
- Google Fonts URL includes `Plus+Jakarta+Sans`, `Orbitron:wght@700;900`, and `Space+Mono`.
- Verification confirmed all four pages use the pricing structure, all four font links are present with English/Chinese parity, pricing CSS uses `var(--font-heading)`, HTTP 200 responses pass, and `git diff --check` passes.

Browser screenshot automation was unavailable, so final visual confirmation remained a manual hard-refresh step.

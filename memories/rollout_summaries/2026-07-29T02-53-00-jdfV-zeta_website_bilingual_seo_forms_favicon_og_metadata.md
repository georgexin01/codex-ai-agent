thread_id: 019fabca-28db-7753-b6c2-67db7101e777
updated_at: 2026-07-29T09:15:35+00:00
rollout_path: \\?\C:\Users\user\.codex\sessions\2026\07\29\rollout-2026-07-29T10-53-00-019fabca-28db-7753-b6c2-67db7101e777.jsonl
cwd: D:\backup\zeta-website-v4
git_branch: main

# Static Zeta website metadata, routing, forms, and favicon/OG updates

Rollout context: The user worked on a hardcoded bilingual HTML website. The project was initially reported at `D:\backup\zeta-website-v4`, but later evidence showed the active project had moved to `D:\backup\website-zetasoftware`.

## Task 1: Footer credit link

Outcome: success

Preference signals:
- The user requested the exact text “Zeta Tech Team” become an href to `https://zetasoftware.my`, with hover transition to the theme red -> similar footer credit changes should preserve exact wording and apply the existing theme variables.

Key steps:
- Updated the footer credit on five original pages: `index.html`, `about.html`, `services.html`, `portfolio.html`, and `contact.html`.
- Added `.footer-credit-link` with color transition and `:hover`/`:focus-visible` theme-red styling.
- Verified all five occurrences and ran `git diff --check`; one pre-existing trailing-whitespace warning remained.

Failures and how to do differently:
- The diff showed many unrelated pre-existing changes and line-ending warnings. Preserve unrelated changes and inspect focused diffs rather than assuming the whole diff belongs to the task.

Reusable knowledge:
- Theme red is exposed through `var(--color-primary)` in `css/style.css`.

References:
- Link contract: `href="https://zetasoftware.my"` and class `footer-credit-link`.

## Task 2: SEO title, description, and alt metadata

Outcome: success

Preference signals:
- The user required the homepage title and description to be used exactly as provided.
- The user required every non-homepage title to end with `| Zeta Software Sdn Bhd`.
- The user requested English, AI-search-friendly metadata and descriptive English alt text.

Key steps:
- Updated homepage metadata exactly to the user-provided title and description.
- Added unique metadata for About, Services, Portfolio, and Contact.
- Improved homepage and portfolio image alt text.
- Preserved existing `noindex, nofollow` during the first metadata pass because indexing policy was not requested.
- Verified all five pages had one description, no missing image alt attributes, exact homepage metadata, and required non-homepage suffixes.

Failures and how to do differently:
- A PowerShell verification initially used `$home`, conflicting with the read-only `$HOME` variable; use a non-reserved variable name.
- A stale-content grep found visible “ZETA CAPITAL” marquee text, but this was outside the requested metadata scope and was intentionally left unchanged at that stage.

Reusable knowledge:
- Public metadata tasks should use `.codex` `meta-content-workflow` plus `seo-ai-search`; inspect actual routes/assets first and do not invent unsupported business facts.

References:
- Homepage exact title: `Custom Mobile App Development Company in Johor Bahru, Malaysia | Android & iOS App Developer | Zeta Software Sdn Bhd`.

## Task 3: Bilingual folder routing and language selector

Outcome: partial

Preference signals:
- The user wanted hardcoded HTML pages retained while adding folder-index routes.
- The user explicitly corrected that English must remain at `/index.html`/`/`, not `/en/index.html`; Chinese uses `/cn/`.
- Requested `EN / CN` dropdown cards beside the header CTA, with matching page navigation such as `/contact/` and `/cn/contact/`.

Key steps:
- Created English folder routes (`about/index.html`, `services/index.html`, `portfolio/index.html`, `contact/index.html`) and Chinese routes under `/cn/`.
- Added the language switcher markup and CSS dropdown behavior.
- Added route normalization in `js/main.js`, including Chinese-vs-English route mapping.
- Added root `<base href="/">` to nested pages to stabilize asset paths.
- Verified representative clean routes returned HTTP 200.

Failures and how to do differently:
- The migration involved broad copies and later large edits; some route/content work was incomplete or difficult to verify in the rollout. Treat folder creation, language translation, link normalization, and browser parity as separate verification gates.
- An attempted PowerShell deletion of `/en/` was blocked by policy; deleting only the temporary file with `apply_patch` worked.

Reusable knowledge:
- English homepage route is root `/`; Chinese homepage is `/cn/`; English subpages use `/about/`, `/services/`, `/portfolio/`, `/contact/`; Chinese equivalents use `/cn/.../`.

References:
- Route map is implemented in `js/main.js` under `languageRoutes` and `staticRoutes`.

## Task 4: Google Sheets form integration

Outcome: success, with live deployment still unverified

Preference signals:
- The user explicitly required no PHP file and wanted JavaScript/HTML only.
- The user required exact shared field names/titles and later narrowed the contract to only six columns: `Date`, `Name`, `Email`, `Contact`, `Project Name`, `Project Requirements`.
- The user requested Email/Contact displayed at 50% width on desktop and stacked on mobile.

Key steps:
- Audited four forms: English/Chinese homepage enquiry forms and English/Chinese contact forms.
- Updated all four forms to the exact five submitted field names; Apps Script generates `Date`.
- Added `.form-row`/`.form-half` CSS with responsive stacking below 600px.
- Replaced the Apps Script contract with only the six requested table headers; removed file upload, file name, project type, phone, and form type columns from storage.
- Preserved read-only `EmailAccount` recipient lookup, automatic `Contacts` sheet creation/header synchronization, and frozen first row.
- Verified field names across all four forms, JavaScript and Apps Script syntax, route HTTP 200, and no project PHP endpoint.

Failures and how to do differently:
- Initial Chinese form patches failed because files contained encoding/mangled text; replacing the full form block was more reliable than matching corrupted localized lines.
- The Apps Script/Google deployment and live submission remained unverified; future agents must not claim live Sheets/email success without deployment authorization and a controlled submission.

Reusable knowledge:
- Form JS: `js/form-submit.js`; Apps Script: `scripts/zeta-google-apps-script.gs`.
- Both `enquiry` and `contact` forms share the `Contacts` table.

References:
- Exact table headers: `Date`, `Name`, `Email`, `Contact`, `Project Name`, `Project Requirements`.

## Task 5: CSS cache version

Outcome: success

Key steps:
- Bumped all 12 HTML stylesheet references from `?v=0125` to `css/style.css?v=0126`.
- Updated README/meta documentation and verified no stale `0124`/`0125` references remained.

Failures and how to do differently:
- Documentation initially produced a self-referential example (`0126` to `0126`); it was corrected to indicate the next version is `0127`.

## Task 6: Favicon, manifest, and OG image metadata

Outcome: success

Preference signals:
- The user required every single page to use the new `/favicon/` assets and `ogImage_v1.jpg`, with project-specific manifest information.

Key steps:
- Found the active project at `D:\backup\website-zetasoftware`; the earlier `zeta-website-v4` path no longer existed.
- Confirmed `/favicon/ogImage_v1.jpg` exists and is 600×400.
- Updated all 12 public HTML pages to use the absolute OG/Twitter image URL `https://zetasoftware.my/favicon/ogImage_v1.jpg`, secure URL, JPEG type, dimensions, and localized image alt text.
- Updated every page with `/favicon/favicon.svg`, `/favicon/favicon-96x96.png`, `/favicon/favicon.ico`, `/favicon/apple-touch-icon.png`, `/site.webmanifest`, and red theme color.
- Rebuilt root and favicon manifests for Zeta Software identity, root scope/start URL, red theme, and `/favicon/` app icons.
- Updated `README.md` and `meta.md` to document the new assets.
- Verified all 12 pages, manifest JSON, JSON-LD, asset existence, duplicate metadata counts, and `git diff --check`.

Failures and how to do differently:
- The first validation incorrectly treated the OG URL’s three metadata occurrences as duplicates; validation was corrected to distinguish `og:image`, `og:image:secure_url`, and `twitter:image`.
- Temporary HTTP smoke testing was blocked by PowerShell policy, so production HTTP/social-preview verification remains pending.

Reusable knowledge:
- All public routes are documented in `meta.md`: `/`, `/about/`, `/services/`, `/portfolio/`, `/contact/`, `/faq/`, plus `/cn/` equivalents.
- Production origin used by metadata is `https://zetasoftware.my`, but deployment must be confirmed before claiming production verification.

References:
- OG asset: `favicon/ogImage_v1.jpg`.
- Root manifest: `site.webmanifest`.
- Metadata checklist: `meta.md`.
- All 12 page heads contain one OG image, one Twitter image, four favicon declarations, one root manifest link, and valid JSON-LD.

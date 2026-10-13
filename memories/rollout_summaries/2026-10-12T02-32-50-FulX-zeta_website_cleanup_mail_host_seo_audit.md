thread_id: 01a12df4-a688-72d0-8aa6-dd792838fc51
updated_at: 2026-10-12T06:20:38+00:00
rollout_path: C:\Users\user\.codex\sessions\2026\10\12\rollout-2026-10-12T10-32-50-01a12df4-a688-72d0-8aa6-dd792838fc51.jsonl
cwd: \\?\D:\backup\website-zetasoftware
git_branch: main

# Zeta website cleanup, mail-host hardening, and Search Console audit

Rollout context: Work occurred in `D:\backup\website-zetasoftware`, a bilingual static HTML site with generated blog pages, Apache `.htaccess`, sitemap, and extensive authoring artifacts.

## Task 1: Legacy and unused-file audit

Outcome: success

Preference signals:
- The user first requested a read-only list of legacy/unused files, then explicitly asked to remove only items that would not affect the current website -> future cleanup should separate public runtime dependencies from authoring/history artifacts and verify before deletion.

Key steps:
- Audited 1,048 tracked files and references across HTML, CSS, JS, JSON, Markdown, and sitemap.
- Identified four unreferenced images and temporary scratch/contact-sheet/test files as safe candidates; preserved generators, archived iOS source PNGs, manifests, and documented assets.
- Removed 14 files total: four unused images and ten temporary artifacts.
- Verified all targets were absent, only intended deletions appeared in Git, all 588 HTML files remained, and every non-`noindex` canonical remained in the sitemap.

Failures and how to do differently:
- A bulk PowerShell deletion was blocked by the command safety filter; deleting exact paths individually worked.
- Text-reference absence is not sufficient to delete generators or historical source assets; classify them separately.

Reusable knowledge:
- The site is bilingual and static; changes affecting content/design should preserve English/CN parity.
- Current cleanup removed no page source, runtime code, sitemap entry, or documented generator dependency.

References:
- Removed image paths: `images/approach/approach-hero-workshop.jpg`, `images/approach/c2c-community-market.jpg`, `images/approach/m2b-business-partner.jpg`, `images/internal-management/internal-hero-operations.jpg`.
- Verification: `tracked_html=588`, `non_noindex_canonical_missing_from_sitemap=0`.

## Task 2: Mail-host reference audit and hardening

Outcome: success

Key steps:
- Full working-tree search found no application, frontend, sitemap, or public metadata use of the mail hostname as a destination.
- Generalized `.htaccess` from one exact host to all hosts beginning with `mail.` using `RewriteCond %{HTTP_HOST} ^mail\. [NC]` and `[G,L]` (410 Gone behavior).
- Removed literal hostname mentions from current maintenance/status text while preserving the historical reason and behavior.
- Verified zero exact hostname occurrences and `git diff --check` passed.

Failures and how to do differently:
- Do not remove the blocking rule merely to achieve a zero-text search: without it, mail-prefixed hosts could reach the website fallback.
- Apache was unavailable locally; production Apache syntax/behavior remains deployment-dependent.

Reusable knowledge:
- Live checks later confirmed sampled `mail.*` URLs returned HTTP 410, while public `robots.txt` and `sitemap.xml` returned 200.

References:
- `.htaccess`: `RewriteCond %{HTTP_HOST} ^mail\. [NC]` followed by `RewriteRule ^ - [G,L]`.

## Task 3: Search Console indexing/canonical audit

Outcome: partial

Key steps:
- Compared reported 404/not-indexed/canonical statuses with source and live evidence.
- Local and live sitemap both contained 590 unique URLs; all sitemap URLs mapped to local files, all had matching self-canonicals, no sitemap URL was `noindex`, and all 508 blog URLs were linked from listings.
- Live sampled mail-host URLs returned 410.
- Found `/contact.html` incorrectly served the homepage with HTTP 200 and homepage canonical, while `/contact/` was the real contact page.
- Added `.htaccess` 301 redirects for `/contact.html` → `/contact/` and `/cn/contact.html` → `/cn/contact/`.
- Gave the user deployment and Search Console steps: deploy `.htaccess`, test live URLs, request indexing for canonical pages, do not request indexing for removed mail-host URLs, and allow time for Google recrawl.

Failures and how to do differently:
- The redirect was source-edited but not production-verified because Apache was unavailable locally; deployment and live redirect verification remain required.
- Search Console’s “Discovered – currently not indexed” cannot be fixed solely by resubmitting a sitemap; inspect representative URLs and improve usefulness/internal linking where needed.

Reusable knowledge:
- Google treats sitemap inclusion, canonical tags, and redirects as signals, not indexing guarantees; 404/410 is appropriate for permanently removed URLs.
- Production indexing, rendering, ranking, and Search Console state must be reported separately from local source verification.

References:
- Verified live/local sitemap parity: `LocalCount=590`, `LiveCount=590`, `LiveOnly=0`, `LocalOnly=0`.
- Verified canonical audit: `CanonicalMismatch=0`, `SitemapNoindex=0`, `BlogHreflangMissing=0`.
- Added rules: `RewriteRule ^contact\.html$ /contact/ [R=301,L,NE]`; `RewriteRule ^cn/contact\.html$ /cn/contact/ [R=301,L,NE]`.

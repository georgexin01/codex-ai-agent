thread_id: 019fdb71-b29e-7ad3-85f2-fa36bb94a3c3
updated_at: 2026-08-10T04:31:01+00:00
rollout_path: \\?\C:\Users\user\.codex\sessions\2026\08\07\rollout-2026-08-07T16-58-09-019fdb71-b29e-7ad3-85f2-fa36bb94a3c3.jsonl
cwd: \\?\C:\Users\user\Desktop\motorcycle\fc-moto-new
git_branch: main

# FC-Moto project metadata and site updates completed with verification

Rollout context: PHP website at `C:\Users\user\Desktop\motorcycle\fc-moto-new`; shared PHP layout, local catalog/category data, and detached PHP server on port 8011.

## Task 1: Footer category links and column layout

Outcome: partial

Preference signals:
- The user requested category links be generated from `data/category.json` order, the next six items placed in the second column, the second title emptied, and “Top Brands” removed so remaining columns expand.

Key steps:
- Located shared footer in `lib/footer.php` and taxonomy helpers in `lib/initData.php`.
- Identified source order: first 12 taxonomy entries, with first six for Top Categories and next six for the untitled second column.
- Implemented dynamic escaped labels/slugs and removed the Top Brands column.

Failures and how to do differently:
- The first combined patch failed because the minified CSS context did not match; later smaller patches succeeded for footer PHP. A dedicated read-back/render verification of the final footer layout was not shown.

Reusable knowledge:
- Product routes use `/product/{slug}` and taxonomy definitions are available through `fcMotoProductSubcategoryDefinitions('moto')`.
- Shared footer is included by most public templates.

## Task 2: Homepage mojibake cleanup

Outcome: success

Key steps:
- Found 17 corrupted UTF-8 sequences across 12 lines in `template/home.php`.
- Replaced malformed dashes, apostrophes, trademark symbols, `ü`, and the FC‑Moto hyphen without changing unrelated content.
- Verified no mojibake markers remained, PHP lint passed, homepage returned HTTP 200, and diff checks passed.

References:
- `template/home.php`
- `php -l template/home.php`

## Task 3: Centralized metadata, sitemap, robots, and manifest

Outcome: success

Key steps:
- Confirmed `lib/initData.php` as the metadata source and `lib/htmlhead.php` as the shared renderer.
- Updated confirmed identity to `FC-Moto`, with motorcycle gear/accessories scope, `en-US`/`en_US`, and theme color `#FED900`.
- Added unique metadata for static pages, magazine articles, product category pages, product details, and wishlist/search handling.
- Added canonical, description, author, application name, theme color, referrer, locale, Open Graph, favicon, manifest, Organization/WebSite/WebPage JSON-LD, and existing social profiles.
- Added `robots.txt`, dynamic `/sitemap.xml`, `site.webmanifest`, and project tracking file `meta.md`.
- Verified 341 sitemap URLs, valid manifest with two icons, production-host canonical simulation, unique titles across representative routes, JSON-LD parsing, and all `lib/`/`template/` PHP lint.

Preference signals:
- The user explicitly said: “noindex, nofollow please” -> future metadata work must default to sitewide `noindex, nofollow` unless the user explicitly asks to re-enable indexing.

Final policy:
- `fcMotoIsIndexable()` now always returns `false`; both `robots` and `googlebot` emit `noindex, nofollow` on every rendered page.
- Verified homepage, About, product, magazine, and article routes all emit the requested directive.

Failures and how to do differently:
- Localhost/staging checks cannot prove production deployment. Apache and real production crawler validation remain separate deployment checks.
- The manifest initially appeared empty when PowerShell treated its response as bytes; decoding bytes as UTF-8 confirmed valid JSON.

References:
- `lib/initData.php` (`fcMotoSiteData`, `fcMotoPageMeta`, `fcMotoIsIndexable`)
- `lib/htmlhead.php`
- `lib/sitemap.php`
- `robots.txt`
- `site.webmanifest`
- `meta.md`
- Server: `php -S 127.0.0.1:8011 index.php`
- Verification: all `lib/` and `template/` files passed `php -l`; representative routes returned HTTP 200.

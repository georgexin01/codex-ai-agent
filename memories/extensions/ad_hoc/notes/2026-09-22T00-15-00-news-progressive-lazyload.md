# Zeta Capital news progressive loading and image lazy-loading

- Scope: `D:\backup\zeta-capital\website-zetaCapital/news.php` and its news assets.
- The news list keeps every article server-rendered for crawlable HTML and ItemList JSON-LD, but initially shows 12 cards.
- `assets/js/news.js` reveals the next 3 hidden cards when the bottom sentinel approaches the viewport, using `IntersectionObserver`, and stops when no hidden cards remain.
- News-card images use the reusable pattern from `D:\backup\website-zetasoftware\js\main.js`: the real image URL is in `data-src`, while `src` starts as a 1x1 SVG data URI. The image observer swaps `data-src` into `src` near the viewport.
- The JavaScript has a no-IntersectionObserver fallback that reveals all cards and loads all images so content remains usable in older browsers.
- Verification path: `php -l news.php`; `node --check assets/js/news.js`; request `/news`, `/news_cn`, and `/assets/js/news.js`; confirm 25 news cards, 12 initially visible, 13 hidden, 25 `data-src` images, and one load-more sentinel.
- Verified on 2026-09-22: PHP lint passed; Node syntax check passed; `/news`, `/news_cn`, and `/assets/js/news.js` returned HTTP 200; both news routes contained 25 cards, 12 visible, 13 hidden, 25 placeholders, 25 `data-src` values, and one sentinel. No connected browser surface was available for visual scroll automation.

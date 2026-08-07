---
name: motorcycle-lazyload-data-src-rule
description: "Reusable lazy-image contract for the motorcycle PHP site."
project: C:\Users\user\Desktop\motorcycle
triggers: ["lazyload", "lazy load", "lazy-loading", "data-src", "image lazy loading"]
---

# Absolute lazy-image rule

For every new or updated lazy image in `fc-moto-new`, keep the real asset URL in `data-src`; `src` must be a tiny inline 1x1 SVG/data URI placeholder. Retain `loading="lazy"` and `decoding="async"`, and activate the image through the shared `fc-moto-new/js/lazyload.js` IntersectionObserver with its non-IntersectionObserver fallback. Do not put the real image URL in `src` for this pattern.

When product cards are revealed dynamically, dispatch `fc-moto:lazyload:refresh`. When a gallery changes its selected image, update `data-src`, remove `data-lazy-loaded`, and dispatch the same event. Do not invent image dimensions; add width/height only when reliable source dimensions are known. Verify rendered `src`, `data-src`, loader status, fallback behavior, and HTTP asset paths.

Project rule source: `C:\Users\user\Desktop\motorcycle\knowledge.md`. Current implementation: `fc-moto-new/js/lazyload.js`, `template/product-list.php`, `template/product-detail.php`, `js/product-list.js`, and `js/product-detail.js`.

# High-priority data-src image lazy loading

priority: high
triggers: lazyload, lazy load, data-src, image loading, page images

## Required contract

For page-body display images, keep the original URL in `data-src` and set `src` to a 1 x 1 SVG data-image placeholder. Use `IntersectionObserver` with a modest preload margin to restore the original URL when the image approaches the viewport. Remove `data-src` only after the restored image fires a successful `load` event. Apply `loading="lazy"` and `decoding="async"` to the restored image.

## Exclusions

Never convert images inside `header`, `footer`, mobile menu, off-canvas UI, preloader, WhatsApp/floating-contact UI, or `[data-lazy-exclude]`. Do not convert CSS `background-image`, `data-background-image`, video elements, or video sources. Keep background and video loading behavior unchanged.

## Dynamic content

Any image created after initial page load must use the same `data-src` plus placeholder contract before it is appended or immediately after creation. News/infinite-scroll cards are included.

## Verification

Check a representative page and dynamic list in the browser: before reveal, eligible images have a placeholder `src` and original `data-src`; after reveal and successful load, `src` is the original URL and `data-src` is absent. Confirm header/footer images have no lazy attributes, background-image values are unchanged, and video/source counts are unchanged. Run syntax checks, HTTP checks, and UTF-8 checks.

## Project reference

EDSB implementation: `C:/Users/user/Desktop/EDSB/website-edsb/js/main.js` and `C:/Users/user/Desktop/EDSB/EDSB_IMAGE_LOADING_CONTINUATION.md`.

The suspected `skills/claude-website` and dedicated lazy-load reference were not present in the current `.codex` checkout on 21 August 2026. The local compression protocol named by PULSE was also unavailable, so this additive note follows the available PULSE/AGENTS rules and is intentionally concise.

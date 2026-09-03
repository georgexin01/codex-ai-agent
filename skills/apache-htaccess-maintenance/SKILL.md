---
name: apache-htaccess-maintenance
description: Audit and update Apache .htaccess rules for PHP no-cache headers, static-asset caching, clean URLs, and directive conflicts in PHP, static, or marketing websites.
metadata:
  short-description: Maintain Apache cache and rewrite rules
---

# Apache `.htaccess` Maintenance

Use this skill when a project contains `.htaccess`, Apache rewrite rules, PHP response caching, `mod_headers`, `mod_expires`, or a request to clean and modernize Apache site configuration.

## Required PHP policy

When the owner requests the Zeta-style PHP policy, preserve this block exactly once under a PHP file match:

```apache
<IfModule mod_headers.c>
  <FilesMatch "\.php$">
    Header always set Cache-Control "no-store, no-cache, must-revalidate"
    Header always set Pragma "no-cache"
    Header always set Expires "0"
  </FilesMatch>
</IfModule>
```

If other layers may add the same headers, inspect both Apache header tables. Before the required `Header always set` lines, `Header onsuccess unset` and `Header always unset` can remove conflicting `Cache-Control`, `Pragma`, and `Expires` values. Do not add this cleanup mechanically when current response ownership is already proven and there is no conflict.

## Audit before editing

1. Read the complete root `.htaccess` and locate every nested `.htaccess`.
2. Search for `Cache-Control`, `Pragma`, `Expires`, `Header`, `FilesMatch`, `mod_headers`, `mod_expires`, `ExpiresDefault`, `ExpiresByType`, `Clear-Site-Data`, `RewriteRule`, and PHP endpoints.
3. Check whether PHP actually exists. A future PHP rule may still be valid, but it cannot be live-tested without a PHP endpoint.
4. Preserve clean-route, access-control, charset, sitemap, and application-specific rewrite behavior unless the request includes those areas.
5. Treat commented-out destructive or state-clearing directives, such as `Clear-Site-Data`, as cleanup candidates only when they are inactive and have no documented purpose.

## Caching decisions

- Preferred reusable baseline for this owner when the project uses versioned static assets: keep the exact PHP no-store block above, use `ExpiresDefault "access plus 1 month"` for static fallback assets, and use `ExpiresByType text/html "access plus 0 seconds"` for HTML revalidation.
- PHP, login, admin, API, form-processing, and other dynamic responses should not be stored when the owner requires the no-cache policy.
- `ExpiresDefault "access plus 1 month"` is a fallback cache lifetime for response types without a more specific rule. It commonly benefits versioned CSS/JS, images, fonts, and other static assets.
- `ExpiresByType text/html "access plus 0 seconds"` makes HTML revalidate quickly; it does not equal `no-store`.
- Do not remove the static caching block solely because PHP must not be cached. Remove or narrow it only when the project has another deliberate asset-cache policy or the owner wants browser/server defaults.
- Respect cache-busted asset URLs such as `style.css?v=...`; a long static lifetime is useful when the version changes after every asset update.
- Never apply the PHP no-store headers to all files unless the owner explicitly requests a site-wide no-cache policy.

## Project-specific boundaries

Do not copy rewrite targets, legacy redirects, sitemap rules, private-file protections, proxy routes, or application paths from another project. Re-audit each project's document root, route map, Apache modules, deployment layout, and existing cache-busting convention before applying the reusable baseline.

## Verification and limits

- Confirm the required PHP lines occur once, containers are balanced, and no duplicate `.htaccess` or stale operational references remain.
- Run the nearest available config or syntax check. If Apache is unavailable locally, state that limitation instead of claiming syntax or response-header success.
- If a PHP endpoint is deployed, verify with `curl -I` and confirm one coherent `Cache-Control`, `Pragma`, and `Expires` policy.
- Check representative static HTML and versioned assets separately so the dynamic and static policies are not confused.
- Do not claim production behavior, CDN behavior, or browser behavior from local source inspection alone.

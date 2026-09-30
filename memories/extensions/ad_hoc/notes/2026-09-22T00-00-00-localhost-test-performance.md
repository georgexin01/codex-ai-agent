# Localhost Test Performance and Project Match

## Evidence

- `C:\Users\user\.codex\skills\localhost-test\scripts\localhost-test.ps1` previously stopped at `STATUS=NO_DEV_SCRIPT` when a PHP project also contained a dependency-only `package.json` without `dev`, `start`, or `dev:local` scripts.
- The same executor reused `127.0.0.1:8081` for `D:\backup\website-zetaCapital` because another project, `D:\backup\website-zetasoftware`, returned HTTP 200 at `/`. Its requested news sitemap then failed.
- After the focused executor patch, the PHP project was detected as `RUNTIME=php-built-in`, started/reused on `127.0.0.1:8082`, and passed every requested path: `/`, `/news`, `/news_cn`, one detail route, and `/news-sitemap.xml`.

## Durable rule

For localhost testing, a package manifest does not prove that a package runtime is the app runtime. If it has no supported development script, continue detection to `index.php` or `index.html` instead of stopping. A listener is reusable only when every requested smoke path returns HTTP 2xx/3xx; a healthy root response from another project is not a project match.

## Verification

- PowerShell parser check: pass.
- Canonical executor smoke test: `STATUS=PASS`.
- Verified project root: `D:\backup\zeta-capital\website-zetaCapital`.
- Verified runtime: `php-built-in`.
- Verified selected port: `8082`.

## Related files

- `C:\Users\user\.codex\skills\localhost-test\SKILL.md`
- `C:\Users\user\.codex\skills\localhost-test\scripts\localhost-test.ps1`

Refresh this note if the executor or project-runtime detection changes.

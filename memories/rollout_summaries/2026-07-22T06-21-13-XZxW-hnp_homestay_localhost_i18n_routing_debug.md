thread_id: 019f887c-460e-7992-bd16-abac9f629694
updated_at: 2026-07-22T07:38:05+00:00
rollout_path: C:\Users\user\.codex\sessions\2026\07\22\rollout-2026-07-22T14-21-22-019f887c-460e-7992-bd16-abac9f629694.jsonl
cwd: \\?\C:\xampp\htdocs
git_branch: main

# HNP Homestay localhost and bilingual routing rollout

Rollout context: Work occurred in `C:\xampp\htdocs`, a PHP/MySQL project served by PHP’s built-in server on `127.0.0.1:8080`, with phpMyAdmin on port 80 and MySQL on 3306.

## Task 1: Verify local hosting and database connectivity

Outcome: success

Key steps:
- Confirmed port 8080 was already served by `php -S 127.0.0.1:8080 index.php`.
- Confirmed phpMyAdmin and MySQL were reachable.
- Verified `api/Website/Config.php` uses database `airbnb.com_db`, host `localhost`, and `mysqli`.
- Added `http://localhost:8080` to the development CORS allow-list.

Reusable knowledge:
- phpMyAdmin is only the management UI; the website reads the same MySQL database directly.
- Project entrypoint is root `index.php`; routing is implemented in root `router.php`.
- `/` and several pages returned HTTP 200 before later bilingual changes; `/properties` initially had an existing 404 route/data issue.

## Task 2: Add English/Chinese route-based i18n

Outcome: partial

Preference signals:
- The user requested that language changes affect the website while preserving database structure/data; future edits should keep DB content and schema untouched unless explicitly requested.
- The user explicitly wanted footer copyright/provider text to remain English on Chinese pages: `© 2026 HNP Homestay. All rights reserved.` and `Provided by Zeta Capital Sdn. Bhd.` -> treat these as permanent English strings.

Key steps:
- Added `i18n/en.json` and `i18n/cn.json`.
- Added shared helpers in `api/Website/Helper.php`: `siteLanguage()`, `sitePath()`, `localizedPath()`, `isCurrentPath()`, and `t()`.
- Added `/cn/...` routing by stripping `/cn` before normal route matching and setting `zh-CN` HTML language.
- Updated active templates, navigation, footer links, buttons, labels, property links, and language switchers to use locale keys and localized paths.
- Updated the property-detail WhatsApp URL to preserve the active language prefix.
- Kept footer copyright/provider text hardcoded in English in `template/lib/footer.php`.

Failures and how to do differently:
- Initial live page checks returned HTTP 500 because the database-backed application layer failed; this remained unresolved and was not caused by the language mapping after the redeclaration fix.
- `Website\siteLanguage()` was initially redeclared because `Helper.php` was explicitly required in `index.php` and also listed in Composer `autoload.files`. The fix was to remove the direct helper include and load Composer autoload only.
- Several PowerShell/PHP one-liners failed due to quoting/escaping. Prefer here-strings or separate script files for PHP validation commands.

Verification:
- PHP lint passed for changed PHP files.
- Locale JSON files parsed successfully.
- CSS asset returned HTTP 200 and contained the language positioning rule.
- Route mapping unit-style check produced `/about`, `About` for English and `/cn/about`, `关于我们` for Chinese.
- Live `/cn/...` and English pages still returned HTTP 500 due to the existing DB/runtime failure, so browser-level visual parity was not verified.

References:
- Primary files: `C:\xampp\htdocs\index.php`, `C:\xampp\htdocs\api\Website\Helper.php`, `C:\xampp\htdocs\template\lib\footer.php`, `C:\xampp\htdocs\i18n\en.json`, `C:\xampp\htdocs\i18n\cn.json`.
- Duplicate-load evidence: `composer.json` registers `api/Website/Helper.php` under `autoload.files`; `index.php` also required it, causing the fatal redeclaration.
- Verification commands: `php -l index.php`, `php -l template/lib/footer.php`, `git diff --check`, `curl.exe -i http://127.0.0.1:8080/cn/about`.

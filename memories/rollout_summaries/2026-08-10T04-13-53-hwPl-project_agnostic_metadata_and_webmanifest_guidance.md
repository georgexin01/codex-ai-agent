thread_id: 019fe9e0-8772-7143-8b6b-11cc8a866137
updated_at: 2026-08-10T04:22:20+00:00
rollout_path: \\?\C:\Users\user\.codex\sessions\2026\08\10\rollout-2026-08-10T12-13-53-019fe9e0-8772-7143-8b6b-11cc8a866137.jsonl
cwd: \\?\C:\Users\user\Desktop\ai comment

# Updated reusable metadata guidance to be project-agnostic and evidence-bound

Rollout context: In `C:\Users\user\Desktop\ai comment`, the user asked to revise `(AI) metaTitle.txt` so it no longer hardcodes VIP Billion/KingsGuard or narrow car/service examples, and so AI derives current project identity, scope, metadata, and manifest values from the active website/app.

## Task 1: Generalize metadata identity and scope rules

Outcome: success

Preference signals:
- The user asked to avoid references that point directly to “car, door, hotel” or a single website/page and requested “more globe or area larger things” -> future metadata guidance should use the broadest accurate industry, category, market, regional, national, international, or global scope, without exaggeration.
- The user explicitly wanted the active project name rather than “VIP BILLION...” or another prior project -> future agents should inspect current project evidence and preserve exact confirmed spelling/legal suffixes.
- The user wanted metadata centralized rather than placed in seed/data or unrelated templates -> prefer an existing centralized metadata module/include/route map.

Key steps:
- Patched `(AI) metaTitle.txt` to require discovery of the actual project root, project instructions, routes, visible brand, configuration, and runtime content.
- Removed hardcoded historical company names, domains, social handles, copied page filenames, narrow industry examples, and placeholder social URLs.
- Added `INSUFFICIENT DATA` behavior when identity or scope cannot be confirmed.
- Added broad-scope rules while preserving specific item/article names for genuinely detail-oriented pages.

Failures and how to do differently:
- An initial `rg --literal-path` verification failed because the installed ripgrep did not support that option; PowerShell `Select-String -LiteralPath` worked.
- A later narrow-term scan initially matched the safeguard sentence itself; the safeguard was rewritten generically and the scan then passed.
- `git diff` was unavailable because the workspace is not a Git repository; rely on read-back and targeted scans in this workspace.

Reusable knowledge:
- Final verification passed with no direct website/company references and no car/door/hotel/room/vehicle examples remaining.

References:
- File: `C:\Users\user\Desktop\ai comment\(AI) metaTitle.txt`
- Verification result: `PASS: no direct website/company reference and no car/door/hotel/room/vehicle example remains.`

## Task 2: Add site.webmanifest guidance

Outcome: success

Preference signals:
- The user asked to remind AI to update `site.webmanifest` “with project info inside” -> future metadata workflows should explicitly cover manifest identity and consistency.

Key steps:
- Added rules for `name`, `short_name`, `description`, `lang`, `id`, `start_url`, `scope`, `display`, verified icons, and evidence-based colors.
- Required consistency with HTML metadata, Open Graph, favicon, visible brand, and JSON-LD.
- Added a rule to skip manifest creation when the project is not an installable web app.

Reusable knowledge:
- Manifest verification passed: the new section exists and no direct historical identity, domain, or URL placeholder remains.

References:
- Section heading: `site.webmanifest task (update with the active project information):`

v1

## User Profile

The user maintains several Windows-based projects through Codex: the `.codex` configuration checkout, a bilingual Zeta static website, a Used-Car Vue/Supabase client, and local Supabase restoration tooling. They value agents that investigate and make narrowly scoped repairs, preserve working state, and verify real outcomes. They commonly expect bilingual English/Simplified-Chinese parity, source-grounded project understanding, and actual localhost/HTTP or build checks rather than claims based on an edit alone.

## User preferences

- For `localhost test`, detect the project type, start only the necessary runtime, and verify expected URLs; a running process is not completion.
- Preserve existing routes, content, images, CSS, and protected local state unless the requested change requires it; make surgical changes and validate both affected surfaces.
- For bilingual Zeta work, update English and Chinese together and test parity (paired IDs, localized labels, corresponding pages).
- Derive project identity, metadata claims, and webmanifest values from current evidence; use `INSUFFICIENT DATA` rather than historical/example identity or invented reach.
- When the user asks for a repair, investigate the actual failure and safely act; report verified state separately from absolute guarantees about later manual/tool changes.

## General Tips

- On Windows, favor simple PowerShell invocations when quoting-heavy commands fail; run checks from the true app root.
- Diagnose missing `.codex` files with Git tracking and sparse-checkout state before restoring/resetting. Sparse checkout is currently disabled in that worktree.
- Treat local static-server tests as separate from Apache/Cloudflare production behavior; localhost does not exercise `.htaccess` cache/compression rules.
- Keep secrets out of output and use local-mode configuration for Used-Car builds when default SSG lacks Supabase environment values.

## What's in Memory

### C:\Users\user\.codex

#### 2026-10-08

- Sparse-checkout recovery and PowerShell alert: core.sparseCheckout, git sparse-checkout disable, TRACKED_ABSENT, Invoke-WebRequest -UseBasicParsing
  - desc: Search first for apparently missing `.codex` memories/skills, safe recovery, permanent-setting boundary, or the recurring PowerShell warning.
  - learnings: Verify tracked presence before repair; pre-commit rejects enabled sparse checkout, but no absolute guarantee prevents future explicit mutation.

#### 2026-09-04

- Codex boot and localhost routing: 00_PULSE.md, ai read .codex knowledge, localhost-test, ports 3000 5173 6006
  - desc: Boot sentinel and the failure shield for running localhost checks from the configuration directory instead of an app root.
  - learnings: Hydrate once; require HTTP readiness checks from the real project root.

### D:\backup\website-zetasoftware

#### 2026-09-07

- Zeta static-site generators, performance, and image migration: update-site-navigation, format-detail-content.js, style.min.css, data-src, images/mobile
  - desc: Bilingual static-site source map, SIM navigation repair, description grouping, caching, Lighthouse work, and incomplete JPG/WebP migration.
  - learnings: Regenerate after generator fixes; never delete the two-folder WebPs before reference/JPG audits; local PHP cannot validate `.htaccess` effects.

### Older Memory Topics

#### C:\Users\user\Desktop\used-car

- Used-Car client audit and loan cards: PROJECT_CONTEXT.md, template, archived migrations, Favorites.vue, MyLoans.vue, development.localhost
  - desc: Vue/Supabase app orientation, localhost/build workflow, authoritative schema boundary, and surgical saved-loan UI reversal; cwd=C:\Users\user\Desktop\used-car.

#### C:\Users\user\Documents\supabase-project-backup-restore

- Huwa2 restore and PostgREST exposure: auth.identities, identities_user_id_fkey, PGRST_DB_SCHEMAS, config.toml
  - desc: Use for validating/repairing a VPS backup, atomic local restore, and exposing a schema in a CLI-managed Supabase stack; cwd=C:\Users\user\Documents\supabase-project-backup-restore.

#### C:\Users\user\Desktop\ai comment

- Evidence-bound metadata and webmanifest: (AI) metaTitle.txt, INSUFFICIENT DATA, site.webmanifest
  - desc: Use for centralized SEO/manifest guidance that must derive identity and scope from the active project; cwd=C:\Users\user\Desktop\ai comment.

#### C:\Users\user\Desktop\used-car

- Chrome SideBySide repair: Dependent Assembly, new_chrome.exe, 151.0.7922.175
  - desc: Windows Chrome incomplete-update diagnosis and version-checked launcher repair; recheck live versions before changing system files; cwd=C:\Users\user\Desktop\used-car.

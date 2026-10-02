v1

## User Profile

Works across Windows web projects: bilingual static sites, Vue/ViteSSG/Supabase applications, local Docker/CLI Supabase, and Codex configuration. Values source-grounded project understanding, surgical implementation, paired bilingual updates, and verification at the actual runtime/deployment boundary. Maintains metadata guidance that must stay independent of historical project identities.

## User preferences

- For `ai read .codex knowledge`, reply only `[🟢] Agent is Ready..`; do not append explanation.
- For "localhost test," identify the application root, launch only what is needed, and report real URL/status checks—not just a listener.
- For bilingual Zeta work, English markup/design is the source; update Chinese counterparts and parity checks in the same task.
- Preserve unrequested content during focused fixes; for "exact same design," reuse canonical structure/classes rather than approximating.
- For project understanding, read project-owned Markdown and current source; treat sample/reference assets as non-production evidence.
- For metadata, derive the actual active project identity/scope from evidence; use `INSUFFICIENT DATA` rather than historical names or invented claims.
- Prefer reversible, narrow changes and current source/test/runtime evidence over broad cleanup or stale documentation.
- Keep EDSB Auth/CRUD phone-first and do not clear shared email data without explicit owner approval. [ad-hoc note]

## General Tips

- On Windows, favor simple separately quoted PowerShell commands and run checks from the real application root.
- Local HTTP 200 proves reachability, not crawler readiness, production deployment, Apache rules, or browser visual quality.
- Parse bilingual JSON after edits; check unique/paired IDs, UTF-8, rendered fallback/schema alignment, and both routes.
- For stateful Supabase work, validate backup consistency, preserve originals/config backups, and distinguish DB restore from API exposure.
- Do not print secrets; use local mode/config without exposing environment values.

## What's in Memory

### C:\Users\user\Desktop\EDSB\admin-panel-edsb

#### 2026-09-18

- EDSB Admin phone-only login and Docker-local Auth parity: auth.users.phone, 050_edsb_phone_only_admin_users.sql, edsb.users, /auth/login
  - desc: Phone-first User CRUD and Docker-local Supabase parity; never use this parity operation on the VPS. [ad-hoc note]
  - learnings: New Auth identities use `email = NULL`; preserve shared Auth/public email fields unless explicitly approved. [ad-hoc note]

### D:\backup\website-zetasoftware

#### 2026-09-07

- Generated navigation, content grouping, cache/minify: generate-standard-internal-management-pages.js, update-site-navigation.js, format-detail-content.js, style.min.css
  - desc: Static bilingual generator maintenance, cache policy, main-thread investigation, and incomplete minified-CSS verification; cwd=D:\backup\website-zetasoftware.
  - learnings: Regenerate shared navigation after SIM pages; immutable-cache only versioned assets; trace main-thread work before optimizing.
- Localhost, lazy images, JPG/WebP migration: php -S 127.0.0.1:8080, data-src, IntersectionObserver, images/mobile, images/website
  - desc: Static runtime checks and unfinished two-folder image migration; search here before changing or deleting WebP assets.
  - learnings: Do not delete WebPs until cross-source reference/JPG/route and viewport-lazy-loader checks pass.

### C:\Users\user\.codex

#### 2026-09-04

- Codex boot and localhost-routing guard: ai read .codex knowledge, 00_PULSE.md, localhost-test
  - desc: Exact sentinel behavior, lazy boot routing, and stop rule when no app exists under `.codex`; cwd=C:\Users\user\.codex.
  - learnings: Hydrate once; rerun localhost checks from an application root.

### Older Memory Topics

#### D:\backup\website-zetasoftware

- FAQ/blog/homepage/portfolio parity: data/faq.json, js/faq.js, data/blogs-cn.json, sticky-phone
  - desc: Bilingual FAQ source/schema, localized latest blogs/pricing, blog shells, and exact homepage phone-frame reuse; cwd=D:\backup\website-zetasoftware.

#### C:\Users\user\Desktop\used-car

- Used-Car audit, schema boundary, local build: PROJECT_CONTEXT.md, template/, _archived, development.localhost, Favorites.vue
  - desc: Vue/ViteSSG project map, external-admin SQL boundary, local verification, and saved-loan UI reversal; cwd=C:\Users\user\Desktop\used-car.
- Chrome SideBySide repair: Dependent Assembly, new_chrome.exe, chrome_proxy.exe, 151.0.7922.175
  - desc: Host-specific pending-Chrome-update repair; inspect event/file-version evidence before replacing launchers; cwd=C:\Users\user\Desktop\used-car.

#### C:\Users\user\Documents\supabase-project-backup-restore

- Huwa2 local restore and PostgREST: auth.identities, identities_user_id_fkey, PGRST_DB_SCHEMAS, config.toml
  - desc: Repair inconsistent VPS auth backup, atomic restore, and CLI-managed schema exposure; cwd=C:\Users\user\Documents\supabase-project-backup-restore.

#### C:\Users\user\.codex

- Codex routing/performance/Git: Update-CodexRouting.ps1, KNOWLEDGE_COMPRESSION_PROTOCOL.md, git sparse-checkout, memories/.git
  - desc: Route-first maintenance, checkpoints, sparse staging, and historical nested-Git caution; cwd=C:\Users\user\.codex.

#### C:\Users\user\Desktop\ai comment

- Project-agnostic metadata: (AI) metaTitle.txt, site.webmanifest, INSUFFICIENT DATA
  - desc: Evidence-based identity/scope and centralized metadata/manifest workflow; cwd=C:\Users\user\Desktop\ai comment.

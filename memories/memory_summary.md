v1

## User Profile

The user maintains several local Windows projects: a bilingual Zeta Software static site, a Used-Car Vue/Supabase client, local Supabase backups, and Codex configuration. They value source-grounded implementation and verification over generic advice, favor narrow/reversible changes, and often specify exact UI/content contracts. They expect bilingual English/Simplified-Chinese parity where applicable and want unfinished work labeled honestly.

## User preferences

- For a requested change, preserve unrelated content/behavior and make the smallest effective edit; inspect counterpart pages/languages when the request implies both.
- Treat “localhost test” as runtime detection plus HTTP readiness checks, not merely starting a process.
- For project identity, use current project evidence; never carry names, domains, or claims from examples/history. Use `INSUFFICIENT DATA` when evidence is missing.
- Prefer evidence-backed verification (source checks, syntax/JSON/build checks, HTTP routes, and visual QA boundaries) and explicitly mark incomplete validation.
- In bilingual static-site work, English structure is the source; localize corresponding `cn/` output and validate parity.
- Keep destructive or broad maintenance work reversible and scoped; preserve backups and avoid unrequested resets/deletions.

## General Tips

- On Windows PowerShell, favor simple separately quoted `rg` commands; use `Select-String -LiteralPath` for exact-path scans.
- Before localhost checks, locate the real application root. Static Zeta uses PHP at port 8080; Used-Car runs from `template/` with `pnpm.cmd run dev:local` on port 3000.
- For generated/static output, edit the generator/source of truth, regenerate both languages, then validate output and routes.
- Do not state performance or visual success from source/HTTP checks alone when browser profiling/visual testing was unavailable.
- Do not expose secrets; local Supabase builds need the project’s configured local mode rather than printing environment values.

## What's in Memory

### D:\backup\website-zetasoftware

#### 2026-09-07

- Bilingual static-site audit, navigation, copy, cache, and CSS: generate-standard-internal-management-pages, update-site-navigation, format-detail-content, style.min.css, Cloudflare cache
  - desc: Search first for generator coupling, English/CN output parity, cache advice, `main.js` diagnostics, or the incomplete minified-CSS verification.
  - learnings: Run `update-site-navigation` after SIM generation; use a trace before performance edits; minified CSS was written but final served/idempotence checks were interrupted.
- Localhost, Lighthouse, lazy images, and JPG/WebP boundary: php -S 127.0.0.1:8080, data-src, IntersectionObserver, images/mobile, images/website
  - desc: Static-server verification and performance work, including the unfinished request to make only two image folders JPG-default and remove their WebPs.
  - learnings: Do not delete WebPs until cross-format reference auditing and route/image validation finish; current lazy-loader needs true viewport-triggered verification.

### C:\Users\user\.codex

#### 2026-09-04

- Codex boot and localhost-root boundary: 00_PULSE.md, ai read .codex knowledge, localhost-test, ports 3000 5173 6006
  - desc: Exact boot sentinel and why a localhost scan from the Codex configuration root is not a valid app readiness check.
  - learnings: Hydrate once; obtain the actual project root before selecting ports and URLs.

### C:\Users\user\Desktop\used-car

#### 2026-08-28

- Used-Car project/audit, schema boundary, and loan cards: PROJECT_CONTEXT.md, archived migrations, Favorites.vue, MyLoans.vue, development.localhost
  - desc: Vue/ViteSSG project map, external authoritative schema warning, local runtime, and the removed precise-quote UI.
  - learnings: Work from `template/`; archived migrations are not provisionable; local build requires `--mode development.localhost`.
- Chrome SideBySide repair: Chrome, missing dependent assembly, new_chrome.exe, 151.0.7922.175
  - desc: Windows-specific diagnosis for an incomplete Chrome update, not a Used-Car code issue.
  - learnings: Inspect SideBySide logs, pending launchers, and version data before modifying shortcuts.

### Older Memory Topics

#### D:\backup\website-zetasoftware

- FAQ, latest blogs, services labels, and pricing parity: faq.json, home-blogs.js, pricing-section, Orbitron, Week 1
  - desc: Exact bilingual content/UI contracts, paired-ID validation, latest-three blog behavior, and services/homepage visual parity; cwd=D:\backup\website-zetasoftware.

#### C:\Users\user\.codex

- Lean knowledge/routing maintenance: MEMORY_DETAILS.md, Update-CodexRouting.ps1, Audit-CodexRouting.ps1, Test-CodexPerfBenchmark.ps1
  - desc: Compact hot-memory routing and validation workflow; cwd=C:\Users\user\.codex. Check current counts before relying on historical benchmark results.
- Sparse-checkout Git maintenance: git sparse-checkout, git add --sparse, thread-writer-locks, memories/.git
  - desc: Parent-repository staging/commit workflow, recoverable cleanup, and nested-repository safeguard; cwd=C:\Users\user\.codex.

#### C:\Users\user\Documents\supabase-project-backup-restore

- Huwa2 restore and API exposure: auth.identities, identities_user_id_fkey, atomic restore, PGRST_DB_SCHEMAS, config.toml
  - desc: Repairing orphan auth identities in a working backup, atomic local restore, and CLI-managed PostgREST schema exposure; cwd=C:\Users\user\Documents\supabase-project-backup-restore.

#### C:\Users\user\Desktop\ai comment

- Metadata and `site.webmanifest` guidance: metaTitle.txt, INSUFFICIENT DATA, project identity, Select-String -LiteralPath
  - desc: Evidence-based current-project identity, truthful scope, centralized metadata, and manifest synchronization rules; cwd=C:\Users\user\Desktop\ai comment.

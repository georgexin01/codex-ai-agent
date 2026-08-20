v1

## User Profile

The user maintains several local web/app projects, including a HUWA2 customer-facing Vue app, bilingual English/Chinese static sites, PHP front-controller sites, and local Supabase environments. They work on Windows/PowerShell and value source-grounded identity/content, faithful UI parity, protected local state, and verification that matches the requested outcome. They expect checkout boundaries to be respected rather than importing assumptions from another project. Long work should retain a precise continuation state. [ad-hoc note]

## User preferences

- For bilingual Zeta work, English markup is the source of truth; update and verify the matching `cn/` counterpart before completion.
- Treat "exact same design" as reuse of the canonical existing DOM/CSS/component, not an approximation.
- Derive identity, claims, metadata, and product requirements from active-project evidence; use `INSUFFICIENT DATA` rather than historic/example facts.
- Prefer surgical, reversible maintenance over heavy `.codex` changes; inspect live routes and benchmarks before recommendations.
- For long work, retain exact constraints, IDs, errors, decisions, verification, and the smallest `NEXT` action.
- For local Supabase work, preserve original backups and protected state; verify both data restore and API exposure.
- Every AI-generated image must be <=1600px; resize oversize output, default to JPG unless alpha is needed, verify final dimensions, and log provenance/use. HUWA is capped at 1200px. [ad-hoc note]
- For HUWA2 visual work, preserve Vue/Pinia/API/RPC/route/i18n/database contracts; use `src/assets/images/generate/`, avoid duplicate `--v2`-style CSS roles, and log batches in `PROJECT_CHANGELOG.md`. [ad-hoc note]

## General Tips

- Current files, tests, logs, and router output override historical memory and old counts.
- Do not call interrupted or locally-only checked work complete; record the missing browser/deployment/live gate.
- For multilingual JSON/HTML, use explicit UTF-8-safe reads/writes, parse JSON after edits, and check paired IDs/counts.
- Use `Select-String -LiteralPath` for literal exact-file PowerShell scans; `rg --literal-path` is unsupported.
- For long tasks, use [skills/fast-batch-checkpoint/SKILL.md](C:/Users/user/.codex/memories/skills/fast-batch-checkpoint/SKILL.md).
- For HUWA2 visual claims, `npm.cmd run build` is necessary but insufficient: inspect the mobile route against `/sample`, or explicitly report the visual gate as blocked/partial. [ad-hoc note]

## What's in Memory

### C:\Users\user\Desktop\huwa\webApp-huwa2

#### 2026-08-19

- HUWA2 customer Vue app visual-work continuation: webApp-huwa2, PROJECT_CHANGELOG.md, npm.cmd run build, /luckydraw, checkoutApi.ts, cartStore
  - desc: Current-state routing for customer-facing Vue visual changes; preserve stores/API/RPC/i18n/database contracts and use read-only `/sample` references. [ad-hoc note]
  - learnings: Lucky Numbers routes to `/luckydraw`; database/checkout behavior remains contract-owned, while visual parity requires a mobile screenshot check beyond build success. [ad-hoc note]

### C:\Users\user\Documents\supabase-project-backup-restore

#### 2026-08-14

- Huwa2 VPS backup restore and local PostgREST exposure: huwa2, 04-auth-rows.sql, identities_user_id_fkey, scripts/04-restore-local.sh, PGRST_DB_SCHEMAS, [api].schemas
  - desc: Search first for orphan `auth.identities` repair, atomic local restore checks, or exposing `huwa2` through CLI-managed local-supabase.
  - learnings: Validate identity parents before retrying; Compose expose tooling does not apply to `com.supabase.cli.project`—edit `supabase/config.toml`, restart with CLI, then verify database and API independently.

### D:\backup\website-zetasoftware

#### 2026-08-13

- Bilingual FAQ, homepage/blog, services, and pricing parity: faq.json, js/faq.js, home-blogs.js, pricing-section, Orbitron
  - desc: English/Chinese parity, FAQPage JSON-LD, exact blog-card contracts, Week labels, pricing/font fixes; cwd=D:\backup\website-zetasoftware.
  - learnings: Keep 30 paired FAQ IDs/fallback/schema; five Zeta IDs are first; visual deployment still requires upload, hard-refresh, and browser inspection.
- Blog system and portfolio phone cards: blogs.json, blogs-cn.json, blogs.md, contentHtml, sticky-phone, portfolio-card-phone
  - desc: Verified blog rules, incomplete ten-article regeneration, and exact homepage phone-frame reuse.
  - learnings: Copy/validate generated assets before JSON references; portfolio has eight canonical phone structures per language.

### Older Memory Topics

#### C:\Users\user\.codex

- Lean routing and fast-batch checkpoints: 00_PULSE.md, Update-CodexRouting.ps1, FAST BATCH STATE, nested-memories-git
  - desc: Route-first maintenance, compression, boot sentinel, task-continuation workflow, and VIPBillion additive news-import overlay; cwd=C:\Users\user\.codex. [ad-hoc note]

#### C:\Users\user\Desktop\motorcycle\fc-moto-new

- FC-Moto metadata, noindex, and shared footer: fcMotoPageMeta, noindex, nofollow, site.webmanifest, category.json
  - desc: Central PHP metadata/indexing policy, UTF-8 cleanup, and data-driven footer requirements; cwd=C:\Users\user\Desktop\motorcycle\fc-moto-new.

#### C:\Users\user\Desktop\ai comment

- Truthful current-project metadata and manifest: metaTitle.txt, INSUFFICIENT DATA, site.webmanifest, Select-String -LiteralPath
  - desc: Reusable workflow for active-project identity and existing installable-app manifest updates; cwd=C:\Users\user\Desktop\ai comment.

#### C:\Users\user\Desktop\motorcycle\jambolive

- JamboLive 317-product import and taxonomy audit: database.json, import-public-products.ps1, 317 products, /media/uploadedphoto/
  - desc: Product import integrity and live category-label checks; cwd=C:\Users\user\Desktop\motorcycle\jambolive.

#### C:\Users\user\Desktop\saleshero

- Sales Hero schema and Mermaid test flow: sales_hero.sql, testflow_saleshero.md, flowchart TD, credit-limit, refunds
  - desc: SQL-grounded workflow knowledge and compact flowchart contract; cwd=C:\Users\user\Desktop\saleshero.

#### C:\Users\user\Desktop\thongthai2\admin-panel-Thongthai

- Floorplanstatistics seat behavior: isAvailableSeat, reserved, @pointerdown, floorplans/table.vue
  - desc: Red/reserved seats in statistics are visual-only; distinguish the editable floorplan page.

#### C:\Users\user\Desktop\cermin_v2

- Cermin PHP localhost test: php -S 127.0.0.1:8000 index.php, /skudai, /unknown, HTTP-404
  - desc: Prior run was aborted before HTTP statuses; inspect port/processes and retest routes sequentially.

thread_id: 01a158a1-2bed-7f01-a73e-548bb33a1142
updated_at: 2026-10-20T10:38:45+00:00
rollout_path: \\?\C:\Users\user\.codex\sessions\2026\10\20\rollout-2026-10-20T17-25-20-01a158a1-2bed-7f01-a73e-548bb33a1142.jsonl
cwd: \\?\D:\project\lionrider

# Lion Rider orientation and Partner retirement completed

Rollout context: `D:\project\lionrider` contains a PHP storefront, a Vben Admin panel, and shared Docker-local Supabase (`local-supabase`, schema `lionrider`). The user first requested broad project/Markdown understanding, then the active work removed the unused Partner entity from the Admin/database while preserving the static Partner Program page.

## Task 1: Project and Markdown orientation

Outcome: partial

Preference signals:
- The user asked to “understand my project website and admin-panel also read all existing .md to understand the project situation” and said Admin updates would follow -> future work should begin with current project docs/source orientation and distinguish project-specific docs from bundled framework references.
- Existing dirty website changes were explicitly preserved; avoid resetting, cleaning, or assuming the workspace root is a Git worktree.

Key steps:
- Read PULSE and project memory, then inventoried 155 Markdown files while prioritizing `PROJECT_CONTEXT.md`, `PROJECT_STATUS.md`, `OWNER_REQUEST_LEDGER.md`, REAL/DUMMY database docs, Admin instructions, and storefront handoff files.
- Confirmed separate app boundaries: `lionrider-website/` is the only Git worktree; `admin-panel-lionrider/` has no Git metadata.
- Confirmed the root `knowledge.md` is copied FC-Moto material and not Lion Rider truth.
- Grounded current state in live/source evidence rather than stale dated Markdown.

Failures and how to do differently:
- A PowerShell `Select-String` regex failed on the Windows path; `-SimpleMatch` worked.
- Broad Markdown output was repeatedly truncated; future orientation should read front-door/current handoff docs first and avoid dumping all bundled Vben docs.
- Several status documents retained stale historical claims; always prefer the latest `PROJECT_STATUS.md` checkpoint and live database/source checks.

Reusable knowledge:
- Storefront: `lionrider-website/`, PHP `index.php`/`router.php`, shared `lib/`, templates in `template/`; local runtime historically uses port 8012.
- Admin: `admin-panel-lionrider/apps/web-antd/`, Vben Vue/TypeScript, schema-locked to `lionrider`.
- Owner direction: use existing REAL contract, accept website page/data loss where REAL cannot represent prior mirror behavior, never drop mirror tables without separate authorization, and preserve shared/non-Lion-Rider schemas.
- Current major remaining gates are authenticated browser CRUD, image/upload click-through, and contract-safe database-backed checkout; REAL `productVariant` is empty and no verified SKU/stock mapping exists.

## Task 2: Retire unused Partner entity

Outcome: success

Preference signals:
- The user’s active project direction favored removing unused Admin/database scope while keeping static marketing content separate -> do not remove the public `/partner-program` page or its imagery merely because the database entity is retired.

Key steps:
- Backed up four `partner` permission rows to `D:\project\lionrider\tmp\partner_retirement_permissions_prechange_20261020.csv`.
- Removed Partner route, store, types, locale labels, and Partner-specific owner-content branches from Admin source.
- Added and applied `admin-panel-lionrider/supabase/migrations/20261020140005_lionrider_retire_partner.sql`.
- Reconciled root REAL docs, website DUMMY docs, Admin README/SUPABASE docs, and project status/ledger to describe Partner as retired or absent.

Verification:
- Post-migration readback: 29 Lion Rider tables, 29 with RLS/policies, 103 policies, 108 permission rows across 27 resources; Partner table/function/permission rows/storage objects all zero/absent.
- `supabase migration list --local` showed migration `20261020140005`; `supabase db push --local --dry-run` later reported database up to date.
- Admin typecheck passed: `pnpm --filter @vben/web-antd typecheck`.
- Admin production build passed: `pnpm --filter @vben/web-antd build`, with existing browser-data, dynamic-import, and chunk-size warnings.
- JSON contracts parsed; DUMMY Markdown `git diff --check` passed; no Partner references remained in active Admin source.

Failures and how to do differently:
- Initial migration filename conflicted with an already-applied/unrelated timestamp; it was renamed to `20261020140005` after checking migration history.
- An early permission backup attempt used fragile inline PowerShell quoting and failed; SQL via stdin/file is safer.
- Some historical sections in `PROJECT_STATUS.md`, Admin docs, and duplicate schema docs still contain old Partner/count statements; treat clearly dated historical sections as history and use the current checkpoint.

Reusable knowledge:
- Migration SQL was surgical: delete `lionrider.permissions` where `resource='partner'`, drop `lionrider.soft_delete_partner(integer)`, then drop `lionrider.partner`.
- The static Partner Program is marketing content, not a database Partner record.
- Existing website dirty files were preserved; only website DUMMY database Markdown files were changed.

References:
- Migration: `admin-panel-lionrider/supabase/migrations/20261020140005_lionrider_retire_partner.sql`
- Backup: `tmp/partner_retirement_permissions_prechange_20261020.csv`
- Admin route aggregator: `admin-panel-lionrider/apps/web-antd/src/router/routes/index.ts`
- Admin menu filter: `admin-panel-lionrider/apps/web-antd/src/router/access.ts`
- Project checkpoint: `PROJECT_STATUS.md`
- Owner ledger: `OWNER_REQUEST_LEDGER.md`


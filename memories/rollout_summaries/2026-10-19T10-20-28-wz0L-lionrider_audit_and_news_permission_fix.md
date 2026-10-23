thread_id: 01a153ad-4a10-7462-ae4b-3ce33711809b
updated_at: 2026-10-21T01:27:51+00:00
rollout_path: \\?\C:\Users\user\.codex\sessions\2026\10\19\rollout-2026-10-19T18-20-28-01a153ad-4a10-7462-ae4b-3ce33711809b.jsonl
cwd: \\?\D:\project\lionrider

# Lion Rider project audit and News permission follow-up

Rollout context: Work occurred in `D:\project\lionrider`, containing separate PHP website and Vben Admin projects sharing Docker-local Supabase.

## Task 1: Audit Lion Rider website, Admin, Markdown, and local Supabase

Outcome: partial

Preference signals:
- The user asked to understand “all pages website, admin panel” and “read all .md,” then record the learned status into Markdown -> future audits should distinguish current evidence from stale/historical documentation and produce a durable project-status handoff.
- The user explicitly asked whether dummy data, Docker-local Supabase, and schema `lionrider` are correctly set up and what is missing -> future responses should give a direct verified/not-verified/missing checklist rather than treating documentation as proof.

Key steps:
- Established that `D:\project\lionrider` is a container, not a Git repository; `lionrider-website` is a Git repo, while `admin-panel-lionrider` is a separate workspace.
- Read project guidance and targeted Markdown, then queried the live local database read-only.
- Confirmed healthy Docker-local Supabase containers and CLI version 2.84.2.
- Live `lionrider` schema audit found 20 tables at the initial audit point, all with RLS; later rollout updates brought the current documented state to 29 tables after News/storefront work and Partner retirement.
- Confirmed website remains PHP/local-JSON backed and separate from Supabase. Current source fixture had 377 products: 317 accessories and 60 spare parts.
- Confirmed the local mirror had 317 products and 1,364 variants, so it is not the same as the full current website fixture; REAL product/variant/voucher data remains distinct from the website mirror.
- Confirmed PostgREST exposure eventually included `lionrider`; anonymous REST access to protected `product` returned `42501 permission denied`, consistent with protected access rather than missing schema exposure.
- Updated durable status/reference documents, including `PROJECT_STATUS.md`, `REAL-DATABASE-STRUCTURE.md`, `REAL-DATABASE-STRUCTURE.json`, and owner/request/module notes.

Failures and how to do differently:
- A multi-statement `supabase db query` failed with `cannot insert multiple commands into a prepared statement`; use one statement or a single JSON-building query for read-only audits.
- Several PowerShell one-liners failed due to parser errors and overly broad output; use smaller commands and avoid dumping generated `dist` or all upstream Vben Markdown.
- Documentation contained contradictory dated claims (for example old “Docker not in use” statements); current live queries and current status checkpoints must outrank historical notes.
- Authenticated browser CRUD and production state remained unverified because no browser tab was connected; do not claim full CRUD success from schema/grant checks alone.

Reusable knowledge:
- Workspace boundaries: `lionrider-website` is the JSON/PHP storefront; `admin-panel-lionrider/apps/web-antd` is the active Vben Admin app; Admin uses schema `lionrider` in shared `local-supabase`.
- Never reset, replace, or drop the shared Supabase stack/schema. Use read-only SQL audits and file-based SQL for changes.
- Website JSON and `websiteCatalog*` mirror tables are preparation/separate data boundaries; the storefront does not automatically use Supabase.
- Current Admin route allowlist excludes website catalog products/spare-parts/taxonomy/videos; these remain source/data only.

References:
- `D:\project\lionrider\PROJECT_CONTEXT.md`
- `D:\project\lionrider\PROJECT_STATUS.md`
- `D:\project\lionrider\REAL-DATABASE-STRUCTURE.md`
- `D:\project\lionrider\admin-panel-lionrider\SUPABASE.md`
- `D:\project\lionrider\admin-panel-lionrider\LIONRIDER_SETUP_PLAN.md`
- `D:\project\lionrider\lionrider-website\status.md`
- Website source counts: `product.json` = 377 products, 317 accessories, 60 spare parts.

## Task 2: Fix Docker-local News CRUD permission denial

Outcome: partial

Preference signals:
- The user asked whether News needed permission “from other schema” and asked to “include news permissions” -> future fixes should explain schema ownership versus grants/RLS directly and make the smallest Lion Rider-only change.
- The user later said the Lion Rider goal could be paused later -> treat “pause the Lion Rider goal” as an explicit scope-control instruction and stop further Lion Rider work when requested.

Key steps:
- Diagnosed the error as stale column-level grants after adding `htmlContent` and SEO fields, not a need for permissions from another schema.
- Applied `admin-panel-lionrider/supabase/migrations/20261020140004_lionrider_news_crud_permissions.sql` locally.
- Added current authenticated INSERT/UPDATE column privileges and a UUID-text default for new News IDs; existing RLS and `super_admin` permission rows remained the authorization model.
- Verified 41 News rows, 41 distinct slugs, 5 RLS policies, 4 `super_admin` actions, anonymous published-only SELECT, and authenticated payload INSERT/UPDATE column privileges.
- Migration history later verified 54 local migrations applied through `20261020140005`, including Partner retirement.

Failures and how to do differently:
- A table-level privilege check showed `UPDATE` false even after the fix because writes are intentionally granted at column level; verify every payload column with `has_column_privilege`, not only table-level privilege.
- Authenticated browser create/save was not verified because no browser tab was connected. The fix is database/schema-verified, not end-to-end UI verified.

Reusable knowledge:
- News permissions are local to `lionrider`; no permission from another schema is required.
- Anonymous access remains read-only/published-only; authenticated News CRUD depends on both RLS authorization and column-level grants.
- Keep the migration and documentation references aligned; avoid applying unrelated migrations without review.

References:
- Migration: `admin-panel-lionrider/supabase/migrations/20261020140004_lionrider_news_crud_permissions.sql`
- Module notes: `docs/modules/news.md`
- Permission error screenshot: `docs/owner-requests/images/news-permission-denied.png`
- Verification: `rows=41`, `distinct_slugs=41`, `policies=5`, `super_admin_actions=4`, payload insert/update privileges true.

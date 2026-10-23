thread_id: 01a15c01-6465-7c21-840a-64bc917e05b9
updated_at: 2026-10-22T07:08:34+00:00
rollout_path: \\?\C:\Users\user\.codex\sessions\2026\10\21\rollout-2026-10-21T09-09-17-01a15c01-6465-7c21-840a-64bc917e05b9.jsonl
cwd: \\?\D:\project\lionrider

# Lion Rider project orientation and metadata updates

Rollout context: `D:\project\lionrider` contains a PHP storefront and a Vben Admin app backed by shared Docker-local Supabase. The aggregate root is not a Git repository; preserve existing changes in child projects.

## Task 1: Project orientation

Outcome: partial

Key steps:
- Read `PROJECT_CONTEXT.md`, `PROJECT_STATUS.md`, Admin instructions, website routes, Admin route registry, stores, types, and Markdown inventory.
- Confirmed GitNexus indexed only `.codex`, not Lion Rider; direct source inspection was used.
- Website routes are defined in `lionrider-website/index.php` and templates under `lionrider-website/template/`.
- Active Admin routes are controlled by `admin-panel-lionrider/apps/web-antd/src/router/routes/index.ts`; dynamic menu filtering is in `src/router/access.ts`.

Reusable knowledge:
- Current REAL database contract and live evidence outrank historical Dummy/mirror docs.
- Admin uses schema `lionrider` in shared local Supabase; do not reset or affect other schemas.
- Authenticated browser and production behavior remained unverified.

## Task 2: Standalone page metadata implementation

Outcome: success

Key steps:
- Added the standalone metadata contract: `route`, `metaTitle`, `metaDescription` (max 160), `metaKeywords`, `createdAt`, `updatedAt`.
- Migrated 11 static routes into active `lionrider."metaData"`; preserved 353 historical rows in restricted `metaDataArchive`.
- Added database policies and a route guard preventing product, News detail, brand, Spare Parts, account, checkout, and technical routes from entering standalone metadata.
- Updated Admin form/types/store/locales, website metadata resolution, fixture generation, and documentation.

Validation:
- Local migrations applied through `20261022101000`.
- Readback confirmed 11 active rows, 353 archived rows, anonymous active read enabled, archive anonymous read disabled, and maximum description length 159.
- Admin typecheck and production build passed; PHP lint and diff checks passed. Browser/HTTP storefront rendering was not verified.

## Task 3: Rename Route Metadata to Metadata

Outcome: success

Preference signal:
- The user explicitly asked: “update Route Metadata > rename to > Metadata” -> future label-only changes should be applied narrowly through the existing i18n key and reflected in both menu and page title.

Key steps:
- Changed English `page.ownerContent.metaData.title` from `Route Metadata` to `Metadata`.
- Changed Chinese label from `页面元数据` to `元数据`.

Validation:
- Both locale JSON files parsed successfully.
- `git diff --check` passed.
- No build or browser check was run because this was a label-only change.

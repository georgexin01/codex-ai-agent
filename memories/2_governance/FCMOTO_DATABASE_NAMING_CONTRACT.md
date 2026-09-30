---
name: fcmoto-database-naming-contract
description: "Project-specific FC-Moto Supabase naming contract: snake_case tables with quoted camelCase columns."
triggers: ["ai read .codex knowledge", "fcmoto database naming", "fcmoto schema", "fcmoto supabase", "fcmoto initData", "camelCase database"]
phase: governance
priority: project-contract
status: authoritative-for-fcmoto
read_before_write: true
scope: "D:/project/fc-moto/fcmoto-website and the future fcmoto schema"
---

# FC-Moto database naming contract

This is the current user-approved naming contract for the FC-Moto project. Read it before designing, documenting, generating, or applying any FC-Moto database structure.

## Scope and precedence

- Applies only to the project-owned `fcmoto` schema.
- It overrides generic database naming defaults for `fcmoto.*` tables.
- It does not rename, copy, or alter Supabase-managed `auth.*` tables.
- It does not rename or alter shared `public.*` Auth/project bridge tables.
- Existing EDSB, Sales Hero, archived, or historical structures are reference-only and must not be loaded into FC-Moto.

## Required naming

- Schema-qualified table names use lowercase snake_case: `fcmoto.site_settings`, `fcmoto.users`, `fcmoto.magazine_articles`.
- Columns in `fcmoto.*` use camelCase and must be double-quoted in SQL: `"isDelete"`, `"socialProfiles"`, `"createdAt"`.
- One-word names stay unchanged: `id`, `name`, `title`, `date`.
- Convert each later underscore word to an uppercase first character and remove the underscore:
  - `this_is_my_database_data_name` -> `thisIsMyDatabaseDataName`
  - `short_description_alt` -> `shortDescriptionAlt`
  - `is_delete` -> `isDelete`
  - `social_profiles` -> `socialProfiles`
  - `created_at` -> `createdAt`
  - `article_id` -> `articleId`
- Foreign keys use camelCase singular plus `Id`: `userId`, `articleId`, `careerPageId`, `roleId`.
- JSONB keys belonging to FC-Moto data also use camelCase.
- Raw external snapshots such as `sourceCatalog` may preserve upstream keys; they are not normalized FC-Moto columns.
- TypeScript row properties for `fcmoto.*` match the database column names directly; do not add a snake_case-to-camelCase mapper for newly created FC-Moto fields.

## Boundary exception

The full database list must preserve the existing names of managed/shared tables:

- `auth.users` and `auth.identities`: Supabase-managed contract.
- `public.project`, `public.role`, and `public."user"`: shared Auth/project bridge contract, currently snake_case.

This exception is intentional. Do not mechanically convert those tables to camelCase.

## Source and migration rules

- Current FC-Moto truth comes from `fcmoto-website/lib/initData.php`, `data/product.json`, `data/category.json`, and current page consumers.
- Preserve current source keys such as `themeColor`, `socialProfiles`, `dateIso`, `detailTitle`, `moreInformation`, and `sourceCatalog` when they become FC-Moto columns or JSONB keys.
- Use reviewed SQL files with quoted camelCase FC-Moto identifiers. Never use inline PowerShell SQL for schema mutation.
- Do not execute migrations, seed data, Auth creation, or Docker database changes unless the user separately authorizes execution.

## Mandatory verification

Before approving an FC-Moto schema or connection:

1. Search the active project for old FC-Moto field spellings such as `is_delete`, `created_at`, `social_profiles`, `theme_color`, and `article_id`.
2. Confirm every `fcmoto.*` table and column in the Markdown/JSON contract uses the camelCase rule.
3. Confirm `auth.*` and `public.*` names remain unchanged in the full contract.
4. Check every PHP page and shared data function against the current source keys; do not load old database structures.
5. Validate JSON, run `php -l` for changed PHP, and read back changed documents.
6. Report database runtime, Auth, RLS, and browser behavior as unverified unless they were actually tested.

## Trigger note

The exact boot phrase `ai read .codex knowledge` remains owned by `00_PULSE.md` and must still return only `[🟢] Agent is Ready..`. After that boot acknowledgement, this contract is the required FC-Moto naming rule for database work.

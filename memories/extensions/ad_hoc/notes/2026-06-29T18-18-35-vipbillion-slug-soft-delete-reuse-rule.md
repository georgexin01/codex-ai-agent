## VIPBillion slug soft-delete reuse rule

When a Vben Admin CRUD module auto-generates a slug/url from title and the table uses soft delete (`deleted_at` or equivalent), deleted rows must not block reusing the same slug later.

Required default fix:
- frontend/store duplicate checks must filter active rows only
- implement a slug-specific `checkSlugExists()` instead of checking title only
- submit must hard-check slug again even if debounce/realtime validation already ran
- database uniqueness must be a partial unique index on active rows only, not a full-table unique constraint/index

Diagnosis rule:
- if UI says slug is available but submit fails with a unique constraint like `uq_news_project_slug_en`, suspect old DB uniqueness drift first
- safest repair is: drop old slug/title constraint if present, drop old index if present, recreate partial unique indexes with `WHERE deleted_at IS NULL`

Do not use `_del` / random suffix renaming on deleted rows as the default solution unless the project explicitly wants archived slug mutation.

Apply this pattern by default to future slug-enabled CRUD modules in VIPBillion and similar Vben + Supabase projects.

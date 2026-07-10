When working in VIPBillion Vben Admin modules that expose image uploads, htmlContent, or multi-image fields, treat attachment cleanup as part of the same delete lifecycle.

Important principle:
- When a source CRUD row is soft-deleted, any related attachment rows in `attachments` must also be soft-deleted by setting `isDelete`/`is_delete` to true.
- The album page should then surface those rows in the Deleted tab.
- "Purge All Deleted" should only appear in the Deleted tab.
- Purging deleted attachments must remove both the attachment rows and their stored file paths from Supabase storage.
- When a module uses `isDelete` in its own table, keep the table filter and attachment filter aligned so the UI does not show stale images after a delete.

Use this as a default rule for future Vben Admin CRUD work in attachment-enabled modules, especially pages that embed uploaded images in rich HTML content.

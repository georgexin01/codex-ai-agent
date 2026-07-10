VIPBillion admin CRUD rule update:

- New business tables should usually include `isDelete boolean NOT NULL DEFAULT false` unless the table already uses legacy `deleted_at`.
- All admin CRUD reads, relation lookups, dropdown options, drawers, and workflow queries must filter active rows with `isDelete = false`.
- Delete actions should soft-delete by setting `isDelete = true`.
- If direct row updates are unreliable under RLS or trigger behavior, use a `SECURITY DEFINER` RPC from the store.
- The reusable guidance was added to `skills/claude/SOFT_DELETE_GUARD.md`, `skills/claude/VBEN_ADMIN_MANDATORY_CHECKLIST.md`, and `skills/claude/create-module/skill.md`.

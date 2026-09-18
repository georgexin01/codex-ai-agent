# EDSB Admin phone-only login contract

- Applies to `C:\Users\user\Desktop\EDSB\admin-panel-edsb`.
- The EDSB Admin login identity is `auth.users.phone`; phone is required in User CRUD and profile updates.
- New EDSB Auth identities must use `email = NULL` by default. The EDSB `users` profile and CRUD do not store or expose email.
- Do not clear existing `auth.users.email` or `public."user".email` without explicit owner approval; those are shared identity data outside the EDSB User CRUD boundary.
- Migration `apps/web-antd/src/sql/migrations/050_edsb_phone_only_admin_users.sql` implements the contract; local verification confirmed `edsb.users.email` is absent, phone is non-null, and EDSB create/update RPCs exist.

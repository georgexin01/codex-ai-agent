# EDSB local Docker Auth parity

- Scope: `C:\Users\user\Desktop\EDSB\admin-panel-edsb` and Docker-local Supabase only; never apply this parity operation to the VPS.
- EDSB admin login uses `auth.users.phone` and phone/password. The reference Auth row is `d86f99b3-5c6b-415e-8a76-fe964421cef4`, phone `60150000001`, email `NULL`, provider `phone`; the password hash is stored only in the local database operation and should not be repeated in guidance.
- Local EDSB project context is `5f51fdb5-4c99-47a4-8c3c-2141913ab931`; do not copy the reference row's Sales Hero `active_project_id` into local EDSB.
- Local `public.user` id `cf34e257-9b9c-4553-8126-76737715d04e` now links to the reference Auth ID. Local `edsb.users` id `1` matches the supplied profile: phone `60159999999`, name `EDSB Admin`, role `super_admin`, profile email `admin@edsb.com`, null avatar, and supplied audit timestamps.
- Auth login phone and EDSB profile phone intentionally differ because that is the supplied VPS reference. Active EDSB CRUD remains phone-first and does not expose email; the nullable profile email column exists only to preserve the supplied local profile shape.
- Verification passed: Auth exact match, phone identity, EDSB public-user link, EDSB profile exact match, email column, 16 EDSB business tables, and localhost routes `/`, `/auth/login`, `/users/list` returned HTTP 200.

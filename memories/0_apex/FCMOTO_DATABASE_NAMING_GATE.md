---
name: fcmoto-database-naming-gate
description: "Tier-0 project gate for FC-Moto database naming before schema, SQL, or data-connection work."
triggers: ["ai read .codex knowledge", "fcmoto database naming", "fcmoto schema", "fcmoto supabase", "fcmoto initData", "camelCase database"]
phase: constitutional
priority: tier-0-project-scope
status: authoritative-for-fcmoto
read_before_write: true
---

# FC-Moto database naming gate

Before any FC-Moto database, SQL, Supabase, or data-connection task, apply the project contract at:

`../2_governance/FCMOTO_DATABASE_NAMING_CONTRACT.md`

Required rule:

- `fcmoto.*` table names use lowercase `snake_case`.
- `fcmoto.*` columns and JSONB keys use camelCase and quoted SQL identifiers: `"isDelete"`, `"socialProfiles"`, `"createdAt"`.
- `auth.*` and `public.*` retain their existing managed/shared snake_case contracts.
- Never load EDSB, Sales Hero, archived, or other old database structures into FC-Moto.

The exact boot phrase `ai read .codex knowledge` remains owned by `00_PULSE.md` and must return only `[🟢] Agent is Ready..`; this gate applies immediately after boot when the task concerns FC-Moto database structure.

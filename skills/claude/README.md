---
name: vben-admin-panel
description: "Front door for Vben Admin panel CRUD tables. Read this first, then jump to the executor or the needed sub-skill."
triggers: ["vben admin", "vben admin panel", "admin panel", "crud module", "supabase admin"]
phase: orchestrator
priority: high
version: 1.1
aliases:
  - vben admin front door
  - admin panel front door
  - vben admin panel
contains:
  - read_first
  - when_to_use
  - main_paths
  - sub_skills
  - routing_guidance
related_docs:
  - skills/claude/WORKING_PROGRESS.md
  - skills/claude/VBEN_ADMIN_MANDATORY_CHECKLIST.md
  - skills/claude/ANTI_DOUBLE_SUBMIT_PATTERN.md
  - skills/claude/SOFT_DELETE_GUARD.md
related_skills:
  - skills/project-handoff-doc-stack/SKILL.md
  - skills/claude-meta/validate-knowledge/skill.md
verification:
  - Use this file first for any Vben Admin CRUD task.
  - Jump to the executor or the matching sub-skill only after the route is clear.
---

# Claude Admin Front Door

## Read First

1. Read this file.
2. If the task is a normal module build, open [`WORKING_PROGRESS.md`](WORKING_PROGRESS.md).
3. If the task is narrower, jump directly to the matching sub-skill below.

## When To Use

- Use for Vben Admin panel CRUD tables, schema-owner, and module generation work.
- Use the executor when you want the full linear workflow.
- Use a sub-skill when you only need one phase.

## Main Paths

- [`WORKING_PROGRESS.md`](WORKING_PROGRESS.md) - full linear executor
- [`create-module/skill.md`](create-module/skill.md) - end-to-end CRUD module
- [`analyze-schema/skill.md`](analyze-schema/skill.md) - fields and relationships
- [`generate-store/skill.md`](generate-store/skill.md) - store and CRUD layer
- [`generate-supabase-schema/skill.md`](generate-supabase-schema/skill.md) - SQL and RLS
- [`generate-views/skill.md`](generate-views/skill.md) - list/detail/form/drawer views
- [`generate-route/skill.md`](generate-route/skill.md) - router module
- [`generate-i18n/skill.md`](generate-i18n/skill.md) - translations
- [`image-upload-spec/skill.md`](image-upload-spec/skill.md) - upload and crop flow
- [`generate-e2e/skill.md`](generate-e2e/skill.md) - E2E scenarios
- [`workflow-test/skill.md`](workflow-test/skill.md) - Playwright workflow config
- [`ui-standardization/skill.md`](ui-standardization/skill.md) - shared UI conventions, including percentage input addon styling

## Reference Files

- [`../SHARED_DB_CONTRACT.md`](../SHARED_DB_CONTRACT.md) - shared schema, bucket, and ownership contract
- [`supabase-rls-rbac-design.md`](supabase-rls-rbac-design.md) - RLS and RBAC reference
- [`VBEN_SUPABASE_LOCAL_LESSONS.md`](VBEN_SUPABASE_LOCAL_LESSONS.md) - local gotchas and safety notes

## Rule Of Thumb

- Keep this file short.
- Do not duplicate the executor here.
- Put heavy reasoning and task steps in the linked files.

## Pinia and c-to-c contract

For Vben Admin modules, use `skills/pinia-contract-workflow/SKILL.md` when the task touches Pinia store naming, page-to-store actions, or the user's `PiniaStore` / `Function` / `Input` sheet contract. Keep the dependency direction `views/tables/drawers -> stores -> utils/types`, compose small reusable functions inside store actions, preserve exact action Inputs, and verify the nearest type-check/build plus the visible Vben workflow.

## Luna Medium Handoff

- Start with the current project truth document and the matching sub-skill only.
- For Vben Admin work, keep schema, store, view, drawer, route, and workflow-test changes aligned.
- Prefer an existing booking or driver-job module shell when the data flow already exists.
- Verify the visible workflow and the nearest typecheck, lint, or build target before handoff.

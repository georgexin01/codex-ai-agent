---
name: oversized-skill-loading-protocol
description: "Lazy front-door and section-loading rules for large skills so task context stays focused without changing skill-owned content."
triggers: ["ai oversized skill", "ai skill loading", "large skill route", "skill context budget"]
phase: routing
version: 1.0
status: authoritative
date_updated: "2026-08-20"
related:
  - memories/2_governance/KNOWLEDGE_COMPRESSION_PROTOCOL.md
  - memories/2_governance/artifacts/skill_path_router.md
  - codex-router/Measure-CodexSkillCatalog.ps1
---

# Oversized Skill Loading Protocol

Skills remain skill-owned and are never mass-rewritten by knowledge compression. When a matched skill is over 5,000 estimated tokens, read its front door and headings first, then load only the section required by the current task.

| route | current size signal | lazy loading rule |
|---|---:|---|
| `skills/claude/supabase-rls-rbac-design.md` | ~73,902 bytes | Read only the auth/RLS/schema section required by the task |
| `skills/claude/generate-views/skill.md` | ~45,152 bytes | Select list/detail/form/drawer section before reading implementation detail |
| `skills/claude/create-module/skill.md` | ~32,946 bytes | Load only the current CRUD stage and its verification gate |
| `skills/claude-app/SKILL.md` | ~24,330 bytes | Load only the requested mobile/PWA build stage |
| `skills/claude/generate-store/skill.md` | ~24,033 bytes | Load only store/type/API contract sections needed by the request |

## Execution rule

1. Resolve the exact route and project fingerprint.
2. Read the front door, headings, and contract summary.
3. Select the smallest matching section; do not preload the whole skill family.
4. Preserve exact public contracts and run the skill's nearest verification gate.

If the skill has no usable heading map, report the context risk and read only the smallest evidence slice needed; do not silently rewrite skill content.

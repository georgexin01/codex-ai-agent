---
name: skill-path-router
description: "Canonical skill path index - maps trigger phrases to exact skill entry points. Read this before scanning skill directories."
triggers: ["skill path router", "skill_path_router", "ai read .codex skills", "which skill", "what skill"]
version: 2.2
date_updated: "2026-07-10"
status: authoritative
---

# SKILL PATH ROUTER V2.1

## How to use
1. Match the user trigger phrase against the table below.
2. Read only the matched skill file - do not scan the full skill tree.
3. If no match, fall back to `skills/` directory listing and frontmatter `description`.

## Trigger to Entry Point Map

| Trigger | Entry Point | What it covers |
|---|---|---|
| `ai claude` | `skills/claude/README.md` | Vben Admin panel CRUD front door - read README first, then the executor |
| `vben admin panel` / `admin panel` | `skills/claude/README.md` | Generic Vben Admin panel and table CRUD route |
| `ai claude app` | `skills/claude-app/WORKING_PROGRESS.md` | Vue/Capacitor app builder - app/mobile workflow |
| `ai claude website` | `skills/claude-website/WORKING_PROGRESS.md` | PHP website + Supabase REST builder - 45 linear micro-tasks |
| `ai starting point` | `skills/starting-point/README.md` | New project bootstrap front door - read README first, then the executor |
| `ai clean module` | `skills/clean-module/skill.md` | Remove old project modules from a copied Vben admin while keeping shared infrastructure |
| `ai personality` | `skills/ai-personality/skill.md` | Professional AI role and behavior profile for Codex and Claude Code |
| `DB handshake (shared)` | `skills/SHARED_DB_CONTRACT.md` | Shared schema, bucket, project_id, env matrix, and ownership rule |
| `ai claude meta` | `skills/claude-meta/SKILL.md` | Claude meta-skills and self-improvement patterns |
| `ai design app` | `skills/design/app/SKILL.md` | Mobile app design execution |
| `ai design website` | `skills/design/website/SKILL.md` | Website design execution |
| `ai design spec` | `skills/design/_spec/SKILL.md` | DESIGN.md contract layer, lint rules, and export guidance |
| `ai karpathy` | `skills/karpathy-guidelines/SKILL.md` | Karpathy coding quality rules |
| `ai imagegen` | `skills/imagegen/SKILL.md` | Image generation workflows and free-asset fallback |
| `ai markdown mindmap` | `skills/markdown-database-mindmap/SKILL.md` | Database schema to Markmap visualization |
| `ai project handoff` | `skills/project-handoff-doc-stack/SKILL.md` | Durable root handoff docs, project truth docs, and sync rules |
| `ai luna 5.6` / `GPT-5.6 Luna` | `memories/extensions/ad_hoc/notes/2026-07-10-luna-5-6-vue-vben-execution-profile.md` | Strict Vue/Vben typing, i18n, form-schema, complete-code, and verification gates |
| `ai pinia contract` / `PiniaStore Function Input` | `skills/pinia-contract-workflow/SKILL.md` | Exact app Pinia store/action/input contract using the user's sheet and hotpot references |
| `ai cyroro audit` | `skills/pinia-contract-workflow/SKILL.md` | Cyroro paired-app contract, schema, environment, and verification audit |
| `localhost test` | `skills/localhost-test/SKILL.md` | Detect active Vben, Vue app, and PHP roots; start and verify local development URLs |

## Recipe and Knowledge Triggers

These point at executable recipes and foundational knowledge docs, not skills.

| Trigger | Entry Point | What it covers |
|---|---|---|
| `ai recipe blueprint` | `memories/CLAUDE_BLUEPRINT_RECIPE.md` | Generate durable project blueprint docs |
| `ai recipe mobile app` | `memories/MOBILE_APP_DESIGN_RECIPE.md` | Canonical mobile aesthetic recipe |
| `ai recipe image to app` | `memories/IMAGE_TO_MOBILE_APP_PIPELINE.md` | Convert design images into Vue mobile app structure |
| `ai recipe header footer` | `memories/1_core/HEADER_FOOTER_DESIGN_RULES.md` | Header and bottom-nav rules |
| `ai recipe free images` | `memories/1_core/IMAGE_SOURCING_FREE.md` | Free image sourcing waterfall |
| `ai recipe pwa` | `memories/1_core/PWA_FAVICON_META_SETUP.md` | PWA and meta setup |
| `ai design sop` | `memories/1_core/DESIGN_SOP.md` | Page-level structural manifest |
| `ai design evolution` | `memories/1_core/DESIGN_EVOLUTION_PROTOCOL.md` | Design-sense evolution framework |
| `ai 5 point formula` / `ai 100 point prompt` | `memories/extensions/ad_hoc/notes/2026-07-01T18-14-43-5-point-ai-principles.md` | Five-principle routing and response clarity rule |
| `ai hybrid metadata router` / `ai metadata router` | `memories/extensions/ad_hoc/notes/2026-07-01T18-27-54-hybrid-metadata-router.md` | Frontmatter schema for AI-friendly knowledge docs and skills |
| `ai project knowledge template` | `memories/extensions/ad_hoc/notes/2026-07-01T18-19-47-project-knowledge-template.md` | Reusable project knowledge scaffolding for future AI runs |
| `ai project handoff` | `skills/project-handoff-doc-stack/SKILL.md` | Durable root handoff docs and sync rules for multi-doc project stacks |
| `ai validate knowledge` | `skills/claude-meta/validate-knowledge/skill.md` | Lints skills and knowledge against the hybrid format protocol |
| `ai validate knowledge fast` | `codex-router/Validate-CodexKnowledge.ps1` | Read-only fast validation for routes, duplicate names, local target paths, secret-like patterns, and oversized files |
| `ai knowledge health` | `codex-router/KnowledgeHealthReport.ps1` | Run detector, validator, routing audit, and performance benchmark as one read-only health check |
| `ai knowledge compression` / `ai compress knowledge` | `memories/2_governance/KNOWLEDGE_COMPRESSION_PROTOCOL.md` | Lossless compression and two-layer rerouting for oversized non-skill Markdown |
| `ai ground kernel` / `ai tier-0` | `memories/0_apex/GROUND_KERNEL.md` | Deep Tier-0 governance, lifecycle phases, edit safety, and recovery |
| `ai trigger conflict` | `codex-router/Audit-CodexRouting.ps1` | Detect exact trigger phrases that map to different destinations |
| `ai route telemetry` | `codex-router/Measure-CodexRouteTelemetry.ps1` | Measure route bytes and estimated tokens for Luna Medium efficiency |
| `ai router blueprint` | `memories/0_apex/templates/MASTER_ROUTER_BLUEPRINT.md` | Lightweight multi-project root router blueprint |
| `create module` / `new module` | `skills/claude/create-module/skill.md` | End-to-end CRUD module generator - SQL, types, store, views, routes, i18n, workflow tests |
| `generate views` | `skills/claude/generate-views/skill.md` | Vue component suite for list, detail, form, and drawer variants |
| `generate store` | `skills/claude/generate-store/skill.md` | Pinia store and type generator with Supabase CRUD and option arrays |
| `generate schema` / `supabase schema` | `skills/claude/generate-supabase-schema/skill.md` | Supabase SQL schema generator with auth, business tables, triggers, and RLS |
| `generate route` | `skills/claude/generate-route/skill.md` | Vue Router route module generator for nested list/detail routes |
| `analyze schema` / `table structure` | `skills/claude/analyze-schema/skill.md` | Analyze table structure and confirm relationships before code generation |
| `generate i18n` / `translations` | `skills/claude/generate-i18n/skill.md` | zh-CN and en-US translation JSON generator from the analyzed schema |
| `generate e2e` / `e2e tests` | `skills/claude/generate-e2e/skill.md` | End-to-end CRUD test scenario generator including quick-create and association flows |
| `workflow test` / `playwright` | `skills/claude/workflow-test/skill.md` | Workflow-test configs and Playwright specs for automated CRUD flows |
| `supabase auth` / `auth architecture` | `skills/claude/supabase-auth-architecture/skill.md` | Multi-project Supabase auth architecture, user creation, and OTP reference |
| `seo tables` / `seo settings module` | `skills/claude/seo-tables-planner/skill.md` | Plan-first SEO table protocol for Vben Admin + Supabase projects |
| `database markmap` / `markmap sync` | `skills/claude/database-markmap-sync/skill.md` | Markdown-backed database mindmap synchronization helper |
| `vben admin` / `admin panel` | `skills/claude/README.md` | Vben Admin CRUD builder front door - read README first, then the executor |
| `vben checklist` / `vben admin checklist` | `skills/claude/VBEN_ADMIN_MANDATORY_CHECKLIST.md` | Mandatory Vben Admin audit checklist before shipping panel changes |
| `double submit` / `anti double submit` | `skills/claude/ANTI_DOUBLE_SUBMIT_PATTERN.md` | Required guardrail for duplicate create/update submission protection |
| `soft delete` / `soft delete guard` | `skills/claude/SOFT_DELETE_GUARD.md` | Soft-delete-safe duplicate checks and partial unique index patterns |
| `vben relation autoguard` / `typed delete relation` / `parent child visibility` / `relation navigation` | `memories/project_notes/VBEN_RELATION_AUTOGUARD_PLAYBOOK.md` | Merged Vben relation and deletion patterns |
| `ai user dna` | `memories/0_apex/USER_DNA.md` | Tier-0 taste profile |
| `ai gitnexus` | `memories/2_governance/GITNEXUS.md` | GitNexus workflow and allowlist |
| `ai drift guard` | `memories/2_governance/DRIFT_GUARD_PROTOCOL.md` | Anti-drift protocol |
| `ai knowledge rot` | `memories/2_governance/KNOWLEDGE_ROT_PROTOCOL.md` | Anti-entropy governance |
| `kushiro` / `kushirobbq` / `kushiro root docs` | `memories/project_notes/KUSHIRO_ROOT_DOCS_ROUTER.md` | Fast route into the KushiroBBQ root truth docs, active folders, and stack guardrails |

## Sub-skill Index

### `skills/claude/` sub-skills
| Sub-skill | Path |
|---|---|
| Full module | `skills/claude/create-module/skill.md` |
| Schema analysis | `skills/claude/analyze-schema/skill.md` |
| Pinia store + CRUD | `skills/claude/generate-store/skill.md` |
| Supabase SQL + RLS | `skills/claude/generate-supabase-schema/skill.md` |
| Vue views + drawers | `skills/claude/generate-views/skill.md` |
| Vue Router module | `skills/claude/generate-route/skill.md` |
| i18n | `skills/claude/generate-i18n/skill.md` |
| Image upload + crop | `skills/claude/image-upload-spec/skill.md` |
| E2E tests | `skills/claude/generate-e2e/skill.md` |
| Workflow tests | `skills/claude/workflow-test/skill.md` |
| Supabase auth architecture | `skills/claude/supabase-auth-architecture/skill.md` |
| RLS + RBAC design | `skills/claude/supabase-rls-rbac-design.md` |
| MCP Supabase connection | `skills/claude/mcp-supabase-postgres-connection.md` |
| Local Docker lessons | `skills/claude/VBEN_SUPABASE_LOCAL_LESSONS.md` |
| SEO tables planner | `skills/claude/seo-tables-planner/skill.md` |

### `skills/design/` sub-skills
| Sub-skill | Path |
|---|---|
| App spec examples | `skills/design/_spec/examples/atmospheric-glass/` |
| Website step 4 | `skills/design/website/04-php-modularization/skill.md` |
| Website step 5 | `skills/design/website/05-hero-cinematics/skill.md` |
| Website step 6 | `skills/design/website/06-component-engineering/skill.md` |

## System Skills
- `skills/.system/skill-installer/SKILL.md` - install skills from GitHub
- `skills/.system/skill-creator/SKILL.md` - create new skill packages
- `skills/.system/plugin-creator/SKILL.md` - create OpenAI plugins
- `skills/.system/openai-docs/SKILL.md` - OpenAI API reference

## Excluded from Routing
- `skills/normal/` - reference library only, no direct triggers

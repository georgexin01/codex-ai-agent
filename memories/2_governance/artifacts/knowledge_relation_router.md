---
name: knowledge-relation-router
description: "Compact cross-domain relation map connecting Codex skills, reusable knowledge, governance, and conditional reference libraries without broad auto-loading."
triggers: ["ai knowledge relations", "ai related knowledge", "knowledge relation router", "codex relation map"]
phase: routing
version: 1.0
status: active
date_updated: "2026-10-07"
last_audit: "2026-10-07"
related:
  - 00_PULSE.md
  - memories/2_governance/artifacts/skill_path_router.md
  - codex-router/router-config.json
  - codex-router/CODEX_ACCESS_PRIORITY_AUDIT.md
---

# Knowledge Relation Router

Use this file after the exact front door is selected. Load the primary route first, then only the related nodes needed by the task. Relations are retrieval hints, not instructions to hydrate every linked file.

## Routing and maintenance

`00_PULSE.md` → `CODEX_DYNAMIC_ROUTING.md` → `codex-router/router-config.json` → `codex-router/Audit-CodexRouting.ps1` → `codex-router/Validate-CodexKnowledge.ps1` → `codex-router/KnowledgeHealthReport.ps1`

For ignore questions: `memories/2_governance/CODEX_IGNORE_PROTOCOL.md` → `.codexignore` → `.gitignore` / `.openaiignore` / `.claudeignore` / `.geminiignore` → route and knowledge validation.

For rot or movement: `memories/2_governance/KNOWLEDGE_ROT_PROTOCOL.md` → active-reference scan → archive/tombstone decision → `Update-CodexRouting.ps1` → audit.

For trigger interpretation: `memories/2_governance/artifacts/trigger_intent_index.md` → resolve exact workflow trigger or retrieval-only intent phrase → apply project-context and confirmation gates → load the narrowest skill or relation node.

For frequent phrase execution: `memories/2_governance/artifacts/intent_action_contracts.md` → resolve project/type and exact target → apply next action and risk gate → run the nearest verification.

For boot connections: `memories/2_governance/artifacts/boot_connection_map.md` → identify project type from cwd and current wording → select one primary route and up to two supporting nodes → lazy-load details only when the next task needs them.

For YAML-first reading: `memories/2_governance/FRONTMATTER_MAINTENANCE_PROTOCOL.md` → `codex-router/Build-CodexFrontmatterIndex.ps1` → `codex-router/codex-frontmatter-index.json` → select the narrowest route, then read the full body only when required.

For automatic update reporting: `memories/2_governance/COMPARISON_REPORTING_PROTOCOL.md` → capture a verified before state → apply the batch → show one suitable comparison table at the substantial/staged threshold. Do not load it for tiny edits.

For large skill context: `memories/2_governance/OVERSIZED_SKILL_LOADING_PROTOCOL.md` → read the matched skill front door and headings → load only the task section → preserve skill-owned content and verify the nearest gate.

For verification selection: `memories/2_governance/EVIDENCE_GATE_MATRIX.md` → classify project/output type → run the nearest direct evidence gate → report blockers instead of claiming success.

## Vben Admin and database work

`skills/claude/README.md` → `skills/claude/create-module/skill.md` → `skills/claude/analyze-schema/skill.md` → `skills/claude/generate-supabase-schema/skill.md` → `skills/claude/generate-store/skill.md` → `skills/claude/generate-views/skill.md` → `skills/claude/generate-route/skill.md` → `skills/claude/generate-i18n/skill.md` → `skills/claude/generate-e2e/skill.md` → `skills/claude/workflow-test/skill.md`

Related knowledge: `memories/0_apex/VUE_PINIA_NAMING_REFERENCE.md`, `skills/pinia-contract-workflow/SKILL.md`, `skills/claude/VBEN_ADMIN_MANDATORY_CHECKLIST.md`, `memories/project_notes/VBEN_RELATION_AUTOGUARD_PLAYBOOK.md`, and `memories/2_governance/LAA_ECOSYSTEM_API_PROTOCOL.md`.

Conditional references: `skills/admin-panel/` patterns and `skills/normal/engineering/vue3-fnb-framework/skill.md` when the task requires a narrow implementation precedent.

## Vue mobile, app, and PWA work

`skills/claude-app/SKILL.md` → `skills/design/app/SKILL.md` → `skills/claude-app/01-handshake-genesis/skill.md` → `skills/claude-app/05-types-foundry/skill.md` → `skills/claude-app/06-industrial-stores/skill.md` → `skills/claude-app/09-view-scaffolding/skill.md` → `skills/claude-app/10-routing-logic/skill.md` → `skills/claude-app/12-i18n-composables/skill.md` → `skills/claude-app/13-native-pwa-deploy/skill.md`

Related knowledge: `memories/MOBILE_APP_DESIGN_RECIPE.md`, `memories/IMAGE_TO_MOBILE_APP_PIPELINE.md`, `memories/1_core/HEADER_FOOTER_DESIGN_RULES.md`, `memories/1_core/IMAGE_SOURCING_FREE.md`, and `memories/0_apex/USER_DNA.md`.

Conditional references: `skills/normal/mobile-template-from-samples/skill.md`, `skills/normal/design/`, and `skills/normal/research/` only for a matching visual or research question.

## PHP website, metadata, and SEO work

`skills/claude-website/SKILL.md` → `skills/claude-website/01-config-generation/skill.md` → `skills/claude-website/04-schema-building/skill.md` → `skills/claude-website/07-rest-client/skill.md` → `skills/claude-website/09-controllers-layer/skill.md` → `skills/claude-website/11-router-v1-endpoints/skill.md` → `skills/claude-website/14-seo-structured-data/skill.md`

Related knowledge: `skills/meta-skills/SKILL.md`, `skills/meta-content-workflow/SKILL.md`, `skills/seo-ai-search/SKILL.md`, `memories/1_core/IMAGE_SOURCING_FREE.md`, and the active project's `STATUS.md`, `BLUEPRINT.md`, or `PROJECT_CONTEXT.md`.

Conditional references: `skills/normal/engineering/php-pro/skill.md` and `skills/normal/research/` when current project evidence leaves an implementation or research gap.

## Design, image, and visual verification

`skills/design/SKILL.md` → `skills/design/app/SKILL.md` or `skills/design/website/SKILL.md` → `skills/design/_spec/SKILL.md` → matching design step/reference.

Related knowledge: `memories/CLAUDE_BLUEPRINT_RECIPE.md`, `memories/MOBILE_APP_DESIGN_RECIPE.md`, `memories/1_core/UI_DNA_MASTER.md`, `memories/1_core/DESIGN_SOP.md`, `memories/0_apex/USER_DNA.md`, and `memories/2_governance/SCREENSHOT_HYGIENE.md`.

For generated images: `skills/imagegen/SKILL.md` → `memories/1_core/IMAGE_SOURCING_FREE.md` → active project's documented asset folder. Never treat `.codex/generated_images/` as project storage; use the user preference note in `memories/extensions/ad_hoc/notes/2026-08-20T10-53-31-no-codex-generated-image-storage.md`.

## Project truth and handoff

`skills/project-handoff-doc-stack/SKILL.md` → current project `AGENTS.md` → `PROJECT_CONTEXT.md` → `STATUS.md` → `BLUEPRINT.md` → current source/config/runtime evidence.

`memories/MEMORY.md` is a keyword registry. When it points to a project note, open that note only if the current cwd or request matches. `memories/extensions/ad_hoc/notes/` is a lazy preference/lesson layer, not a replacement for current project truth.

For intent-quality coverage: `codex-router/Measure-CodexIntentCoverage.ps1` checks complete contracts, project types, verification gates, destructive confirmation gates, and that content storage remains none.

For stale knowledge proposals: `codex-router/Audit-CodexFreshness.ps1` then `codex-router/Propose-CodexStaleQuarantine.ps1` checks route/reference counts; all candidates remain manual-review-only with no automatic move or deletion.

For route ownership: `00_PULSE.md` owns primary triggers, `memories/2_governance/artifacts/skill_path_router.md` owns semantic skill/recipe routes, and `codex-router/router-config.json` owns roots, tiers, exclusions, and fallback paths. `codex-router/Audit-CodexRouting.ps1` verifies target existence, manifest paths, and trigger conflicts; same-target boot/fallback duplicates are allowed.

## Conditional reference-library policy

- `skills/normal/` remains outside the broad integrity index but is exposed through explicit relation edges and selected only when the task needs a matching precedent.
- `memories/extensions/ad_hoc/notes/` remains outside the broad integrity index but is exposed through explicit triggers and relation edges; it is never bulk-loaded.
- `memories/archive/`, `memories/rollout_summaries/`, `memories/raw_memories.md`, `memories/*_DETAILS.md`, `skills/.system/`, secrets, runtime state, and nested `.git/` remain excluded from normal routing.
- If a relation target is missing, repair the route or remove the stale edge; do not invent a replacement from historical content.

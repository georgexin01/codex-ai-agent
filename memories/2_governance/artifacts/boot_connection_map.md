---
name: boot-connection-map
description: "Compact project-aware connection map used after PULSE hydration to select frequent knowledge and skill pointers without bulk loading."
triggers: ["ai boot connections", "ai frequent routes", "ai project connections"]
contains: ["project type", "frequent knowledge", "frequent skill", "boot preload", "lazy route"]
phase: boot-routing
version: 1.0
status: active
date_updated: "2026-08-20"
evidence_scope: "654 parseable user-message entries from 44 available 2026 session files, 2 locked active files, and 15 curated rollout summaries; older indexed session IDs have no local raw files"
related:
  - 00_PULSE.md
  - memories/2_governance/artifacts/trigger_intent_index.md
  - memories/2_governance/artifacts/skill_path_router.md
  - memories/2_governance/artifacts/knowledge_relation_router.md
---

# Boot Connection Map

This file is a pointer map, not a bulk knowledge load. After PULSE, resolve the current project type and keep one primary route plus at most two supporting routes ready. Read linked skills or knowledge only when the next user task needs them.

## Boot algorithm

1. Read `00_PULSE.md` and preserve the exact sentinel behavior.
2. Run `codex-router/Detect-CodexProjectTruth.ps1` when a project lane is involved; inspect the current working directory and user wording for a project fingerprint.
3. Select one primary project lane and up to two related nodes. Prefer current files over historical matches.
4. Do not preload `skills/normal`, archives, rollout history, ad hoc notes, or unrelated project facts.
5. On the next task, load the selected front door first, then only the related files needed for the requested action.
6. If the fingerprint is ambiguous, keep only the global safety and routing context and ask or inspect before choosing a project lane.

The exact `ai read .codex knowledge` response remains only `[🟢] Agent is Ready..`; this map changes preparation, not visible output.

## Frequency evidence

Counts are messages containing a project family, not permission to invoke it. The sample removed repeated injected instruction blocks and could not read two locked active files.

| Frequent lane | Messages | Boot priority |
|---|---:|---|
| Images | 156 | High context signal; activate only with an image action |
| Design/UI | 130 | High; activate when visual/UI language is present |
| Codex maintenance | 120 | High for `.codex` cwd or routing/knowledge wording |
| Bilingual/content | 107 | High when English/Chinese, FAQ, blog, or paired content appears |
| PHP/website/SEO | 96 | High for PHP, website, metadata, SEO, robots, sitemap, or JSON-LD |
| Localhost/testing | 92 | High when `localhost test`, HTTP, browser, or Playwright appears |
| Mobile/PWA | 91 | High for mobile, Capacitor, PWA, or app-build wording |
| Vue/Vben/database | 38 | High-caution lane for Vben, Pinia, Supabase, schema, RLS, or API contracts |

## Project-aware connections

| Project fingerprint | Primary route | Frequent supporting knowledge/skills | Boot and completion rule |
|---|---|---|---|
| `.codex` cwd, knowledge, routing, trigger, ignore, or Git maintenance | `memories/2_governance/artifacts/skill_path_router.md` | `trigger_intent_index.md`, `knowledge_relation_router.md`, `CODEX_IGNORE_PROTOCOL.md`, validator scripts | Read current router first; validate routes after edits; never bulk-load history |
| `localhost test`, local URL, HTTP status, browser, Playwright | `skills/localhost-test/SKILL.md` | current project truth, relevant app/website front door | Detect the real root and server; verify raw URLs; do not mutate source unless separately requested |
| PHP website, REST, metadata, SEO, robots, sitemap, JSON-LD | `skills/claude-website/WORKING_PROGRESS.md` | `skills/meta-skills/SKILL.md`, `skills/meta-content-workflow/SKILL.md`, `skills/seo-ai-search/SKILL.md`, design website | Derive identity from current project evidence; verify PHP/HTTP/metadata gates |
| Vben admin, CRUD, table, Pinia, schema, Supabase, RLS, PostgREST | `skills/claude/README.md` | create-module, analyze-schema, generate-store/views/route/i18n/e2e, `skills/pinia-contract-workflow/SKILL.md` | Inspect schema and exact Store/Function/Input contracts before edits; verify build/tests |
| Vue mobile, Capacitor, PWA, app build | `skills/claude-app/WORKING_PROGRESS.md` | `skills/design/app/SKILL.md`, mobile recipe, Pinia/API/i18n/database contracts | Preserve app contracts; build is necessary but visual/mobile route verification is also required |
| Popup, modal, button, click, trigger, same design, screenshot, visual | `memories/2_governance/artifacts/trigger_intent_index.md` | design app/website, design spec, screenshot hygiene, active project truth | Resolve exact target and canonical reference; implement smallest UI change; verify visible state |
| Image generation, image size, image asset | `skills/imagegen/SKILL.md` | image policy, image sourcing, active project asset folder | Enforce dimensions/provenance; never save generated images in `.codex/generated_images/` |
| English/Chinese, bilingual, FAQ, blog, paired content | active project truth document | metadata/SEO route, language datasets, current English source and `cn/` counterpart | English is source of truth; check paired IDs, content, routes, and UTF-8 |

## Conditional project overlays

Only activate these when the current cwd or current source confirms the project. They never become global facts merely because they appeared in history.

| Project | Conditional nodes |
|---|---|
| HUWA2 | `skills/huwa2-webapp/SKILL.md`, checkout/API/RPC/i18n/database contracts, mobile visual gate |
| Zeta Software | bilingual FAQ/blog/pricing/portfolio notes, English source, `cn/` parity, SEO/metadata |
| FC-Moto | metadata/noindex, manifest, category/footer source, PHP verification |
| JamboLive | public product import, category labels, detail routes, local images |
| Sales Hero | SQL-grounded test flow, roles, credit-limit, refund branches |
| Cermin | PHP localhost routes and explicit HTTP status checks |

## Cost and safety boundary

Boot reads pointers only. Do not make the sentinel hydrate every frequent skill or every historical note. Frequent means “candidate connection”; current project evidence and the user’s exact request decide what is actually loaded. Destructive actions, browser clicks, form submission, database mutation, deletion, reset, and force-push always retain their existing confirmation and target-verification gates.

## Maintenance rule

Re-audit this map only when new verified task results add a project family, a route, or a repeated failure pattern. Do not promote a broad noun such as `page`, `image`, `app`, or `website` into an automatic workflow trigger.

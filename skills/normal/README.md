---
name: normal-skills-index
description: "Index for the normal/ tree — a large, loosely-organized general-purpose skill/pattern collection (design vault, engineering recipes, ops scripts, research notes). Not part of the claude/claude-app/claude-website build pipeline; read a subfolder directly when its topic matches the task."
triggers: []
version: 1.0
status: authoritative
date_updated: "2026-08-07"
last_audit: "2026-08-07"
---

# `normal/` — General Pattern & Utility Collection

This tree predates the current `claude*`/`design*` skill families and hasn't been folded into them. It's reachable by direct path only — this file exists so it's at least discoverable from `skills/README.md`. Contents were not deep-audited in this pass; treat each subfolder as unverified until read.

| Subfolder | Contents (sampled) |
|---|---|
| `artifacts/` | Motion-design and ecosystem-DNA reference docs. |
| `brainstorming/` | `skill.md` — brainstorming/ideation workflow. |
| `design/` | `client_dna/` (per-client design profiles) and `design_vault/` (component recipes: auth screens, gradients, glass effects, micro-interactions). |
| `engineering/` | `php-pro/` and `vue3-fnb-framework/` — stack-specific engineering skill recipes. |
| `mobile-design/` | `scripts/mobile_audit.py` — mobile design audit tooling. |
| `mobile-template-from-samples/` | `skill.md` — build a mobile template from sample screenshots (references `USER_DNA.md`, `MOBILE_APP_DESIGN_RECIPE.md`, and historical `memories/archive/` pattern files). |
| `ops/` | `auto_cleaner.ps1`, `system-monitor/skill.md` — local ops/maintenance scripts. |
| `performance/` | `identity_sync.md`. |
| `research/` | AI research methodology notes and `.toon` session-efficiency reports. |
| `testing/` | `webapp-testing/skill.md` — web app testing skill. |
| `_warm/` | Empty at last check. |

For the maintained, actively-routed build pipelines, use `skills/claude/README.md`, `skills/claude-app/SKILL.md`, `skills/claude-website/SKILL.md`, or `skills/design/SKILL.md` instead.

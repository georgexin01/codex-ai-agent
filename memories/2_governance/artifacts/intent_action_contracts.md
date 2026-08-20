---
name: intent-action-contracts
description: "Compact project-aware phrase contracts that turn frequent user intent into a safe next action and verification gate."
triggers: ["ai action contracts", "ai next action routing", "ai intent action", "next action contract"]
contains: ["popup modal", "click center plus button", "close button", "click event", "verification gate"]
phase: routing
version: 1.0
status: active
date_updated: "2026-08-20"
related:
  - memories/2_governance/artifacts/trigger_intent_index.md
  - memories/2_governance/artifacts/skill_path_router.md
  - memories/2_governance/artifacts/knowledge_relation_router.md
---

# Intent Action Contracts

Use this compact layer after project type and target resolution. A phrase selects an interpretation and a next action; it never authorizes an unsafe click, mutation, deletion, reset, or force-push by itself.

| project/type | trigger keywords | meaning | confidence | next action | verification | risk gate |
|---|---|---|---|---|---|---|
| Web/app UI | `popup modal`, `modal`, `popup`, `dialog`, `drawer` | A visibility layer or overlay is involved | high | Locate component, open/close state, portal, stacking, and responsive behavior | Source event/state trace; browser check only when requested | Confirm exact component before editing |
| Web/app UI | `click center + button`, `click plus button`, `add button`, `new button` | The user means the visible add/create control | medium | Resolve the exact button, trace handler, then inspect form/store/API path | Source caller chain plus browser check when requested | Do not activate a real button without explicit browser instruction |
| Web/app UI | `button`, `click this button`, `press`, `tap` | An interactive control or event path is involved | medium | Resolve target, event binding, handler, state mutation, and navigation/API effect | Event trace or requested browser interaction | Target must be unambiguous |
| Web/app UI | `close button`, `close when`, `X button`, `hide`, `toggle` | A dismissal or visibility transition is requested | high | Find close handler, escape/backdrop behavior, unsaved-state guard, and affected overlay | State transition plus responsive/browser check when requested | Preserve unsaved-data protection |
| Web/app UI | `trigger`, `click event`, `activation`, `when click` | Trace event to downstream behavior | medium | Follow event -> handler -> state/API/navigation and identify the first failing edge | Caller/callee trace and nearest test | Do not infer a mutation from the phrase alone |
| CRUD/data | `form`, `submit`, `save`, `create`, `update` | A data mutation or contract may be involved | medium | Inspect schema, store/API, validation, i18n, and anti-double-submit guard | Type/build, API/SQL, or workflow test | Preserve exact contracts; confirm material mutation |
| Destructive maintenance | `delete`, `remove`, `reset`, `drop`, `clear` | Data or knowledge may be removed | high | Resolve exact target, references, backup/recovery, and ignore rules before acting | Final state plus route/reference validation | Explicit confirmation required for material destruction |
| Research/routing | `read`, `study`, `research`, `find`, `look up` | Evidence is requested before action | high | Read current project truth, select the narrowest route, then follow only needed relations | Cite current files and state missing evidence | No historical fact overrides current files |
| Localhost | `localhost test`, `test locally`, `run local` | Runnable local app readiness is requested | high | Detect project root, reuse/start the correct server, and test required URLs | Raw URLs and HTTP status per route | Do not mutate source/config during a readiness check |
| Design parity | `same design`, `exact same`, `copy this`, `reuse existing`, `match` | Canonical visual structure must be reused | high | Find source DOM/CSS/component and compare route, assets, typography, spacing, and responsive behavior | Build plus visual/browser check | Do not approximate when a canonical source exists |

## Contract execution order

1. Resolve project type from cwd, current files, and user wording.
2. Resolve the exact target; broad nouns such as `page`, `image`, `app`, or `update` remain context labels.
3. Apply the matching next action and risk gate.
4. Verify using the nearest evidence gate before reporting completion.

If the phrase remains ambiguous after current-file inspection, state `INSUFFICIENT DATA` and identify the missing target or project evidence.

Confidence rule: `high` may select the contract when the target is clear; `medium` requires target confirmation from current files before any mutation or browser action. Any conflicting project evidence lowers confidence and stops execution.

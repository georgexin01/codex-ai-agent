---
name: evidence-gate-matrix
description: "Project-aware verification matrix that selects the nearest evidence gate before Codex reports completion."
triggers: ["ai evidence gate", "ai verification matrix", "what test should run", "verify before done"]
phase: verification
version: 1.0
status: authoritative
date_updated: "2026-08-20"
related:
  - 00_PULSE.md
  - memories/2_governance/artifacts/intent_action_contracts.md
  - codex-router/Test-CodexIntentContracts.ps1
---

# Evidence Gate Matrix

Select the smallest evidence gate that directly proves the requested outcome. Build success alone does not prove visual, HTTP, schema, or route behavior.

| project/type | primary gate | additional gate when relevant | completion rule |
|---|---|---|---|
| `.codex` routing/knowledge | route audit + knowledge validator | frontmatter/index or performance benchmark | No missing targets, conflicts, or unreported benchmark failures |
| Vue/Vben implementation | type-check/build | route workflow, browser/mobile visual check | Contracts and requested runtime behavior are verified |
| PHP/static website | PHP lint/build | HTTP route and metadata/browser check | Requested route and current identity evidence are verified |
| Supabase/schema/API | SQL/schema inspection | API/RLS or restore check | Schema, contracts, and exposed behavior agree |
| `localhost test` | HTTP request/status | browser or API check only when requested | Print each working raw URL and status |
| UI interaction | source event/state trace | browser click/screenshot when explicitly requested | Exact target and visible state transition are proven |
| research/read-only | current file/source evidence | historical memory only for matching context | Separate fact, preference, history, and missing evidence |

If the primary gate cannot run, report the exact blocker and do not claim complete success.

---
name: codex-access-priority-audit
title: Codex Access Priority Audit
description: "Global classification of .codex knowledge, skills, router, runtime, and archive surfaces so agents read less, route faster, and avoid stale/noisy context."
aliases:
  - codex inventory
  - codex access map
  - codex priority audit
  - codex cleanup plan
triggers:
  - ai codex inventory
  - ai codex access priority
  - ai codex cleanup plan
  - ai reorganize codex
priority: high
status: active
scope: global-codex
last_verified: "2026-07-07"
source_of_truth:
  - 00_PULSE.md
  - AGENTS.md
  - CODEX_DYNAMIC_ROUTING.md
  - memories/2_governance/artifacts/skill_path_router.md
verification:
  - Re-run codex-router/Audit-CodexRouting.ps1 after route-affecting edits.
  - Do not delete or move active knowledge/skill paths without route patching or redirect stubs.
---

# Codex Access Priority Audit

Purpose: keep `.codex` fast and predictable across all projects by separating hot routing context from lazy knowledge, project fingerprints, runtime files, and historical archives.

## Operating Model

```text
User request
-> 00_PULSE.md
-> current project root fingerprint
-> exact skill route if needed
-> targeted memory lookup if useful
-> deep tools only when justified
-> verify result
```

## Priority Lanes

| Lane | Meaning | Read Policy |
|---|---|---|
| P0 Hot | Required to route safely | Read once per chat or when routing becomes stale |
| P1 Active | Common fallback or current project truth | Read only when task matches |
| P2 Lazy | Useful deeper knowledge | Triggered only |
| P3 Conditional | Tooling, config, graph, or audit support | Use only for matching need |
| P4 Runtime | Installed/cache/generated runtime data | Never treat as knowledge |
| P5 Archive | History, logs, rollouts, recovery evidence | Use only for exact resume/debug |

## Global Classification

| Surface | Classification | Role | Action |
|---|---|---|---|
| `00_PULSE.md` | P0 Hot | Single boot router, priority ladder, trigger map | Keep highest priority |
| `AGENTS.md` | P0 Hot | Global behavior contract | Keep concise; avoid duplicating PULSE |
| Current user request/open files | P0 Hot | Freshest task truth | Always prefer over memory |
| Current project `AGENTS.md` | P1 Active | Project-specific behavior/routing | Read from active repo when present |
| `PROJECT_CONTEXT.md` | P1 Active | Tiny project fingerprint | Read immediately after boot when present |
| `STATUS.md` | P1 Active | Current project state/handoff | Read when resuming or debugging that project |
| `BLUEPRINT.md` | P2 Lazy | Architecture/product intent | Read for bigger product or architecture work |
| `CODEX_DYNAMIC_ROUTING.md` | P1 Active | Generated route summary | Use for route audit, not routine boot |
| `00_CODEX_START_HERE.md` | P2 Lazy | Deferred boot reference | Read only when PULSE is insufficient |
| `00_REASONING_EVOLUTION_PROTOCOL.md` | P2 Lazy | Deeper reasoning contract | Read only for deep/high-risk reasoning work |
| `memories/MEMORY.md` | P1 Active | Search registry for prior knowledge | Keyword lookup only; do not full-hydrate history |
| `memories/0_apex/` | P2 Lazy | Deep kernels, user DNA, router templates | Triggered by governance/design/deep tasks |
| `memories/1_core/` | P2 Lazy | Reusable core knowledge | Triggered by matching topic |
| `memories/2_governance/` | P2 Lazy | Protocols and safety policies | Triggered by matching risk/tooling need |
| `memories/3_domains/` | P3 Conditional | Domain-specific knowledge | Use only for matching project/domain |
| `memories/project_notes/` | P2 Lazy | Project-specific route notes | Use only when cwd or prompt matches |
| `memories/extensions/ad_hoc/notes/` | P2 Lazy | Recent durable lessons and behavior notes | Prefer recent matching notes; avoid broad scans |
| `memories/rollout_summaries/` | P5 Archive | Historical recovery evidence | Use only for exact old-task resume/debug |
| `memories/raw_memories.md` | P5 Archive | Generated/raw memory body | Avoid unless rebuilding memory index |
| `skills/README.md` | P1 Active | Human skill front door | Use before scanning skill directories |
| `memories/2_governance/artifacts/skill_path_router.md` | P1 Active | Canonical skill route fallback | Use on skill route miss |
| `skills/` | P2 Lazy | Specialized workflows | Load only exact matching skill |
| `skills/.system/` | P3 Conditional | Built-in system skills | Use only when task asks for skill/plugin/OpenAI docs/imagegen |
| `rules/default.rules` | P3 Conditional | Command/config permission patterns | Do not treat as behavior or principles |
| `codex-router/` | P3 Conditional | Route generation, manifest, audit tools | Use for route maintenance/integrity only |
| `codex-router/codex-manifest.json` | P3 Conditional/Risky | Path/hash integrity index | Never full-read at boot |
| `plugins/` | P4 Runtime | Installed plugin cache | Use only through exposed tools/skills |
| `cache/` | P4 Runtime | Cached runtime data | Do not route as knowledge |
| `.tmp/`, `tmp/` | P4 Runtime | Temporary files | Exclude from knowledge routing |
| `.sandbox/`, `.sandbox-bin/`, `.sandbox-secrets/` | P4 Runtime/Risky | Sandbox/runtime/secrets | Never route as knowledge; protect secrets |
| `sessions/` | P5 Archive | Session history | Use only for exact recovery |
| `logs_*.sqlite`, `state_*.sqlite`, `goals_*.sqlite`, `memories_*.sqlite` | P5 Archive/Runtime | Runtime state/log DBs | Never read as normal context |
| `.gitnexus/` | P3 Conditional | Graph metadata | Use only for matching codebase analysis; never for `.codex` itself |

## Cleanup Rules

1. Do not delete first. Classify, route-patch, then archive.
2. Keep `00_PULSE.md` as the only hot boot brain.
3. Treat `rules/` as operational config, not thinking principles.
4. Treat `memories/MEMORY.md` as an index, not a full context file.
5. Treat `skills/` as trigger-loaded workflows, not global context.
6. Treat project files as local truth only for the current cwd.
7. Keep runtime/cache/log/session files out of routing.
8. Before moving active knowledge or skill paths, update routes or leave redirect stubs.

## Universal Project Fingerprint

When entering any project, check in this order:

```text
1. Project AGENTS.md
2. PROJECT_CONTEXT.md
3. STATUS.md
4. BLUEPRINT.md
5. README.md / package / composer / index files
```

Use these only for the active project. Do not let one project's `STATUS.md` or `BLUEPRINT.md` become global behavior.

## Recommended Next Passes

| Pass | Goal | Risk |
|---|---|---|
| 1 | Add this audit report | Low |
| 2 | Add route entry for this audit if desired | Medium |
| 3 | Find duplicated behavior rules across PULSE, AGENTS, performance notes | Low |
| 4 | Mark old stubs as superseded more visibly | Medium |
| 5 | Archive stale docs only after route audit passes | High |

## Current Recommendation

Keep the current router architecture. Improve speed by making the access policy explicit and by preventing runtime, archive, and project-specific files from competing with P0/P1 route surfaces.

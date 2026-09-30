---
name: gpt-6-luna-high-reasoning-profile
title: GPT-6 Luna High Reasoning Profile
description: "Runtime profile contract for GPT-6 Luna high reasoning effort, task context lanes, and controlled automation."
aliases:
  - luna reasoning modes
  - medium high reasoning
  - gpt 6 luna high reasoning
triggers:
  - ai luna reasoning
  - ai gpt-6 luna reasoning
  - ai medium high reasoning
  - ai luna performance mode
priority: high
contains:
  - medium reasoning
  - high reasoning
  - context budget
  - escalation gate
  - controlled automation
related_docs:
  - 00_PULSE.md
  - AGENTS.md
  - memories/2_governance/MODEL_COST_OPTIMIZATION_POLICY.md
  - codex-router/controlled-auto-policy.json
  - 00_REASONING_EVOLUTION_PROTOCOL.md
verification:
  - Run codex-router/Run-CodexLunaMaintenance.ps1.
  - Confirm route, memory, skill, and benchmark checks before completion.
phase: governance
model_hint: medium
model_profile: gpt-6-luna-high
applies_to: ["gpt-6-luna"]
version: 1.1
status: authoritative
date_updated: "2026-09-30"
last_audit: "2026-09-30"
---

# GPT-6 Luna high reasoning profile

This is the compact contract for the configured GPT-6 Luna runtime. `config.toml` selects model `gpt-6-luna` and high reasoning effort. `model_profile` is a local label; Markdown frontmatter does not change runtime configuration.

## High reasoning effort — configured default

- High effort applies to routine and complex tasks through the runtime configuration.
- Keep evidence and output proportional to the request; high effort does not authorize broader scope.
- Resolve the longest route first and load only the relevant front door and evidence.
- Keep one verification target for narrow work; expand checks when risk requires it.

## Task context lanes

- Routine, balanced, and deep describe context scope, not model choice or reasoning effort.
- Routine work uses PULSE, one matching front door, and a few current project files.
- Deep work adds exact governance or project truth when risk, ambiguity, or the task requires it.

## High-effort checks

- Preserve the exact task contract, paths, identifiers, errors, and acceptance criteria.
- Test counterexamples, source conflicts, stale routes, and rollback paths when relevant.
- Run full relevant validation before claiming completion.

## Shared locks

Current files and tests outrank memory. Protected files, secrets, live data, Tier-0, and Tier-1 governance remain gated. Automatic actions are limited by `codex-router/controlled-auto-policy.json`.

## Luna-sized documentation

Keep front doors compact and actionable. Preserve deep detail in deferred companion files. Do not truncate unique contracts, identifiers, routes, examples, exceptions, or verification rules merely to meet a token target.

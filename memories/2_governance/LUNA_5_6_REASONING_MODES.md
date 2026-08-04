---
name: luna-5-6-reasoning-modes
title: GPT-5.6 Luna Medium and High Reasoning Modes
description: "Compact operating contract for GPT-5.6 Luna reasoning levels, context budgets, escalation, and controlled automation."
aliases:
  - luna reasoning modes
  - medium high reasoning
  - gpt 5.6 luna modes
triggers:
  - ai luna reasoning
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
verification:
  - Run codex-router/Run-CodexLunaMaintenance.ps1.
  - Confirm route, memory, skill, and benchmark checks before completion.
phase: governance
model_hint: medium
model_profile: luna-5.6-medium
version: 1.0
status: authoritative
date_updated: "2026-08-04"
---

# GPT-5.6 Luna reasoning modes

This is the compact mode contract for the user's GPT-5.6 Luna runtime. Reasoning depth changes evidence quality and verification depth; it never authorizes broader scope or weaker safety.

## Medium mode — default

- Resolve the longest route first.
- Load PULSE, one matching front door, and only targeted evidence.
- Keep one verification target and concise output.
- Do not load Tier-0, rollout history, or broad memory unless the route requires it.
- Use for routine coding, lookup, small fixes, local tests, and known-scope changes.

## High mode — deliberate escalation

Use only for explicit `deep`, `thorough`, or `review` requests, unresolved ambiguity, security/auth/schema work, architecture, recovery, or a failed Medium check.

- Preserve the exact task contract, paths, identifiers, errors, and acceptance criteria.
- Read the exact higher-tier sources required by the route.
- Test counterexamples, source conflicts, stale routes, and rollback paths.
- Run full relevant validation before claiming completion.
- Return to Medium after the high-risk task is complete.

## Shared locks

Current files and tests outrank memory. Protected files, secrets, live data, Tier-0, and Tier-1 governance remain gated. Automatic actions are limited by `codex-router/controlled-auto-policy.json`.

## Luna-sized documentation

Keep front doors compact and actionable. Preserve deep detail in deferred companion files. Do not truncate unique contracts, identifiers, routes, examples, exceptions, or verification rules merely to meet a token target.

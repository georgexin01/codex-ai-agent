---
name: project-knowledge-template
title: Project Knowledge Template
description: "Reusable structure for future AI project knowledge notes. Use this template to record source of truth, routing, rules, examples, verification, and exceptions in a way that is easy for AI to parse."
aliases:
  - knowledge template
  - project template
  - router template
triggers:
  - ai project knowledge template
  - ai knowledge template
  - ai project template
priority: high
version: 1.0
status: authoritative
contains:
  - source_of_truth
  - routing
  - rules
  - examples
  - verification
  - exceptions
  - reusable_principle
  - goal
related_docs:
  - memories/extensions/ad_hoc/notes/2026-07-01T18-27-54-hybrid-metadata-router.md
  - memories/0_apex/templates/MASTER_ROUTER_BLUEPRINT.md
  - memories/2_governance/artifacts/skill_path_router.md
related_skills:
  - skills/project-handoff-doc-stack/SKILL.md
  - skills/claude-meta/validate-knowledge/skill.md
verification:
  - The template should tell AI what the doc is for before the body starts.
  - The router terms should match the trigger names in the boot and skill routers.
---

# Project Knowledge Template

Use this template when adding reusable project knowledge for future AI runs.

## 1. Source of Truth
- Name the primary repo, folder, or file that owns the truth.
- State what must not be overridden by older notes or helper docs.

## 2. Routing
- Define the exact boot file.
- Define the exact trigger phrase and the exact file it should open.
- Keep one trigger per task whenever possible.

## 3. Rules
- Write the non-negotiable project rules in short, direct statements.
- Prefer stable facts over broad advice.
- Keep rules separated by purpose: routing, design, data, safety, verification.

## 4. Examples
- Add one good example and one bad example for important workflows.
- Show the exact path, command, or shape the AI should prefer.

## 5. Verification
- State the one check that proves the change is correct.
- Prefer file read-back, build, lint, curl, SQL validation, or route audit.

## 6. Exceptions
- List what must not be touched without explicit approval.
- Call out sensitive areas, destructive actions, and local infra boundaries.

## 7. Reusable Principle
- One boot doc.
- One trigger per task.
- One file per purpose.
- One verification step per action.
- One source of truth per project.

## Goal
- Make the knowledge easier for AI to read, easier to route, and harder to misinterpret.
- Keep the project instructions simple enough that future skills can follow them more consistently.

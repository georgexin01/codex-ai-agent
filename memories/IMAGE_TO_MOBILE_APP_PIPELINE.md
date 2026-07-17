---
name: image-to-mobile-app-pipeline
description: "Canonical image-to-mobile-app execution index for Luna 5.6: analyze references, scaffold the mobile app, wire design, verify every route, and write BLUEPRINT.md."
type: procedure-index
tier: 2
phase: 1-execution
priority: HIGH
model_hint: medium
applies_to: ["claude", "claude-code", "luna-5.6-medium", "antigravity"]
authored_for: "shared cross-AI use"
requires: ["MOBILE_APP_DESIGN_RECIPE.md", "CLAUDE_BLUEPRINT_RECIPE.md", "0_apex/USER_DNA.md", "1_core/DESIGN_SOP.md", "0_apex/SOVEREIGN_BLUEPRINT_PROTOCOL.md"]
details: "IMAGE_TO_MOBILE_APP_PIPELINE_DETAILS.md"
version: 1.0-index
status: authoritative
last_audit: "2026-07-17"
---

# Image-to-Mobile-App Pipeline — Fast Index

The complete original pipeline is preserved in [`IMAGE_TO_MOBILE_APP_PIPELINE_DETAILS.md`](IMAGE_TO_MOBILE_APP_PIPELINE_DETAILS.md). Read this index first, then open only the detail phase required for the current build.

## Purpose

Use when the user supplies screenshots, reference images, or a visual sample and wants a Vue 3 + TypeScript + Vite + Tailwind mobile app. This pipeline turns visual evidence into a verified app shell, page set, design system, interactions, and BLUEPRINT.md.

## Required route

1. Detect whether the request is image-driven and confirm the project/scaffold boundary.
2. Run the pre-flight and inspect every reference image individually before coding.
3. Synthesize one design language and map each required page to sample evidence.
4. Follow the phases: scaffold, tokens, app shell/toasts, auth, main tabs, account, sub-pages, utilities, Design Kit, CTA wiring, verification, and BLUEPRINT.md.
5. Finish with a route smoke-walk, visible-state checks, and no dead-end CTA audit.

## Hard requirements

- Sample evidence wins over generic taste rules where they conflict.
- Use `MOBILE_APP_DESIGN_RECIPE.md` for the canonical mobile shell and primitives.
- Every tab/chip/CTA must change content, navigate, update state, or show an explicit toast.
- Preserve responsive viewport metadata and safe-area spacing.
- Keep mock data and Supabase seams explicit; do not silently invent persistence.
- Verify all required pages and write the project BLUEPRINT.md before completion.

## Detail-section router

| Need | Read in detail companion |
|---|---|
| Trigger and pre-flight | `§0 Trigger detection`, `§1 Pre-flight checklist` |
| Reference-image analysis | `§2 Phase 0` |
| Scaffold and tokens | `§3 Phase 1`, `§4 Phase 2` |
| Shell, toast, auth, tabs, account, sub-pages | `§5`–`§10` |
| Design Kit and CTA wiring | `§11`, `§12` |
| Verification and BLUEPRINT.md | `§13`, `§14` |
| Canonical 23+ page list | `§15` |
| Copy-paste primitives | `§16` |
| Hard always/never rules | `§17` |
| User refinement history and quick launch | `§18`–`§19` |
| Permission boundaries | `§20` |

## Preservation rule

The detail companion retains the complete pre-compression pipeline, including exact phase instructions, code blocks, page lists, interaction rules, historical refinements, and verification requirements.

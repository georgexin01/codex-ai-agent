---
name: mobile-app-design-recipe
description: "Canonical mobile app build recipe index for the user's preferred fintech/utility aesthetic, sample-driven mobile builds, and Luna 5.6 routing."
type: procedure-index
tier: 2
phase: 1-execution
priority: HIGH
model_hint: medium
applies_to: ["claude", "claude-code", "luna-5.6-medium", "antigravity"]
authored_for: "shared cross-AI use"
requires: ["CLAUDE_BLUEPRINT_RECIPE.md", "0_apex/USER_DNA.md", "1_core/DESIGN_SOP.md", "0_apex/SOVEREIGN_BLUEPRINT_PROTOCOL.md"]
unlocks: ["IMAGE_TO_MOBILE_APP_PIPELINE.md"]
details: "MOBILE_APP_DESIGN_RECIPE_DETAILS.md"
version: 2.0-index
status: authoritative
last_audit: "2026-07-17"
triggers:
  - "build me a mobile app"
  - "new mobile app"
  - "sample app like wallet"
  - "clone the template"
  - "fintech mobile app"
  - "scaffold a new app"
  - "mobile app starter"
---

# Mobile App Design Recipe — Fast Index

This is the canonical routed entry point. The complete original recipe is preserved in [`MOBILE_APP_DESIGN_RECIPE_DETAILS.md`](MOBILE_APP_DESIGN_RECIPE_DETAILS.md). Read this index first; open only the matching detail section when exact code, checklist, or historical pattern is needed.

## Purpose and output

Use for new Vue 3 + TypeScript mobile/PWA builds, wallet/fintech-style samples, template clones, and sample-image-driven app work. The recipe produces a working app, BLUEPRINT.md, responsive mobile shell, toast/alert wiring, navigation, and verified flows.

## Non-negotiable design DNA

- Sample-image fidelity wins when reference images exist; otherwise use the user's taste profile.
- Light paper backgrounds, yellow/gold primary CTA where samples support it, ink anchor cards, and no unnecessary third accent color.
- `font-bold` (700) is the default; reserve 900 for hero prices.
- Glass is for overlays, toasts, and bottom bars—not full headers.
- Every tab, chip, quick action, CTA, and menu item must drive content, navigation, store behavior, or an explicit toast.
- Use `width=device-width, initial-scale=1.0, viewport-fit=cover`; never hardcode viewport width.
- Monetary values use `.tnum`; active Material Symbols use `.fill-1`.

## Required execution route

1. Read `CLAUDE_BLUEPRINT_RECIPE.md` when documenting or analyzing an existing project.
2. For a new app, follow the detail recipe's foundations, reusable systems, views, routing, polish, and verification phases.
3. For reference images, run the image-study protocol before scaffolding and map every required page to sample evidence.
4. Build reusable UI primitives before duplicating page-specific markup.
5. Verify navigation, toasts, OTP behavior, bottom navigation, safe-area spacing, no horizontal overflow, and final route smoke-walk.

## Detail-section router

| Need | Read in detail companion |
|---|---|
| Taste decision and pre-build commitment | `§0.5 TASTE COMPASS`, `Taste Commit` |
| Trigger and output contract | `When to invoke`, `Outputs` |
| Basic implementation checklist | `Build Phases`, `Verification Checklist` |
| Copy-paste UI primitives | `Reusable primitives library` |
| Global style and permission rules | `Style rules`, `Permission boundaries` |
| Sample-image workflow | `§N.1`–`§N.3` |
| Component/form stack | `§N.4` |
| Navigation, mock seam, locale, artifacts | `§N.5`–`§N.8` |
| Chip/tab/brand wiring | `§N.9`–`§N.10` |
| Replacement, route, seed, and smoke-test safeguards | `§N.11` |
| OTP, auth, filters, maps, galleries, forms, FAB, toast, Tailwind gotchas | `§N.12.1`–`§N.12.14` |

## Preservation rule

No original recipe content was discarded. The detail companion retains the complete pre-compression file, including code blocks, exact values, examples, historical lessons, and verification requirements. Keep this index short and use the companion only for the relevant section.

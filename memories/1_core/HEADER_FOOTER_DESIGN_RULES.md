---
name: header-footer-design-rules
description: "Canonical mobile header, bottom navigation, tab, button-completion, sizing, and verification rule index."
type: rule-index
tier: 2
phase: design
priority: HIGH
model_hint: medium
applies_to: ["claude", "claude-code", "luna-5.6-medium", "antigravity"]
authored_for: "shared cross-AI use"
requires: ["../MOBILE_APP_DESIGN_RECIPE.md", "../0_apex/USER_DNA.md", "DESIGN_SOP.md", "../0_apex/SOVEREIGN_BLUEPRINT_PROTOCOL.md"]
details: "HEADER_FOOTER_DESIGN_RULES_DETAILS.md"
version: 1.0-index
status: authoritative
last_audit: "2026-07-17"
---

# Header & Footer Design Rules — Fast Index

The complete original rules are preserved in [`HEADER_FOOTER_DESIGN_RULES_DETAILS.md`](HEADER_FOOTER_DESIGN_RULES_DETAILS.md). Read this index first and open only the needed detail section.

## Core rules

- Headers are fixed, pure white, and use the project header shadow; choose the correct fixed-header variant for the page type.
- Reserve space for fixed headers and bottom navigation; never cover content or the final list item.
- Bottom navigation is visible only on designated main-tab pages, with icon, label, active state, and working navigation.
- Tabs and filter chips must change the panel/content, not only the underline or visual state.
- No silent buttons: every icon or CTA must navigate, mutate state, open a sheet/modal, or show an explicit toast.
- Use canonical Tailwind classes and the documented size ladder; avoid undocumented arbitrary pixel values.
- Run the complete verification checklist before declaring the design finished.

## Detail-section router

| Need | Read in detail companion |
|---|---|
| Header behavior and variants | `§1`, especially `§1.1`–`§1.5` |
| Bottom navigation/footer | `§2` |
| Filter chips and segmented tabs | `§3` |
| CTA and icon completion | `§4` |
| Examples and references | `§5` |
| Verification checklist | `§6` |
| Size standards and canonical mappings | `§6.5` |
| Application scope | `§7` |

## Preservation rule

The detail companion retains every original implementation example, exact class/value, page matrix, exception, size mapping, and verification item. This index changes only the first-read route, not the design contract.

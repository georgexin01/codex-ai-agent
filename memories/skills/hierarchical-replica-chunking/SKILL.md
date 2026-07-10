---
name: hierarchical-replica-chunking
description: Use when the user wants a screenshot-accurate app or website replica, says "replica", "clone", "same design", or "match exactly", and fidelity matters more than redesign.
argument-hint: "[reference-image-or-target]"
user-invocable: false
allowed-tools:
  - Read
  - Grep
  - ViewImage
---

# Hierarchical Replica Chunking

## When to use

Use this when a task is about reproducing a UI from screenshots or a reference image and the goal is to stay visually close to the source.

Do not use this for loose inspiration work, net-new design direction work, or purely functional/layout refactors where exact visual matching is not the goal.

## Inputs / context to gather

1. Confirm the reference image or screenshot is available.
2. Confirm the user wants close visual matching rather than a reinterpretation.
3. Identify the implementation surface to edit first, such as the page, component, or section.
4. If images inside the design matter, note whether existing assets can preserve the same framing or whether replacement assets may be needed.

## Procedure

1. Inspect the reference image before editing anything.
2. Break the page into major bands such as `header`, `hero`, `body-top`, `body-center`, `body-bottom`, and `footer`.
3. Break each band into medium chunks, then into the smallest meaningful visual chunks.
4. Treat each chunk as one grouped replica unit, not one HTML tag:
   - structure
   - spacing
   - typography
   - palette
   - border/radius/shadow
   - image ratio and focal placement
   - overlays, badges, or CTA placement
5. Write the chunk breakdown in markdown before implementation when fidelity matters.
   - Template: `skills/hierarchical-replica-chunking/templates/replica-breakdown.md`
6. Implement one major chunk at a time and compare back to the reference after each chunk.
7. Keep the reference image active for the whole task:
   - inspect it again while working on each major chunk
   - compare size, spacing, color, layout, border/radius/shadow, image framing, icon placement, and section density
8. If an exact match would require bad cropping, stop and inspect the image composition first.
   - Prefer a replacement image or adjusted asset that preserves ratio and focal balance over blind cropping.

## Efficiency plan

1. Do one strong decomposition pass up front instead of repeated element-by-element guessing.
2. Reuse the chunk notes as the implementation checklist so the reference does not have to be re-described from scratch.
3. Compare after each major chunk instead of waiting until the whole page is built.
4. Stop broad redesign drift early; if a chunk starts looking "cleaner" but less like the screenshot, revert to the reference.

## Pitfalls and fixes

- Symptom: the result feels loosely inspired by the screenshot rather than matching it.
  Fix: go back to chunk decomposition and group the styling with the visual unit it controls instead of treating the page as a flat element list.

- Symptom: the first pass looked close, but later sections drifted.
  Fix: keep the reference image under continuous review; do not inspect once and rely only on notes afterward.

- Symptom: images fit the slot but the composition looks wrong.
  Fix: preserve width/height ratio and focal balance; replace or reframe the image instead of forcing a blind crop.

## Verification checklist

1. A markdown chunk breakdown exists or was explicitly reasoned through before implementation.
2. Each major band was compared back to the reference during implementation, not only at the end.
3. The final pass checks spacing, color, hierarchy, section order, typography feel, border/radius/shadow, and image framing against the reference.
4. No major chunk was redesigned away from the screenshot unless the user explicitly asked for reinterpretation.

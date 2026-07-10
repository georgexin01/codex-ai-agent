# Replica Chunking Technique

## User-approved addition
Save this as reusable `.codex` knowledge for future design work.

## Name
- Hierarchical Replica Chunking
- Nested Visual Decomposition
- Design DNA Chunk Mapping

Preferred working name:

`Hierarchical Replica Chunking`

## Core Meaning

When replicating an app or website from screenshots, do not analyze the design as a flat list of elements.

Instead, break the design into nested visual chunks:

`A = (c + c + (c + c + c) + c ...)`

Where each `c` is **not** necessarily one HTML element.

Each `c` means:

- one smallest meaningful visual design chunk
- one controllable replica unit
- one grouped structure + styling package

## What a `c` can contain

A single `c` may include:

- container structure
- one or more `div` blocks
- border rules
- radius rules
- shadow rules
- background rules
- theme direction
- color tokens
- text color
- font size
- font weight
- spacing
- alignment
- icon placement
- image ratio
- image focal placement
- overlay notes
- CTA placement
- section-specific CSS notes

So:

- `c` is not "one tag"
- `c` is not "one CSS declaration"
- `c` is "one smallest meaningful visual replica chunk"

## Why this improves replica accuracy

This method improves screenshot replication because it:

1. prevents shallow element-by-element analysis
2. captures grouped visual behavior instead of isolated tags
3. helps preserve exact section hierarchy
4. makes CSS notes inseparable from the visual unit they control
5. makes image composition easier to track by section
6. reduces random redesign drift
7. increases likelihood of same-looking reproduction

## Recommended analysis flow

1. Break the whole page into major bands:
   - header
   - hero
   - body-top
   - body-center
   - body-bottom
   - footer
2. Break each major band into medium chunks.
3. Break each medium chunk into smaller chunks.
4. For each smallest meaningful chunk, record:
   - structure
   - spacing
   - typography
   - palette
   - border/radius/shadow
   - image ratio and focal placement
   - any overlays or badges
5. Record this in markdown before implementation when high-fidelity replica work matters.

## Trigger conditions

Use this technique when:

- the user wants an app or website to look as close as possible to a screenshot
- the user says "replica", "clone", "same design", "match exactly", or similar
- the visual hierarchy is dense or premium and small details matter
- image composition is important
- a design should be recreated without changing logic

## Important rule: Persistent reference monitoring

When a sample image, uploaded screenshot, or chat-posted design reference exists and the user wants a replica, clone, copy, or exact same design, that reference image becomes a **persistent monitoring item** for the whole task.

This is an important rule.

AI must:

1. inspect the reference image before editing
2. inspect it again while working on each major chunk
3. compare the current output back to the reference continuously
4. keep the reference active until the task ends

Do not:

- inspect the image once and then ignore it
- rely on markdown notes alone after the first pass

Do:

- monitor the reference image
- read the markdown breakdown
- use chunk execution
- keep re-checking image similarity for:
  - size
  - spacing
  - color
  - layout
  - typography feel
  - border/radius/shadow
  - image framing
  - icon placement
  - section density
  - section order

## Important image rule

If exact screenshot matching would force bad cropping:

1. do not crop blindly just to fit the box
2. understand the reference composition first
3. use a new generated or replacement image if needed
4. keep width, height, ratio, and focal balance aligned to the reference

## Skill integration intent

This technique should be considered part of future `design/app` and `design/website` replica-oriented work whenever screenshot-accuracy is the goal.

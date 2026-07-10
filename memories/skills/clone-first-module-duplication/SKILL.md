---
name: clone-first-module-duplication
description: Use when the user says "copy and paste", "duplicate", "clone", or "same modules" and wants an existing module reused with the same shell before inner content changes.
argument-hint: "[source-module-or-target-area]"
user-invocable: false
allowed-tools:
  - Read
  - Grep
---

# Clone First Module Duplication

## When to use

Use this when the user wants the same module, drawer, grid, or component structure copied into a new feature area and the safest path is to preserve the original shell first.

Do not use this when the user explicitly wants a redesign, a fresh layout, or only a tiny edit inside an existing file.

## Inputs / context to gather

1. Confirm the exact source module or file the user wants copied.
2. Confirm what part must stay the same:
   - shell
   - spacing
   - drawer or grid behavior
   - component structure
3. Confirm which inside content should change after the clone exists.
4. Identify whether the request touches one file, a paired component set, or a module folder.

## Procedure

1. Locate the exact source module before editing anything.
2. Duplicate the whole source module or file first.
3. Verify the clone still preserves the same outer shell and structure before making content edits.
4. Only after the clone exists, change the inside content the user actually asked for.
5. Keep layout-preserving edits separate from content-swapping edits so drift is easy to spot.
6. For VIPBillion driver-job relation drawer work:
   - clone the driver-job list drawer or module shell first
   - preserve the drawer/grid shell
   - then swap the inner table/content from driver jobs to bookings

## Efficiency plan

1. Spend the first search pass finding the exact source module instead of re-creating the layout from memory.
2. Reuse the cloned shell as the baseline so later diffs show only intentional inner-content changes.
3. Stop exploring alternatives once the correct source module is identified; duplicate first, then refine.

## Pitfalls and fixes

- Symptom: the result has the same intent but not the same structure.
  Fix: go back and duplicate the original module shell directly instead of rebuilding it from scratch.

- Symptom: spacing, drawer behavior, or component wiring drifted during the copy.
  Fix: compare the cloned shell to the source before changing inner content; restore the shell first, then re-apply the requested content edits.

- Symptom: the agent starts redesigning before a clone exists.
  Fix: pause implementation, locate the exact source file, and create the duplicate before any reinterpretation.

## Verification checklist

1. The exact source module/file is identified in notes or working context.
2. A full clone exists before inner-content edits begin.
3. The cloned result preserves the same shell, spacing, drawer/grid behavior, and component structure unless the user explicitly asked otherwise.
4. Final diffs mainly show the requested content swap or target-specific renaming, not an unintended redesign.

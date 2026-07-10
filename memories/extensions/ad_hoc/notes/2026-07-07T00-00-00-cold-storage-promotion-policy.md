---
name: cold-storage-promotion-policy
title: Cold Storage Promotion Policy
description: "AI-managed audit note for deciding whether a memory or skill file should stay cold, be promoted to active routing, or be left as historical context."
aliases:
  - cold storage audit
  - memory promotion policy
  - route promotion policy
triggers:
  - ai cold storage audit
  - ai promote memory
  - ai memory promotion
priority: high
status: authoritative
version: 1.0
related_docs:
  - 00_PULSE.md
  - memories/MEMORY.md
  - memories/memory_summary.md
  - memories/0_apex/USER_DNA.md
verification:
  - Compare the candidate against current boot routes and current project files.
  - Promote only when the file is reusable, correct, and clearly valuable to future work.
  - Keep it cold when it is historical, duplicated, or likely to bloat the boot path.
---

# Cold Storage Promotion Policy

Use this note when auditing memory or skill files that are not currently in the hot boot path.

## Promote when
- The file encodes a reusable rule, workflow, or constraint that applies across multiple future tasks.
- The file is correct, current, and not already represented more cleanly in a hotter note.
- The file would reduce repeated explanation or repeated lookup in future turns.
- The file deserves a direct trigger because it is a common decision point.

## Keep cold when
- The file is historical, project-specific, or only useful for one past rollout.
- The file duplicates a hotter rule already present in `00_PULSE.md` or another active note.
- Routing the file would add noise to boot without improving decisions.
- The file contains sensitive or one-off context that should not be promoted broadly.

## Route if needed
- If the file is valuable but not yet discoverable, add a small trigger in `00_PULSE.md`.
- If the file is a reusable principle, convert it into a short note with hybrid frontmatter.
- If the file is a cleanup candidate only, leave it cold and reference it from memory summaries instead.

## Cold means deferred, not deleted
- Excluded cold notes remain on disk and are not trash.
- When a task is semantically related, search cold filenames, frontmatter, and body text before concluding that knowledge is missing.
- Read the matching cold note on demand, then promote only the reusable rule or route that improves future decisions.
- Promotion can happen later when repeated work proves the note is worth a hot trigger; cold status is reversible.

## Default decision
- Keep the hot path lean.
- Promote only the best reusable knowledge.
- Leave everything else cold unless a later task proves it deserves activation.

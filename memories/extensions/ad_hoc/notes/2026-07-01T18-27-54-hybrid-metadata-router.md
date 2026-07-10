---
name: hybrid-metadata-router
title: Hybrid Metadata Router
description: "Front-matter contract for knowledge docs and skills. Use this schema to help AI read a document faster by exposing what it is, what it contains, which names it answers to, and which related docs or skills should be loaded next."
aliases:
  - metadata router
  - yaml router
  - frontmatter router
  - project metadata
  - document router
triggers:
  - ai hybrid metadata router
  - ai metadata router
  - ai yaml frontmatter
  - ai project knowledge template
priority: high
version: 1.0
status: authoritative
contains:
  - name
  - title
  - description
  - aliases
  - triggers
  - priority
  - version
  - status
  - scope
  - applies_to
  - source_of_truth
  - parts
  - options
  - settings
  - urls
  - paths
  - functions
  - related_skills
  - related_docs
  - use_when
  - do_not_use_when
  - verification
use_when:
  - The document should be easy for AI to route and summarize.
  - The file needs a clear purpose, scope, and related references at the top.
  - A skill or knowledge file should advertise its important names, paths, or functions.
do_not_use_when:
  - The file is temporary scratch work with no long-term reuse value.
  - The document already has a project-specific format that must remain unchanged.
related_skills:
  - skills/project-handoff-doc-stack/SKILL.md
  - skills/claude-meta/validate-knowledge/skill.md
  - skills/claude-meta/SKILL.md
related_docs:
  - 00_PULSE.md
  - memories/2_governance/artifacts/skill_path_router.md
  - memories/extensions/ad_hoc/notes/2026-07-01T18-19-47-project-knowledge-template.md
  - memories/0_apex/templates/MASTER_ROUTER_BLUEPRINT.md
verification:
  - Check that the frontmatter names and triggers match the router entries.
  - Confirm that the note gives AI a single clear answer about what the document is for.
---

# Hybrid Metadata Router

Use this as the canonical header pattern for new `.md` knowledge docs and reusable skill notes.

The goal is to make each file self-describing at the top so AI can route faster:

- what the file is called
- what it is for
- which names it answers to
- which paths or functions it mentions
- which skills or docs it should pull next
- what should not be inferred from it

This is a router aid, not a replacement for the project truth docs.

For project handoff stacks, keep the root doc small and route-first, then attach the detailed docs underneath it.

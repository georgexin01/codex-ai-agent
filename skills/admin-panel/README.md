---
name: admin-panel-patterns
description: "Small, targeted Vben Admin / VXE Table pattern recipes — not a full build workflow. For the full CRUD build workflow, use skills/claude/README.md instead."
triggers: ["array fk count", "embedded list drawer", "vxe conditional blue link", "vxe table column class"]
version: 1.0
status: authoritative
date_updated: "2026-08-07"
last_audit: "2026-08-07"
---

# Admin Panel Patterns

Narrow, copy-paste-ready patterns for Vben Admin / VXE Table problems that come up mid-build. This is a pattern library, not an orchestrator — for the full module build workflow, start at [`../claude/README.md`](../claude/README.md) instead.

## Patterns

- [`array-fk-count/skill.md`](array-fk-count/skill.md) — client-side parallel-query count for an array-typed foreign key (when a native FK count doesn't work).
- [`embedded-list-drawer/skill.md`](embedded-list-drawer/skill.md) — embedding a list component inside a drawer (quizLaa-pattern match).
- [`vxe-conditional-blue-link/skill.md`](vxe-conditional-blue-link/skill.md) — VXE Table column with a dynamic `className` function for conditional blue-link styling.

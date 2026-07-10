---
name: starting-point-front-door
description: "Front door for new project bootstrap. Read this first, then open the full executor if the user is starting a new PHP website + Vben Admin + Docker Supabase project."
triggers: ["new project", "starting point", "bootstrap project", "start new project", "project setup", "ai starting point"]
phase: 0-bootstrap
requires: []
version: 1.2
status: authoritative
---

# Starting Point Front Door

## Read First

1. Read this file.
2. If this is a new project, open [`skill.md`](skill.md).
3. If the user only needs a specific phase, jump to the matching downstream skill.

## When To Use

- Use for brand-new PHP website + Vben Admin + Docker Supabase work.
- Use when the user gives a raw brief and needs project-root docs created.
- Use when you need to decide project shape before building anything.

## Main Paths

- [`skill.md`](skill.md) - full bootstrap executor
- [`../SHARED_DB_CONTRACT.md`](../SHARED_DB_CONTRACT.md) - schema, bucket, project ownership
- [`../claude/WORKING_PROGRESS.md`](../claude/WORKING_PROGRESS.md) - admin build path
- [`../claude-website/WORKING_PROGRESS.md`](../claude-website/WORKING_PROGRESS.md) - website build path
- [`../claude/create-module/skill.md`](../claude/create-module/skill.md) - CRUD module builder

## Rule Of Thumb

- Keep this file short.
- Do not duplicate the executor here.
- Use it as the routing layer, not the workflow layer.

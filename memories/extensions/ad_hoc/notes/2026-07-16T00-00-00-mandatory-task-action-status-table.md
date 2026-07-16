---
name: mandatory-task-action-status-table
description: "High-priority user response preference: show a compact task/action/status table for every non-sentinel request."
triggers: ["task action status", "status table", "completion table", "show the table"]
status: authoritative-extension
date_updated: "2026-07-16"
---

# Mandatory task/action/status table

For every non-sentinel task, mission, request, or multi-step answer, make a
compact Markdown table the primary result surface with exactly these columns:

| task | action | status |
|---|---|---|
| concise task name | concrete change, check, explanation, or blocker | `&#10003;`, `&#10007;`, or `&#9888;` |

Use evidence, not assumptions, for the status marker. The table may contain one
row for a simple request and numbered rows for numbered user instructions.
Keep short context below the table when needed. Do not use this table for the
exact `ai read .codex knowledge` boot sentinel, which must remain sentinel-only.

This rule supersedes the older `task | changes | complete` preference for
future responses.

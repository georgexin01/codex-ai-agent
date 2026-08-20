---
name: frontmatter-maintenance-protocol
description: "YAML-first metadata, reading, and ongoing frontmatter maintenance rules for Codex Markdown knowledge and skills."
triggers: ["ai yaml knowledge", "ai frontmatter audit", "ai metadata index", "frontmatter maintenance"]
phase: governance
version: 1.0
status: authoritative
read_before_write: true
last_audit: "2026-08-20"
related:
  - 00_PULSE.md
  - codex-router/Build-CodexFrontmatterIndex.ps1
  - codex-router/codex-frontmatter-index.json
  - memories/2_governance/KNOWLEDGE_COMPRESSION_PROTOCOL.md
---

# Frontmatter Maintenance Protocol

## Purpose

Use Markdown frontmatter as a fast catalog. It tells Codex what a file is for, when it applies, which phrases route to it, and whether it is current. Frontmatter is metadata, not a replacement for the document body.

## YAML-first reading contract

When the user invokes `ai read .codex knowledge`:

1. Read `00_PULSE.md` for the protected boot and safety contract.
2. Read or regenerate the compact `codex-router/codex-frontmatter-hot.json` route catalog. The scanner may inspect every entry on disk and write the full `codex-router/codex-frontmatter-index.json` catalog, but the boot context never loads the full catalog.
3. Use `name`, `description`, `triggers`, `aliases`, `contains`, `phase`, `status`, `date_updated`, and `related` to select the smallest relevant route.
4. Read full Markdown bodies only for the selected route, current project truth, and the few notes needed to answer the task.
5. Keep distilled facts, contracts, decisions, and next actions in the active context; do not persist every document or transcript as memory.

The exact trigger still returns only `[🟢] Agent is Ready..`. The metadata scan is internal preparation and does not expose a long boot report.

## Canonical fields

New or intentionally edited eligible Markdown should keep these fields at the top:

`name`, `description`, `triggers`, `aliases`, `contains`, `phase`, `version`, `status`, `date_updated`, `related`.

Use `evidence_scope` when the file contains frequency, historical, or project-derived claims. Keep triggers deliberate; broad nouns belong in `contains` and must not auto-invoke a workflow.

## Ongoing update rule

Whenever Codex intentionally creates or modifies an eligible `.md` file:

1. Read its current frontmatter before editing.
2. Preserve existing identifiers, contracts, routes, examples, and exceptions.
3. Update `date_updated` and revise `description`, triggers, aliases, contains, status, or related paths when the document’s purpose or routing changed.
4. Run `codex-router/Build-CodexFrontmatterIndex.ps1 -WriteIndex` after the edit.
5. Run route and knowledge validation before reporting completion.

Do not automatically add or rewrite frontmatter in `00_PULSE.md`, `AGENTS.md`, protected boot contracts, historical detail files, generated/runtime files, or any `/skills/` Markdown. Skills are indexed and read, but their Markdown remains skill-owned.

## State meanings

| State | Meaning | Action |
|---|---|---|
| `valid` | Top YAML exists and closes correctly | Route normally |
| `missing` | Legacy file has no top YAML | Read by path/heading; add metadata only when intentionally edited and eligible |
| `unclosed` | YAML starts but has no closing marker | Report and repair only with explicit maintenance scope |
| `protected` | Root/boot contract or other protected file | Index and read; do not mass-rewrite |
| `skill-read-only` | Under `/skills/` | Index and read; never modify through this maintenance protocol |
| `cold-history` | Archive, rollout, raw, or detail companion | Keep deferred; read only when a task explicitly needs historical evidence |

## Memory boundary

The index stores metadata, file integrity, and frontmatter state—not full Markdown bodies. Persistent memory should contain only durable user rules, verified contracts, important failures, project truth, and the smallest continuation state needed for future work.

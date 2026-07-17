---
name: knowledge-compression-protocol
description: "Automatic lossless compression and routing protocol for oversized non-skill Markdown knowledge files."
triggers: ["ai knowledge compression", "ai compress knowledge", "large knowledge markdown", "knowledge size audit"]
phase: governance
model_hint: medium
model_profile: luna-5.6-medium
version: 1.0
status: authoritative
read_before_write: true
last_audit: "2026-07-17"
---

# Knowledge Compression Protocol

## Mandatory authoring notice

Before creating or editing any `.codex` knowledge, rule, principle, router document, or memory Markdown, AI MUST read this protocol and the current target file. Write knowledge to be **less but accurate**: remove repetition and process filler, but retain every fact, contract, trigger, path, identifier, exception, example outcome, and verification requirement needed for correct future decisions.

Authoring targets:

- Prefer routine knowledge files below **20 KB / 5,000 estimated tokens** when the subject can remain complete.
- Treat **20 KB / 5,000 tokens** as a review signal, not an automatic rewrite command.
- Automatically split or compress only above **35 KB / 8,000 estimated tokens**.
- Use a compact index plus complete detail companion when one file needs both fast routing and deep history.
- Never shorten unique knowledge merely to meet a number, and never modify Markdown under `/skills/` through this protocol.

## Absolute rule

For eligible `.md` files under `C:/Users/user/.codex`, automatically start this protocol when either automatic threshold is exceeded:

- file size is greater than **35 KB** (`35,840` bytes), or
- estimated load is greater than **8,000 tokens**, calculated as `ceil(character_count / 4)`.

The lower **20 KB / 5,000-token** level remains a review signal only; it does not force compression.

Use `codex-router/Find-LargeKnowledge.ps1` as the detector. It is read-only and must run before any compression edit.

All paths containing `/skills/` or `\skills\` are permanently excluded. Never modify, split, compress, move, rename, or delete any Markdown file inside a skills folder under this rule.

## Eligible scope

Apply to knowledge, rules, principles, router documentation, and root guidance Markdown. Do not automatically rewrite session history, rollout summaries, archives, runtime logs, generated indexes, preserved detail companions, protected boot contracts, or secrets. Report those as cold/protected/excluded when detected.

## Required lossless workflow

1. Inspect the current file, all headings, all route references, and all callers before editing.
2. Classify the file as hot index, active rule, reusable reference, or cold history.
3. Prefer a two-layer split: keep a compact searchable/index file at the routed path and preserve the complete original in a cold companion such as `*_DETAILS.md`.
4. Preserve every contract, trigger, path, URL, schema name, identifier, exception, example outcome, and historical decision in the companion or a clearly rerouted detail file.
5. Shorten repeated prose only after its meaning is represented by a compact rule, keyword set, or explicit pointer to preserved details.
6. Search every `.md`, `.yaml`, `.json`, `.ps1`, and router/index file for the old path and patch active references to the new target.
7. Regenerate routing/manifests, then verify old-path references, target existence, trigger conflicts, and route reachability.
8. Run `codex-router/Verify-KnowledgeCompression.ps1` for the pair, then read back both layers and compare headings, anchors, keywords, and preserved-content counts before reporting completion.

## No-op and safety gates

- If the file already has a compact index plus a complete cold companion, do not repeatedly rewrite it.
- `00_PULSE.md` and `AGENTS.md` may be detected, but are protected hot contracts: report them and never self-rewrite them automatically.
- Never delete historical content merely to reduce tokens. Archive or preserve it first.
- If a route, contract, or preservation check fails, stop and report `INSUFFICIENT DATA` or the exact blocker.
- A large skill Markdown file is always a skip under this protocol, even if it exceeds both thresholds.

## Completion report

Report: original path, final path(s), before/after bytes, before/after estimated tokens, preserved-content evidence, changed routes, excluded skill files, and validator/benchmark results.

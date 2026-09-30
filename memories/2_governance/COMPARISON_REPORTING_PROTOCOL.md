---
name: comparison-reporting-protocol
description: "Automatic one-table before-and-after reporting for substantial .codex maintenance and staged updates."
triggers: ["automatic comparison", "automatic before after", "comparison report", "update comparison", "show before and after"]
phase: governance
model_hint: medium
model_profile: gpt-6-luna-high
version: 1.0
status: authoritative
read_before_write: true
last_audit: "2026-08-20"
related:
  - 00_PULSE.md
  - memories/2_governance/DRIFT_GUARD_PROTOCOL.md
  - memories/extensions/ad_hoc/notes/2026-07-16T00-30-00-detailed-chat-table-metrics.md
---

# Comparison Reporting Protocol

## Purpose

After a substantial `.codex` update, automatically show one concise comparison table so the user can see what changed and what evidence supports it. This is a reporting rule, not permission to expand scope or to create extra work.

The normal response still begins with the required `task | action | status` table. This protocol adds **at most one** comparison table when its threshold is met. Never emit several comparison tables for the same update.

## Automatic display thresholds

Show one comparison table after verification when any one of these conditions is true:

- the update changes **5 or more** meaningful files;
- the measured text delta is **25 KB or more**;
- a protected or routing surface changes: `00_PULSE.md`, a canonical router, governance protocol, frontmatter/manifest index, or route configuration;
- a trigger, route, skill relation, knowledge relation, or validation rule changes;
- the work reaches a meaningful phase boundary (`PLAN -> ACT`, `ACT -> VERIFY`, or final handoff) after a substantial batch;
- the user asks for comparison, before/after, optimization, improvement, performance, or a progress summary.

For staged maintenance, count meaningful update units and show the table at the **third or fourth** unit, whichever is the natural phase boundary, and again at final handoff only if the final state materially differs. Do not show duplicate tables for an unchanged checkpoint.

Meaningful units are file additions/removals, behavior or route changes, validated cleanup, a completed project lane, or a measured verification result. Ignore lock files, unchanged generated noise, and read-only inspection as update units.

## Table selection

Use the single table that best represents the work. Keep rows to the changed areas only.

| work type | suitable rows | evidence examples |
|---|---|---|
| `.codex` routing or knowledge | files, bytes/tokens, routes, conflicts, missing targets, validator, benchmark | route audit, knowledge validator, benchmark output |
| project implementation | behavior, files, tests/build, route/API/schema contract, risk | current files, test/build output, HTTP/browser check |
| cleanup or migration | item count, active references, retained/deleted state, validation | reference scan, route check, preservation check |
| performance or optimization | load size, estimated tokens, measured speed, quality rating | telemetry, benchmark, verified response behavior |
| UI or localhost work | route/state, viewport, visual result, asset contract, runtime status | browser screenshot/check, HTTP status, build output |

The table should normally use these columns:

`area | before | after | delta | improvement % | evidence/status`

Use `N/A` when there is no trustworthy baseline or the value is not numeric. Calculate improvement only from measured comparable values; never invent a baseline, speed, token count, rating, or success claim.

## Detailed metrics rule

When the user explicitly requests detailed metrics, optimization numbers, or ratings, include the applicable values in the same single comparison table: improvement percentage, rating out of 10, estimated token cost, speed and speed increase percentage, intelligence/context quality out of 10, and AI chat-flow/reply quality out of 10. Label every estimate as `estimated`; label live measurements with their source.

For an automatic maintenance checkpoint, do not add irrelevant metric columns merely to make the table wider. Prefer the smallest evidence-backed set of rows and columns that explains the update.

## Baseline and evidence handling

1. Capture the before state from the current file, prior verified checkpoint, or recorded benchmark before applying the batch.
2. Apply and verify the update.
3. Compare like with like: the same scope, metric definition, and command where possible.
4. If no baseline exists, write `baseline unavailable` or `N/A`; do not infer improvement from file counts alone.
5. Put blockers and intentionally unchanged protected files in the short text below the table rather than creating a second table.

The one comparison table is a compact handoff surface, not a replacement for raw verification. Keep the underlying command output available in the work log and report the nearest check used.

## Handoff wording

After the table, state briefly:

- what changed;
- what was verified;
- what remains blocked;
- what was intentionally not changed;
- the next safest action.

For small edits below every threshold, keep the answer concise and omit the automatic comparison table unless the user explicitly asks for it.

---
name: fast-batch-checkpoint
description: Preserve a compact, loss-aware continuation state for a long or context-heavy task, especially when the user asks to resume old work or batch progress.
argument-hint: "[task or project]"
user-invocable: false
allowed-tools:
  - Read
  - Grep
  - Bash
---

# Fast Batch Checkpoint

## When to use

Use when work is long, context is becoming repetitive, a task is interrupted, or the user asks to summarize old requests and continue efficiently. Do not use to compress away active requirements, safety boundaries, or unverified work.

## Inputs to gather

1. Read the current task request, relevant status/progress file, changed-file list, and the last verification output.
2. Identify exact constraints, paths, IDs, URLs, contracts, errors, decisions, and acceptance criteria that must survive compression.
3. Classify each item as `DONE`, `ACTIVE`, `NEXT`, `BLOCKED`, `DEFERRED`, or `OBSOLETE`.

## Procedure

1. Write a `FAST BATCH STATE` with the objective, confirmed evidence, changed files, unresolved items, and the smallest verified next action.
2. Mark work `DONE` only after its verification gate; a running process, plan, or unverified edit is `ACTIVE`.
3. Batch only independent read-only checks. Keep dependent edits, authentication, secrets, database changes, destructive operations, and ambiguous decisions ordered and explicit.
4. Refresh the checkpoint after each coherent verified batch and resume from `NEXT` without rereading unrelated history.
5. For VIPBillion local-Docker news imports, use the existing importer and `news.md` schema; preserve additive phases `10, 40, 50, 50, 50`, old rows, aligned-language/company-name checks, proportional image dimensions, and one `/news` localhost smoke check. [ad-hoc note]

## Efficiency plan

1. Preserve exact high-risk facts verbatim; compress only repetitive discussion.
2. Cache the current file list and verification evidence in the state.
3. Stop broad rescans when the source/schema is unchanged and the batch gate passes.

## Pitfalls and fixes

- Symptom: a checkpoint claims progress but no test/read-back proves it. Fix: downgrade to `ACTIVE` and record the required verification.
- Symptom: a large patch fails on encoded Markdown. Fix: anchor a smaller patch around stable nearby text.
- Symptom: batch speed causes an unsafe change. Fix: separate the state-changing or ambiguous action from read-only checks and request/retain the required authorization.

## Verification checklist

1. Exact user constraints and acceptance criteria are present.
2. Every `DONE` item has concrete verification evidence.
3. `NEXT` is a smallest actionable step, not a broad rediscovery request.
4. No secrets are stored in the checkpoint.

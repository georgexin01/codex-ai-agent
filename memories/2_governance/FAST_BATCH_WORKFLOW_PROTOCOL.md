---
name: fast-batch-workflow-protocol
description: "Loss-aware checkpoint and batch execution protocol for long, repetitive, or context-heavy Codex tasks."
triggers: ["ai fast batch workflow", "ai batch context", "ai task checkpoint", "long task checkpoint"]
phase: governance
model_hint: medium
model_profile: luna-5.6-medium
version: 1.0
status: authoritative
read_before_write: true
last_audit: "2026-08-12"
---

# Fast Batch Workflow Protocol

## Purpose

Use this protocol to shorten long-running work while preserving the information needed for an accurate continuation. It applies when a request combines many related older requests, the working context is becoming repetitive or oversized, or the task has stayed in progress across several tool cycles.

## Checkpoint rule

Before continuing a long task, and again after each coherent batch, create a compact state from the available conversation and current project evidence. Do not reconstruct inaccessible history and do not invent completion, decisions, files, rows, credentials, or test results.

Keep these facts verbatim whenever present:

- current user objective, acceptance criteria, and safety boundaries;
- exact paths, symbols, public contracts, schema names, IDs, URLs, values, and error text;
- decisions, exceptions, unresolved questions, and explicit user instructions;
- changed files and the evidence used to verify them.

Compress repeated explanation, stale narration, and already-proven background. If older requests conflict, the newest explicit user instruction wins; otherwise mark the conflict instead of silently merging it. Classify older requests as `DONE`, `ACTIVE`, `NEXT`, `BLOCKED`, `DEFERRED`, or `OBSOLETE`.

## Batch execution

1. Route once and load only the files needed for the current batch.
2. Group independent read-only inspections and checks into one batch where safe.
3. Keep dependent edits and state-changing operations ordered and explicit.
4. Verify each batch at its nearest useful gate before starting the next one.
5. Update the checkpoint after the gate, not from a process merely being started.
6. Resume from the checkpoint instead of rereading unrelated old tasks or repeating completed scans.

Never batch destructive actions, authentication, secrets, database changes, or ambiguous decisions merely for speed. Local Docker/Supabase and live data retain their existing protection rules.

## Fast batch state format

Use this compact handoff internally or in a progress update:

```text
FAST BATCH STATE
Goal: <one sentence>
Scope: <included work; excluded work>
Preserved constraints: <exact contracts, paths, values, safety rules>
DONE + verified: <completed items and evidence>
ACTIVE: <current item and exact position>
NEXT: <smallest next actions in order>
BLOCKED / decisions: <blocker, owner, or missing evidence>
DEFERRED / not changed: <intentionally untouched work>
Changed files: <paths>
Verification: <checks and results>
Uncertainty: <INSUFFICIENT DATA items, if any>
```

## Completion boundary

Do not report a long task as complete because a command is running or a plan exists. Report completion only after the requested scope has a current evidence check. If work must pause, leave the state with the exact next action, blocker, and verification gate so the next turn can continue quickly.

Do not store secrets, tokens, cookies, session data, or private authenticated response bodies in a checkpoint. Record only their presence or configuration shape when needed.


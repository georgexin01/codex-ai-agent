---
name: module-audit-protocol
description: "Sovereign Module Audit Protocol (V2.1) — relation-check and CRUD-integrity QA for module create/edit/delete work."
triggers: ["audit", "crud integrity", "module audit"]
version: 2.1
status: authoritative
date_updated: "2026-08-07"
last_audit: "2026-08-07"
---

# Sovereign Module Audit Protocol (V2.1)

Run this check at the end of any interaction involving module Create, Edit, Update, Delete, Error Check, or Testing. Report results as plain text — no mandatory decorative dashboard or emoji table (see `00_PULSE.md` §0.3 / `GROUND_KERNEL.md` on decoration-free output).

## Phase 1: Relation Check (Referral: 5. has relation)
Whenever a module is updated or created, proactively scan for existing relations using this detection logic:

### 1.1 Detection Intelligence
- **Strong Signal**: a table (e.g. `agent_review`) contains a column ending in `Id` (e.g. `agentId`) where the prefix matches a partial or single word from a parent table name (e.g. `agent_list`).
- **Ambiguous Signal**: the `Id` prefix (e.g. `report`) only vaguely matches a table name or exists in a non-standard module (e.g. `report_list`).

### 1.2 The Handshake Rule (MUST ASK)
- **Automatic**: if the relation is a clear-cut 1:N (e.g. Agents -> Reviews), proceed with the standard injection.
- **Handshake**: if the relation is ambiguous (e.g. Reports -> Agents), ask the user: *"I detected an agentId in report_list. Should I add the LayerIcon and relationship modules?"*
- **No unilateral change**: never add relationship drawers or icons for ambiguous cases without explicit go-ahead from the user — cleaning up redundant modules is difficult.

## Phase 2: CRUD Integrity Audit (Referral: 6. create + 7. edit)
Audit the "popup modules" (drawers) to prevent technical debt.

### 2.1 Audit: 6. Create Tables (Left-Side Popup)
- Verify the `submit` logic and Supabase integration.
- Ensure the list refreshes on success.

### 2.2 Audit: 7. Edit Tables (Right-Side Popup)
- Verify the "input is empty" bug is NOT present.
- Ensure `getDetailApi` and `idKey` are correctly synced in `useEditDrawer`.

## Phase 3: Completion Checklist
State pass/fail plainly (no emoji, no mandatory GUI table) for each applicable node: Create module (left-drawer integrity), Edit module (right-drawer hydration), CRUD registry (lifecycle verification), relation wiring (if any), i18n namespace, workflow bridge (if E2E-registered), and Malaysian seed-data conventions. Mark N/A with a one-line reason for anything not applicable to the current module.

## Phase 4: The Failure-Correction Loop
When a user reports a failure or a bug (e.g. "Edit form is empty" or "Submission failed"):

1. **Code-level audit**: inspect the store, forms, and views. Identify the structural mismatch.
2. **Surgical repair**: apply the fix while preserving the module's density conventions (no stray Card padding, correct `idKey`/`api` bindings).
3. **Proof of fix**: state plainly which specific node from the Phase 3 checklist now passes.

## Pattern: The Clean Module Standard
A module is considered "Clean" only if it meets these criteria:
- **RAW Density**: VXE tables have `border: true` and no surrounding Cards/padding.
- **Universal CRUD**: all 4 actions (Create, Read, Update, Delete) are functional.
- **Malaysian Context**: mock data and seed logic follow the Malaysian high-fidelity specs.

## Comparison / audit tables

For any "before/after" or comparison table this protocol's Phase 3/4 output feeds into, use the single canonical spec in `00_PULSE.md` §7 — do not restate the column list here.

---
**Status**: Authoritative | **Last Update**: 2026-08-07**

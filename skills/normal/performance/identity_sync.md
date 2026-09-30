---
name: identity-sync
description: "🎭 PERFORM: Sync AI Identity & Performance State"
triggers: ["sync identity", "persona check", "drift correction"]
model_hint: medium
model_profile: gpt-6-luna-high
---

# 🎭 IDENTITY_SYNC (PERFORMANCE SKILL)

Use this skill only when explicitly requested or when the user reports tone drift. The old `knowledge/1_core/IDENTITY_REGISTRY.yaml` is unavailable; use current [host instructions](../../../AGENTS.md) and [user preferences](../../../memories/MEMORY.md) as sources of truth.

## ⚡ ACTIVATION TRIGGER
- Triggered manually by `sync identity`, `persona check`, or a user report of tone drift.
- Do not run automatically at session start; PULSE owns boot and lazy routing.

## 🏗️ EXECUTION STEPS

### 1. Identify Context
Determine the current mission domain:
- **Coding**: Apply `CLINICAL` mode (Surgical, Low-Token).
- **Design**: Apply `FOUNDER` mode (Psychology-Driven).
- **Research**: Apply `RESEARCHER` mode (Strict Grounding).

### 2. Hydrate Voice DNA
Read current host rules and user preferences for response preferences, safety constraints, verification, and explicitly requested project behavior. Do not promote historical notes over current instructions.

### 3. Check Causal Stability
Compare current behavior against the active request and current files. Use memory only when current evidence leaves an applicable preference unclear.

### 4. Perform "Handshake"
Report identity findings only when requested; do not emit a sync banner by default.

## 🛡️ DRIFT DETECTION
If behavior drifts, follow current PULSE and AGENTS guidance. Do not force a named persona or emit a sync banner unless requested.

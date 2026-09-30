---
name: claude-meta
description: "Sovereign Meta-Orchestrator. Enforces the Plan → Execute → Validate loop for any non-trivial change. Mandatory handshake before touching Tier-0/1 assets."
triggers: ["claude-meta", "meta", "planning", "plan-first", "plan stop approve", "handshake", "validate knowledge", "audit", "post-mortem", "before code", "agentic loop"]
phase: 0-orchestrator
requires: []
unlocks: [plan-first, validate-knowledge]
inputs: [user_intent, target_tier, scope]
output_format: structured_plan_then_execute_then_audit
model_hint: medium
model_profile: gpt-6-luna-high
version: 2.1
status: authoritative
date_created: "2026-04-16"
date_updated: "2026-04-24"
---

# `claude-meta` — Sovereign Meta-Orchestrator (V2.1)

**Plan → Execute → Validate**. Wraps every non-trivial Sovereign action. Aligns with [GROUND_KERNEL.md](../../memories/0_apex/GROUND_KERNEL.md) Principle 9 and [KARPATHY_OPERATIONAL_STANDARD.md](../../memories/0_apex/GROUND_KERNEL.md).

---

## ⚖️ WHEN TO INVOKE

Mandatory if ANY:
- Touching ≥2 files in one change
- Touching Tier-0 (Apex / ATLAS / Claude skills) or Tier-1 (`1_core/`, `2_governance/`)
- Schema / RLS / auth-flow change
- New module / route / entity

Skip if: single-file Tier-2/3 edit ≤ 20 lines — use the surgical task and safety rules in [AGENTS.md](../../AGENTS.md).

---

## 🚀 THE 3-PHASE LOOP

### Phase 1 — PLAN
Invoke **[plan-first/skill.md](./plan-first/skill.md)** when planning materially reduces risk. Capture intent, success criteria, skill chain, verification, rollback, and affected files in the current conversation or an existing project plan path when requested.

### Phase 2 — Authorization Check
Use the user's existing authorization for the requested scope. Pause only when a meaningful decision is missing or current host safety rules require approval:

| Scope | Action |
|---|---|
| Tier 0/1 guidance | Plan and execute the clearly authorized change; follow host protections and preserve originals. |
| Other knowledge/skills | Make the smallest scoped change and verify it. |
| Project source | Follow the active project's instructions and current host safety gates. |

User authorization persists across turns unless the user revokes it or the task scope changes. Follow the current host rules in [AGENTS.md](../../AGENTS.md).

### Phase 3 — EXECUTE (medium)
Per skill-chain step:
1. **ACT** — surgical change on named lines only
2. **MICRO-VERIFY** — run the plan's checkpoint command
3. **OBSERVE** — print PASS/FAIL with actual exit code
4. On FAIL → **STOP**, offer rollback, re-enter Phase 1

### Phase 4 — VALIDATE (medium)
Invoke **[validate-knowledge/skill.md](./validate-knowledge/skill.md)**. Runs: frontmatter check · path-ref integrity · cross-ref resolution · secret scanner · screenshot hygiene ([SCREENSHOT_HYGIENE.md](../../memories/2_governance/SCREENSHOT_HYGIENE.md)). `>20` violations → HALT + escalate as Critical Drift.

---

## PLAN TEMPLATE

```markdown
[🔪 APEX PLAN] | [⚡ MODE: {recipe}] | [🎯 TIER: {0|1|2|3}]

## INTENT
{one sentence}

## FILES & TIERS
| File | Tier | Action |

## MICRO-VERIFICATION
- [ ] `{command}` → expect {state}

## ROLLBACK
- {undo per failure point}

[⚡ STATUS: READY TO EXECUTE WITHIN USER AUTHORIZATION]
```

---

## 🔁 SCP MANDATE

Every Phase-1 plan comparing ≥2 paths MUST include the [SCP](../../memories/2_governance/MODULE_AUDIT_PROTOCOL.md) table:

| Option | Token Spend | Token Cost | Speed Time | Speed % | Rating /10 |

Pick highest Rating, justify in one sentence, proceed.

---

## 🛡️ GUARDRAILS

- **Zero speculation** — solve only the immediate goal
- **Surgicality** — touch only files the plan named; adding files mid-execute → STOP, re-plan
- **Reality-bound** — PASS/FAIL must be a real exit code, not a vibe
- **No silent escalation** — if a new protected or destructive boundary surfaces, stop and follow the current host approval rule
- **Lossless re-entry** — keep the plan and step pointer in the current conversation or an existing project-owned plan file when persistence is needed.

---

## 🔗 RELATED

[plan-first](./plan-first/skill.md) · [validate-knowledge](./validate-knowledge/skill.md) · [AGENTS.md](../../AGENTS.md) · [GROUND_KERNEL](../../memories/0_apex/GROUND_KERNEL.md) · [SCREENSHOT_HYGIENE](../../memories/2_governance/SCREENSHOT_HYGIENE.md)

---
**V2.1 trimmed 2026-04-24** — removed verbose HUD examples and redundant prose; protocol logic intact.

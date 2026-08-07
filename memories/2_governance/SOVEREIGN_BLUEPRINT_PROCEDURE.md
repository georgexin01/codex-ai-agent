---
name: sovereign-blueprint-procedure
tier: 2
priority: HIGH
scope: ["planning", "architecture", "simulation", "start"]
version: 3.1
date_updated: "2026-08-07"
last_audit: "2026-08-07"
---

# 🧭 蓝图预飞规划程序 (BLUEPRINT PRE-FLIGHT PLANNING PROCEDURE V3.1)

> **Scope note (2026-08-07)**: this file owns the pre-flight **planning methodology** (simulation gate, deep-dive study flow, guided questioning) that produces a blueprint's content. It is a companion to — not a newer version of — `memories/0_apex/SOVEREIGN_BLUEPRINT_PROTOCOL.md`, which owns the BLUEPRINT/DESIGN file lifecycle mechanics. The version number here (V3.1) is this file's own history; it does not supersede the V2.0 protocol file.

## ⚖️ 0. CORE DIRECTIVE
AI MUST generate an `APP_BLUEPRINT.md` before any project starts. V3.0 adds the **Simulation Gate**.

## 🚀 1. PRE-FLIGHT SIMULATION (NEW)
BEFORE generating the blueprint, AI MUST run a "Mental Sandbox" to predict:
1.  **Logical Conflicts**: (e.g., "Will this auth flow work with the requested offline mode?")
2.  **Edge-Case Failures**: (e.g., "This design will break on a 320px screen.")
3.  **Performance Bottlenecks**: (e.g., "50 image loads here will cause lag.")
*   **Result**: The findings MUST be documented in a `## 🧪 SIMULATION_LOG` section within the blueprint.

## 🏗️ 2. BLUEPRINT EVOLUTION (V3.0)
The blueprint is now a **Live DNA Document**.
- **Handshake Mandate**: Any change to the project must be "Legislated" in the blueprint first before "Executed" in the code.
- **Purity Audit**: Every blueprint section must be checked against **GROUND_KERNEL.md**.

## 🌊 3. THE DEEP DIVE STUDY FLOW (V3.1)
For complex transitions or new projects referencing legacy code:
1.  **Phase 1: Environment Scan**: Map the root folder and identify "Reference Folders" (e.g. `website-LAA-official`).
2.  **Phase 2: Logic Extraction**: Read `router.php`, `index.php`, and `lib/` to understand the architectural pulse.
3.  **Phase 3: Domain Benchmarking**: Study reference sites (e.g. Carlist, Carsome) to extract domain-specific requirements (Filters, User Flow).
4.  **Phase 4: DNA Synthesis**: Clone `MASTER_BLUEPRINT.md` and customize it with the findings from Phase 1-3.
5.  **Phase 5: Knowledge Archiving**: Save the project-specific patterns back to the global `memories/` base if they are reusable.

## 🤖 4. GUIDED QUESTIONING 2.0
AI MUST ask the "Deep 4" questions:
- **Architecture**: Monolithic or Modular?
- **State**: Client-side or Supabase-heavy? (If No DB: Use PHP Variable Arrays).
- **Visuals**: Which **[Aesthetic Spells]** are active?
- **Security**: AOE-Tier requirements?

---
**Blueprint Pre-Flight Planning Procedure V3.1 — Master Architect Active // 2026-05-03, scope-clarified 2026-08-07**

---
name: gpt-5-6-luna-operating-playbook
description: "General GPT-5.6 Luna operating rules for high-context, tool-using, cache-aware Codex work."
triggers: ["__auto_after_codex_boot__", "__luna_context__"]
activation: task_state_deep
read_mode: deep_only
keep_awake: same_lane
unload_when: lane_change
priority: warm
canonical_for: [model_optimization, knowledge_review, routing_validation]
status: authoritative
phase: execution
model_hint: medium
model_profile: luna-5.6-medium
version: 1.0
date_updated: "2026-07-10"
source:
  - "https://docsbot.ai/models/compare/gpt-5-6-luna/gpt-5-4-mini"
related_docs:
  - memories/2_governance/MODEL_COST_OPTIMIZATION_POLICY.md
  - memories/extensions/ad_hoc/notes/2026-07-10-luna-5-6-vue-vben-execution-profile.md
  - skills/claude-meta/validate-knowledge/skill.md
---

# GPT-5.6 Luna operating playbook

This is the general Luna layer for deep model-optimization, knowledge review, routing validation, and explicit `.codex` improvement work. Project-specific files, current source, tests, and explicit user instructions remain higher-signal than this note.

Knowledge labels used in this file:

- `RULE`: an operational behavior to follow.
- `PREFERENCE`: a user or project taste/default that may be overridden by current project truth.
- `EVIDENCE`: a historical or external observation that must not become an absolute rule without verification.

`EVIDENCE:` The linked DocsBot comparison reports a 400K context window, 128K maximum output, predictable prompt caching across the GPT-5.6 family, a fast/affordable high-volume tier, and 82.5% on Terminal-Bench 2.1 under its listed settings. Treat provider-facing model facts and benchmark numbers as article-reported until verified against current official OpenAI documentation; use them to shape workflow, not to bypass evidence.

## Top 10 advantages to operationalize

1. **RULE — Large context is a retrieval advantage, not permission to dump the tree.** Load the smallest relevant route first, then expand in bounded batches. Use the larger window for connected evidence, not repeated or unrelated files.
2. **RULE — Long output is an artifact budget.** Use normal concise replies; reserve large completions for complete source files, migrations, generated docs, or test artifacts that genuinely need them.
3. **RULE — Fast, affordable throughput favors Lean Lane by default.** Finish routine work with narrow reads, short updates, and one nearest verification target before escalating.
4. **RULE — Prompt-cache stability is a design constraint.** Keep durable instructions and stable route prefixes unchanged; place volatile task details after them. Avoid needless edits to hot boot files.
5. **RULE — Tool use should be an inspect-act-verify loop.** For coding tasks, gather current file evidence, make the smallest patch, read it back, and run the nearest useful check.
6. **Use parallelism for independent evidence.** Batch unrelated file reads, searches, and checks together; keep dependent operations sequential so the evidence chain stays clear.
7. **Spend deeper reasoning on ambiguity and risk.** Start with low-cost hypotheses and escalate only for unknown root causes, architecture, security, governance, or failed verification.
8. **Exploit terminal strength through executable acceptance criteria.** Prefer `rg`, focused scripts, type checks, builds, smoke requests, and browser checks over prose claims that code is correct.
9. **Keep model uncertainty visible.** A comparison page may contain stale, incomplete, or vendor-generated data; label article-derived claims, verify unstable facts, and never invent missing capabilities, prices, or access entitlements.
10. **Measure the workflow, not only the model.** For repeated routes, track prompt/completion tokens when available, cache reuse, wall-clock time, route correctness, verification result, and whether the extra context changed the outcome.

## Default Luna execution contract

`HYDRATE route -> GROUND current evidence -> PLAN smallest change -> ACT -> VERIFY -> REPORT outcome plus verification.`

- Keep the user’s fixed constraints and exact error text verbatim.
- Keep one matching skill family awake while the task remains in the same lane.
- Prefer one source of truth and one verification target per task.
- Do not confuse a large context window with permission to read secrets, sessions, unrelated history, or the full `.codex` tree.
- If three fixes fail on the same issue, stop repeating the same tactic and switch to a deeper audit.

## Activation

This note is not a user-facing trigger. PULSE supplies the compact Luna digest during boot. Load this full playbook only when the task enters deep model-optimization, knowledge-review, routing-validation, or explicit `.codex` improvement work. Keep it awake while that deep lane remains active; unload it when the lane changes.

Task-specific routes still take precedence when a project or skill requires deeper instructions, such as the separate Vue/Vben Luna profile.

## What this changes in `.codex`

- General Luna behavior lives here instead of bloating `00_PULSE.md`.
- `ai luna 5.6` remains the only user-facing Luna-specific route, for Vue/Vben work.
- The cost policy uses Luna as the active baseline while retaining portable Lean/Balanced/Deep lanes.
- Existing project-specific skills remain authoritative for their own workflows.

---
name: ai-growth
description: Maintain and improve Codex knowledge, skills, routing, and recurring workflows through current-source research, evidence-based proposals, safe promotion, and regression checks. Use when the user asks to improve Luna behavior, keep AI guidance current, audit knowledge or skills, or design an ongoing AI maintenance loop.
---

# AI Growth Skill

Improve Codex as a maintained system, not as an uncontrolled self-rewriting agent.

## Core operating rule

Separate four stages:

1. **Acquire:** fetch current information from official product documentation or an explicitly trusted source.
2. **Interpret:** compare the source with the current local rule, skill, route, or memory and state uncertainty.
3. **Propose:** write a small change plan or reviewable patch with evidence and expected impact.
4. **Promote:** apply only the approved, scoped change, then run route, syntax, behavior, and regression checks.

Research may be automatic; promotion must remain reviewable whenever it changes durable rules, permissions, routing, model defaults, external actions, or user data.

## Source and routing policy

- For current Codex, OpenAI, model, API, skill, configuration, or automation behavior, use official OpenAI documentation first and open the source page before relying on it.
- Treat local files as authoritative for local behavior and contracts. Treat memory as historical context, not as proof of current product behavior.
- Read the narrowest matching route and front door first. Do not load the entire knowledge tree.
- Keep durable rules in `AGENTS.md` or governance files, reusable methods in skills, current external facts in references or a dated research note, and one-off instructions in the active prompt.
- Never place secrets, tokens, cookies, private response bodies, or unverified claims into knowledge or skills.

## Growth loop

For each improvement cycle:

1. Identify the repeated friction, requested capability, or product change.
2. Record the target file, current behavior, evidence source, and acceptance test.
3. Search and open current official documentation when the fact may have changed.
4. Prefer a small additive reference or focused skill edit over a broad rewrite.
5. Validate frontmatter and references; run the nearest executable dry-run or regression check.
6. Record what changed, what was verified, what remains uncertain, and when the evidence should be refreshed.

Promote a durable rule only when it is supported by current evidence, repeated user value, or a verified failure. Do not turn one accidental output or one speculative article into a universal rule.

## Codex surfaces to use deliberately

- Use `AGENTS.md` for stable repository behavior, commands, contracts, and done criteria.
- Use a skill for a repeatable method with clear triggers, inputs, outputs, and boundaries.
- Use MCP when the needed context changes frequently or lives outside the repository.
- Use scheduled tasks for cadence after the workflow is reliable manually; the skill defines the method and the scheduled task defines the schedule.
- The weekly read-only task specification is `tasks/weekly-official-openai-docs-research.md`.
- Use hooks for mechanical checks that should not depend on model memory.
- Use worktrees for recurring or potentially conflicting maintenance changes.
- Use `/compact`, `/fork`, and focused chats to keep long-running work scoped and reviewable.

## Safe automation defaults

- **Automatic research:** allowed for read-only source collection and a concise dated proposal.
- **Automatic validation:** allowed for local, non-destructive checks.
- **Automatic promotion:** limited to explicitly authorized, low-risk additive updates; otherwise stop at a reviewable diff.
- **Automatic external mutation:** never infer permission. Ask for explicit scope before sending messages, changing live systems, installing plugins, or altering production data.
- **Automatic self-edit during generation:** prohibited. A skill may use its update policy for the next run, but it must not change its own active instructions halfway through the current run.

## Output contract

Every growth report should state:

- the observed problem or opportunity;
- the official or local evidence used;
- the proposed or applied change;
- the regression and route checks performed;
- the remaining uncertainty and refresh date;
- the safest next action.

For the detailed scoring rubric and maintenance template, read `references/growth-loop.md`.

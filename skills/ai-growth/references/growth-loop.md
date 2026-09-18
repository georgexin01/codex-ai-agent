# Codex Growth Loop Reference

## Compact maturity model

| Layer | Best location | Purpose | Promotion signal |
| --- | --- | --- | --- |
| One-off request | Active prompt | Current goal and constraints | Do not persist automatically |
| Stable repository rule | `AGENTS.md` | Commands, contracts, safety, done criteria | Repeated project need |
| Reusable workflow | `SKILL.md` | Triggered method and decision boundaries | Repeated task or correction |
| Current product fact | Focused reference | Model, API, or tool behavior | Official source and checked date |
| Historical lesson | Memory note | Prior failure, preference, or decision | Repeated value and no current conflict |
| Mechanical invariant | Hook or script | Deterministic enforcement | Testable without model judgment |
| Recurring maintenance | Scheduled task | Research, audit, or report cadence | Workflow already reliable manually |

## Research proposal template

```text
Title:
Date checked:
Scope:
Observed friction or opportunity:
Current local behavior:
Official source URLs:
Relevant evidence:
Proposed smallest change:
Files affected:
Risk and blast radius:
Regression checks:
Uncertainty:
Review or refresh date:
```

## Promotion rubric

Score each candidate from 0 to 2:

- **Authority:** official or trusted primary source.
- **Freshness:** checked recently enough for the fact's volatility.
- **Relevance:** directly improves a real user workflow.
- **Repeatability:** supported by repeated friction or a reusable task.
- **Verifiability:** has a concrete local or behavioral check.

Promote automatically only for additive, low-risk changes with a total of 9 or more, no permission or secret impact, and a passing regression check. Otherwise create a proposal and wait for review.

## Suggested cadence

- Every relevant task: verify volatile product facts before making claims.
- Weekly: collect official release, model, skill, and configuration changes into a read-only digest.
- Monthly: review repeated corrections and promote only proven improvements.
- After a failure: capture the smallest preventive rule and add a regression test before generalizing it.

## Anti-drift checks

- Confirm every linked route and reference exists.
- Keep the skill front door concise so discovery remains cheap.
- Do not duplicate the same rule across PULSE, `AGENTS.md`, a skill, and memory unless ownership is explicit.
- Compare paired instructions after edits and search for stale model names or defaults.
- Run the skill validator, syntax checks, and the smallest meaningful dry-run.
- Never claim a live API, account entitlement, scheduled task, MCP connection, or production behavior was verified unless it was actually tested.

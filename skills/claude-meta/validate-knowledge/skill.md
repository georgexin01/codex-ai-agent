---
name: validate-knowledge
description: "Sovereign Apex Validator — Lints all skills + memories against HYBRID_FORMAT_PROTOCOL. Checks Apex compliance (Tier-0, Ignore Injection), broken path refs, router bidirectional integrity, JSON-config parseability, inline-secret leaks, and screenshot hygiene. Phase 4 of the claude-meta loop. (V15.3)"
triggers: ["validate knowledge", "lint skills", "apex audit", "audit format", "validate sovereign", "secret scan", "knowledge drift", "post-mortem"]
phase: 3-testing
requires: []
unlocks: []
inputs: []
output_format: lint_report
model_hint: medium
model_profile: luna-5.6-medium
version: 15.3
status: authoritative
date_created: "2026-04-16"
date_updated: "2026-07-03"
---

# validate-knowledge — Sovereign Apex Validator (V15.3)

## When to Use

- After any structural refactor or knowledge consolidation
- Before final mission sign-off
- To verify Crystal State (0-noise) integrity

## Steps

### Step 1 — SCAN

Walk these directories recursively:
- `C:/Users/User/.codex/skills/`
- `C:/Users/User/.codex/memories/`

Collect every `.md` and `.yaml`.

### Step 2 — CHECK FRONTMATTER (per file)

For each `.md`:
- [ ] Opens with `---` on line 1
- [ ] Has required fields: `name`, `description`, `triggers`, `phase`, `model_hint`, `version`
- [ ] `model_hint` is one of `fast`, `medium`, or `deep`
- [ ] `model_profile`, when present, identifies the current model family without replacing the capability label
- [ ] `triggers` is array of 2–5 literal strings
- [ ] No duplicate `name` across files

### Step 3 — CHECK PATH REFS

Grep each file for `file:///` and `C:/` absolute paths.
- [ ] Verify targets exist via `Test-Path`.
- [ ] Flag broken links as HIGH severity.

### Step 4 — CHECK CROSS-REFS

Verify that all `requires:` and `unlocks:` point to valid skills reachable in the current router index.

### Step 4.5 — ROUTER BIDIRECTIONAL CHECK

Open [skill_path_router.md](../../../memories/2_governance/artifacts/skill_path_router.md) and enforce two-way integrity:

- [ ] **Outbound**: every routed file target exists on disk (`Test-Path`).
- [ ] **Inbound**: every authoritative routing file under `memories/0_apex/`, `memories/1_core/`, and `memories/2_governance/` is either (a) referenced by the router, (b) referenced by another authoritative file, or (c) flagged as orphan.
- [ ] **Trigger conflicts**: no two router entries share an identical trigger keyword unless they are `shared` by design.

Flag orphans as MEDIUM; flag missing targets as HIGH.

### Step 5 — CHECK DUPLICATES & DENSITY

- [ ] Identify files < 1KB (Potential merge targets).
- [ ] Identify >80% body similarity (Potential redundancy).

### Step 6 — CHECK LOCKED INTEGRITY (TIER-0)

For files under `skills/claude/`:
- [ ] Verify no unauthorized modifications (unless handshake matched).
- [ ] Ensure `GROUND_KERNEL` principles remain untouched.

### Step 7 — APEX PURITY AUDIT (NEW V15.2)

- [ ] **Principle 13**: Verify presence of root `.codexignore`.
- [ ] **Noise Liquidation**: Verify zero `metadata.json` or `timestamps.json` in scanned paths.
- [ ] **HUD Compliance**: Verify all `walkthrough.md` files use the Clinical HUD format.

### Step 7.5 — JSON CONFIG AUDIT

For every `*.json` under `C:/Users/User/.codex/`:

- [ ] Parse with `JSON.parse()` (via `node -e` or PowerShell `ConvertFrom-Json`). Invalid JSON = HIGH severity.
- [ ] Confirm `mcp_config.json` contains no inline credentials — secrets must resolve from `.env.keys` or an env-var reference.

### Step 7.6 — SECRET SCANNER

Grep every config + script file for inline secret patterns:

```regex
sk-[a-zA-Z0-9_-]{20,}          # Anthropic / OpenAI-style keys
AQ\.[A-Za-z0-9_-]{20,}          # Google Stitch / GCP keys
Bearer [A-Za-z0-9_-]{20,}       # Bearer tokens
xox[bapr]-[A-Za-z0-9-]{10,}    # Slack tokens
ghp_[A-Za-z0-9]{30,}            # GitHub PATs
```

- [ ] Any match **outside** `.env.keys` = **HIGH severity — halt writes and alert user**.

### Step 7.7 — SCREENSHOT HYGIENE

Per [SCREENSHOT_HYGIENE.md](../../../memories/2_governance/SCREENSHOT_HYGIENE.md):

- [ ] Confirm `C:/Users/User/.codex/brain/{session-uuid}/.tempmediaStorage/` folders are empty or absent.
- [ ] Confirm `.system_generated/click_feedback/` folders are empty or absent.
- [ ] Report total `.png`/`.jpg` files still present under `brain/` (expected: < 30 files total).

### Step 8 — WRITE REPORT

Save to `C:/Users/User/.codex/brain/tactical/LINT_REPORT_{date}.md`.

## Guardrails

- DO NOT edit files. Report only.
- STOP if scan finds >20 violations (Critical drift).

## Lightweight Sign-Off

For normal routing changes, run `Audit-CodexRouting.ps1`, `Validate-CodexKnowledge.ps1`, and `Test-CodexPerfBenchmark.ps1` first. Use the full scan above for structural refactors, secret-sensitive changes, or final release sign-off. The fast validator is read-only and reports duplicate names, oversized files, and documentation examples as warnings while failing only on actionable route or secret findings.

---
**validate-knowledge V15.3 — 2026-07-03 · Karpathy Apex Edition (router bidirectional + JSON audit + Secret Scanner + Screenshot Hygiene)**

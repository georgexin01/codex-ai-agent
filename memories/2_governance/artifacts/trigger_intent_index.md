---
name: trigger-intent-index
description: "Compact, evidence-bound trigger, intent, and next-action index for Codex routing."
triggers: ["ai trigger keywords", "ai intent map", "ai ui intent", "ai phrase frequency"]
contains: ["popup modal", "modal", "popup", "button", "click this button", "trigger", "click event", "open this", "show this", "same design", "exact same", "not working"]
phase: routing
version: 1.0
status: active
date_updated: "2026-08-20"
evidence_scope: "654 parseable user-message entries from available 2026 session JSONL, excluding repeated injected instruction blocks and locked active files"
related:
  - 00_PULSE.md
  - memories/2_governance/artifacts/skill_path_router.md
  - memories/2_governance/artifacts/knowledge_relation_router.md
  - memories/2_governance/CODEX_IGNORE_PROTOCOL.md
---

# Trigger Intent Index

This is a compact retrieval layer. Exact workflow triggers may route work. Natural-language intent phrases only enrich task interpretation; they never authorize destructive actions, browser clicks, form submission, deletion, reset, or force-push by themselves.

## Matching contract

1. Match the longest exact phrase first.
2. Resolve project type from the current working directory and current files before applying project-specific meaning.
3. Use `trigger` for an explicit workflow route; use `contains` phrases as retrieval hints only.
4. If the phrase is ambiguous, inspect the target and ask only when the target or action cannot be resolved safely.
5. `delete`, `remove`, `reset`, `drop`, `force push`, and `unignore secrets` require explicit target verification and confirmation.
6. Keep detailed implementation rules in the matched skill or relation node; do not expand this hot index with long explanations.

## Recommended active workflow triggers

| Project/type | Trigger keywords | Meaning and route | Mode |
|---|---|---|---|
| Global | `ai read .codex knowledge` | Hydrate compact PULSE context and return only `[🟢] Agent is Ready..` | Sentinel |
| Global | `localhost test` | Detect the current project, reuse/start the correct server, verify HTTP URLs, and avoid source mutation | Safe check → `skills/localhost-test/SKILL.md` |
| Global | `ai fast batch workflow`, `ai batch context`, `ai task checkpoint`, `long task checkpoint` | Preserve `DONE`, `ACTIVE`, `NEXT`, `BLOCKED`, `DEFERRED`, and verification state | Route → checkpoint protocol |
| Codex | `ai knowledge health`, `ai validate knowledge fast` | Run read-only knowledge, route, secret, and target checks | Read-only validation |
| Codex | `ai knowledge relations`, `ai related knowledge` | Follow task-relevant knowledge-to-knowledge edges only | Route → relation router |
| Codex | `ai codex routing`, `ai codex access map` | Inspect access lanes, manifests, routes, and safe cleanup boundaries | Route-only |
| Codex | `ai codex ignore`, `ai ignore setting` | Inspect ignore visibility while preserving secrets and runtime state | Route-only |
| Vben/Admin | `ai vben admin`, `admin panel`, `create module`, `new module` | Use the Vben front door and preserve Store, Function, Input, schema, route, and i18n contracts | Plan-first |
| Vue/mobile | `ai claude app`, `vue mobile app`, `capacitor app`, `pwa app build` | Use the mobile workflow while preserving Vue, Pinia, API, i18n, and database contracts | Build + verify |
| PHP/website | `ai claude website`, `php website`, `HTML to PHP` | Use the PHP/Supabase website route and current project evidence | Plan + verify |
| SEO/metadata | `update meta skills`, `full metadata audit`, `metaTitle`, `SEO metadata`, `AI search` | Audit public identity, canonical, robots, sitemap, JSON-LD, and crawlability from current evidence | Evidence-bound |
| Database | `ai cyroro audit`, `ai pinia contract`, `PiniaStore Function Input` | Preserve exact app and reference contracts before editing | High-caution audit |
| Images | `generate image`, `AI image`, `image generation`, `image size` | Enforce dimension policy, provenance, and project asset storage; never use `.codex/generated_images/` as project storage | Generate + verify |
| Design | `ai design`, `app design`, `website design`, `design.md`, `design tokens` | Route through the design hub or contract layer and preserve project design DNA | Plan + verify |

## Intent-to-execution playbook

Use the first matching row, then keep the smallest relevant route awake. The `done when` condition is part of the instruction and prevents stopping after inspection alone.

| Intent family | Next actions | Done when |
|---|---|---|
| `popup modal`, `modal`, `popup`, `dialog`, `drawer` | Identify project and target route → locate component/state → trace open/close trigger → preserve responsive, escape, outside-click, stacking, and scroll behavior → patch only the needed layer → verify the visible state | The requested overlay opens, closes, and remains correct at the relevant viewport; build or browser evidence is reported |
| `button`, `click this button`, `click`, `press`, `tap` | Resolve exact page, label, selector, and target → inspect handler and resulting state/API/navigation → use browser control only when explicit and target is visible → verify the result and side effects | The intended control is identified and its expected result is observed or the exact blocker is reported |
| `trigger`, `click event`, `activation`, `when click` | Trace event binding → handler → store/API → state, route, or modal transition → inspect callers/contracts → make the smallest fix → test success and failure paths | The event path is explained and verified from user action to resulting state |
| `open this`, `show this`, `make it appear`, `hide`, `close`, `toggle` | Identify visibility state and owner → inspect conditional rendering, CSS, portal, and event path → patch state ownership or styling → verify open and closed states | Both requested visibility states work without breaking adjacent UI |
| `form`, `submit`, `save`, `create`, `update` | Inspect schema/types → store/API input contract → validation and loading state → anti-double-submit behavior → implement → run the nearest test/build/API check | The expected record or UI state changes once, validation works, and the contract remains intact |
| `delete`, `remove`, `reset`, `drop`, `clear` | Resolve exact target and scope → inspect references/backups/ignore rules → state the destructive effect → require confirmation when target or effect is material → execute only after confirmation → validate recovery or final state | The exact requested target changed and the result is verified; no unrelated data was touched |
| `same design`, `exact same`, `copy this`, `reuse existing`, `match` | Find canonical source component/route → compare DOM, CSS, assets, typography, spacing, and responsive behavior → reuse or minimally extend canonical code → run build and visual check | The target uses the canonical structure and the requested parity is verified, not merely approximated |
| `not working`, `broken`, `failed`, `unable` | Reproduce → capture exact error/route → inspect logs, console, network, schema, and current source → isolate root cause → patch → rerun the failed check | The original failure is no longer reproduced, or the exact external blocker and next test are recorded |
| `check`, `verify`, `test`, `confirm`, `does it work` | Select the nearest evidence gate: validator, build, HTTP, browser, SQL/schema, or contract check → run it → compare result to request | Raw evidence supports completion or the task is explicitly marked partial/blocked |
| `read`, `study`, `research`, `find`, `look up` | Resolve the narrowest source route → read current project truth first → follow only relevant relations → separate facts, preferences, and historical evidence → report before editing | The answer or implementation is grounded in current evidence and missing data is stated |
| `clear`, `clean`, `old`, `legacy`, `out of date`, `useless` | Inventory references and route usage → classify active, conditional, cold, or dead → preserve unique facts → archive/tombstone or remove only the resolved target → validate routes | Stale content is reduced without breaking a route or losing unique current guidance |
| `update`, `build`, `create`, `make`, `add` | Resolve project, target, source of truth, and acceptance criteria → inspect callers/contracts → patch smallest scope → verify output and report changed files | The requested artifact exists or is updated, and its acceptance check passes |

## Compound intent samples

Use `+` as a compact separator for related constraints. It means “combine these meanings”; it is not a literal UI operator and does not authorize an action by itself.

| User phrase pattern | Expanded meaning | Next action and completion check |
|---|---|---|
| `click center + button` | Find the button positioned at the center of the relevant page, card, modal, or toolbar, then follow its click behavior | Resolve the exact route/container and button label → inspect or explicitly click the target → verify the resulting state, navigation, or API effect |
| `button + close when ...` | The button must close something under the stated condition | Identify the controlled modal/drawer/popover and condition → trace close state/event → verify it closes only under that condition |
| `click + open modal` | A click should open a modal or overlay | Locate the source control and modal state → trace event-to-state path → verify open, focus, scroll lock, and close behavior |
| `popup modal + close button` | The overlay needs a visible close control | Locate the modal component and close handler → preserve escape/outside-click rules → verify the close button returns to the prior state |
| `button + not working` | The control exists but its event path is failing | Reproduce → inspect selector, disabled/loading state, handler, console, network, and store/API call → fix root cause → rerun the same interaction |
| `button + save form` | The button submits a form and persists data | Inspect schema, validation, store/API input, loading state, and duplicate-submit guard → submit once → verify saved result and error handling |
| `click + show form` | A click changes visibility to display a form | Find visibility state and form owner → trace click handler → verify the form appears with correct focus and validation |
| `click + hide popup` | A click changes visibility to hide an overlay | Find close control and state owner → verify the overlay disappears and background interaction returns safely |
| `center button + same design` | The centered button must match the canonical visual reference | Find the canonical component/style → compare structure, spacing, typography, icon, and responsive behavior → verify at target viewport |
| `modal + mobile` | The overlay must work at mobile dimensions | Inspect responsive layout, viewport height, keyboard, scroll, and safe area → verify open/close and content access on mobile |
| `click + route page` | A control navigates to a page or route | Resolve source button and destination contract → inspect router/navigation guard → verify URL, active state, refresh, and back behavior |
| `trigger + API` | The event should invoke a backend/API operation | Trace event → handler → store/client → endpoint/RPC → response state → verify success, failure, loading, and duplicate protection |
| `remove old button` | A stale UI control may be removed | Search references and route usage → confirm exact target and replacement behavior → remove only after explicit scope is clear → build and visual-check affected route |

## Completion response contract

For an intent-driven task, finish with: changed files or `no change`, verification evidence, blocked items, intentionally untouched scope, and the next safest action. Never report “done” from a route match alone.

## Natural-language UI intent phrases

| Project/type | Phrase family | Interpretation | Safe next action |
|---|---|---|---|
| Web/app UI | `popup modal`, `modal`, `popup`, `dialog`, `drawer` | A visibility layer or overlay is involved | Locate component, open/close state, stacking, portal, and responsive behavior |
| Web/app UI | `button`, `click this button`, `click`, `press`, `tap` | An interactive control or event path is involved | Resolve the exact target; inspect handler or use browser control only when explicitly requested |
| Web/app UI | `trigger`, `click event`, `activation`, `when click` | Trace event → handler → state/API/navigation | Find the event binding and its caller/callee chain |
| Web/app UI | `open this`, `show this`, `make it appear`, `hide`, `close`, `toggle` | Visibility or state transition is requested | Identify the state variable, action, and affected component |
| CRUD/data | `form`, `submit`, `save`, `create`, `update`, `delete`, `remove` | A data mutation or form contract may be involved | Inspect schema, store/API contract, validation, and anti-double-submit guard; confirm destructive targets |
| Design | `same design`, `exact same`, `copy this`, `reuse existing`, `match` | Reuse the canonical DOM/CSS/component rather than approximate | Find the source component and compare current route output |
| Debugging | `not working`, `broken`, `failed`, `unable` | Diagnose a failure | Inspect current logs, route, target, and smallest reproducible path |
| Verification | `check`, `verify`, `test`, `confirm`, `does it work` | Evidence is required before completion | Run the nearest relevant validator, build, HTTP check, or browser check |
| Knowledge | `read`, `study`, `research`, `find`, `look up` | Inspect source evidence before making a change | Route to the narrowest knowledge or skill front door |
| Maintenance | `clear`, `clean`, `old`, `legacy`, `out of date`, `useless` | Possible rot or stale content | Mark candidate, check references, archive or remove only with a resolved target and explicit scope |

## High-frequency context labels, not triggers

These appeared often in the sampled user messages but are too broad to invoke a workflow alone: `page`, `image`, `app`, `update`, `project`, `content`, `knowledge`, and `website`. They should help classify the task only after a real trigger or clear request is identified.

## Evidence snapshot

| Phrase/token | Observed occurrences | Interpretation |
|---|---:|---|
| `page` | 326 | Context label |
| `image` | 277 | Context label; use image route only with an image action |
| `app` | 184 | Context label |
| `update` | 176 | Action candidate; requires target and scope |
| `project` | 110 | Context label and project-boundary check |
| `content` | 107 | Context label |
| `knowledge` | 98 | Codex knowledge context |
| `website` | 92 | Project-type classifier |
| `read` | 83 | Research/read intent |
| `button` | 50 | UI target intent |
| `modal` | 21 | UI overlay intent |
| `popup` | 20 | UI overlay intent |
| `popup modal` | 17 | Strong UI overlay phrase |
| `trigger` | 16 | Event/routing intent |
| `click` | 7 | Interaction intent; target still required |

Counts are directional evidence, not automatic permissions. The sample excludes repeated injected instruction blocks and locked active session files; re-audit before promoting new phrases to workflow triggers.

## Related routes

- Exact skill and recipe routes: `memories/2_governance/artifacts/skill_path_router.md`
- Structured phrase-to-action contracts: `memories/2_governance/artifacts/intent_action_contracts.md`
- Cross-domain relations: `memories/2_governance/artifacts/knowledge_relation_router.md`
- Boot and safety contract: `00_PULSE.md`
- Ignore and visibility rules: `memories/2_governance/CODEX_IGNORE_PROTOCOL.md`

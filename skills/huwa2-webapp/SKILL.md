---
name: huwa2-webapp
description: Work on the HUWA2 Vue customer app when updating routes, visual design, or app behavior while preserving its stores, APIs, i18n, and database contracts.
metadata:
  short-description: Safely update the HUWA2 customer app
---

# HUWA2 Web App

Use this skill for work inside
`C:\Users\user\Desktop\huwa\webApp-huwa2`. Read the compact current-state
memory at `C:\Users\user\.codex\memories\project_notes\HUWA2_WEBAPP_CURRENT_STATE.md`
before task-specific files.

## Scope

- Edit only `webApp-huwa2` unless the user explicitly changes scope.
- Treat `sample`, `webApp-huwa`, and `admin-panel-huwa-2` as read-only references.
- Prefer current source, tests, runtime evidence, and migrations over stale
  planning prose or historical changelog claims.

## Before editing

1. Identify the route and owning view/component.
2. Read the relevant project rules, current view, shared selectors, and callers.
3. For visual work, inspect the matching `/sample` reference and supplied assets.
4. Preserve existing stores, API/RPC payloads, auth guards, route paths,
   handlers, translations, and database contracts.
5. Keep visual changes in `src/style.css` with stable `huwa-` selectors; do not
   add another version-suffixed selector for an existing DOM role.

## HUWA-specific contracts

- The customer is a Malaysia-focused bilingual audience, primarily ages 45–65;
  preserve readable typography, warm cream/orange/red/gold surfaces, clear
  actions, and the five-item navigation.
- Server quote/order RPCs own checkout totals and shipping truth. Do not add
  client-side business calculations during visual work.
- Lucky Draw is currently frontend demo behavior. Do not invent a backend table,
  RPC, persistence contract, or reward settlement schema.
- Generated images go to `src/assets/images/generate/` and are capped at 1,200px;
  use PNG only when real transparency is required.

## Verification and handoff

- Read back every edit.
- Run `npm.cmd run build` for Vue, template, or CSS changes.
- Use the smallest safe runtime/browser check for behavior changes.
- Do not claim exact screenshot parity without a target-viewport visual check.
- Append a concise entry to `PROJECT_CHANGELOG.md` with changed files,
  verification, remaining mismatch, and intentionally untouched contracts.
- Report completed, blocked, deferred, intentionally unchanged, and next safest
  action separately.

## Useful current-state references

- Root authority: `C:\Users\user\Desktop\huwa\PROJECT_CONTEXT.md`.
- Customer/design rules: `HUWA_CUSTOMER_UI_UX_GUIDE.md`,
  `HUWA_PAGE_UPDATE_RULES.md`, and `webApp-huwa2\DESIGN.md`.
- Current route/status and recent user decisions:
  `C:\Users\user\.codex\memories\project_notes\HUWA2_WEBAPP_CURRENT_STATE.md`.

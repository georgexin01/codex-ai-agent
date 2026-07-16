---
name: trash-dual-app-operating-rules
description: "Reusable operating rules learned from the CY RORO Trash dual-app workflow: surgical UI changes, driver/admin task progression, local Supabase boundaries, and evidence-based verification."
triggers: ["trash-container-app", "web-driver-app", "web-admin-app", "order timeline", "driver task workflow", "admin order modal", "bin label", "customer debt", "localhost test"]
status: authoritative-extension
date_updated: "2026-07-14"
---

# CY RORO Trash dual-app operating rules

## Project boundaries

- Active implementation targets are `web-driver-app` and `web-admin-app`.
- `admin-panel-trash` is the reference-only desktop Vben app for schema, migrations, RPCs, permissions, and business behavior unless the user explicitly reactivates it.
- Do not change Supabase schema, migrations, or local Docker data for a visual/page request. If the requested display data is absent, use a clearly scoped UI fallback only after checking the current relation path.
- Keep driver and admin behavior aligned through the same `trash` schema, but preserve their separate route, auth, navigation, and presentation responsibilities.

## UI change contract

- For screenshot/design requests, change only the named page, component, section, or design property. Preserve unrelated text, routes, data loading, and controls.
- Treat supplied HTML and screenshots as the visual contract: compare spacing, border radius, colors, typography, height, active state, icon, disabled state, and positioning before editing.
- When a user says “design only,” do not change content, database mapping, status logic, or navigation behavior.
- For exact label corrections, search both apps and all related modal/timeline/card views; verify the old label has no remaining source references.
- Keep modal close controls functional: decorative overlays must not intercept pointer events, and both the header X and footer Close button should call the same close path.

## Shared task workflow truth

- Driver task progression is: created → task started → departure photo uploaded/confirmed → transporting → arrival photo uploaded/confirmed → task completed.
- `开始流程` / `开始流程`-equivalent actions must update the task and order status without closing the modal.
- Uploading a photo and confirming/submitting it are separate states: a selected or previewed file is not persisted as final proof until the confirmation action succeeds.
- After a proof confirmation, hide only that proof's confirmation action when the persisted photo/status says it is complete; keep the next valid action available.
- Completed tasks retain visible disabled start/finish buttons for timeline context. They become non-clickable and gray rather than disappearing.
- The latest timeline status should have the active border/highlight; completed earlier steps use completed styling and future steps use pending styling.
- Admin order modals should reuse the driver's timeline meaning and proof states, while admin-only actions may remain available where explicitly requested.

## Data and display rules

- Resolve customer name and phone from the order's `customerId` relation before showing `未知客户`; only use a fallback when the relation is genuinely unavailable.
- Keep the current hardcoded Chinese bin display fallback consistent across home cards, order detail, history, and modals: `蓝色大桶` and `绿色小桶`.
- Keep customer, bin/task, driver, amount, and timeline data in their correct cards; do not duplicate detail into summary cards when the design specifies a compact card plus detail modal.
- Debt totals represent unpaid customer balance. Do not show a negative debt as if it were a debt: display the unpaid amount as a positive red amount when balance is owed, and `RM 0.00` in the normal dark style when no debt is due. The detail modal must list the unpaid orders that make up the total.

## Pinia and C+C implementation

- Preserve the exact public `PiniaStore -> Function -> Input` spelling and casing from the user's contract, including `getAllBinWIthOrder`.
- Keep the dependency direction `views -> stores -> utils/types -> API/Supabase`. Views should not query Supabase directly.
- Put normalization, payload building, date conversion, storage-path handling, and other pure work in typed `src/utils/*-store.ts` helpers; let Pinia actions compose those helpers and own persistence.
- Before copying a store package between the two apps, compare schema fields, auth role, env, response shape, route inputs, and existing callers. Copying without that comparison is unsafe.
- Use frontend camelCase and map DB snake_case at the boundary; do not casually rename public function or input names for internal cleanliness.

## Verification gate

- After a source edit, read back the changed lines and run the nearest useful check. For either mobile app, at minimum run `cmd.exe /d /c npm run type-check` from that app root; use build and a visible route smoke test for workflow or multi-file changes.
- For `localhost test`, detect existing listeners first, use Command Prompt with the exact `npm run dev` script for both standalone Vue apps, keep servers detached, and verify HTTP rather than trusting a running process.
- Current expected standalone app ports are driver `3000` and admin `5173`; the Vben reference app uses `6006` with `pnpm.cmd run dev:local`.
- For status/photo workflow changes, verify both the visible state and the persistence path: button behavior, modal staying open, next-step transition, storage reference, and database status update.
- Report uncertainty when live data or browser inspection is unavailable; never claim a visual check from type-check output alone.

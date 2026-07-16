---
name: pinia-contract-absolute-gate
description: "Absolute enforcement gate for Trash PiniaStore, Function, and Input naming across web-admin-app and web-driver-app."
triggers: ["absolute Pinia rules", "forced Pinia contract", "recheck Pinia", "exact function input name", "Google Sheet contract gate"]
status: authoritative-extension
date_updated: "2026-07-14"
---

# Absolute Pinia contract gate

Whenever work touches Pinia in `trash-container-app`, this gate is mandatory and cannot be skipped:

1. Read the live Google Sheet `Trash` -> `Pinia` tab before editing or reviewing Store code. Treat its `PiniaStore`, `Function`, and `Input` columns as the public contract.
2. Build a checklist from every non-empty contract row. Match Store names, Pinia ids, Function names, casing, and Input meaning exactly. The Sheet typo `getAllBinWIthOrder` is intentional and must remain unchanged.
3. Search both `web-admin-app` and `web-driver-app` source for every contract Store and Function. A declaration alone is insufficient: inspect its type Input, all callers, barrel exports, and the persistence boundary.
4. If any Store, Function, or Input is missing, renamed, aliased, unioned with an incompatible legacy shape, or called with the wrong argument structure, stop the task and repair it before adding unrelated features.
5. Prefer the old `D:\project\hotpot\admin-panel-hotpot` Options API Store structure: explicit state, typed actions, Store-owned API work, action-level try/catch/finally, local-state refresh/invalidation after writes, and small helpers in `src/utils/`.
6. Reuse only the Hotpot implementation pattern. Never copy its PHP endpoints, API paths, models, authentication assumptions, or business schema into the Trash Supabase apps.
7. Public update actions use the exact object Input contract. For example, `update(input)` receives the target `id` inside the typed Input; do not reintroduce `update(id, data)` or compatibility unions such as `StatementInput | string`.
8. Natural-language Sheet Inputs such as `from url`, `id from URL`, `customer Id`, `startDate, endDate`, `object`, and `-` must be represented by the closest typed, behaviorally exact Input. Do not invent a competing public name just to make TypeScript convenient.
9. Driver task reads must be auth-scoped inside the Store. `getLists()` and `getDetail(taskId)` must not let a page inject an arbitrary driver identity; derive the current driver from the authenticated user and preserve `DriverTaskUpdateInput` for `update(input)`.
10. Extra private or workflow actions are allowed only when needed by the current app, but they must not replace, rename, or weaken the Sheet-facing actions.
11. Keep the dependency direction `views -> stores -> utils/types -> API/Supabase`; views must not call Supabase directly or assemble a second payload contract.
12. Before declaring completion, run exact-name search, read back each changed Store and one caller, run `cmd.exe /d /c npm run type-check` in both apps, run `npm run build` for Store/multi-file changes, and report any unavailable browser or database verification honestly.

## Current enforcement result

- Admin `useOrderStore.update` uses one `OrderUpdateInput` object containing `id`.
- Driver `useDriverTaskStore.getLists()` has no page-supplied driver id; `getDetail(taskId)` accepts the URL task id only.
- The unused Driver `useOrderStore` was also repaired so it cannot retain the old two-argument update or string statement Input.
- Both apps must be rechecked against this gate on every future Pinia request, even when the requested change appears visual or local.

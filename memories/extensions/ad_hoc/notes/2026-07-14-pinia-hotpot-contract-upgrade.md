---
name: pinia-hotpot-contract-upgrade
description: "Complete Pinia implementation upgrade for trash-container-app using the old Hotpot admin-panel store style while preserving the Trash Google Sheet PiniaStore, Function, and Input contract."
triggers: ["PiniaStore Function Input", "Hotpot Pinia style", "admin-panel-hotpot", "Trash Pinia migration", "OrderUpdateInput", "DriverTaskUpdateInput", "getAllBinWIthOrder"]
status: authoritative-extension
date_updated: "2026-07-14"
---

# Pinia contract and Hotpot-style implementation

## Authority order

1. Current Trash Google Sheet `Trash` -> `Pinia` tab controls public `PiniaStore`, `Function`, and `Input` names and casing.
2. Current `web-admin-app` and `web-driver-app` types, callers, auth, environment, and Supabase schema control compatible implementation details.
3. `D:\project\hotpot\admin-panel-hotpot` is a structure/style guide, not a schema or API source. Reuse its Store organization, not its PHP endpoints or business models.

Never change a public action name because the old project uses another name. In particular, preserve `getAllBinWIthOrder` exactly, including its casing.

## Hotpot Store pattern to reuse

- Use Pinia Options API: `defineStore('id', { state: () => ({ ... }), getters: { ... }, actions: { ... } })`.
- Keep state explicit and domain-oriented: collections, current/detail record, loading, pagination/filter state where the page needs them.
- Give each action one clear responsibility and a typed Input/Output contract.
- Wrap each async action in its own `try/catch/finally`; set loading state at the store boundary, log a store-specific context, and either return a safe read fallback or rethrow a write failure according to the current app policy.
- After successful create/update/delete, update the local collection and invalidate/refetch any all-record cache. Do not leave stale detail or list state after a mutation.
- Keep filters, pagination, display helpers, and local selectors in the Store when they are part of the domain flow; keep framework-independent transformation in `src/utils/`.
- The current Supabase app can keep its schema-specific query/RPC code, relation selects, RLS checks, and Storage calls. Do not copy Hotpot `apiPath` or PHP request code into the Trash apps.

## Exact Trash contract currently implemented

### Admin contract

- `useOrderStore`: `create(input: OrderCreateInput)`, `update(input: OrderUpdateInput)`, `getDetail(id)`, `redirectWhatsapp(customerPhoneNumber, orderNumber)`, `getOrderByCustomerIdForStatement(input: StatementInput)`, `getAllByDate(input: OrderDateRangeInput)`.
- `useBinStore`: `getAllBinWIthOrder()`.
- `useDriverStore`: `getCarTrackApi(vehicleNo)`.
- `useHelperStore`: `convertStringToDates(month)`.

`OrderUpdateInput` is an object containing the target `id` plus partial order fields. The store strips `id` before sending the update payload to Supabase. This keeps the Sheet's object-style update contract while preventing the primary key from being written.

### Driver contract

- `useDriverTaskStore`: `getLists()`, `getDetail(taskId)`, and `update(input: DriverTaskUpdateInput)` are the Sheet-facing actions.
- `getLists()` and `getDetail(taskId)` derive the authenticated driver's `driverId` inside the Store rather than requiring pages to pass a second permission parameter.
- Task-specific actions such as `startTask`, `saveDeparturePhoto`, `saveCompletionPhoto`, and `completeTask` remain internal page workflow actions because the driver UI needs them; do not rename the Sheet-facing actions to these names.
- Page call shape is `views -> useDriverTaskStore().getLists()` or `getDetail(route.params.id)`, never a direct Supabase query.

## Input contract rules

- Preserve exact named Inputs already established in the project: `OrderCreateInput`, `OrderUpdateInput`, `StatementInput`, `OrderDateRangeInput`, and `DriverTaskUpdateInput`.
- When the Sheet describes an Input semantically (`from url`, `customer Id`, `startDate, endDate`, or `object`) rather than giving a TypeScript type name, represent that meaning with a typed project Input instead of literal hardcoded values.
- Do not use compatibility unions that hide contract drift, such as `StatementInput | string`, when the public contract is an object Input.
- Do not make pages assemble a second payload shape. Normalize once in `src/utils/*-store.ts`, then let the Store own persistence.
- Keep DB field translation at the Store boundary: current Trash frontend models use camelCase while database fields/relations must follow the live schema contract.

## C+C composition

```text
small pure utility -> typed Store action -> page caller
```

- `buildOrderCreatePayload`, `buildOrderUpdatePayload`, `buildDriverTaskUpdatePayload`, `mergeBinsWithOrders`, date conversion, and Storage path functions are pure boundary helpers.
- Pinia actions compose validation/normalization/query/persist/refresh; views only provide the exact Input and render the result.
- Before changing a helper, search every Store and page caller. Before changing a Store action, search all callers and compare the Sheet contract.
- Copy a Store package between the apps only after comparing schema, auth role, environment, relation response shape, route Input, and existing callers.

## Verification gate for future changes

1. Search exact Store, Function, and Input names against the Sheet.
2. Read the Store and at least one live caller back after editing.
3. Run `cmd.exe /d /c npm run type-check` in the affected app.
4. Run `cmd.exe /d /c npm run build` for Store or multi-file changes.
5. Smoke-test the visible caller for list load, detail load, mutation, and refresh behavior.
6. For driver actions, verify auth scoping and that no page can query another driver's task data by passing an arbitrary driver ID.
7. For Supabase writes, verify the exact RPC/table payload and do not change schema or local data unless explicitly requested.

## Completed migration evidence

- Admin and Driver Store callers were aligned to the Sheet-facing Input style.
- Admin `update` now accepts one object Input instead of `(orderId, input)`.
- Driver `getLists` no longer requires a page-supplied driver ID; the Store derives it from the authenticated user.
- Admin and Driver both passed `npm run type-check` and `npm run build` after the migration.
- No Supabase schema or database data was changed by this Pinia structure migration.

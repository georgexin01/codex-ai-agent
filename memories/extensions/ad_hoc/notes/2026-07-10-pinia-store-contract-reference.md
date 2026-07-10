---
name: pinia-store-contract-reference
description: "User-owned Pinia contract rule and hotpot reference paths for app store naming and page usage."
triggers: ["PiniaStore Function Input", "useOrderStore", "Pinia contract", "Google Sheet Pinia"]
status: authoritative
date_updated: "2026-07-10"
---

# Pinia contract reference

For app work, the user's Google Sheet `Trash`, tab `Pinia`, defines a public contract. Preserve the exact spelling and casing of the columns and values:

`PiniaStore` → `Function` → `Input`

These are not loose documentation labels. They are the names workmates use to find and call store actions. Do not rename, alias, or silently change them during implementation.

Reference projects to inspect before designing an app store:

- `D:\project\hotpot\app-cashier-hotpot`
- `D:\project\hotpot\admin-panel-hotpot`
- `D:\project\hotpot\webApp-hotpot`

Observed reference shape:

- stores use `defineStore('<id>', { state: () => ({}), actions: { ... } })`
- pages instantiate stores with `const merchantStore = useMerchantStore()` or the equivalent exact store name
- pages call actions from `onMounted`/fetch functions and assign typed results to local refs
- independent actions are often loaded with `Promise.all`
- `authStore` controls role/member-dependent calls and Inputs
- API calls stay inside Pinia actions

The exact `useOrderStore` implementation was not found in the three inspected hotpot roots; `useOrderStore` and its action names come from the user's `Pinia` sheet. Use the hotpot stores such as `useMerchantStore`, `useMemberStore`, and auth-dependent page loading as the structural reference, not as a source for renaming the user's contract.

When editing an app store, change only the requested store implementation area unless the user explicitly expands scope. Search callers, preserve exact sheet Inputs, and run TypeScript verification after editing.

## High-priority `c-to-c` composition rule

Use the user's `c-to-c` model for all Vue app work:

- `c` = one very small, single-purpose function
- `c + c` or `c + c + c` = a reusable utility composition
- utilities in `utils/` and types in `types/` feed store actions
- Pinia actions are the largest page-facing compositions and keep the exact sheet contract
- pages call `useStore().Function(Input)` and do not duplicate the internal chain

Preferred dependency direction:

`views -> stores -> utils/types`

Pass auth and other state into small functions as explicit Input. Do not make utility functions import views or secretly mutate stores. Search callers before changing a small `c`, and verify the largest composed store action after changes.

## Vben Admin extension

The same method applies to Vben Admin list/detail/form/drawer modules: `views/tables/drawers -> Pinia store action -> c-to-c utils/types -> API/Supabase`. Keep `useEntityForm` and Vben drawer lifecycle behavior in the view/composable layer, but keep query, permission, normalization, persistence, and refresh composition in the store boundary. Preserve exact spreadsheet action names and Inputs, use `$t()` for all Vben UI text, and retain cloned module shells when the data flow is reused.

# Cyroro dual-app Pinia and schema audit

Scope: `C:\Users\user\Desktop\trash-container-app`

Stable decisions from the final admin/driver audit:

- Both `web-admin-app` and `web-driver-app` use the same local Supabase project and `VITE_SUPABASE_SCHEMA=cyroro`. The immutable root `schema.sql` is reference-only and must not be edited.
- The Google Sheet `Trash` -> `Pinia` tab is the public contract: preserve exact `PiniaStore`, `Function`, and `Input` names and casing, including `getAllBinWIthOrder`. Do not rename a working action to make it prettier.
- Core contract stores are `useOrderStore`, `useDriverTaskStore`, `useBinStore`, `useDriverStore`, and `useHelperStore`. Core actions include `create`, `update`, `getDetail`, `getAllByDate`, `getOrderByCustomerIdForStatement`, `redirectWhatsapp`, `getLists`, `getAllBinWIthOrder`, `getCarTrackApi`, and `convertStringToDates`.
- Shared Input contracts are `OrderCreateInput`, `OrderUpdateInput`, `StatementInput`, `OrderDateRangeInput`, and `DriverTaskUpdateInput`. Keep public Inputs stable; map legacy public keys such as `driverId` and `binSizeId` to Cyroro `deliveryDriverId` and `binSizeType` at the store/util boundary.
- Store direction remains `views -> stores -> utils/types -> Supabase`. Use pure c-to-c helpers for normalization and payload mapping; keep API/Supabase calls in Pinia actions.
- Cyroro business tables used by the apps are `users`, `customers`, `orders`, `drivers`, `driver_tasks`, `bins`, and `attachments`. Cyroro does not contain `bin_sizes`, `customer_transactions`, `driver_withdrawals`, or driver bank-account tables; those page designs may remain but must not issue legacy queries or pretend to persist missing data.
- Driver task state is Cyroro `pending -> inProgress -> completed/cancelled`; order execution status is Cyroro-compatible and must not use `uploadingDeparturePhoto`.
- Debt is calculated from customer-linked orders: unpaid `paymentStatus` orders use `totalAmount`; paid and cancelled orders are excluded. `status=completed` describes execution, while `paymentStatus=paid` describes settlement.
- Map markers use order `latitude/longitude`, falling back to the related bin coordinates only when order coordinates are null. This is a display fallback, not a source-data mutation.
- The required CarTrack Store action invokes external Edge Function `cyroro-cartrack-vehicle-status` with `{ vehicleNo }`. A local 404 means the Edge Function is not deployed; it is not a missing Cyroro table and does not block pages that do not call it.
- Final verification standard for paired-app work: read the live Sheet contract, inspect both apps and current schema, run authenticated representative Cyroro reads, run `npm.cmd run type-check` and `npm.cmd run build` in both apps, and verify each localhost root returns HTTP 200. Report external/backend warnings separately.

Reference contract sheet: https://docs.google.com/spreadsheets/d/1vpmJ5dERvIAWwdRWbcqh72nQdGjM5xwLHV91y70Yu_Y/edit?gid=1483757173#gid=1483757173

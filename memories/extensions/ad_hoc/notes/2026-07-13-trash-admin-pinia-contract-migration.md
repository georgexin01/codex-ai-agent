# Trash admin Pinia contract migration

- Source of truth: Google Sheet `Trash`, `Pinia` tab. The exact public contract is five stores: `useOrderStore`, `useDriverTaskStore`, `useBinStore`, `useDriverStore`, and `useHelperStore`.
- Exact admin functions now include: `create`, `update`, `getDetail`, `redirectWhatsapp`, `getOrderByCustomerIdForStatement`, `getAllByDate`; `getLists`, `getDetail`, `update`; `getAllBinWIthOrder`; `getCarTrackApi`; and `convertStringToDates`.
- Exact casing matters, including the Sheet typo `getAllBinWIthOrder`.
- Admin order inputs use `OrderCreateInput`, `OrderUpdateInput`, `StatementInput`, and `OrderDateRangeInput`; driver-task updates use `DriverTaskUpdateInput`.
- C+C structure: pure payload/date/merge helpers live in `src/utils/*-store.ts`; stores own Supabase/RPC access; views call stores. Legacy plural store/action names were removed from admin callers.
- Added admin reusable store/type/util modules for order, driver task, bin, driver tracking, and date helpers without changing the Supabase schema.
- Verification: admin `npm run type-check` passed; admin `npm run build` passed; driver `npm run type-check` passed; localhost `5173` and `3000` returned HTTP 200. No old admin contract names remain in `src`.

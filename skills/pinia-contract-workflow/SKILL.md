---
name: pinia-contract-workflow
description: "Preserve exact PiniaStore, Function, and Input contracts for Vue TypeScript apps and Vben Admin panels by researching the project spreadsheet and reference stores before editing app code."
---

# Pinia Contract Workflow

Use this skill when a user asks to create, redesign, map, or consume an app or Vben Admin Pinia store from the `Trash` spreadsheet or the hotpot reference projects. The three spreadsheet columns `PiniaStore`, `Function`, and `Input` are a public naming contract and must be copied exactly.

The preferred construction model is `c-to-c` composition: small functions combine into medium functions, medium functions combine into Pinia actions, and Pinia actions remain the largest page-facing contract.

## Source order

1. Read the current project's app root, types/models, API client, auth store, target store, and calling pages.
2. Read the `Pinia` tab in the user's Google Sheet when access is available. Treat its exact `PiniaStore`, `Function`, and `Input` values as required names, not suggestions.
3. Use these reference projects for implementation shape:
   - `D:\project\hotpot\app-cashier-hotpot` — cashier app Pinia stores and role-aware page loading.
   - `D:\project\hotpot\admin-panel-hotpot` — admin app store patterns and CRUD refresh behavior.
   - `D:\project\hotpot\webApp-hotpot` — member-facing Vue app stores, auth-dependent loading, and parallel page fetches.
4. Prefer current project code and schema over the reference projects when data shape or security rules differ.

## Exact contract rule

- Preserve the spreadsheet store name exactly, such as `useOrderStore` and its exact Pinia id.
- Preserve every spreadsheet function name and casing exactly, such as `create`, `update`, `getDetail`, `getAllByDate`, or `getAllWithoutPagination`.
- Preserve the spreadsheet Input contract exactly. Do not rename `id`, date fields, IDs, request objects, or payload keys for convenience.
- If TypeScript needs a stronger type, add a type alias/interface while retaining the exact public function name and input shape.
- Do not silently add synonyms, aliases, renamed wrappers, or a second competing action name.

## Store structure

## `c-to-c` composition rule

Build behavior from the smallest reusable unit upward:

```text
utils: c + c + c -> small reusable utility
store: c(c + c) + c(c + c) -> Pinia action
page: useStore().Function(Input) -> page-facing contract
```

- A `c` function should do one small, testable job: normalize a payload, parse a date, build a query, map a row, format a value, or validate one boundary.
- Put reusable framework-independent `c` functions in `src/utils/`; put TypeScript contracts and row/payload shapes in `src/types/`.
- Compose utilities into store actions instead of duplicating their logic in pages or repeating large inline callbacks.
- Keep API/Supabase calls at the store boundary; utilities must not secretly mutate Pinia state or call pages.
- Keep the dependency direction easy to trace: `views -> stores -> utils/types`; a utility may be reused by stores, but a utility must not import a view.
- If a utility needs store/auth state, pass the required Input explicitly rather than importing a store globally; this keeps `c` functions reusable and testable.
- Do not over-split trivial one-line expressions or create circular utility/store dependencies. Composition reduces noise only when each `c` has one clear responsibility.
- Before changing a `c`, search its callers and verify every composed store action that depends on it.
- Document the composition at the store action boundary when the chain is non-obvious: `load -> normalize -> map -> assign`.

The spreadsheet still controls the largest public names. `c-to-c` changes the internal construction, not the exact `PiniaStore`, `Function`, or `Input` contract.

## Pinia and c-to-c quality principles

Apply these principles inside the stable public contract. They improve the implementation without changing the spreadsheet's store, function, or input names:

1. Keep every small `c` pure, deterministic, and independently testable.
2. Let Pinia coordinate the chain; pages should not assemble API, validation, normalization, and refresh logic.
3. Add typed Input and Result contracts. Stronger TypeScript types may be added internally without renaming the public Input.
4. Prevent repeated requests with loading guards, in-flight request deduplication, and targeted cache invalidation where the project supports it.
5. Separate read and write pipelines. Use CRUD (`create`, `read`, `update`, `delete`) when the domain supports it, but preserve the exact spreadsheet action when it uses names such as `getDetail`, `getLists`, or `getAllByDate`.
6. Make actions safe to retry: avoid duplicate writes, use idempotency or server-side uniqueness where available, and refresh state after a successful mutation.
7. Centralize error normalization so utilities, API clients, and views do not invent competing error shapes.
8. Keep database-to-frontend translation at the store boundary through typed c-to-c mappers; keep UI models camelCase and database models compatible with the current schema.
9. Expose selectors or computed projections instead of making every page depend on raw store state.
10. Test small c-to-c functions first, then test Pinia action orchestration and one visible caller.
11. Add short comments at store, action, and non-obvious c-to-c boundaries. Explain purpose, Input/Output, side effects, and composition order; do not narrate obvious syntax or create noisy comments.

Prefer the smallest safe performance improvement: deduplicate before caching, invalidate narrowly after writes, and never hide stale or permission-sensitive data behind a cache.

## Store relation binding and removal

Treat each Pinia store as a related package, not an isolated file. Bind these layers by searching the actual project before editing:

```text
store implementation
  -> src/types/<store>.ts contract file
  -> src/utils/*-store.ts c-to-c helpers
  -> src/stores/index.ts and src/types/index.ts barrel exports
  -> views/tables/drawers and composables that call the store
  -> tests, mocks, route loaders, and documentation
```

- Prefer direct imports from `src/types/<store>.ts` inside the store and its utilities; use barrel files for public convenience only.
- Keep shared entity types in `src/types/entities.ts` when more than one store uses them; do not delete shared types with one store.
- Before removing a store, build a relation inventory from imports, `use...Store()` calls, exact action names, utility imports, barrel exports, and test/mocks.
- When the user explicitly requests removal, remove the store implementation and only unused private type/helper/test files. Remove callers and barrel exports in the same change; retain any shared utility, entity type, or view used by another store.
- Never silently delete a related file merely because its filename matches. Check its callers first and report shared files that must remain or require a separate decision.
- After relation changes, verify no stale imports or exact contract references remain, then run type-check, build, and the nearest visible smoke test.

Use the project-compatible Pinia setup pattern:

```ts
import { defineStore } from 'pinia';

export const useOrderStore = defineStore('order', {
  state: () => ({
    orders: [] as Order[],
    order: {} as Order,
  }),
  actions: {
    async getDetail(id: string): Promise<Order> {
      // call the project's API/Supabase boundary
    },
    async create(input: OrderCreateInput): Promise<Order> {
      // preserve the exact spreadsheet Input contract
    },
    async update(input: OrderUpdateInput): Promise<Order> {
      // preserve the exact spreadsheet Input contract
    },
  },
});
```

The implementation may use options API or setup syntax only when the current project already uses that style. The exported `use...Store()` name, Pinia id, action names, and inputs remain stable.

## Page usage pattern

Pages instantiate the store once and call actions from lifecycle/fetch handlers:

```ts
const orderStore = useOrderStore();
const orders = ref<Order[]>([]);

const fetch = async () => {
  const orderData = await orderStore.getAllWithoutPagination();
  orders.value = orderData;
};

onMounted(fetch);
```

## Vben Admin usage

Apply the same contract and c-to-c model to Vben Admin list pages, detail pages, forms, and drawers:

- Vben views, tables, and drawers call Pinia actions; they do not call Supabase/API clients directly.
- Keep `useEntityForm` for scalar form state and pass the exact typed Input into the store action.
- Keep relation option loaders, payload normalization, row flattening, and permission checks as small reusable `utils/` or store helpers.
- Let the store action compose `load -> validate -> normalize -> persist -> refresh` rather than placing that chain in a Vben view.
- Preserve Vben table pagination/filter Inputs and return typed page results for `useVbenVxeGrid` or the project's existing grid wrapper.
- Keep drawer create/edit/reset behavior in the existing Vben composables and verify anti-double-submit, upload reset, relation refresh, and soft-delete behavior.
- Use `$t('...')` in Vben columns, form labels, drawer titles, messages, and route metadata; locale files remain outside the store contract.
- When a Vben module is cloned, preserve its shell and replace only the internal c-to-c data flow unless the user explicitly asks for a new module shape.

For independent data, follow the reference pattern:

```ts
const [orderData, memberData] = await Promise.all([
  orderStore.getAllWithoutPagination(),
  memberStore.getAllWithoutPagination(),
]);
```

For permission-dependent data, read `authStore` first and pass the exact required Input. Use `Promise.resolve([])` only when the established page pattern intentionally skips a role-restricted request.

## Auth and API boundaries

- Initialize or verify `authStore` before actions whose Input depends on the current user, member, merchant, outlet, or role.
- Keep API calls inside Pinia actions; pages call store actions, not the API client directly.
- Match the current project API client and response wrapper before writing a new request.
- Preserve loading/error behavior and return typed data so pages can assign results directly.
- After create/update/delete, refresh or invalidate cached arrays according to the existing store's behavior; do not invent a second cache policy.
- Keep UI-only state, upload wrappers, and dynamic form arrays out of the API Input unless the spreadsheet contract explicitly includes them.

## Editing boundary

When the user identifies one store, modify only that store's implementation block unless they explicitly ask for page/type/API changes. In particular, for:

```ts
function useOrderStore() {
  // edit only this contract/implementation area
}
```

Preserve unrelated store actions and existing callers. Before changing a function name or Input, search all usages and compare against the spreadsheet first.

## Verification gates

1. Search the repository to confirm the exact `PiniaStore`, `Function`, and `Input` names exist.
2. Read back the edited store and at least one calling page.
3. Run the nearest TypeScript check/build.
4. Verify the page action receives the intended Input and returns the expected Output.
5. For auth-dependent actions, verify the logged-in role/member context and fail safely when unavailable.

Do not claim the contract is complete until the store and at least one caller use the exact spreadsheet names.

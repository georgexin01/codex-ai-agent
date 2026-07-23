---
name: vue-pinia-naming-reference
description: "Tier-0 naming reference for Vue 3, TypeScript, Pinia stores, page functions, API clients, variables, routes, and typed Inputs/Outputs. Derived from the hotpot Vue projects and normalized into safe defaults for future code generation."
triggers: ["Vue naming", "Pinia naming", "store naming", "function naming", "API naming", "camelCase", "useStore", "PiniaStore Function Input"]
phase: constitutional
priority: tier-0
model_hint: medium
status: authoritative
date_updated: "2026-07-17"
---

# Vue 3 + TypeScript + Pinia Naming Reference

This is the high-priority naming reference for future Vue 3 and TypeScript work. It was derived from representative files in:

- `D:\project\hotpot\webApp-hotpot`
- `D:\project\hotpot\admin-panel-hotpot`
- `D:\project\hotpot\app-cashier-hotpot`

The hotpot projects provide real naming evidence, not a contract to copy blindly. Current project files, live schema/API contracts, user-provided names, and the exact `PiniaStore` / `Function` / `Input` source always have precedence.

## 1. Mandatory precedence

Apply naming decisions in this order:

1. Security, framework validity, and current runtime behavior.
2. Exact user, spreadsheet, API, database, route, or public contract names.
3. Existing names used by callers and tests.
4. This reference's recommended naming defaults.
5. Generic CRUD or framework habits.

Never rename a working public symbol only because this reference recommends a different name. Never add a renamed alias silently. If the contract source is unavailable, report `INSUFFICIENT DATA` instead of guessing.

## 2. Core casing contract

| Area | Required style | Examples |
|---|---|---|
| Vue/TypeScript variables | camelCase | `userName`, `selectedVehicle`, `loading` |
| Functions and methods | camelCase | `fetchUser`, `getById`, `updateUser` |
| Pinia composable export | `use<Entity>Store` | `useAuthStore`, `useProfilesStore` |
| Pinia local instance | domain camelCase + `Store` | `authStore`, `profilesStore`, `ordersStore` |
| Pinia state/getters/actions | camelCase | `currentUser`, `activeVouchers`, `fetchUser` |
| Components and component files | PascalCase | `UserCard.vue`, `BookingForm.vue` |
| Interfaces, types, classes, enums | PascalCase | `User`, `UserCreateInput`, `VehicleStatus` |
| API client/service instances | camelCase | `apiClient`, `apiService`, `authService` |
| API method names | camelCase verb + domain | `getUser`, `createBooking`, `updateProfile` |
| Route names | existing project contract; otherwise PascalCase | `Login`, `BookingDetails` |
| URL paths | existing contract; otherwise lowercase kebab-case | `/booking-details`, `/user-profile` |
| Database/API payload fields | preserve live contract | `snake_case` stays `snake_case` at the boundary |

`lowerUpper`, `lowerUpperUpper`, and longer names all mean one consistent camelCase sequence: the first word begins lowercase and every following word begins uppercase. Do not mix snake_case, kebab-case, PascalCase, and camelCase inside one frontend identifier family.

## 3. Pinia store naming formula

For a new domain store, use:

```text
composable export: use<Entity>Store
Pinia id:          <entity> or the established project id
local instance:    <entity>Store
single state:      <entity>
collection state:  <entities>
```

Examples:

```ts
export const useUserStore = defineStore('user', { ... });
export const useBookingStore = defineStore('booking', { ... });

const userStore = useUserStore();
const bookingStore = useBookingStore();
const bookings = ref<Booking[]>([]);
```

For a domain whose normal page operation is a collection, a plural local instance is acceptable when it improves clarity and remains consistent:

```ts
const ordersStore = useOrderStore();
```

Prefer the singular store composable (`useOrderStore`) for the domain entity. Do not create both `useOrderStore` and `useOrdersStore` for the same domain unless separate public contracts prove they represent different resources.

### Store naming lessons from hotpot

Recommended and repeatedly supported:

```text
useAuthStore              -> authStore
useMemberStore            -> memberStore
useMerchantStore          -> merchantStore
useOutletStore            -> outletStore
useMemberVoucherStore     -> memberVoucherStore
useVoucherForRedeemStore  -> voucherForRedeemStore
```

Observed but not a new default:

```text
useVouchersStore          # plural store export
useOutletsStore           # plural store export
usePurchaseStore          # Pinia id differs: 'lookup'
```

These are compatibility examples only. Preserve them when they are already public and called. Do not reproduce their inconsistency for a new store without a documented reason.

## 4. Store action naming

Choose the verb from the operation's actual behavior:

| Operation | Preferred action names | Meaning |
|---|---|---|
| Remote/API load | `fetchUser`, `fetchAllDrivers`, `fetchAvailableVouchers` | Performs an external read and usually updates store state |
| Local/read selector | `getUser`, `getById`, `getByMobilePhone`, `getList` | Reads one or more records or selects state |
| Unpaginated collection | `getAll`, `getAllWithoutPagination` | Returns the complete collection when that is the contract |
| Create/insert | `createUser`, `addUser` | Creates a new record; preserve the project's chosen verb |
| Update one | `updateUser`, `update` | Mutates one record; exact public contract wins |
| Update many | `updateUsers`, `bulkUpdateUsers` | Mutates multiple records; use only when genuinely plural |
| Delete/remove | `deleteUser`, `removeUser` | Permanently or logically removes a record |
| Initial store setup | `init`, `initializeStore`, `loadInitialData` | Hydrates default/reference state |
| Authentication | `login`, `logout`, `verifyOTP`, `refreshSession` | Auth/session operations |
| State-only mutation | `setUser`, `clearUser`, `resetForm` | Does not imply an API request |
| Domain validation/check | `checkIsFavourite`, `canClaimVoucher`, `isSessionExpired` | Returns a check or computed decision |

Rules:

- `fetch` implies a remote or asynchronous load; do not use it for a pure array filter.
- `get` implies a read/select; it does not automatically imply an API request.
- Use `getById`, not ambiguous `getDetail`, when the actual Input is one identifier and the project has no established `getDetail` contract.
- Use `getAll` only when all records are returned; use `getList` for a list with filters or pagination; use `getListWithoutPagination` when that exact contract matters.
- Use singular nouns for one record and plural nouns for a real collection or bulk operation.
- Do not mix `fetchUsers`, `getAllUsers`, `getUsersList`, and `listUsers` for the same operation. Select one accurate name and reuse it across store, page, API, mock, and test.
- Preserve intentional public names such as `create`, `update`, `delete`, `getAll`, or `getById` when they are already the contract.

## 4.1 Admin-panel-hotpot CRUD contract

When the target is an admin panel with the `admin-panel-hotpot` structure, use this more specific convention after checking the current store and callers:

### Store module

```ts
// src/stores/article.ts
export const useArticleStore = defineStore('article', {
  state: () => ({
    articles: [] as Article[],
    article: {} as Article,
    apiPath: '/articles.php',
    pagination: {} as Pagination,
  }),
  actions: {
    async getAll(): Promise<{ articles: Article[]; pagination: Pagination }> { ... },
    async getAllWithoutPagination(): Promise<Article[]> { ... },
    async getById(id: number): Promise<Article> { ... },
    async create(req: ArticleRequest): Promise<Article[]> { ... },
    async update(req: Article): Promise<Article> { ... },
    async delete(id: number): Promise<Article[]> { ... },
  },
});
```

Admin-panel rules:

- Store source files use a singular domain filename in camelCase: `article.ts`, `memberGroup.ts`, `merchantCard.ts`, `menuItem.ts`.
- Admin pages normally import the store from its direct module path, such as `@/stores/article` or `@/stores/memberGroup`, and import models from `@/model/...`; follow a barrel export only when the current app already uses one.
- Store exports use the singular entity form: `useArticleStore`, `useMemberGroupStore`, `useMerchantCardStore`, `useMenuItemStore`.
- The Pinia id normally matches the singular filename/domain: `'article'`, `'memberGroup'`, `'merchantCard'`, `'menuItem'`. Preserve a different existing id when callers depend on it.
- Store state uses the singular entity for one record and the plural entity for a collection: `article` and `articles`, `memberGroup` and `memberGroups`.
- Keep `apiPath` for the store's endpoint path when that is the current project convention. Do not rename it to `apiUrl` or `endpoint` in an existing store without an explicit migration.
- Keep `pagination` as the standard paginated state object and use the project's `Pagination` type.
- `getAll()` is the paginated list contract and normally returns an object keyed by the plural domain plus `pagination`, such as `{ articles, pagination }`.
- `getAllWithoutPagination()` returns the complete list and is used for relationship/reference dropdown data.
- `getById(id)` reads one record by identifier. Preserve `getDetail` or another exact contract if the current store already uses it.
- `create(req)`, `update(req)`, and `delete(id)` are the established CRUD action names in this admin panel. The `req` parameter name is an observed store convention; the typed public Input is more important than the short parameter name.
- After `create`, `update`, or `delete`, refresh the relevant collection or update it according to the existing store behavior. Do not invent a second refresh action name.
- Store actions own API calls and state assignment. Pages call stores; pages do not call `apiClient` directly.

### Admin table page

Use the resource directory in plural camelCase and retain the existing generic page filenames:

```text
src/pages/articles/table.vue
src/pages/articles/form.vue
src/pages/memberGroups/table.vue
src/pages/memberGroups/form.vue
src/pages/merchantCards/table.vue
src/pages/merchantCards/form.vue
```

The standard table setup names are:

```ts
const articleStore = useArticleStore();
const articles = ref<Article[]>([]);
const pagination = ref<Pagination>();
const isLoadingTable = ref(true);
const isFormLoading = ref(false);
const isEdit = ref(false);
const isOpenModal = ref(false);
const currentArticle = ref<Article | null>(null);
const authStore = useAuthStore();

const fetch = async () => { ... };
const showModal = (article: Article | null = null) => { ... };
const handleOk = async (formState: ArticleRequest | Article) => { ... };
const handleDelete = async (id: number) => { ... };
```

Use the exact resource noun in `current<Entity>`, collection variables, callback parameters, and store instance names. For example, use `currentMemberGroup`, `memberGroups`, and `memberGroupStore`, not `currentData`, `items`, and `store`.

### Admin form page

The standard form setup names are:

```ts
const props = defineProps({ ... });
const loading = ref(false);
const formRef = ref();
const formState = reactive<ArticleRequest | Article>({ ... });

const resetForm = () => { ... };
const handleOk = async () => { ... };
const validateForm = () => { ... };
```

Related dropdown data follows `<entity>s`, `<entity>Loading`, and `<entity>Store`:

```ts
const corporates = ref<Corporate[]>([]);
const corporateLoading = ref(false);
const corporateStore = useCorporateStore();
const merchants = ref<Merchant[]>([]);
const merchantLoading = ref(false);
const merchantStore = useMerchantStore();
const outlets = ref<Outlet[]>([]);
const outletLoading = ref(false);
const outletStore = useOutletStore();
```

When data is independent, the admin panel commonly loads it with `Promise.all`. When access depends on `authStore.role`, keep the role condition visible and use the established empty-result fallback rather than silently requesting forbidden data.

### Admin model and response naming

Admin-panel model files commonly use a resource response suffix and PascalCase types:

```text
src/model/articleResponse.ts
Article
ArticleRequest
ArticlesResponse
```

Use `EntityRequest` for create/update form payloads, `EntitiesResponse` for list transport wrappers, `EntityResponse` for one-record transport wrappers, and `Pagination` for list metadata. Preserve existing model filenames and exact exported types when they are already imported by stores/pages.

## 5. Page and view variable naming

Use variables that describe the value and its cardinality:

```ts
const member = ref<Member>();
const members = ref<Member[]>([]);
const currentMember = ref<Member | null>(null);
const selectedMemberId = ref<number | null>(null);
const memberStore = useMemberStore();
const memberLoading = ref(false);
const isFormLoading = ref(false);
const isOpenModal = ref(false);
const canSubmit = computed(() => ...);
```

Recommended prefixes:

- `is...`, `has...`, `can...`, `should...`, `show...`, `hide...` for booleans.
- `current...`, `selected...`, `active...`, `default...`, `initial...` for state roles.
- `...Id` for identifiers, `...Ids` for identifier collections.
- `...List` only when the value is intentionally a list and the domain noun is otherwise unclear.
- `...Loading`, `loading`, `...Error`, and `errorMessage` for request state.
- `formRef`, `formState`, `formData`, `queryParams`, `route`, and `router` for established framework concepts.

Avoid vague names such as `data`, `item`, `obj`, `value`, `store`, `temp`, or `result` when the domain is known. A short local callback variable such as `item` is acceptable only inside a narrow loop where its type and meaning are obvious.

## 6. Page function and handler naming

Page functions use camelCase and describe the user action or data flow:

```ts
const fetch = async () => { ... };
const fetchMember = async () => { ... };
const handleSubmit = async () => { ... };
const handleDelete = async (id: number) => { ... };
const handleOk = async () => { ... };
const openModal = () => { ... };
const closeModal = () => { ... };
const resetForm = () => { ... };
const addDateAndTimeRow = () => { ... };
const removeDateAndTimeRow = (index: number) => { ... };
const getPlatform = (platform: SocialMediaPlatform) => { ... };
```

Use:

- `fetch...` for loading page data from stores/API.
- `handle...` for event handlers or button/form actions.
- `open...` / `close...` for UI visibility.
- `reset...` for restoring initial UI state.
- `add...` / `remove...` for collection edits.
- `get...` for pure lookup/formatting functions.
- `validate...` for functions that validate and return a validation result.
- `build...` / `map...` / `normalize...` for pure transformation functions.
- `start...` / `stop...` for polling, timers, scanning, or subscriptions.

Avoid one generic `fetch` function when a view loads several unrelated domains; use `fetchMemberData`, `fetchVoucherData`, or a documented `loadPageData` orchestration function when that improves traceability. Existing hotpot views use `fetch`; preserve it when already established, but choose the more descriptive name for new complex pages.

## 7. Async lifecycle and store usage pattern

Instantiate stores near the top of the page setup block. Keep loading and error state explicit. Use `try/finally` whenever a local loading flag surrounds awaited work:

```ts
const authStore = useAuthStore();
const profilesStore = useProfilesStore();
const loading = ref(false);

onMounted(async () => {
  loading.value = true;
  try {
    await authStore.fetchUser();
    await profilesStore.fetchAllDrivers();
  } finally {
    loading.value = false;
  }
});
```

The exact lesson is the naming relationship and visible dependency order, not a mandatory copy of these entities or actions. Adapt the Input, error handling, auth requirements, and concurrency to current project evidence.

For independent requests, use clear collection names and parallel loading:

```ts
const [memberData, outletData] = await Promise.all([
  memberStore.getAll(),
  outletStore.getAll(),
]);
```

For dependent requests, keep the prerequisite first and name the dependency explicitly:

```ts
await authStore.fetchUser();
await profilesStore.fetchAllDrivers();
```

## 8. API client, service, and endpoint naming

Use one obvious API boundary per project:

```ts
const apiClient = axios.create({ ... });
const apiService = new ApiService();
const authService = new AuthService();
```

Recommended separation:

- `apiClient`: configured HTTP client/interceptors only.
- `apiService`: domain service facade when the project uses a service class.
- `authService`: auth-specific service facade.
- Pinia actions: application state coordination and store assignment.
- `src/utils/`: pure mapping, validation, formatting, and query helpers.

Do not make pages call Axios/fetch directly when the project convention places API calls in Pinia actions or services. Keep endpoint paths and backend field casing exactly at the API boundary. Name endpoint methods by domain and operation: `getMember`, `getMemberById`, `createBooking`, `updateBooking`, `deleteBooking`, `sendOtp`, `verifyOtp`.

If the backend endpoint has a legacy name such as `sendOTP.php` or `verifyOTPForRegistrations.php`, preserve the path string. The frontend function may follow the established contract (`sendOTP`, `verifyOTPForRegistration`) until a separate migration is explicitly requested.

## 9. Types, Inputs, Outputs, and payloads

Use PascalCase type names with explicit role suffixes:

```ts
type UserCreateInput = ...;
type UserUpdateInput = ...;
type UserQueryInput = ...;
type UserResponse = ...;
type UsersResponse = ...;
type UserListResult = ...;
```

Prefer `Input` for action/page input, `Request` when the API contract calls it a request, `Response` for a transport response, and `Result` for a normalized application result. Do not rename an existing public type just to satisfy this preference.

Keep these distinct when the project needs them:

```text
User              domain/UI entity
UserCreateInput   fields needed to create
UserUpdateInput   fields allowed to update
UserQueryInput    filters/pagination/search
UserResponse      raw API response wrapper or API entity
```

Map database/API fields at the store or API boundary. Do not silently change `snake_case` payload keys that the backend requires. Use camelCase for frontend state only when the current project mapping supports it.

## 10. Files, routes, and module structure

Recommended new-file defaults:

```text
src/stores/user.ts
src/types/user.ts
src/api/userApi.ts
src/services/userService.ts
src/utils/user.ts
src/composables/useUser.ts
src/pages/users/table.vue
src/pages/users/form.vue
src/views/UserListView.vue
src/components/UserCard.vue
```

Use the project's established folder and filename convention when it already exists. Hotpot demonstrates both resource files (`member.ts`) and feature folders (`pages/memberGroups/table.vue`), so do not reorganize folders during a naming-only task.

For route metadata, keep code keys camelCase, route names stable, and visible titles in intentional human wording. Route paths should describe the resource and remain compatible with existing links.

## 11. Observed hotpot exceptions and quality warnings

The reference projects include useful working patterns and also legacy drift. Treat these as audit findings, not defaults:

- duplicate or backup files such as `auth copy.ts`, `CardDetail copy.vue`, and `CashierHub_bk.vue` are not naming references;
- singular/plural store exports vary (`useOutletStore` vs `useOutletsStore`, `useVoucherStore` vs `useVouchersStore`);
- a store file/export may use a Pinia id unrelated to the entity (`usePurchaseStore` with `lookup`);
- some page loaders are generically named `fetch`, while complex pages also use descriptive functions such as `fetchMember`;
- some legacy state/API fields retain `snake_case` while newer frontend fields use camelCase;
- direct `useStore().action()` calls exist, but a named local store instance is preferred when a page uses the store repeatedly.

Preserve these exceptions when callers depend on them. For new code, use the normalized rules in Sections 2–10.

## 12. Naming-generation algorithm

Before inventing a name, answer these questions:

1. What is the domain noun? (`user`, `memberVoucher`, `booking`)
2. Is the value singular or a collection? (`member` vs `members`)
3. Is this a store, page function, API method, type, variable, route, or payload key?
4. Is the operation remote fetch, local read, create, update, delete, transform, validation, or UI event?
5. Does an exact public contract already exist?
6. Which callers, types, and API paths already use the name?
7. Does the proposed name remain consistent across store, page, API, mock, and test?

Then search the repository, select the smallest accurate camelCase/PascalCase name, preserve exact contracts, and verify the symbol plus one caller with TypeScript/build checks.

## 13. Compact checklist

- [ ] `use<Entity>Store` export is used for a new Pinia domain.
- [ ] Local instance follows `<entity>Store` and is not vague.
- [ ] Action verb accurately describes remote/read/write/UI behavior.
- [ ] Singular/plural noun matches the real cardinality.
- [ ] Page variables use domain-specific camelCase names.
- [ ] Components/types/interfaces use PascalCase.
- [ ] API client/service names are separated from Pinia state coordination.
- [ ] Existing `PiniaStore`, `Function`, `Input`, API, database, and route contracts were searched and preserved.
- [ ] Backup/legacy files were not treated as new naming standards.
- [ ] Exact symbol and at least one caller were read back and type-check/build verification was run.

---
Vue + Pinia Naming Reference — Tier-0, derived from hotpot evidence and normalized for future AI generation // 2026-07-17

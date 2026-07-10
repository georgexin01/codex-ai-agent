# Pinia Store Relation Binding

Treat each Pinia store as a bound reusable package: store implementation, `src/types/<store>.ts`, `src/utils/*-store.ts` c-to-c helpers, barrel exports, view/table/drawer callers, composables, tests, mocks, route loaders, and documentation. Prefer direct store-specific type imports while keeping shared entities in `src/types/entities.ts`.

For an explicit store-removal request, Codex should inventory actual imports and callers, remove the implementation plus unused private types/helpers/tests/callers/barrel exports together, and retain shared files still used elsewhere. Never delete by filename alone. Finish with stale-import search, type-check, build, and a visible smoke test.

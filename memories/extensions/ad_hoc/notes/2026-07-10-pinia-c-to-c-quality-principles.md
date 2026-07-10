# Pinia and c-to-c Quality Principles

Use these as high-priority implementation rules for the user's Pinia stores and reusable c-to-c functions. Keep the public `PiniaStore`, `Function`, and `Input` cards unchanged while improving the inside: pure small functions, Pinia orchestration, typed Input/Result contracts, request deduplication, separate read/write pipelines, retry-safe CRUD mutations, centralized errors, store-boundary database translation, selectors, and tests from small c upward.

CRUD is a good internal model when the domain supports create/read/update/delete, but the spreadsheet's exact action names always win (`getDetail`, `getLists`, `getAllByDate`, and similar names must not be silently renamed). Add short comments at store, action, and non-obvious c-to-c boundaries describing purpose, Input/Output, side effects, and composition order so humans and AI can trace behavior deeper without reading noise.

For performance, deduplicate in-flight requests before adding caches, invalidate only affected state after writes, and avoid caching stale or permission-sensitive data. Verify with exact-name search, c-to-c unit tests, Pinia orchestration tests, TypeScript checks, builds, and one visible caller smoke test.

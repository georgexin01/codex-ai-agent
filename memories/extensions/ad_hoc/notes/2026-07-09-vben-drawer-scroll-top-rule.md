Vben admin drawer rule:

- Any CRUD drawer or module shell should reopen at the top scroll position.
- Apply the reset on open, on opened, and after nested content mount when needed.
- Special-case drawers launched directly from booking flows should also clear any persisted mount state on close so reopening starts fresh.
- Prefer a shared scroll reset helper for all modules instead of one-off per-screen fixes.

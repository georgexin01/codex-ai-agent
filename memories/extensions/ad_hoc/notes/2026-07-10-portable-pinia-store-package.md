# Portable Pinia Store Package Rule

The completed `web-driver-app` Pinia implementation is a reusable reference package for future apps in the same product/domain family. When another app has compatible tables, auth context, API/Supabase boundaries, and TypeScript models, Codex may copy the `stores/`, related `utils/`, and `types/` implementation as a starting point instead of rebuilding the Pinia layer from zero.

Keep the public cards stable: exact `PiniaStore`, `Function`, and `Input` names remain the page-facing contract. Reuse is allowed inside the implementation, but Codex must compare the target app's schema, environment variables, auth roles, response shapes, route Inputs, and existing callers before copying. Adapt only incompatible internals and preserve the c-to-c direction: `views/tables/drawers -> stores -> utils/types -> API/Supabase`.

When a same-project app needs the same behavior, prefer copying the complete store package together with its c-to-c helpers and types, then run exact-name search, TypeScript check, build, and a visible page smoke test. Do not copy blindly across unrelated schemas or silently rename contract actions.

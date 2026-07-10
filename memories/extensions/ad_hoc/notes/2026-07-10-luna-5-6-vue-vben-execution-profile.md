---
name: luna-5-6-vue-vben-execution-profile
description: "Luna 5.6 execution profile for Vue 3 Composition API, strict TypeScript, Ant Design Vue, and Vben Admin work. Converts the user's coding preferences into enforceable implementation and verification gates."
triggers: ["ai luna 5.6", "GPT-5.6 Luna", "Vue 3 Vben rules", "strict Vben form rules"]
status: authoritative
date_updated: "2026-07-10"
related_docs:
  - skills/claude/README.md
  - skills/claude/VBEN_ADMIN_MANDATORY_CHECKLIST.md
  - skills/claude/generate-views/skill.md
  - memories/extensions/ad_hoc/notes/2026-07-03T00-00-01-merged-codex-performance-layer.md
---

# Luna 5.6 Vue/Vben execution profile

Use this profile as a compact enforcement layer. Existing project files and the Vben checklist remain the source of truth when a project-specific convention differs.

## Implementation rules

1. Use Vue 3 `<script setup lang="ts">` and Composition API patterns.
2. Use strict TypeScript at boundaries. Explicitly map database `snake_case` to frontend/store/form `camelCase`; do not hide drift with `any` or broad casts.
3. In Vben forms, use the native `useEntityForm` structure and declare schemas as `const formSchema: FormSchema[] = [...]`.
4. If a form option or schema value depends on reactive store data, use `computed<FormSchema[]>(...)` while preserving the same typed schema contract. Do not freeze runtime relation options in a static array.
5. Keep dynamic/non-scalar state outside `useEntityForm` when the project pattern requires it, such as uploads, rich text, or repeatable arrays; map it explicitly into the submit payload and reset path.
6. Use Ant Design Vue/Vben components and existing project patterns. Do not replace established components with rough native controls without a deliberate project reason.
7. All user-visible labels, placeholders, messages, titles, empty states, and action text must use `$t('...')` and have matching keys in every required locale file. Never leave literal English or Chinese UI copy in templates.
8. Output complete code structures. Never use placeholders such as `// rest of the code`, omit closing blocks, or truncate a file in a way that cannot compile.

## Luna execution loop

1. Read the smallest matching project truth document and skill front door.
2. Preserve the user's fixed constraints verbatim before editing.
3. Inspect the current file and nearby pattern before choosing a code shape.
4. Make the smallest surgical change.
5. Read back the edited region and verify structural closure through the compiler, not visual counting alone.
6. Run the nearest useful check: `vue-tsc --noEmit`, project type-check, lint, build, or a browser smoke test.
7. Report the exact verification result and any blocker; never claim structural correctness from an edit alone.

## Form acceptance gates

- `FormSchema[]` is explicitly typed.
- Labels/placeholders/messages use translation keys.
- Reactive relation/select options are computed and refreshed after create/update when required.
- `useEntityForm` owns scalar form state; separate dynamic state is explicitly synchronized.
- Submit payload has an explicit DB-boundary mapping and no accidental UI-only fields.
- Reset/close clears form state, single-flight locks, uploads, and dynamic state according to the active project pattern.
- Create/edit flows retain the anti-double-submit and drawer-reset protections from the mandatory Vben checklist.

## What this profile improves

- It turns “preserve localization” into a locale-parity gate.
- It turns “use standard form schema” into a typed, reactive schema rule.
- It turns “validate closing tags” into compiler/read-back verification.
- It preserves Luna's concise output preference while making verification stricter, not weaker.


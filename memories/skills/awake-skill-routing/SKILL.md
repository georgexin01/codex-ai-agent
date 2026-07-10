---
name: awake-skill-routing
description: Use when work starts in a `.codex`-managed project and you need the smallest reliable boot read, a quick project fingerprint, and the right skill family kept awake across related follow-up work.
user-invocable: false
allowed-tools:
  - Read
  - Grep
---

# Awake Skill Routing

## When to use

Use this when the task is inside a project that relies on `.codex` knowledge routing and you need to decide what to read first without doing a full tree scan.

Do not use this for one-off file edits that already name the exact target files, or when the user explicitly asks for a full repo audit.

## Inputs / context to gather

1. Confirm the current project root and whether a `.codex` knowledge entrypoint exists.
2. Identify the request type in plain language, such as app build, website/backend work, or general Claude workflow work.
3. Gather a small project fingerprint from existing route hints, naming, or a tiny targeted read.

## Procedure

1. Start with the smallest boot read:
   - Read `.codex` knowledge only as a compact routing entrypoint.
   - Do not expand into a full tree scan unless the routing entrypoint fails to identify the project area.
2. Build or confirm a small project fingerprint:
   - project name
   - repo type or stack
   - likely skill family
3. Wake only the matching skill family for the current request:
   - `skills/claude`
   - `skills/claude-website`
   - `skills/claude-app`
   - or another clearly matching family already routed by the project
4. Read only the front door or minimum required files for that skill family before doing task work.
5. Keep the matching skill awake through later turns and later chats for the same project while the work stays in that area.
6. Re-check the awake set at the start of each new request:
   - if the project and task family still match, reuse the same awake skill
   - if focus changed, switch to the new matching family
7. Put a skill back to sleep only when the related work is done or the user changes focus.

## Efficiency plan

1. Prefer one small routing read plus one project fingerprint over repeated broad exploration.
2. Load only the skill family needed for the current request; do not read unrelated skills "just in case."
3. Reuse the current awake skill choice across follow-up work in the same project instead of re-discovering it every turn.
4. Stop the routing pass once you can state the project fingerprint and chosen skill family confidently.

## Pitfalls and fixes

- Symptom: booting turns into a large knowledge scan before any real work starts.
  Fix: fall back to the compact `.codex` entrypoint and a tiny fingerprint read; do not recurse through unrelated knowledge paths.

- Symptom: multiple skill families get loaded for one request and context cost spikes.
  Fix: choose the one family that matches the current task best and defer all others unless the request clearly crosses boundaries.

- Symptom: a later request in the same project repeats the same routing discovery work.
  Fix: re-check the awake set first and keep the already-matching skill awake until the user changes focus.

## Verification checklist

1. The route started from a compact `.codex` knowledge read rather than a broad tree scan.
2. A short project fingerprint is identifiable from the routing pass.
3. Exactly one primary skill family is awake for the current request unless the task truly spans multiple areas.
4. The response or working notes make it clear why unrelated skills were not loaded.

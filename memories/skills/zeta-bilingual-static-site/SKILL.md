---
name: zeta-bilingual-static-site
description: Maintain or verify the Zeta Software English/Simplified-Chinese static site, including generated pages, data parity, localhost checks, and source-faithful visual reuse.
argument-hint: "[task or route]"
user-invocable: false
allowed-tools:
  - Read
  - Grep
  - Bash
---

# Zeta Bilingual Static Site

## When to use

Use for work in `D:\backup\website-zetasoftware` involving English/CN parity, static generators, FAQ/blog JSON, navigation, local serving, image loading, or screenshot-accurate reuse.

Do not use as authority for production deployment, browser visual approval, or unfinished migrations; establish those from current evidence.

## Inputs / context to gather

1. Read `README.md`, `status.md`, `meta.md`, and the task-relevant generator/data file.
2. Identify the English source and matching `cn/` output/data surface.
3. Determine whether the task changes generated files, dynamic JSON rendering, or static HTML.
4. For image work, inventory references in HTML, JS, JSON, and CSS before changing sources/deleting assets.

## Procedure

1. Make the smallest change in the canonical source. Preserve unrelated descriptions, images, CSS, routes, and page content.
2. Update the Chinese counterpart with the same structure and localized visible text.
3. If a generator is involved, update the generator/source data first, regenerate its output, and inspect output rather than patching only generated pages.
4. For FAQ/blog data, parse JSON and check record count, unique IDs/slugs, paired English/CN IDs, image paths, and renderer/schema/fallback alignment.
5. For exact visual parity, reuse existing canonical DOM classes/structure and dimensions; do not create a look-alike replacement.
6. Serve static files with `php -S 127.0.0.1:8080 -t <workspace>` when no appropriate server is already running, then check representative English/CN URLs with HTTP requests.
7. Run relevant `node --check` commands and `git diff --check`. Record browser/deployment verification separately when it was not performed.

## Efficiency plan

1. Read only the matching data, renderer, generator, and paired pages after the project docs.
2. Batch paired-language checks and representative route checks.
3. Stop before deletion when source-reference or runtime validation is incomplete.

## Pitfalls and fixes

- Symptom: English is correct but Chinese diverges. Fix: compare paired IDs, titles, visible fallback content, and matching routes before completion.
- Symptom: a generated page has empty navigation. Fix: ensure its generator renders/invokes `scripts/update-site-navigation.js`, regenerate, then inspect output.
- Symptom: PowerShell suggests Chinese mojibake. Fix: use UTF-8-aware Node/file-byte inspection before changing content.
- Symptom: bulk image migration appears ready. Fix: confirm every reference and replacement file first; do not delete WebPs based on a partial search.
- Symptom: local server listens but pages are not proven. Fix: request representative routes; a listener alone is not a pass.

## Verification checklist

1. English and CN source/output surfaces match structurally and localize visible content.
2. JSON, syntax, duplicate/pair checks, and renderer/schema/fallback checks relevant to the edit pass.
3. Representative English and CN routes return expected HTTP responses.
4. `git diff --check` passes.
5. Any unperformed browser, production, or destructive-asset gate is stated as incomplete.

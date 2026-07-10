---
name: static-site-metadata-sweep
description: Use when the user asks to change "all meta related text", homepage title/description copy, or branding across SEO/social tags in a static marketing site.
argument-hint: "[brand-or-copy-target]"
user-invocable: false
allowed-tools:
  - Read
  - Grep
---

# Static Site Metadata Sweep

## When to use

Use this when the user wants homepage metadata updated consistently across HTML head tags and the web manifest, especially for branding or SEO copy changes.

Do not use this when the request is a full site rebrand that clearly includes URL slugs, domain changes, or asset renames; in that case, use this only for the metadata portion and explicitly check broader scope.

## Inputs / context to gather

1. Capture the exact old string and exact new string if the user provided them.
2. Confirm whether the request is:
   - a straight brand rename
   - fuller title/description copy
   - a broader rebrand that might also affect URLs or filenames
3. Locate the real homepage entry file.
4. Check whether the repo also has a manifest file such as `site.webmanifest`.

## Procedure

1. Search the repo for the exact old brand or title string first with a literal search such as `rg -n -F "<old string>" .`.
2. Open the homepage entry file and identify the metadata block.
3. Update the branding/copy consistently across:
   - `<title>`
   - `meta name="author"`
   - `meta name="application-name"`
   - `meta name="apple-mobile-web-app-title"`
   - `meta name="keywords"`
   - `meta name="description"`
   - relevant `og:*` tags
   - relevant `twitter:*` tags
4. If a manifest exists, update `name` and `short_name` or the equivalent app-name fields.
5. Decide explicitly whether canonical URLs, OG image paths, or asset filenames are metadata-only identifiers that should stay unchanged or whether the user wants them renamed too.
6. Re-run a literal search for the old string or old copy fragments to confirm they are gone from the intended files.
7. Read back the edited head section or targeted metadata lines once before finishing.

## Efficiency plan

1. Start with literal `rg -F` searches; they are faster and safer than building a complex regex for HTML tags in PowerShell.
2. Search for the old brand string first, then only inspect the files that actually contain it.
3. Stop exploring once `index.html` and the manifest clearly hold the live metadata; avoid drifting into unrelated content files unless the search proves they are part of the same brand surface.

## Pitfalls and fixes

- Symptom: `rg` fails with a regex parse error such as `unclosed group`.
  Fix: switch to `rg -F` or a simpler literal pattern instead of pushing the regex harder.

- Symptom: the page title changed but social share/install metadata is still inconsistent.
  Fix: patch the full head metadata set plus the manifest, not just `<title>` and one description field.

- Symptom: old branding still appears in search results after the edit.
  Fix: re-run a literal search for the old string and inspect any remaining matches before finishing.

- Symptom: the request says `all meta related text`, but URLs or asset filenames still contain the old brand.
  Fix: ask whether those identifiers are in scope for a full rebrand; do not silently rename them if the prior request only targeted metadata.

## Verification checklist

1. The exact requested brand/copy string appears in the intended metadata fields.
2. The homepage metadata and manifest naming stay consistent with each other.
3. A literal search for the old brand or old copy fragments returns no in-scope matches.
4. The final readback confirms the head metadata block was updated consistently rather than partially.

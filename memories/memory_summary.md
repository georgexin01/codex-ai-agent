v1

## User Profile

The user works across Windows-hosted web projects, local Supabase, and their `.codex` setup. They expect agents to inspect the real project/runtime before acting, make narrow reversible changes, preserve bilingual parity and existing content where applicable, and prove results with targeted checks rather than completion claims. They often ask agents to take action directly, but value clear limits when an outcome is interrupted, unverified, or cannot be guaranteed.

## User preferences

- Diagnose the actual cause first—especially for missing files, local services, or system errors—and avoid generic resets or destructive recovery.
- For `localhost test`, infer the project runtime, start only what is needed, and HTTP-check real routes; a running process is not success.
- Preserve scope: for narrow requests, do not alter unrelated content, routes, styling, configuration, or contact behavior.
- On bilingual Zeta work, update English/CN in lockstep, preserve structural parity, and validate paired data/visible output.
- Use current project evidence for identity, metadata, SEO scope, and manifest values; use `INSUFFICIENT DATA` rather than carry forward historical names or claims.
- Report verified state separately from future guarantees; do not call interrupted or untested work complete.

## General Tips

- On Windows/PowerShell, prefer simple individually quoted commands; run source checks from the real app root. `Invoke-WebRequest -UseBasicParsing` avoids the PowerShell 5.1 parsing warning.
- Before a destructive or recovery action, capture current Git/state evidence. Sparse checkout can hide tracked files; compare `core.sparseCheckout`, `git ls-files`, and filesystem presence first.
- Keep secrets redacted. For local Supabase, preserve originals/backups, use transactional restore paths, and verify both data and API exposure.
- Browser visual QA, production Apache/Cloudflare behavior, and local PHP static-server checks are distinct verification surfaces.

## What's in Memory

### C:\Users\user\.codex

#### 2026-10-08

- Sparse-checkout recovery and PowerShell alert: sparse-checkout, git sparse-checkout disable, TRACKED_ABSENT, Invoke-WebRequest -UseBasicParsing
  - desc: Search first when Codex memories/skills appear missing, Git staging is odd, or a PowerShell web-request warning appears.
  - learnings: Verify omission versus deletion before recovery; sparse checkout was disabled with a pre-commit regression guard, and the alert is not a Codex approval.

#### 2026-09-04

- Codex boot and localhost root boundary: 00_PULSE.md, [🟢] Agent is Ready.., localhost-test, project root
  - desc: Exact hydration contract plus the stop rule for localhost tests accidentally started from `.codex`.
  - learnings: Hydrate once; locate the app root and HTTP-check URLs before calling a local test successful.

### D:\backup\website-zetasoftware

#### 2026-09-07

- Zeta generators, content formatting, cache, and CSS: generate-standard-internal-management-pages.js, update-site-navigation.js, format-detail-content.js, style.min.css
  - desc: Bilingual static-site project map, SIM navigation repair, natural description grouping, cache guidance, and incomplete CSS-minification verification.
  - learnings: Regeneration must call the shared navigation updater; use trace evidence before main-thread code changes; final CSS served/idempotence checks remain needed.

- Zeta static localhost, Lighthouse, and image loading: php -S 127.0.0.1:8080, Lighthouse, WebP, data-src, images/mobile
  - desc: Static server contract, verified performance work, and the paused JPG/WebP/lazy-loader follow-up.
  - learnings: Do not delete WebPs or claim JPG migration/true viewport lazy loading until references, assets, routes, and IntersectionObserver behavior are verified.

### Older Memory Topics

#### C:\Users\user\Desktop\used-car

- Used-Car architecture, schema boundary, and saved-loan cards: PROJECT_CONTEXT.md, _archived migrations, development.localhost, Favorites.vue, MyLoans.vue
  - desc: Use for `cwd=C:\Users\user\Desktop\used-car`; active client is `template/`, archived SQL is not authoritative, and local build needs `development.localhost`.

- Chrome SideBySide repair: new_chrome.exe, Dependent Assembly, 151.0.7922.175
  - desc: Machine-specific incomplete Chrome-update repair; inspect event/version evidence before elevated launcher replacement.

#### C:\Users\user\Documents\supabase-project-backup-restore

- Huwa2 restore and local PostgREST exposure: auth.identities, identities_user_id_fkey, PGRST_DB_SCHEMAS, [api].schemas
  - desc: Validate backup foreign keys, preserve originals, atomically restore, then configure the CLI-managed local Supabase API.

#### D:\backup\website-zetasoftware

- Zeta FAQ, homepage blogs, workflow, and pricing parity: faq.json, home-blogs.js, pricing-section, Orbitron
  - desc: Earlier bilingual content/design changes with exact data, layout, and font-loading contracts.

#### C:\Users\user\Desktop\ai comment

- Evidence-bound metadata and site.webmanifest: (AI) metaTitle.txt, INSUFFICIENT DATA, site.webmanifest, Open Graph
  - desc: Reusable metadata rules: derive active project identity/scope from evidence and do not copy historical examples.

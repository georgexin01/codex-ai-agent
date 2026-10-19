v1

## User Profile

Works hands-on across Windows/PowerShell local web projects, often bilingual EN/CN static sites and PHP/Vue/Supabase apps. Uses Codex for source-grounded orientation, surgical implementation, audit reports, and durable handoff. Cares about current files and real verification more than stale Markdown or screenshots; expects explicit boundaries between source, localhost HTTP, browser, and production evidence. Protects existing worktrees, local Docker/Supabase state, credentials, and user-facing flows.

## User preferences

- Before meaningful changes, read the project’s relevant Markdown and reconcile it with current source; if asked for “all .md”, do not call a front-door-only pass complete.
- Follow the requested scope exactly; a screenshot does not authorize adjacent styling or refactors. Verify the named route/label/behavior.
- For bilingual work, update and validate EN/CN pairs, locale routing, and generated output—not English only.
- Treat browser/live tests that can create bookings, metrics, or records as state-changing; use safe fixtures where possible and report unperformed gates.
- In full-access sessions, continue obvious in-scope implementation steps without repetitive confirmation; pause for a real product decision, destructive action, or ambiguous tradeoff. [ad-hoc note]
- Treat local Docker/Supabase as protected: do not switch, stop, reset, recreate, migrate, or repoint an active stack without explicit same-turn permission. [ad-hoc note]

## General Tips

- Current source/runtime/tests outrank historical documentation. Check Git status before edits and preserve unrelated dirty changes.
- Separate syntax/build/diff checks from HTTP, browser, Apache/host-rule, and production verification.
- On Windows, use short independently quoted PowerShell commands after complex quoting fails; use `Select-String -LiteralPath` for exact-file scans.
- For a protected Codex-path commit failure, inspect staged deletions under `memories/ skills/`, restore unintended files from `HEAD`, then run the hook; do not bypass it.
- Reuse focused procedures when applicable: `skills/zeta-bilingual-static-site/`, `skills/localhost-project-match/`, `skills/local-supabase-protection/`, and `skills/static-site-metadata-sweep/`.

## What's in Memory

### C:\Users\user\.codex

#### 2026-10-19

- Protected-path Git recovery: pre-commit, staged-deletion, git restore, memories/phase2_workspace_diff.md
  - desc: Recover protected-memory deletions and distinguish local hook blocks from remote push failures.
  - learnings: inspect cached deletions directly; `git restore --source=HEAD --staged --worktree -- <path>` plus hook validation cleared the blocker.

### D:\backup\website-zetasoftware

#### 2026-10-16

- AI SEO pages and sitemap/service icons: generate-ai-seo-pages.js, update-site-navigation.js, languageRoutes, sitemap.xml, service-icons
  - desc: Bilingual AI SEO preview generation, navigation/locale integration, sitemap coverage, and PNG service-icon replacement.
  - learnings: use locale-specific generator templates; new routes need language maps and sitemap alternates; local verification does not prove deployment.

### D:\backup\zeta-aiseo

#### 2026-10-16

- Generated news and shared cache version: data/news.json, generate-news.js, validate-news.js, ?v=2301
  - desc: Chinese news pipeline, generator/sitemap checks, and homepage CSS/JS cache-busting maintenance.
  - learnings: data JSON is canonical; incomplete article work is not a publish success; deploy HTML and referenced assets together.

### D:\project\mincorner

#### 2026-10-16

- Secure pickup date: cartPickupDateWindow, Asia/Kuala_Lumpur, Failed to order, placeOrderWithoutPayment
  - desc: Picker/UI and PHP cart/finalization validation for Malaysia pickup dates; also traces Remark popup source.
  - learnings: validate forged/stale dates twice and keep admin reporting pickers out of the customer rule.

### Older Memory Topics

#### D:\project\VIPBillion\website-vipbillion

- Booking UX and request audit: Optimization Plan, Get a Quote, /booking, BookingRequestConflictException
  - desc: Chinese audit format, exact CTA/pre-fill behavior, centered modal/minimum loading, and safe booking-test boundary; cwd=D:\project\VIPBillion\website-vipbillion.

#### D:\project\xhs-tiktok-inbox

- Telegram preview timeline: PhonePreview.vue, historyDates, stickyHistoryDate, getNoticeHistoryTimestamp
  - desc: Platform-isolated Telegram date divider/click behavior, cross-tab image sizing, and Chrome SideBySide recovery; cwd=D:\project\xhs-tiktok-inbox.

#### D:\project\lionrider\lionrider-website

- PHP/JSON storefront handoff: status.md, spareparts-finder.js, 127.0.0.1:8012
  - desc: JSON-storefront boundary, mobile account sidebar, availability-aware model filtering, and localhost checks; cwd=D:\project\lionrider\lionrider-website.

#### C:\Users\user\Desktop\used-car

- Vue/Supabase boundary and Chrome repair: template, development.localhost, archived migrations, SideBySide
  - desc: Runnable-root and external-schema authority rules, plus Windows Chrome repair; cwd=C:\Users\user\Desktop\used-car.

#### C:\Users\user\Documents\supabase-project-backup-restore

- Huwa2 restore/PostgREST: auth.identities, atomic restore, PGRST_DB_SCHEMAS
  - desc: Repair a working backup copy, restore safely, and expose the CLI-managed local schema; cwd=C:\Users\user\Documents\supabase-project-backup-restore.

#### C:\Users\user\Desktop\ai comment

- Evidence-bound metadata: (AI) metaTitle.txt, INSUFFICIENT DATA, site.webmanifest
  - desc: Derive identity and claims only from active-project evidence; cwd=C:\Users\user\Desktop\ai comment.

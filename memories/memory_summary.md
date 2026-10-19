v1

## User Profile

Works across several locally checked-out web projects and uses Codex for hands-on audits, tightly scoped UI/content changes, infrastructure recovery, and durable project handoffs. Values current source and real verification over stale Markdown, screenshots, or spreadsheet status. Frequently works with bilingual EN/CN sites and expects parity. Uses Windows/PowerShell and asks agents to understand project Markdown before meaningful edits. Prefers evidence-backed progress with clear boundaries when browser/live testing could mutate data.

## User preferences

- Before project changes, “understand my website first include .md” / “all .md”: read orientation docs and reconcile them against current source; do not claim exhaustive orientation after only front-door documents.
- Follow the explicit requested edit exactly. A screenshot or inferred issue must not replace a narrow request such as `View Our Services` → `Get a Quote` → `/booking`.
- For bilingual work, update and validate EN/CN pairs rather than declaring English-only completion.
- For audits, present detailed Chinese comparison tables with pages, task, changes, problem, and done status; distinguish spreadsheet claims from independently verified source/live evidence.
- Treat browser/live tests that can create bookings or increment visitor metrics as state-changing; use isolated/mocked tests, and report remaining visual/runtime verification honestly.
- Prefer reversible, surgical maintenance over heavy changes; preserve dirty worktrees, original backups, protected paths, and existing routes.

## General Tips

- Current source/runtime evidence outranks historical docs; flag documentation drift and never retain secrets found in old configuration docs.
- On Windows, use small independently quoted PowerShell commands after complex quoting fails. For exact-file scans use `Select-String -LiteralPath`, not unsupported `rg --literal-path`.
- Build/lint/diff checks validate syntax, not browser UX. Separate source validation from HTTP, browser, and production/host-rule verification.
- Check Git status before editing; protected Codex `memories/`/`skills/` staged deletions require recovery and pre-commit validation, not bypassing hooks.

## What's in Memory

### D:\project\VIPBillion\website-vipbillion

#### 2026-10-16

- VIPBillion booking UX and customer-request audit: WORKSPACE.md, Optimization Plan, booking-confirmation-modal, BookingRequestConflictException, pricing mismatch
  - desc: Website orientation, 13-row Chinese audit requirements, confirmed issues, centered booking dialog, minimum loading, and idempotency.
  - learnings: Current code outranks stale Phase-2 docs; no browser/live booking verification yet; use test harnesses that avoid tracking/records.

#### 2026-10-15

- Get a Quote CTA and booking prefill: View Our Services, Get a Quote, /booking, nav.get_quote, VBBookingPrefill
  - desc: Exact CTA routing, service/route selection, vehicle default, 30-day PHP prefill, plus scope-miss caution.
  - learnings: Find the exact header label and verify `/booking`; do not substitute unrelated visual edits.

### C:\Users\user\.codex

#### 2026-10-16

- Protected Codex-path commit blocker: pre-commit, staged-deletion, memories/phase2_workspace_diff.md, git restore
  - desc: Restore protected memory files and validate the hook; sparse-checkout diagnosis and maintenance context are in the same block.
  - learnings: `git restore --source=HEAD --staged --worktree -- <path>` followed by `git hook run pre-commit` cleared the blocker.

### D:\project\xhs-tiktok-inbox

#### 2026-10-15

- Telegram preview timeline: PhonePreview.vue, historyDates, stickyHistoryDate, getNoticeHistoryTimestamp
  - desc: Divider ordering, clickable sticky date, time-only markers, and all-tab upload sizing.
  - learnings: Explicit dividers define segments; build passed but browser scroll/click QA remains necessary. Also includes MSI-validated Chrome SideBySide recovery.

### D:\project\lionrider\lionrider-website

#### 2026-10-14

- Lion Rider storefront handoff and Spare Parts finder: status.md, PHP JSON storefront, spareparts-finder.js, 127.0.0.1:8012
  - desc: JSON-storefront boundaries, documentation drift, mobile account sidebar, availability-aware model filtering, and local server routes.
  - learnings: Keep storefront data distinct from admin Supabase; normalize model names and inspect dirty state first.

### D:\backup\website-zetasoftware

#### 2026-10-12

- Zeta static-site SEO/performance: .htaccess, php -S 127.0.0.1:8080, WebP, data-src, generated navigation
  - desc: Bilingual static-site parity, hosting rules, image migration safeguards, and generated navigation workflow.
  - learnings: Local PHP serving cannot validate Apache behavior; keep EN/CN parity and avoid premature original-asset deletion.

### Older Memory Topics

#### C:\Users\user\Desktop\used-car

- Used-Car Vue/Supabase and Chrome repair: PROJECT_CONTEXT.md, archived migrations, development.localhost, SideBySide
  - desc: cwd=C:\Users\user\Desktop\used-car. `template/` is runnable root; schema migrations belong in missing external admin repo; includes proven Chrome pending-launcher repair.

#### C:\Users\user\Documents\supabase-project-backup-restore

- Huwa2 VPS restore/PostgREST: auth.identities, identities_user_id_fkey, 04-restore-local.sh, PGRST_DB_SCHEMAS
  - desc: cwd=C:\Users\user\Documents\supabase-project-backup-restore. Repair orphan identities in a working backup copy, atomic restore, then configure CLI-managed local Supabase API schemas.

#### C:\Users\user\Desktop\ai comment

- Evidence-bound metadata workflow: (AI) metaTitle.txt, INSUFFICIENT DATA, site.webmanifest
  - desc: cwd=C:\Users\user\Desktop\ai comment. Project identity and claims must be derived from active evidence, never copied from historic examples.

#### D:\backup\zeta-aiseo

- Generated-news sitemap audit: sitemap.xml, published news routes
  - desc: cwd=D:\backup\zeta-aiseo. Compare sitemap against actual generated published routes; audit found full coverage.

#### D:\project\mincorner

- Remark popup source: Remark, 备注, hardcoded bilingual text
  - desc: cwd=D:\project\mincorner. Diagnostic evidence that the right-side cart popup text is template-hardcoded.

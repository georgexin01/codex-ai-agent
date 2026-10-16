thread_id: 01a1337f-959e-7af3-ba5d-913ed7a4d3f4
updated_at: 2026-10-13T08:05:25+00:00
rollout_path: \\?\C:\Users\user\.codex\sessions\2026\10\13\rollout-2026-10-13T12-22-41-01a1337f-959e-7af3-ba5d-913ed7a4d3f4.jsonl
cwd: \\?\D:\project\VIPBillion

# VIPBillion project discovery and Google Sheet requirements audit

Rollout context: Working directory was `D:\project\VIPBillion`. The user first asked the agent to understand the project, then provided a Google Sheet and asked for every row to be researched, translated into Chinese, and mapped to the VIPBillion project. All work was read-only; no project or sheet changes were made.

## Task 1: Understand VIPBillion project

Outcome: partial

Preference signals:
- The user asked the agent to “read and understand my project works now,” indicating they want proactive project orientation before future implementation work.
- The user expects current code/live evidence to be reconciled against older documentation rather than blindly trusting one source.

Key steps:
- Read `WORKSPACE.md`, `STATUS.md`, `MASTER_PLAN.md`, `DATABASE.md`, admin `PROJECT_CONTEXT.md`, and relevant project docs.
- Inspected both active applications, routes, stores, templates, migrations, and Git status.
- Confirmed the workspace contains a Vue 3/Vben admin panel in `admin-panel-vipbillion`, a PHP bilingual website in `website-vipbillion`, and Supabase migration sources under `admin-panel-vipbillion/apps/web-antd/src/sql/migrations/`.
- Confirmed the PHP front controller is `website-vipbillion/index.php`; clean routes and `/cn/` language routing are implemented.

Failures and how to do differently:
- Documentation is inconsistent: root `STATUS.md` says Phase 2 orders/drivers/payments were removed, while active code and newer migrations contain bookings, drivers, reports, and payment flows.
- `DATABASE.md` contains conflicting statements about whether `driver_jobs` and `bookings.payment_status` remain, while `driver-job.ts` still queries them. Future schema-dependent work must verify the live Supabase schema before edits.
- A malformed PowerShell ripgrep command failed once; use simpler quoted searches for mixed PHP/TypeScript patterns.

Reusable knowledge:
- `DATABASE.md` is intended as the schema sync authority, but its current state may be stale.
- Website content is largely Supabase-backed and administered through Vue forms; relevant admin forms include service, pricing-rule, slideshow, and vehicle forms.
- Existing worktree changes were left untouched: staged admin changes in vehicle/service files and a website `images/banner.zip` deletion.

References:
- Root orientation: `D:\project\VIPBillion\WORKSPACE.md`
- Current status: `D:\project\VIPBillion\STATUS.md`
- Schema mirror: `D:\project\VIPBillion\DATABASE.md`
- PHP entry: `website-vipbillion/index.php`
- Admin project fingerprint: `admin-panel-vipbillion/PROJECT_CONTEXT.md`

## Task 2: Research and translate Google Sheet requirements

Outcome: success

Preference signals:
- The user explicitly requested research on “every single rows,” Chinese translation, and tables containing IDs, pages, section names, and update content. Similar future reviews should preserve every row and use structured Chinese tables.
- The user wanted requirements mapped to the actual VIPBillion project, not merely translated literally.

Key steps:
- Accessed the native Google Sheet `VIP Billion Website Optimization and Inquiry Conversion`, tab `Optimization Plan`.
- Read the full populated range `A8:K21`: 13 action rows, 7 P0 items, all `Not started`, no comments.
- Checked the live English and Chinese website pages and traced each row to project files.
- Produced a Chinese table covering ID, priority/evidence, page/area, finding, requested update, acceptance criteria, owner, and status.

Validated findings:
- W01: Contact page repeats the same WhatsApp link twice in English and Chinese.
- W02: Code can render Instagram links from settings; official-account ownership still needs business confirmation.
- W08/W11/W12/W14: Contact and WhatsApp flows exist, but form submission, feedback, and GTM conversion tracking were not actually exercised.
- W15: English homepage shows the 10-hour city sedan package from RM600 while pricing shows `In City` at RM500.
- W18: English services page displays `60–90 Hours` for KLIA to KL/Selangor/Klang; cross-border detail is categorized as `Airport Transfer`.
- W26: About page shows visitor count and expandable service-standard/fleet sections whose anchors currently point to `#`.
- Chinese and English content differ materially: Chinese homepage reported no featured services, and Chinese service prices/durations differed from English.

Failures and how to do differently:
- Do not directly change prices, durations, categories, FAQ policies, social accounts, or images without business confirmation; the sheet identifies required decisions, not authoritative values.
- Do not claim mobile QA, GTM event verification, form delivery, Google Business Profile ownership, or image authenticity was verified; those remained untested.
- W11 wording is tentative (“probably” switch to WhatsApp), so future implementation should confirm the desired lead flow before editing.

Reusable knowledge:
- Shared website locations for likely changes: `website-vipbillion/template/contacts.php`, `template/home.php`, `template/services.php`, `template/services-single.php`, `template/pricing.php`, `template/about.php`, `lib/header.php`, `lib/footer.php`, `lib/initData.php`, and `lib/sendEmail.php`.
- Admin content ownership: `admin-panel-vipbillion/apps/web-antd/src/views/services/service-form.vue`, `pricing-rules/pricing-rule-form.vue`, `slideshows/slideshow-form.vue`, and `vehicles/vehicle-form.vue`.
- The sheet is a requirements/audit source; current live pages and business confirmation are needed before treating findings as final specifications.

References:
- Google Sheet: `https://docs.google.com/spreadsheets/d/1Qk8jzmZERae_gf-nhXqz0vsZ87Zwr3JcUkVW8SnNXVA/edit#gid=1724772122`
- Sheet range read: `'Optimization Plan'!A8:K21`
- Live pages checked: `/`, `/contacts`, `/pricing`, `/services`, `/services/airport-transfers`, `/services/cross-border-international`, `/about`, and corresponding `/cn/` pages.
- Google Business Profile guidance: `https://support.google.com/business/answer/3038177`

---
name: huwa2-webapp-current-state
purpose: Compact, verified continuation knowledge for the HUWA2 customer-facing Vue app.
applies_to: C:\Users\user\Desktop\huwa\webApp-huwa2
last_verified: 2026-08-19
---

# HUWA2 Web App Current State

## Authority and scope

- Active implementation: `C:\Users\user\Desktop\huwa\webApp-huwa2`.
- Read-only references: `sample`, `webApp-huwa`, and `admin-panel-huwa-2`.
- Preserve existing Vue behavior, Pinia stores, API/RPC calls, route guards,
  i18n keys, and database contracts during visual work.
- Record implementation batches in `C:\Users\user\Desktop\huwa\PROJECT_CHANGELOG.md`.
- Current local dev port: `5174`; production check: `npm.cmd run build`.
- Repository has no committed local `.env`; runtime data availability depends on
  launch configuration. Never expose credentials or authenticated data.
- Codex skill validation uses host Python 3.11; `PyYAML 6.0.3` is installed in
  the user site. If the validator reports `No module named yaml`, repair with
  `py.exe -3 -m pip install --user PyYAML`.

## Current implementation status

Major customer-facing visual work is recorded for Home, Catalog, Product Detail,
Cart, Payment and payment result pages, Orders, Profile, Referral, Lucky Draw,
VIP, Addresses, Notifications, Points, Transactions, Bank Account, Withdraw,
and Withdrawal History.

Legal pages have the HUWA2 visual shell and mascot watermarks, but their legal
copy remains unchanged:

- `/terms`: mascot `12.png`.
- `/refund-policy`: mascot `2.png`.
- `/privacy-policy`: mascot `8.png`.

Not fully redesigned: `/fortune` and `/zodiac`. `/profile/edit`, the
payment-link routes, `/client-flow-demo`, `/login`, `/otp`, and `/signup` now
have the secondary HUWA2 route styling; `/profile/edit` still needs an
authenticated screenshot check. Signup's mascot was intentionally removed;
login and OTP retain their mascot accents.

## Customer decisions from the current workstream

- Homepage `Lucky Numbers` shortcut navigates to `/luckydraw`.
- Homepage search opens Catalog with a query; choosing a Catalog category clears
  the active search and restores category/all results.
- The Home variant modal must layer above the shared footer only while open.
- Lucky Draw uses image-based reels and local demo draw results; no backend
  Lucky Draw schema/RPC contract has been provided.
- Lucky Draw handle is static PNG while idle and mounts the GIF only while active;
  the current reset duration is 2,000 ms after the user's 2x GIF update.
- Lucky Draw success result uses `9.png`; failed `Nice try!` result uses `13.png`.
- Do not create duplicate versioned selectors such as `--v2`, `--v3`, `--v4`,
  or `--v5` for the same CSS role. Version labels describe design iterations.
- New generated images belong in `src/assets/images/generate/`, use PNG only
  for genuine transparency, and never exceed 1,200px width.

## Data and contract boundaries

- Views use stores/API boundaries; do not add direct database calls to solve a
  visual issue.
- `checkoutApi.ts` and server quote/order RPCs are the source of truth for
  totals, shipping, discounts, point redemption, membership, commission,
  charity, payment, refund, and cancellation behavior.
- `cartStore` is local browser storage, not a `huwa2` cart table.
- `shippingSettingStore` reads `huwa2.shipping_settings`, but current source
  evidence shows no active view caller; verify before changing shipping logic.
- `bannerStore` and `App.vue` already consume active homepage banner and splash
  RPCs from the HUWA migration 191 contract.

## Verification gate

For Vue/template/CSS changes, read back the changed files and run
`npm.cmd run build` from `webApp-huwa2`. For visual claims, also inspect the
route at the target mobile viewport against the matching `/sample` reference.
If browser access or screenshot capture is unavailable, report the visual gate
as blocked or partial. Do not claim exact visual parity from a build alone.

## Source references

- Project authority: `C:\Users\user\Desktop\huwa\PROJECT_CONTEXT.md`.
- Visual/customer rules: `HUWA_CUSTOMER_UI_UX_GUIDE.md` and
  `HUWA_PAGE_UPDATE_RULES.md`.
- App rules: `webApp-huwa2\AGENTS.md` and `webApp-huwa2\DESIGN.md`.
- Historical evidence: latest relevant entries in `PROJECT_CHANGELOG.md`;
  current latest entry is 147.

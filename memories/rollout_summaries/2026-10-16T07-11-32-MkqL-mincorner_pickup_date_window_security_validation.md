thread_id: 01a1438d-4087-7df2-a212-e184982c6c0b
updated_at: 2026-10-16T08:24:48+00:00
rollout_path: \\?\C:\Users\user\.codex\sessions\2026\10\16\rollout-2026-10-16T15-11-33-01a1438d-4087-7df2-a212-e184982c6c0b.jsonl
cwd: \\?\D:\project\mincorner
git_branch: main

# Min Corner pickup-date workflow was audited and updated

Rollout context: Read-only project orientation was followed by several related changes in `D:\project\mincorner` for the customer pickup-date picker and order submission security.

## Task 1: Project orientation

Outcome: success

Key steps:
- Identified Min Corner as a direct-PHP/MySQL storefront with an admin panel.
- Found 107 Markdown files, but only `README.md` and `admin/AUTH_TEMPORARY_CHANGE_LOG.md` are project-authored; the rest are vendor/backup documentation.
- Mapped the active pickup flow to `cart.php` → shared `assets/js/app.js` → `controller/CartController.php` → `checkout.php`.
- Existing working-tree changes were preserved.

Failures and how to do differently:
- GitNexus was unavailable because `.gitnexus/` is absent; use direct `rg` searches and file reads for this repository.
- Project has no `AGENTS.md`, `PROJECT_CONTEXT.md`, or root handoff docs.
- A diagnostic read exposed a hard-coded database credential in `include/config.php`; future work must redact secrets and recommend rotation.

Reusable knowledge:
- Customer pickup date selection exists only on `cart.php`, initialized in `assets/js/app.js`.
- `checkout.php` displays the stored date as disabled and does not accept a new date.
- Admin date pickers are reporting filters and are unrelated to pickup availability.

## Task 2: Pickup date window and visual highlighting

Outcome: success

Preference signals:
- The user repeatedly required the same calculation in both UI and submit validation, including Mondays being permanently unavailable and unavailable submitted dates showing a clear “failed to order.. reason..” alert -> future changes should update the picker and every server-side finalization path together.
- The user explicitly asked to check pages beyond `/cart.php` -> trace post-cart pages and final order endpoints, not only the visible picker.
- The user requested subtle visual guidance and later approximately 5px calendar spacing -> preserve light-gray eligible-date highlighting and spaced date cells.

Key steps:
- Final shared rule: Malaysia date today + 3 days through +22 days, represented as start `today + 3` and end `start + 19` (20 calendar days inclusive); Mondays are disabled/rejected.
- For the rollout’s reference date Oct 16, 2026: bounds are Oct 19–Nov 7; Oct 19, Oct 26, and Nov 2 are Mondays; Oct 20 is the first selectable date.
- Updated `assets/js/app.js` to calculate Malaysia-local dates with `Intl.DateTimeFormat('en-CA', { timeZone: 'Asia/Kuala_Lumpur' })`, set picker bounds, disable Monday, and apply `beforeShowDay` class `pickup-date-available`.
- Updated `assets/css/app.css` with very light gray eligible-day styling and `border-spacing: 5px` for the datepicker table.
- Added shared server helpers in `controller/CartController.php`: `cartPickupDateWindow()` and `cartPickupDateUnavailableReason()`.
- Cart creation rejects invalid, Monday, or out-of-window dates with `title: 'Failed to order'` and a reason; `cart.php` shows a SweetAlert modal for these responses while retaining toast behavior for other errors.
- Finalization via `checkout.php` / `placeOrderWithoutPayment` now revalidates the saved `delivery_date` against the current window, preventing stale pending orders from bypassing the rule; checkout displays the returned failure title and reason.

Validation:
- `php -l controller\CartController.php` passed.
- `php -l checkout.php` passed.
- `node --check assets\js\app.js` passed.
- `git diff --check` passed for edited files.
- No browser or live order test was run.

References:
- `assets/js/app.js:105-123` — dynamic bounds, Monday exclusion, `beforeShowDay` highlighting.
- `assets/css/app.css:409-425` — eligible-date styling and 5px table spacing.
- `controller/CartController.php:17-45` — shared pickup-window helpers.
- `controller/CartController.php:347-372` — cart-submit validation and failure response.
- `controller/CartController.php:500-546` — final checkout revalidation.
- `cart.php:585-600` — modal alert handling.
- `checkout.php:351-355` — finalization error alert handling.

# Pinia audit speed improvements

Applied improvements for future `trash-container-app` Pinia work:

1. Use a bounded Google Sheet metadata plus `Pinia` range read instead of scanning unrelated tabs.
2. Run the reusable `pinia-contract-workflow/scripts/check_paired_pinia_contract.ps1` before reading deep app code.
3. Inspect only the affected store, its direct `utils/types` package, and one caller per paired app.
4. Run static contract/env/legacy checks before authenticated API calls and production builds.
5. Enforce a change budget: preserve working pages and actions, avoid unrelated refactors, and report missing external services separately.

The full contract still comes from the live `Trash` -> `Pinia` sheet. The script is a fast gate, not a replacement for schema or runtime verification.

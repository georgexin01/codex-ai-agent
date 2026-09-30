# GPT-6 Luna High Pinia execution profile

This workspace uses GPT-6 Luna with high reasoning effort as the active execution profile. The model ID is `gpt-6-luna`; high effort is configured separately in `config.toml`.

For Pinia, Cyroro, and paired-app work, prioritize:

1. Evidence before implementation: read the live contract, current schema, files, and callers.
2. Minimal-context change budget: load only the required route, Store, utility, type, and caller; avoid unrelated refactors.
3. Automated verification before completion: run the contract audit, type-check, build, authenticated API checks, and localhost checks as appropriate.

Preferred sequence: route -> ground current evidence -> make the smallest compatible change -> verify -> report warnings separately.

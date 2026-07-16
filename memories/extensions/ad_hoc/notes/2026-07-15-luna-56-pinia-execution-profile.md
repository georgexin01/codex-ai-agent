# Luna 5.6 Pinia execution profile

This workspace uses Luna 5.6 as the active execution profile.

For Pinia, Cyroro, and paired-app work, prioritize:

1. Evidence before implementation: read the live contract, current schema, files, and callers.
2. Minimal-context change budget: load only the required route, Store, utility, type, and caller; avoid unrelated refactors.
3. Automated verification before completion: run the contract audit, type-check, build, authenticated API checks, and localhost checks as appropriate.

Preferred sequence: route -> ground current evidence -> make the smallest compatible change -> verify -> report warnings separately.

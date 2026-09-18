# Local Supabase and Docker playbook

This reference describes a reusable local-development boundary. Read the active
project's configuration before using any command.

## Environment separation

- Use Docker-compatible runtime for local Supabase.
- Keep local, staging, linked remote, and production targets explicit.
- Inspect the active environment filename and URL without printing keys.
- Never place a secret/service key in frontend source or Vite variables.
- Verify the database schema and project context before applying SQL.
- Use the local stack only for development/testing; do not expose it as production.

## Daily local workflow

~~~text
start or reuse Docker/Supabase
-> check service health
-> inspect migration state
-> apply reviewed local migrations
-> run SQL/runtime verification
-> start the app in the local mode
-> check HTTP routes
-> run authenticated browser checks
~~~

Use the project's documented runner. If it uses Docker copy plus psql file
execution, preserve that process. If it uses Supabase CLI migrations, state
--local or --linked explicitly whenever both are available.

## Migration discipline

A migration is complete only when all of these agree:

- reviewed source file;
- successful apply output;
- live schema read-back;
- migration history or approved operation record;
- reusable verification result;
- clean replay evidence when reproducibility is required.

Direct Studio/SQL changes are not automatically represented in migration files.
Capture them before claiming a clean reset reproduces the environment.

## Backup discipline

Before destructive or identity-changing operations:

1. identify the exact target container/database/schema/rows;
2. export a recoverable backup;
3. record the target and intended change;
4. use a transaction where possible;
5. verify the exact post-state;
6. retain the rollback artifact until the result is accepted.

Do not print backup contents or credential fields.

## Localhost verification

Start only the required application. Reuse a healthy existing server. Verify:

- root route;
- authentication route;
- changed module route;
- REST/Auth health where relevant;
- browser schema and project context;
- real authenticated behavior when credentials are available.

Report every working raw URL on its own line with its status. HTTP success alone
does not prove authentication or database authorization.

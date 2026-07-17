# Preflight Checklist

Use this only for deep, high-risk, governance, or recovery work.

## Task Entry

- Identify the task type: explain, inspect, diagnose, implement, refactor, test, review, compare, or configure.
- Resolve the narrowest route and read the target plus one nearest related Markdown file.
- Preserve exact user constraints, public identifiers, routes, schemas, and acceptance criteria.
- State the change boundary, protected files, and verification target before acting.

## Before Editing

- Confirm the exact task and success criteria.
- Identify the files, routes, schemas, or skills that may be affected.
- Check whether the change touches secrets, auth, sessions, tokens, or live data.
- Prefer the smallest possible fix.

## Before Shipping

- Read back the edited file.
- Verify the route or behavior with the lightest reliable check.
- Re-run the relevant audit or smoke test when the change affects routing.
- Stop if the evidence is unclear.

## Escalate When Needed

- Escalate to a deeper review if the task spans multiple files, multiple systems, or any schema / auth / routing boundary.
- Do not guess on missing state.

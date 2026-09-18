# Research, drift, and performance benchmark

Use this reference when improving the skill or auditing a completed project. Keep
it project-neutral: record facts from the active project at runtime rather than
hardcoding IDs, counts, credentials, or historical entity names.

## Research record

For each improvement record:

- date checked;
- task friction or failure;
- local source evidence;
- live runtime evidence;
- official documentation consulted;
- proposed rule or automation;
- acceptance test;
- uncertainty and refresh date.

Promote only rules supported by current evidence, repeated value, or a verified
failure. Prefer deterministic checks over another paragraph of instructions.

## Drift checks

Search for and report:

- historical table/entity names in active routes, stores, SQL, or labels;
- project IDs or Auth IDs hardcoded in reusable instructions;
- environment files pointing to an unexpected target;
- migrations present in source but absent from migration history;
- direct database changes not represented in the chosen migration authority;
- profile/Auth phone or email assumptions that disagree with live rows;
- duplicate project bridge rows;
- missing grants, policies, Storage paths, or verification files;
- stale test fixtures or routes from a reference project.

Do not silently rename a database entity. Use the current contract name, or propose
a new name and obtain approval before schema mutation.

## Golden tasks

Use representative tasks from the active project without embedding private data:

1. targeted UI/i18n text change;
2. new table/module planning;
3. CRUD module implementation;
4. phone or email Auth login;
5. missing/duplicate project bridge diagnosis;
6. schema/grant/RLS denial diagnosis;
7. Storage upload and cleanup;
8. relationship or composite-key module;
9. local versus linked environment selection;
10. localhost start and HTTP verification;
11. migration replay/drift audit;
12. final handoff report.

Each task needs expected target, allowed mutation, required evidence, and a
failure condition. Do not evaluate only whether the final prose sounds good.

## Scorecard

Score each task from 0 to 10:

- correct target and scope;
- relevant files read;
- no secrets or unauthorized mutation;
- correct implementation/diagnosis;
- correct naming from the current contract;
- required verification completed;
- concise and focused response;
- token/tool efficiency.

Track:

- first correct route;
- unnecessary file reads;
- tool calls;
- estimated tokens;
- time to first useful result;
- rework after verification;
- false completion claims.

A skill improvement should not be called 10/10 until it passes the golden tasks
with agreed thresholds and no critical safety failure.

## Fast-path rule

For a narrow task, load only the task route and target files. For a project-wide
task, run preflight and contract audit first, then load references on demand.
Do not make every conversation pay the cost of the complete runbook.

thread_id: 019f3b4c-2967-7d91-89d5-2e3eded86ef7
updated_at: 2026-07-07T09:52:15+00:00
rollout_path: C:\Users\user\.codex\sessions\2026\07\07\rollout-2026-07-07T14-37-59-019f3b4c-2967-7d91-89d5-2e3eded86ef7.jsonl
cwd: \\?\C:\Users\user\.codex
git_branch: main

# `.codex` boot and knowledge-hygiene rollout with selective promotion, cleanup, and protection rules

Rollout context: The user worked inside `C:\Users\user\.codex` and repeatedly asked how `.codex` knowledge should behave, how to improve boot/routing performance, what memories are active, which cold files should be promoted, and how to protect important markdown from accidental changes. The session focused on `00_PULSE.md`, router audits, memory structure, and safe cleanup.

## Task 1: Explain `.codex` boot / knowledge behavior and improve boot rules
Outcome: success

Preference signals:
- When the user asked how `ai read .codex knowledge` should behave, they wanted the agent to “read .codex knowledge” as a special boot action and not a summary; this reinforced that boot should stay route-first and very small.
- When the user said they wanted AI behavior to be “faster and smarter” and asked how to get from 9/10 to 10/10, they implicitly preferred self-checking boot rules, explicit fallback behavior, and evidence-first routing in the boot layer.
- When the user asked for “important rules, principles and behaviour” to be activated from Part 1, they wanted personalized behavior rules to be treated as boot-critical rather than buried in deferred notes.

Reusable knowledge:
- `00_PULSE.md` is the single boot read for `.codex`; the rollout verified and preserved that sentinel behavior.
- The user’s hot preferences are now encoded in `00_PULSE.md` as small boot rules: smallest viable route, current evidence over memory, plan-first unless terse execute, verify before done, and keep one matching skill family awake.
- The session established a “maintenance-owned” convention via `(ai manage)` for a small set of durable notes that should be updated when better rules are found.

References:
- `00_PULSE.md` now contains `## 0.1 Personalized Behavior Rules (Part 1, always active)` and `## 0.1.1 Boot Self-Check (10/10 gate)`.
- The user’s boot-related preferences were distilled from their repeated prompts about `ai read .codex knowledge`, boot size, and “faster and smarter” behavior.

## Task 2: Improve routing with self-describing notes and AI-managed memory anchors
Outcome: success

Preference signals:
- The user explicitly wanted important behavior and principles to be “part 1” and said the AI should “mark this down” so `00_PULSE` would activate them.
- The user liked the idea of adding `(ai manage)` to important knowledge/skills so the AI knows which notes are maintenance-owned and should be updated when needed.
- The user approved the idea of promoting durable principles into routed notes/templates instead of leaving them as chat-only ideas.

Reusable knowledge:
- The rollout added a new small convention: `(ai manage)` means the note is maintenance-owned and should be updated when a better durable rule is discovered.
- A new note was created: `memories/extensions/ad_hoc/notes/2026-07-07T00-00-00-cold-storage-promotion-policy.md`, used as an AI-managed audit policy for deciding whether memory/skill files should stay cold, be promoted, or be retired.
- `00_PULSE.md` gained explicit triggers for this audit lane: `ai cold storage audit` and `ai promote memory`.
- The rollout also added direct boot triggers for `READ_BEFORE_ANSWER_PROTOCOL.md`, `SINGLE_TRUTH_SOURCE_PROTOCOL.md`, and `skills/awake-skill-routing/SKILL.md`, because these were judged to be short, reusable, and valuable enough to promote without bloating the boot path.

Failures and how to do differently:
- Large bundled protocol docs like `0_apex/ENGINEERING_PROTOCOLS.md` and `2_governance/SESSION_START_PROTOCOL.md` were intentionally left cold to avoid inflating the boot path.
- The better pattern was selective promotion of short, reusable rules instead of activating all candidate files.

References:
- `00_PULSE.md` triggers added: `ai read before answer`, `ai single truth source`, `ai awake skill routing`, `ai cold storage audit`, `ai promote memory`.
- New file added: `memories/extensions/ad_hoc/notes/2026-07-07T00-00-00-cold-storage-promotion-policy.md`.
- Verified via `Update-CodexRouting.ps1 -Quiet` and `Audit-CodexRouting.ps1` with zero missing mandatory/fallback/root entries and zero legacy refs.

## Task 3: Measure memory usage / hot vs cold coverage / memory structure
Outcome: success

Preference signals:
- The user repeatedly asked whether memories are “useful,” how much they are used, how they are built, and which parts should be promoted into active routing.
- The user wanted the AI to judge whether cold knowledge is still valuable to their work and whether improvements should be made only when they are “good improvement.”
- The user said important markdown files should “never” be changed or removed, showing a strong preference for preservation of key docs.

Reusable knowledge:
- The memory tree is large, but the boot-hot portion is small. A direct-reference count from `00_PULSE.md` found about 18 unique memory targets referenced there during the rollout, while the memory tree had 125 content files; the hot boot path is therefore a small subset of the whole knowledge base.
- The active memory structure was described as: `MEMORY.md` as master index, `memory_summary.md` as condensed overview, `0_apex/` for core principles/user DNA/templates, `1_core/` for reusable system knowledge, `2_governance/` for policies and routing/safety, `extensions/ad_hoc/notes/` for durable session-derived notes, `rollout_summaries/` for evidence-backed summaries, `project_notes/` for project-specific persistence, and `raw_memories.md` as legacy/raw history.
- The user’s key durable preference is now to keep `00_PULSE.md` small and to promote only genuinely reusable rules, not everything in memory.

Failures and how to do differently:
- The rollout learned that `1_core` is mostly cold and should not be treated as normal boot-hot content unless a task specifically needs it.
- Large SQLite/log/state files are runtime storage, not token-heavy knowledge; they matter for disk hygiene, but they do not increase prompt cost unless read.

References:
- `memories/MEMORY.md` and `memories/memory_summary.md` were inspected as the main memory structure sources.
- The rollout measured roughly 125 content files in `memories`, with active/hot references concentrated in a much smaller set.

## Task 4: Protect important markdown and define safe cleanup behavior
Outcome: success

Preference signals:
- The user explicitly said: “for important .md please do not ever change or remove to those very important,” which is a strong durable protection preference.
- The user wanted cleanup, but only if it reduced noise without deleting important knowledge.

Reusable knowledge:
- `00_PULSE.md` now contains a `Protected Markdown Rule` saying important routed markdown files should not be changed or removed unless the user explicitly asks for that exact file.
- The rule prefers additive routing or tiny patches over deletion for boot rules, routers, governance notes, skill front doors, and durable project memory.
- During cleanup, dated `.sandbox` logs were removed safely, while runtime markers and route-critical docs were preserved.

Failures and how to do differently:
- Broad pruning of `memories/` would be risky because some older-looking files are still route-critical.
- The better default is to keep important knowledge files and route around them rather than pruning first.

References:
- `00_PULSE.md` section `## 0.1.3 Protected Markdown Rule`.
- Safe cleanup already removed older `.sandbox` history logs while preserving live markers and route-critical knowledge.

## Task 5: Classify `0_apex`, `1_core`, `2_governance` usage and active relevance
Outcome: success

Preference signals:
- The user asked whether `0_apex`, `1_core`, and `2_governance` are “used or not,” indicating they want a practical hot/cold distinction rather than a theoretical one.
- The user’s broader pattern shows a preference for knowing what is active now versus what is merely stored.

Reusable knowledge:
- `0_apex` is active: it is referenced from `00_PULSE.md` and from the dynamic router for deep/governance/design anchors.
- `2_governance` is active: it contains live routing/safety files such as `PREFLIGHT_CHECKLIST.md`, `skill_path_router.md`, `GITNEXUS.md`, `DRIFT_GUARD_PROTOCOL.md`, and cleanup/ignore rules.
- `1_core` is mostly cold: it exists as a support library, but it is not part of the normal hot boot path.

References:
- `CODEX_DYNAMIC_ROUTING.md` and `00_PULSE.md` both point to `0_apex` and `2_governance` as active routing/deep-policy surfaces.
- `1_core` appeared in the root inventory and in search results, but not as a hot boot dependency.

## Task 6: Root ignore files and cleanup / versioning state
Outcome: partial

Preference signals:
- The user wanted the various `.ignore` files checked and updated “to current newest ignore version we needed,” with additional cleanup only if safe.
- They also wanted to reduce the amount of markdown the AI has to read, but without harming important knowledge.

Reusable knowledge:
- The root contains multiple ignore files: `.gitignore`, `.codexignore`, `.openaiignore`, `.claudeignore`, `.geminiignore`.
- These files were broadly similar in purpose: ignore secrets, runtime DB/log/state files, high-noise folders, while keeping curated knowledge and skills available.
- The current ignore set already excludes most obvious runtime and generated noise; the big risk is not missing ignore entries, but accidentally hiding or deleting important routed docs.

Failures and how to do differently:
- The root inventory showed many files are still live references via `00_PULSE.md`, `AGENTS.md`, `CODEX_DYNAMIC_ROUTING.md`, `memories/MEMORY.md`, and `skills/*`.
- Cleanup should stay narrow and evidence-based; the safe approach is to update ignore rules only when they meaningfully reduce noise without masking important knowledge.

References:
- Root ignore files inspected: `.gitignore`, `.codexignore`, `.openaiignore`, `.claudeignore`, `.geminiignore`.
- The audit also showed `CODEX_DYNAMIC_ROUTING.md` regenerated cleanly with no missing entries and 391 safe indexed files.


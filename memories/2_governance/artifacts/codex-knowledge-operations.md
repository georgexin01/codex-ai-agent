---
name: codex-knowledge-operations
description: "Operate the .codex memory, skill, route, history, and usage catalogs without bulk-loading content or promoting unverified rules."
triggers: ["ai knowledge operations", "ai codex knowledge system", "ai memory skill management"]
phase: governance
model_hint: medium
model_profile: gpt-6-luna-high
version: 1.1
status: active
date_updated: "2026-10-23"
related:
  - 00_PULSE.md
  - memories/2_governance/artifacts/skill_path_router.md
  - memories/2_governance/artifacts/knowledge_relation_router.md
  - skills/ai-growth/SKILL.md
  - codex-router/Invoke-CodexKnowledgeHook.ps1
  - codex-router/Inspect-CodexKnowledgeUsage.ps1
  - config.toml
---

# Codex Knowledge Operations

Use this as the management map for the local `.codex` knowledge system. It is a router and operating contract, not a request to load every linked file.

## Catalog and retrieval

- `codex-router/codex-frontmatter-hot.json` is the compact trigger/path preview. `codex-router/codex-frontmatter-index.json` is the complete Markdown metadata catalog; read records by query, not the full JSON.
- `codex-router/skill-activation-manifest.json` summarizes eligible skill front doors and activation metadata. Load a matching skill body only after choosing its route.
- `memories/2_governance/artifacts/skill_path_router.md` owns semantic routes. `memories/2_governance/artifacts/knowledge_relation_router.md` adds conditional links; a relation never means preload every linked node.
- `memories/MEMORY.md` is the historical keyword registry. `memories/memory_summary.md` is compact cross-project context. Current project source and truth documents outrank both.
- `AGENTS.md` in `C:\Users\user\.codex` is the global Codex instruction source. Its priority, task-classification, and evidence rules apply every session. `00_PULSE.md` owns boot and trigger routing; `GROUND_KERNEL.md` remains deferred for deep governance or high-risk work.
- The five-point principle note (`memories/extensions/ad_hoc/notes/2026-07-01T18-14-43-5-point-ai-principles.md`) defines the compact quality goal: one boot doc, one trigger per task, one file per purpose, one verification step per action, one source of truth per project.

## History and usage records

- `memories/rollout_summaries/` contains durable task handoffs. `codex-router/last-changes.json` is a generated routing delta, not a conversation log.
- `hooks.json` calls `Invoke-CodexKnowledgeHook.ps1` on prompt submission and selected post-tool events. The exact `ai read .codex knowledge` trigger re-surfaces the governing AGENTS sections, five-point principles, compact summary, and boot recommendations as hidden developer context while preserving its visible sentinel.
- `codex-router/knowledge-usage.jsonl` records UTC time, broad knowledge categories, and accessed `.codex` paths only. It excludes raw prompts, tool results, and session IDs. The file is local runtime state and is Git-ignored.
- Run `codex-router/Inspect-CodexKnowledgeUsage.ps1` or use `ai knowledge usage` to inspect counts and recent path events. An empty ledger means the hook has not yet run or has not been trusted.

## Memory and skill reflection

- At the end of substantial work, use verified tool and source evidence to decide whether a reusable lesson was learned. Add concise memory for a stable preference or project-specific fact; create or improve a skill only for a repeatable workflow with a clear trigger, inputs, steps, boundaries, and verification.
- Preserve source links, dates, uncertainty, and route ownership. Do not save secrets, raw chats, unverified claims, or speculative product behavior. Keep detailed history in rollout summaries and the memory index concise.
- User authorization allows durable learning, but does not make every task worthy of a new memory or skill. Review before promotion when a change affects safety, permissions, routing, external actions, or runtime defaults.
- Use `skills/ai-growth/SKILL.md` for current-source research, proposals, and regression checks. Use `codex-router/KnowledgeHealthReport.ps1` for the local structure and route audit.

## Hook trust and boundaries

- Codex requires review and trust for non-managed hooks. Review the exact hook under `/hooks` before expecting automatic hydration or logging; do not bypass that gate.
- The hook does not install extensions, start MCP servers, change project files, read full transcripts, or auto-promote memories. It only hydrates the explicit trigger and records allowed metadata.
- Keep MCP tools separate from skills: MCP supplies live data/actions; skills define when and how to use those tools.
- `config.toml` registers the pinned Microsoft Playwright MCP server (`@playwright/mcp@0.0.83`) alongside the existing OpenAI documentation MCP. Restart Codex after configuration changes before expecting new MCP tools in a session.

## Research checked 2026-10-23

- OpenAI documents progressive skill discovery, where metadata guides activation and full skill content loads only when selected: https://developers.openai.com/plugins/concepts/skills
- Codex hooks support `UserPromptSubmit`, `PostToolUse`, and `SessionStart`; non-managed hooks require trust review, and `transcript_path` is not a stable hook interface: https://learn.chatgpt.com/docs/hooks
- Codex customization documents `~/.codex/AGENTS.md` as global guidance applied before work starts; use it for rules that should shape all sessions, with project AGENTS files for local contracts: https://learn.chatgpt.com/docs/customization/overview
- OpenAI's current skill/prompt guidance recommends concise triggers, progressive disclosure, and reviewing over-prescriptive instructions: https://developers.openai.com/blog/rethinking-skills-and-prompts-for-gpt-6-astra
- Microsoft Playwright MCP uses the browser accessibility tree for structured browser automation. The local server is pinned to `0.0.83`; review updates before changing the pin: https://github.com/microsoft/playwright-mcp
- The MCP reference Memory server provides a persistent knowledge graph, but its server includes deletion tools and the local `.codex` already has routed Markdown catalogs. It was not installed because it would duplicate the existing source of truth and add write-capable runtime tools: https://github.com/modelcontextprotocol/servers/tree/main/src/memory

## Verification

Run:

```powershell
.\codex-router\Invoke-CodexKnowledgeHook.ps1 -Event UserPromptSubmit -DryRun
.\codex-router\Inspect-CodexKnowledgeUsage.ps1 -Json
.\codex-router\Audit-CodexRouting.ps1 -Detailed
.\codex-router\Validate-CodexKnowledge.ps1
```

Verify the visible sentinel separately in a new Codex session after the hook has been trusted.

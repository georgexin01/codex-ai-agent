---
name: weekly-official-openai-docs-research
description: Read-only weekly review of official OpenAI documentation for Codex, Luna, image generation, skills, configuration, hooks, and scheduled tasks.
schedule: weekly
mode: read-only
skill: skills/ai-growth/SKILL.md
---

# Weekly Official OpenAI Docs Research

Run this task in a fresh Codex session with the `ai-growth` skill.

## Prompt

Audit only the current official OpenAI documentation for changes affecting:

- Codex customization, `AGENTS.md`, skills, memories, MCP, hooks, and scheduled tasks
- GPT-5.6 Luna model selection, reasoning effort, latency, and token/cost guidance
- GPT-Image-2.5 Flare and Sunburst model IDs, quality, size, background, editing, and API behavior

Use official OpenAI sources only:

- `https://learn.chatgpt.com/docs/`
- `https://developers.openai.com/api/docs/`
- `https://platform.openai.com/docs/`

Compare the fetched documentation with the current local files. Produce a dated,
concise proposal containing source URLs, changed facts, affected local paths,
conflicts, risk, recommended smallest patch, validation checks, uncertainty, and
the next refresh date.

## Safety boundaries

- Read-only research and local non-destructive inspection only.
- Do not edit `AGENTS.md`, `00_PULSE.md`, skills, memories, config, scripts, or routes.
- Do not send prompts or local file contents to external services beyond the
  official documentation query itself.
- Do not use API keys, live API calls, account data, or production data.
- Do not promote findings automatically. Stop at a reviewable proposal.

## Acceptance checks

1. Every product claim has an opened official source URL and retrieval date.
2. Local evidence names the exact file and current setting or rule.
3. Stale, conflicting, or unavailable evidence is labeled `INSUFFICIENT DATA`.
4. No local file outside the report output is modified.
5. The proposal recommends a human-reviewed promotion step when durable rules,
   permissions, routing, model defaults, or external actions would change.

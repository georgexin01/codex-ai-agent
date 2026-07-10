---
name: kushiro-root-docs-router
description: "Fast route for the KushiroBBQ workspace. Maps the project name and common triggers to the root truth docs, active app folders, and stack guardrails."
triggers: ["kushiro", "kushirobbq", "kushiro root docs", "kushiro project", "kushiro status", "kushiro database", "kushiro crosswalk"]
version: 1.0
status: active
date_updated: "2026-06-15"
---

# KushiroBBQ Root Docs Router

Use this note when the request is about `C:\Users\user\Desktop\kushiro` and the agent needs the fastest route into the real project truth without scanning the whole workspace.

## Project Root

- Workspace: `C:\Users\user\Desktop\kushiro`

## First Read Order

1. `C:\Users\user\Desktop\kushiro\CLAUDE.md`
2. `C:\Users\user\Desktop\kushiro\STATUS.md`
3. `C:\Users\user\Desktop\kushiro\DATABASE.md`
4. `C:\Users\user\Desktop\kushiro\CROSSWALK.md`
5. `C:\Users\user\Desktop\kushiro\WORKSPACE.md`

## Root Truth Docs

- Stack and anti-drift guardrail:
  `C:\Users\user\Desktop\kushiro\CLAUDE.md`
- Current phase and next work:
  `C:\Users\user\Desktop\kushiro\STATUS.md`
- DB schema and relationship contract:
  `C:\Users\user\Desktop\kushiro\DATABASE.md`
- Entity to module to route coverage:
  `C:\Users\user\Desktop\kushiro\CROSSWALK.md`
- Workspace structure and local setup:
  `C:\Users\user\Desktop\kushiro\WORKSPACE.md`
- Project identity and deployment targets:
  `C:\Users\user\Desktop\kushiro\PROJECT_INFO.md`
- Business/domain research:
  `C:\Users\user\Desktop\kushiro\PROJECT_RESEARCH.md`
- Patterns and known gotchas:
  `C:\Users\user\Desktop\kushiro\PROJECT_KNOWLEDGE.md`

## Active App Folders

- PHP backend and schema owner:
  `C:\Users\user\Desktop\kushiro\kushiroBbq-BE`
- Custom Vue admin panel:
  `C:\Users\user\Desktop\kushiro\admin-panel-kushiroBbq`
- Member PWA:
  `C:\Users\user\Desktop\kushiro\webApp-kushiroBbq`
- Cashier app:
  `C:\Users\user\Desktop\kushiro\app-cashier-kushiroBbq`

## Stack Guardrails

- This project is NOT Vben Admin.
- This project does NOT use Supabase.
- This project uses PHP + MySQL + custom Vue apps.
- Use `npm run dev` for the frontend apps, not `pnpm dev:local`.
- Treat `kushiroBbq-BE` as the schema owner for DB changes.

## Suggested Task Routing

- Backend/API or DB work:
  start with `CLAUDE.md`, `STATUS.md`, `DATABASE.md`, then inspect `kushiroBbq-BE`
- Admin module or admin bug:
  start with `CLAUDE.md`, `CROSSWALK.md`, then inspect `admin-panel-kushiroBbq`
- Member app or cashier app:
  start with `CLAUDE.md`, `STATUS.md`, then inspect the matching app folder
- Project understanding or handoff refresh:
  read the full root truth set above before code spelunking

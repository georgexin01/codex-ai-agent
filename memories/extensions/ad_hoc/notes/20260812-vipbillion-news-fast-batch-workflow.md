# VIPBillion news fast batch workflow

For the VIPBillion local-Docker news import, use the verified `news.md` schema and the existing importer as the source of truth. Preserve the approved additive phase order `10, 40, 50, 50, 50`; keep old rows unchanged unless the user explicitly requests a correction.

After the initial schema/source verification, each batch may use a compact gate: selected-count and cumulative-count check, JSON parse and aligned language check, company-name rule check, generated SQL/insert check, proportional image dimension check, and one localhost `/news` smoke check. Do not repeat full site recapture, full historical audits, or broad repository scans for every batch unless a gate fails or source/schema changes.

News company names must be normalized to `VIP BILLION MILESTONE TRAVEL & TOURS`, or the `SDN BHD` form when the source contains that legal suffix. News images must be resized proportionally within desktop `1200x630` and mobile `400x300`, without padding, white canvas, or contain-style letterboxing; preserve the source aspect ratio and store the real paths.

Local Docker/Supabase remains additive-only. Do not reset, delete, recreate, or alter unrelated old rows.

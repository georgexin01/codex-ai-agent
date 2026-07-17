---
name: detailed-chat-table-metrics
description: "When the user requests detailed comparison tables, include improvement percentage, ratings, token cost, speed, intelligence/context quality, and AI chat-flow/reply quality."
triggers: ["detailed tables", "more info in tables", "improvement %", "token cost", "intelligence rating", "chat flow rating"]
status: active
---

# Detailed chat-table metrics

Keep the mandatory compact `task | action | status` table for every non-sentinel request.

When the user asks for comparison, before/after, optimization, or detailed table metrics, add dedicated columns or a second comparison table covering:

- improvement percentage;
- rating out of 10;
- estimated token cost;
- speed and speed increase percentage;
- intelligence/context quality rating out of 10;
- AI chat-flow/reply quality rating out of 10.

Clearly label estimates. Do not claim exact benchmark results unless measured from current evidence. Do not force these extra columns into ordinary status tables when the user did not request detailed metrics.

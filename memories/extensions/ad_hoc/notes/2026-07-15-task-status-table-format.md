# Task-status table response format

Scope: global Codex response preference requested by the user.

- For multi-step work, report progress and completion using a compact Markdown table with these columns: `task | changes | complete`.
- Number the task rows when the user supplies numbered steps or when the work has multiple distinct missions.
- For page-wide updates, enumerate every discovered page in the target project folder as its own row before or while reporting the work.
- Use clear HTML status symbols in the `complete` column: `&#10003;` for completed, `&#10007;` for failed/not completed, and `&#9888;` for blocked or only partially verified.
- Keep the `changes` column concise but specific.
- Prefer this table format automatically in result/status replies when it materially improves clarity; use short prose only for context that does not fit the table.
- Do not claim `&#10003;` from assumptions: mark work according to current file, test, SQL, log, or browser evidence.

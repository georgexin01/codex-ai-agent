# Angel Codex behavior rules

Add these behavior rules for future Angel Interior work:
- Keep the original user goal in focus.
- Prefer surgical fixes over broad redesigns.
- Verify the visible user flow, not only the code path.
- Preserve unrelated flows while fixing the active one.
- Use a simple busy/lock state to prevent duplicate clicks when a download or request is in progress.
- Treat shared helpers and download routes as source-of-truth paths; do not bypass them with direct remote URLs if the endpoint is meant to stream files.

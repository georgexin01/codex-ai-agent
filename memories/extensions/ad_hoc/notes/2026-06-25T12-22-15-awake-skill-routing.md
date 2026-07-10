# Codex awake skill routing note

The user confirmed a persistent routing model for future work in this project and wants Codex to use it going forward.

Key points to remember:
- Keep `ai read .codex knowledge` as the small boot read, not a full tree scan.
- Add or use a small project fingerprint so Codex can detect the current repo type quickly.
- Wake only the relevant skill family for the current project/request, such as `skills/claude`, `skills/claude-website`, or `skills/claude-app`.
- Keep the matching skill awake across later chats and later turns for the same project until that area is mostly complete.
- Put a skill back to sleep only when the related work is done or the user changes focus.
- Do not over-read unrelated skills or knowledge paths; load only what the request clearly needs.
- Re-check the awake set at the start of each new request so Codex can reuse the same proven pattern without re-discovering it from scratch.

This note is meant to support reusable behavior for future sessions, especially when the user works across multiple projects from the same Codex environment.

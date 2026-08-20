# Root Git Only for `.codex`

- Policy: `C:\Users\user\.codex\.git` is the only Git repository for this knowledge tree and is the repository pushed to the user's GitHub remote.
- `memories/` is ordinary tracked content. Never run `git init`, `git clone`, or create `.git` metadata inside `memories/`.
- Run Git commands from `C:\Users\user\.codex`; do not treat `memories/` as a separate repository or submodule.
- If `memories/.git` reappears, stop and inspect it before changing or removing it. Confirm with `Test-Path .\memories\.git`, `git -C .\memories rev-parse --show-toplevel`, and `git submodule status`.
- Verified 2026-08-20: `memories/.git` absent, `.gitmodules` absent, no submodules, and root Git tracks `memories/` as regular files.

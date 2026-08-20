# No `.codex` generated-image storage

- User preference: never intentionally save generated images under `C:\Users\user\.codex\generated_images\` or another `.codex` folder.
- For project-bound images, use the active project's documented asset folder, update consuming references, and verify the final files there.
- If a tool creates a transient preview under its protected default location, remove it when practical; do not treat that location as project storage.
- Verified 2026-08-20: `C:\Users\user\.codex\generated_images` does not exist.

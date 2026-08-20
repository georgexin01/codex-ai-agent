# Image-generation asset policy added

- User requires a mandatory measurement-first workflow for website/mobile raster assets.
- Canonical policy: `codex-router/IMAGE_GENERATION_ASSET_POLICY.md`.
- Final assets must be 30–1600px per edge, fit the measured rendered element, default to JPG when opaque, and use PNG only for real alpha or artifact-sensitive flat art.
- Bootstrap v5.3 tiers are a responsive grouping aid; actual computed section/card/div/img dimensions remain authoritative.
- Project-bound images must never remain in `.codex/generated_images/` or another `.codex` folder.

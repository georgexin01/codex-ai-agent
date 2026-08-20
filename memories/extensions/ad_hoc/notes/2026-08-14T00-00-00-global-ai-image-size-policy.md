---
name: global-ai-image-size-policy
description: Mandatory user rule for every AI-generated image, with a stricter HUWA project cap.
triggers: [generate image, AI image, image generation, image asset, image size]
priority: T0
scope: global image-generation behavior
source: explicit user instruction on 2026-08-14
---

# Global AI Image Size Policy

This is an explicit high-priority user rule for every AI-generated image.

- Global hard maximum: final image width must be `1600px` or less. Never
  generate, keep, publish, or store an AI-generated image wider than `1600px`.
- Prefer an allowed width ladder suited to the rendered use:
  `64px`, `120px`, `300px`, `400px`, `600px`, `800px`, `900px`, `1000px`,
  `1200px`, or `1600px`.
- Request the suitable width from the image-generation tool and verify the
  final dimensions after generation. Preserve aspect ratio.
- If a tool returns an image wider than the applicable limit, resize it down
  before use. Do not silently leave an oversized source in the project.
- JPG is the default format. Use PNG only when transparent background, logo,
  icon, or another genuine alpha-channel requirement needs it.
- A project-specific rule may be stricter than this global cap. For HUWA,
  `HUWA_PAGE_UPDATE_RULES.md` and `webApp-huwa2/DESIGN.md` cap generated images
  at `1200px`; the HUWA-specific `1200px` cap wins.
- Record the generated filename, prompt/source, intended use, requested width,
  final width/height, format, and transparency reason in the project log.

This note is a high-priority routed memory overlay. It does not replace the
protected `GROUND_KERNEL.md`; when a project has a narrower image limit, obey
the narrower limit.

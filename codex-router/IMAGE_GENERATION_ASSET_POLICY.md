---
name: image-generation-asset-policy
description: "Highest-priority image-generation gate for measuring rendered website/app boxes, selecting exact raster dimensions, choosing PNG or JPG, reducing bytes, and verifying final assets."
triggers: ["ai imagegen", "generate image", "generate images", "create image", "create images", "make an image", "make images", "AI image", "image generation", "image asset"]
aliases: ["gpt image 2", "gpt-image-2", "GPT 2.0 images", "responsive image asset", "fit image to card", "image size", "image for website", "image for mobile app", "transparent image", "transparent logo", "website image", "app image", "hero image", "banner image", "card image", "profile image", "gallery image", "ad image"]
contains: ["background", "banner", "logo", "profile", "gallery", "ads", "card", "Bootstrap", "transparent", "PNG", "JPG", "JPEG"]
phase: image-generation
priority: highest-when-image-generation
version: 1.0
status: authoritative
date_updated: "2026-08-20"
evidence_scope: "OpenAI GPT Image 2 and Bootstrap v5.3 official documentation checked 2026-08-20; measurement and storage rules are local Codex policy."
related:
  - skills/.system/imagegen/SKILL.md
  - memories/extensions/ad_hoc/notes/2026-08-20T12-00-00-image-generation-asset-policy.md
  - memories/extensions/ad_hoc/notes/2026-08-20T12-05-00-image-generation-trigger-routing.md
  - memories/2_governance/artifacts/trigger_intent_index.md
---

# Image Generation Asset Policy

This policy is mandatory whenever an AI-generated raster image will be used in a website or mobile app. It applies to `gpt-image-2` and newer image generators, while preserving model-specific limitations. It does not authorize saving project assets inside `.codex`.

## 1. Required route and hard limits

For `ai imagegen`, and for any message whose intent combines an image-generation verb (`generate`, `create`, `make`, `render`, `produce`, `design`) with an image noun (`image`, `photo`, `illustration`, `banner`, `logo`, `hero`, `card`, `profile`, `gallery`, `ad`, `asset`), read this policy first, then read `skills/.system/imagegen/SKILL.md`, then inspect the active project and target route. The exact wording does not need to match a saved trigger.

Hard final-asset limits:

- Final raster width and height: **30px minimum**, **1600px maximum**.
- Do not generate or retain pixels larger than the measured rendered box unless the user explicitly requests retina density, a source master, or a crop-safe variant.
- Default density is `1x`: final pixels equal the measured CSS box, rounded to whole pixels and clamped to 30–1600px.
- A 30px floor is for the smallest raster asset. If the actual control is smaller, prefer an existing SVG/CSS icon instead of creating an oversized raster.
- Never use `.codex/generated_images/` or any other `.codex` folder as project asset storage. Save the selected final only in the active project’s documented asset directory and update its consumer/reference.

## 2. Inspect before generating

Do not generate from viewport width alone. Resolve the current project and measure the actual rendered target:

1. Identify the page/route and the target `section`, `background`, `banner`, `card`, `div`, or `img`.
2. Inspect the computed CSS box at every relevant responsive state: `width`, `height`, `aspect-ratio`, padding, border, `object-fit`, `object-position`, and overflow/crop behavior.
3. Account for the parent container, Bootstrap grid columns, gutters, and the real content box. A full viewport can be wider than the image element.
4. Determine whether the image is content (`<img>`) or a CSS background. For `cover`, measure the container and preserve safe crop space; do not use the viewport as a substitute.
5. Use project evidence over assumptions. If the route, target element, or rendered dimensions cannot be established, report `INSUFFICIENT DATA` and inspect or ask before generation.

Required measurement record:

| field | required value |
|---|---|
| project and route | current project root and page/route |
| target | exact selector/component and asset role |
| breakpoint | Bootstrap tier plus actual viewport width |
| rendered box | CSS width × height in px after padding/border decisions |
| crop rule | contain, cover, intrinsic, background, or art-directed crop |
| density | `1x` by default; explicit reason for another density |
| final target | exact output width × height after 30–1600 clamp |
| format | JPG or PNG, with alpha decision |
| verification | dimension, alpha, visual sharpness, byte-size, and consumer check |

## 3. Bootstrap responsive measurement base

Bootstrap v5.3 is mobile-first and uses these default minimum-width tiers:

| tier | viewport range | official container max-width |
|---|---:|---:|
| xs | `<576px` | auto |
| sm | `≥576px` | 540px |
| md | `≥768px` | 720px |
| lg | `≥992px` | 960px |
| xl | `≥1200px` | 1140px |
| xxl | `≥1400px` | 1320px |

These tiers are grouping points, not permission to assume a device width. Measure the actual box at the breakpoint. Generate separate variants only when the box ratio, crop, or composition changes materially. If only the scale changes, generate one largest required variant within 1600px and let responsive CSS scale it down.

For `srcset` or `<picture>`, select the smallest variant whose intrinsic dimensions cover the measured target without exceeding the target by more than an explicitly approved density factor. Do not create six duplicate assets merely because six Bootstrap tiers exist.

## 4. Asset-role sizing rules

| asset role | measurement rule | default composition rule |
|---|---|---|
| background | exact section/container box, including crop direction | match container ratio; reserve text-safe negative space only when the layout needs it |
| banner/hero | exact banner box at each art-directed ratio | wide crop; no extra canvas beyond the measured section |
| logo/wordmark | exact logo box and whether alpha is required | preserve clear space; use SVG/native logo when the project already has one |
| profile/avatar | exact rendered square or declared ratio | center the subject; keep important features inside the crop-safe area |
| gallery image | exact gallery cell box and responsive ratio | preserve the project’s contain/cover behavior |
| advertisement | exact ad slot width × height; mobile slots may be portrait | compose for the slot; do not reuse a desktop banner in a portrait slot without checking crop |
| card image | exact card media box, not the whole card | match `object-fit` and `object-position`; no unused border or card padding in the raster |
| smallest icon | exact visual box | prefer SVG/CSS; raster only when requested and never below 30×30 final pixels |

## 5. Format and transparency decision

Use the smallest format that preserves the required pixels:

- **JPG/JPEG by default** for opaque photos, backgrounds, banners, ads, gallery images, and card imagery. Re-encode with a quality sweep and visually check at the rendered size.
- **PNG only when real alpha transparency is required**, or when sharp flat edges/line art would show unacceptable JPEG artifacts. Do not keep a default opaque PNG.
- Transparent means actual alpha, not a white or checkerboard-looking background. Verify the alpha channel after generation.
- For `gpt-image-2` through the OpenAI API/CLI, native transparent background is currently unsupported. Do not silently switch models. Use the built-in image-generation path when it supports true transparency, or ask before using an explicitly approved fallback such as `gpt-image-1.5`; a chroma-key removal path is acceptable only when its edge validation passes.
- If the project already requires WebP/AVIF, follow the project contract; otherwise this policy’s default is JPG for opaque output and PNG for alpha output.

## 6. GPT Image 2 and generator constraints

When the selected generator accepts explicit dimensions, request a source canvas close to the measured ratio, then validate the final artifact:

- `gpt-image-2` supports flexible sizes, but source dimensions must satisfy the model’s current constraints: each edge is a multiple of 16px, long-to-short ratio is at most 3:1, total pixels are within the model’s documented range, and the model edge limit is respected.
- This local policy is stricter than the model maximum: the final saved asset must not exceed 1600px on either edge.
- If a 30–1600px target is too small or does not satisfy model source constraints, generate the nearest valid source canvas and **downsample/crop to the exact measured final dimensions**. Never keep the larger source as the project asset.
- If the measured ratio exceeds 3:1, do not distort or force an invalid model request. Use an art-directed crop, a CSS/background composition, or a project-approved alternative and verify the result.
- Use low quality only for disposable drafts, thumbnails, or rapid iteration. Use medium as the normal final starting point; use high only when text, dense detail, identity, or a difficult final asset justifies the extra cost and latency.
- Prefer explicit size over `auto` when exact fitting is required. Record the actual requested source size and the final post-processed size.

## 7. Mandatory post-generation optimization

Every generated candidate must pass this sequence before it becomes a project asset:

1. Read actual width, height, file format, color mode, and alpha presence.
2. Resize/crop to the exact target box; preserve aspect ratio and the project’s declared crop behavior.
3. For opaque images, remove alpha and encode JPG; for transparent images, preserve alpha and encode PNG.
4. Re-encode and compare bytes against visual quality at the rendered size. Reduce bytes until the smallest version remains sharp, clean, and free of halos, blocking, banding, or text damage.
5. Confirm both edges are within 30–1600px and no edge exceeds the approved measured target.
6. Inspect the image at the target CSS size and one larger review zoom. A technically valid dimension is not enough if the image looks blurry or the crop is wrong.
7. Save only the final selected asset in the active project folder, update references, and record provenance/use in the project’s existing changelog or asset manifest.

## 8. Stop conditions

Stop before generation when:

- the active project, route, target element, or computed dimensions are unknown;
- the requested composition conflicts with the measured box or model ratio constraints;
- transparency is required but the chosen model/path cannot provide it;
- the output is still an opaque PNG, larger than 1600px, larger than the measured target, missing required alpha, or visually blurry;
- the intended project asset would remain only in `.codex` storage;
- the final asset cannot be read back and verified.

## 9. Standard prompt additions

Append only the lines relevant to the measured asset:

```text
Asset role: <background | banner | logo | profile | gallery | ad | card | icon>
Target box: <exact final width>x<exact final height> px, measured from the rendered project element
Responsive behavior: <Bootstrap tier(s), actual box sizes, and whether art direction changes>
Composition: <match the target aspect ratio; preserve safe crop area; no extra canvas>
Output intent: <opaque JPG or true-alpha PNG; no watermark; no unintended text>
Quality gate: <sharp at the rendered CSS size; no blur, halos, banding, or crop loss>
```

This policy controls measurement and final asset handling. It does not replace the image-generation skill’s built-in-versus-CLI rules, project asset conventions, or current model documentation.

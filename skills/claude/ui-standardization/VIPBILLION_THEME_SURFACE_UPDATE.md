---
name: vipbillion-theme-surface-update
description: "Theme-surface notes for VIPBillion Vben Admin white/dark mode cleanup: list columns, detail drawers, form shells, HTML content editors, and theme-aware status badges."
triggers: ["vipbillion theme", "white theme", "dark mode", "status badge", "drawer theme", "table label design", "vben admin theme"]
version: 1.0
status: reference
---

# VIPBillion Theme Surface Update

Use these rules when a Vben Admin module needs to look correct in both white and dark themes.

## 1. Shared Surface Tokens

Prefer theme tokens over fixed colors:

- `bg-background`
- `border-border`
- `text-foreground`
- `text-muted-foreground`
- `bg-muted`
- `text-primary`

Avoid hardcoded gray shells such as:

- `bg-[#1f2127]`
- `border-gray-700`
- `text-gray-400`
- `text-gray-500`

## 2. Detail Drawer / Card Shells

Use a consistent white-surface card pattern:

```vue
<div class="rounded-lg border border-border bg-background p-4 shadow-sm">
```

Use this for:

- identity blocks
- content blocks
- summary blocks
- vehicle or route option blocks

## 3. Image Placeholder Pattern

Use light placeholders that still work in dark mode:

```vue
<div class="flex h-16 items-center justify-center rounded-lg border border-dashed border-border bg-background text-xs text-muted-foreground">
  No image
</div>
```

Use the same pattern for desktop/mobile images, avatars, and empty state media blocks.

## 4. Status Badge Pattern

Status badges should be theme-aware, not one fixed color.

Recommended active state:

```vue
'border border-emerald-200 bg-emerald-50 text-emerald-700 dark:border-emerald-800 dark:bg-emerald-950 dark:text-emerald-300'
```

Recommended inactive/default state:

```vue
'border border-border bg-muted text-muted-foreground'
```

Use `inline-flex rounded px-2 py-0.5 text-xs font-medium` as the badge base.

## 5. Table Status Labels

For table columns that use a shared status renderer:

- keep the renderer centralized when possible
- avoid hardcoding a dark-only Tag color
- if a module needs custom table cell markup, use the same active/inactive badge classes as the drawers

## 6. HTML Content Fields

For long HTML content:

- use `html-content-editor.vue`
- pass `maxHeight` when the drawer should not stretch
- keep internal scrolling inside the editor
- use the same height behavior for read-only and edit states

## 7. Input Addons

For `RM`, `%`, and similar add-ons:

- use theme-aware background and border tokens
- keep the addon compact
- avoid green/cyan addon text unless the design explicitly needs it

## 8. What Was Updated In VIPBillion

These modules were brought closer to theme-aware white/dark styling:

- bookings
- driver jobs
- driver order report
- driver commission management
- services
- attractions
- slideshows
- pricing rules
- news
- reviews
- vehicles
- currencies

## 9. Quick Fix Checklist

- [ ] Replace fixed gray shell colors with theme tokens
- [ ] Convert status badges to light/dark aware classes
- [ ] Keep white-mode cards bright and readable
- [ ] Keep dark-mode success badges visibly green
- [ ] Use shared HTML editor maxHeight instead of drawer stretching
- [ ] Do not change CRUD logic while fixing colors


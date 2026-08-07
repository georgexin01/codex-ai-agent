---
name: industrial-interaction-library
description: "Sovereign Industrial Patterns & Interaction Library (V2.1)"
triggers: ["industrial patterns", "ui patterns"]
version: 2.1
status: authoritative
date_updated: "2026-08-07"
last_audit: "2026-08-07"
---

# 🏗️ INDUSTRIAL INTERACTION LIBRARY (V2.1)

This file consolidates the two active industrial UX/UI pattern sets. Two sub-docs formerly merged here have moved: the Stitch UI palette protocol is retired to `memories/archive/STITCH_UI_PROTOCOL.md` (superseded — `USER_DNA.md` is the current default palette), and the mobile popup/modal engineering recipe now lives standalone at `memories/1_core/MOBILE_POPUP_MODAL_SIDEBAR.md` (it's a debugging recipe, not a design-DNA pattern).

# === INDUSTRIAL_PATTERNS.md ===
# Sovereign Industrial UX Patterns

This document defines the high-level UX and interaction patterns originally written for the (now dead) quizLaa project, but the patterns themselves (relationship tray, CellFkLink/Layericon navigation, Malaysian seed-data spec) are in active general use — `MODULE_AUDIT_PROTOCOL.md`'s Phase 1 relation-check logic is built directly on this vocabulary. Treat as general Vben-admin pattern reference, not project-specific.

## 📐 Pattern: The Top-Down Relationship Tray
This pattern provides an "unobtrusive reveal" of relational data without navigating away from the core list.

### 1. Interaction Model
- **Trigger A (General)**: Clicking the `lucide:layers` header icon (Layericon). Opens the tray with **Tabs** for all available relationships (e.g., Reviews, Leads).
- **Trigger B (Specific)**: Clicking a blue count link in a record (e.g., "5 Reviews"). Opens the tray in **Full-Bleed Single Mode** (specifically targeting that relationship).

### 2. Implementation Specs
- **Component**: `RelationshipDrawer.vue` (top-placement).
- **Embedded Tables**: Use the list components (e.g., `ReviewList`) with the `embedded` prop set to `true`. This removes external padding and full-page height controls. [FE:Step 09]
- **Header Aesthetic**: Uses `cinematic-gradient-header` for a premium, darkened visual break.
- **Drawer Placement**: `placement="top"`. Height should be roughly `600px` to `800px` depending on data density.

## 📐 Pattern: Relationship Navigation Hierarchy
Standardized mapping for M2M and 1:N navigation.

| Direction | Mechanism | Implementation | Referral |
|---|---|---|---|
| **UP** (to Parent) | **CellFkLink** | Blue clickable text in List columns. | `[FE:Step 09]` |
| **DOWN** (to Child) | **Layericon** | `lucide:layers` action button in List rows. | `[FE:Step 11]` |

## 📐 Pattern: Sovereign Data Specification (Malaysian)
All seed, mock, and test data MUST strictly follow Malaysian regional standards. [FE:Step 02]

- **Companies**: Must end in `Sdn Bhd` or `Bhd`.
- **Phones**: Format `+60 12-345 6789`.
- **Emails**: Use `.com.my` or `.my` domains where applicable.
- **Geography**: Utilize Malaysian cities (Kuala Lumpur, Penang, Johor Bahru).

## 📐 Pattern: The Profile-Only Detail
This pattern allows viewing an entity's core details (Profile) without the noise of its relationship tables, typically used when navigating *from* a relationship page (e.g., from a Lead to the Agent's profile). [FE:Step 09]

### Implementation Specs
- **Prop**: `hideTables: true`.
- **Navigation**: The `DetailDrawer` must check for this prop in `setData` and pass it to the underlying `Detail` component.

---
**Status**: Authoritative | **Last Update**: 2026-04-21 | **Domain**: UX / Interaction Design

# === SOVEREIGN_UI_PATTERNS.md ===
---
name: sovereign-ui-patterns
description: "Sovereign 设计模式 (V1.0)"
triggers: ["design", "patterns", "views", "filters", "chips", "status"]
version: 1.0
status: authoritative
---

# 第二部分 通用设计模式 (Sovereign Design Patterns)

本文件定义了 Views 中常用的交互模式，确保系统的视觉一致性和操作流畅度。

## 一、 水平状态标签 (Horizontal Status Chips)
*   **说明**: 用于列表顶部的分类过滤，支持横向滑动，带有缩放和发光效果。
*   **代码示例**:

```html
<!-- 使用 no-scrollbar 类隐藏滚动条 -->
<div class="flex gap-2 overflow-x-auto no-scrollbar p-4 pb-2">
  <button v-for="(cfg, key) in statusConfig" :key="key" :class="[
    'shrink-0 px-4 py-2 rounded-full border transition-all duration-300 flex items-center gap-2 shadow-sm text-[11px] font-bold',
    activeFilters.includes(key)
      ? 'bg-slate-900 border-slate-900 text-white scale-105 ring-2 ring-slate-900/10'
      : 'bg-white border-gray-200 text-slate-600 hover:border-gray-400'
  ]">
    <span class="size-1.5 rounded-full" :style="`background-color: ${cfg.color}`"></span>
    {{ cfg.label }}
  </button>
</div>
```

## 二、 状态条卡片 (Status Strip Card)
*   **说明**: 通过左侧的彩色条快速传达数据状态，适用于仪表盘和精简列表。
*   **代码示例**:

```html
<div class="bg-white rounded-2xl border border-gray-100 flex overflow-hidden shadow-sm active:scale-[0.98] transition-all duration-300">
  <!-- 根据状态绑定的颜色条 (GYOR 逻辑) -->
  <div class="w-1.5 shrink-0" :style="`background-color: ${statusColor}`"></div>
  
  <div class="flex-1 p-4">
    <!-- 内容区域 -->
    <div class="flex justify-between items-start">
      <h3 class="font-bold text-slate-900">{{ title }}</h3>
      <span :class="['px-2 py-0.5 rounded-md text-[9px] font-black', statusBg, statusText]">
        {{ statusLabel }}
      </span>
    </div>
  </div>
</div>
```

---
## 三、 相关链接 (Related Links)
*   **参考**: [MASTER_BLUEPRINT.md](../0_apex/templates/MASTER_BLUEPRINT.md)

---
*Created by Antigravity Tier-1 Core Design Node*


---

Two sub-docs previously merged here have moved (see note at top of this file): `memories/archive/STITCH_UI_PROTOCOL.md` (retired competing palette) and `memories/1_core/MOBILE_POPUP_MODAL_SIDEBAR.md` (mobile modal engineering recipe). §6's "conservative design principles" (don't unilaterally change unmentioned global config; respect existing visual conventions unless the user explicitly authorizes free rein) still apply generally — see `00_PULSE.md` §0.2's priority ladder (surgical action only).

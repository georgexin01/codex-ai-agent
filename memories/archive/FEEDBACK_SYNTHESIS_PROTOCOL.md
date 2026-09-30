---
name: feedback-synthesis-protocol
tier: 1
priority: CRITICAL
scope: ["chat", "blueprint", "evolution", "memory"]
version: 2.0
status: archived
---

> **ARCHIVED (tombstone)**: not referenced from `00_PULSE.md` or `skill_path_router.md` — unreachable except by direct path. Also majority Chinese-language, which conflicts with the established English-for-durable-knowledge rule (`2026-07-15-codex-knowledge-english-rule.md`, now routed in `00_PULSE.md` §0.1.3). Moved out of `2_governance/artifacts/` 2026-08-07 per `KNOWLEDGE_ROT_PROTOCOL.md` §6.

# 🧠 对话合成协议 (FEEDBACK SYNTHESIS PROTOCOL V2.0)

## 🎯 1. 使命 (MISSION)
本协议旨在通过 **Chain-of-Abstraction (CoA)** 逻辑，将用户对话中的原始反馈（Raw Signal）瞬间转化为工业化的 **DNA 规则**。V2.0 专注于零延迟提取、高密度存储与跨会话状态水合。

## 🔍 2. 信号提取与 CoA 逻辑 (SIGNALS & COA)
AI 必须在每轮对话结束时，通过以下阶梯进行提取：
1.  **Raw Signal**: 提取用户的原始需求（如 "这个按钮圆角太大了"）。
2.  **Abstraction (CoA)**: 剥离具体业务背景，转化为设计/逻辑准则（"圆角比例应遵循 1:1.6 黄金比例"）。
3.  **Standardization**: 转化为技术参数或 APEX 原则。

## 🧪 3. 高密度存储 (STORAGE)
所有提炼出的 "Synthesis Nodes" 必须记录在：
`SYNTHESIS_LOG.json` (the referenced log is unavailable in this checkout. This archived protocol's logging and promotion steps cannot be followed until the original log is recovered; do not infer or recreate its contents).

- **Pending**: 尚未验证或尚未同步至蓝图的节点。
- **Promoted**: 已正式进入 Tier-0/1 治理文件的规则。

## 🔄 4. 治理联动 (GOVERNANCE SYNC)
1.  **Pillar-0 Check**: Historical instruction to read `pending_nodes` from `SYNTHESIS_LOG.json`; currently unavailable, so this archived step is inactive.
2.  **Auto-Promotion**: 如果一个 Pending 节点在连续 3 轮对话中被验证有效，AI 必须主动发起 "Handshake Approved" 将其同步至 `GROUND_KERNEL.md` 或 `TIER_1_CORE_MASTER.md`。

## 🧹 5. 纯度审计 (PURITY AUDIT)
AI 严禁记录任何包含 PII、业务数据或冗余废话的反馈。只保留 **纯粹的技术与设计 DNA**。

---
**Sovereign Governance Node // Antigravity V15.2 (2026-05-02)**

---
name: supabase-auth-architecture
description: Reference for multi-project Supabase auth — 3-schema design, user creation flow, OTP verification.
triggers: ["supabase auth", "multi project auth", "auth architecture", "otp flow", "jwt claims"]
phase: reference
priority: high
requires: []
unlocks: []
inputs: []
output_format: architecture_reference
model_hint: medium
version: 2.0
aliases:
  - auth architecture reference
  - jwt claims guide
  - multi schema auth
contains:
  - three_schema_design
  - user_creation_flow
  - otp_verification
  - jwt_claims
related_docs:
  - skills/claude/README.md
  - skills/claude/WORKING_PROGRESS.md
  - skills/claude/generate-supabase-schema/skill.md
  - skills/SHARED_DB_CONTRACT.md
related_skills:
  - skills/project-handoff-doc-stack/SKILL.md
  - skills/claude-meta/validate-knowledge/skill.md
verification:
  - Use this as the auth architecture reference before changing schema or JWT behavior.
  - Confirm the three-schema flow and OTP path match the project truth.
---

# Supabase Multi-Project Auth Architecture (supabase-auth-architecture)

Record the complete Supabase multi-project authentication architecture, user creation flow, and OTP verification process.

## Overview

This document records the architecture decisions, data flow, and implementation patterns for managing users across multiple projects in a single Supabase instance.

## Core Architecture: 3 Schemas, 3 Responsibilities

```
一个 Supabase 实例（一个 PostgreSQL 数据库）
│
├── schema: auth              ← Supabase 内置，不按项目分
│   ├── auth.users            ← 登录账号（email + 密码 hash）
│   ├── auth.identities       ← 登录方式（email/phone/google）
│   └── 一个 email = 一个账号，跨所有项目共享
│
├── schema: public            ← 共享层，管理"谁在哪个项目做什么"
│   ├── public.project        ← 项目列表（quizLaa, wms, ...）
│   ├── public.role           ← 角色定义（每个项目有自己的角色集）
│   └── public.user           ← 桥接表：auth_id + project_id + role_id
│                                一个人在多个项目 = 多行记录
│
├── schema: quizLaa           ← 项目 A 的业务数据
│   ├── quizLaa.users         ← 业务用户（email, name, role）
│   ├── quizLaa.lessons
│   ├── quizLaa.questions
│   ├── quizLaa.questionAnswers
│   └── quizLaa.permissions   ← 权限矩阵
│
└── schema: wms               ← 项目 B 的业务数据
    ├── wms.users
    ├── wms.warehouses
    └── ...
```

## Key Tables Detail

### auth.users (Supabase built-in)
```sql
-- 不按项目分！一个 email = 一个登录账号
-- 密码用 bcrypt hash 存储
-- email_confirmed_at: NULL = 未验证，有值 = 已验证
-- raw_user_meta_data: 存自定义数据（如 temp_password: true）
```

### public.project
```sql
CREATE TABLE public.project (
    id UUID PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,       -- 'QuizLAA'
    schema_name VARCHAR(50) NOT NULL UNIQUE, -- 'quizLaa'
    description TEXT,
    is_active BOOLEAN DEFAULT true
);
```

### public.role
```sql
CREATE TABLE public.role (
    id UUID PRIMARY KEY,
    project_id UUID REFERENCES public.project(id), -- NULL = 全局角色
    name VARCHAR(50) NOT NULL,        -- 'admin', 'agent', 'staff'
    level INTEGER NOT NULL,           -- 数字越小权限越高
    UNIQUE(project_id, name)
);

-- 全局角色（project_id = NULL）
-- root_admin: level 0  ← 最高权限，可以管理所有项目
-- super_admin: level 10
-- admin: level 20
-- ...

-- 项目角色（project_id = 某个项目）
-- admin: level 20  (quizLaa)
-- agent: level 60  (quizLaa)
```

### public.user (桥接表)
```sql
CREATE TABLE public.user (
    id UUID PRIMARY KEY,
    auth_id UUID REFERENCES auth.users(id),    -- → 登录账号
    project_id UUID REFERENCES public.project(id), -- → 属于哪个项目
    role_id UUID REFERENCES public.role(id),    -- → 在这个项目的角色
    name TEXT NOT NULL,
    email TEXT,
    UNIQUE(auth_id, project_id)  -- 一个人在一个项目只能有一个角色
);

-- Example:
-- auth_id=xxx, project_id=quizLaa, role=admin   ← 在 quizLaa 是 admin
-- auth_id=xxx, project_id=wms, role=staff        ← 在 wms 是 staff
```

## Key Concepts

### anon key vs service_role key
```
anon key（公开密钥）
├── 固定的，所有用户共用（hardcode 在 .env 里）
├── 告诉 Supabase "这个请求来自你的应用"
├── 受 RLS 限制
├── 不能操作 auth schema
└── 暴露在前端没问题

service_role key（超级密钥）
├── 绕过所有 RLS
├── 可以操作 auth.users
├── 绝对不能放在前端
└── 只用在：Edge Function / 数据库函数 / 服务器后端

实际请求 = anon key + JWT access_token
├── anon key → "我是你的应用"
└── JWT → "我是 admin@quizlaa.com，角色是 admin"
```

### SECURITY DEFINER 函数
```
普通函数：以调用者身份运行，受 RLS 限制
SECURITY DEFINER 函数：以函数创建者（postgres superuser）身份运行
├── 可以操作 auth schema
├── 可以绕过 RLS
├── 不需要 service_role key
└── 安全：函数源码在数据库内部，前端看不到
```

### Permission System (权限控制)
```
quizLaa.permissions 表：
├── role_id + resource + action → scope
│
│ scope 的含义：
│ ├── 'all'  → 可以操作所有记录
│ ├── 'own'  → 只能操作自己的记录
│ └── 'none' → 没有权限
│
│ Example:
│ admin + users + create → 'all'    ← admin 可以创建用户
│ agent + lessons + read → 'all'    ← agent 可以看所有课程
│ agent + questionAnswers + read → 'own'  ← agent 只能看自己的答题
│ agent + users + create → (不存在) → 'none' ← agent 不能创建用户
```

### JWT Custom Claims (custom_access_token_hook)
```
登录时 → custom_access_token_hook 触发
├── 读取 public.user（根据 auth_id + active_project_id）
├── 注入到 JWT：
│   ├── project_id: UUID     ← 当前项目
│   ├── user_role: 'admin'   ← 角色名（注意不是 'role'，那个被 PostgREST 保留）
│   └── role_level: 20       ← 角色等级
└── 所有后续请求都带着这些信息
```

## User Creation Flow (RPC 方案)

### 前端调用
```typescript
// 像普通 API 一样简单
const { data, error } = await supabase.rpc('create_user', {
  p_email: 'newuser@quizlaa.com',
  p_password: '123456',
  p_name: 'New User',
  p_project_id: import.meta.env.VITE_PROJECT_ID,
  p_role: 'agent',
});
```

### 数据库内部（SECURITY DEFINER 函数）
```
create_user(p_email, p_password, p_name, p_project_id, p_role)
│
├── 1. 权限检查
│   ├── get_current_role_level() > 20 → 拒绝
│   └── 检查调用者是否有目标项目权限（root_admin 跳过）
│
├── 2. 查找 role_id
│   └── SELECT id FROM public.role WHERE name = p_role AND project_id = p_project_id
│
├── 3. auth.users（登录账号）
│   ├── 已存在同 email → 跳过（复用已有账号）
│   └── 不存在 → INSERT（密码用 crypt() 做 bcrypt hash）
│            └── email_confirmed_at = NULL（未验证，等 OTP）
│
├── 4. auth.identities（登录方式）
│   └── INSERT（email provider）
│
├── 5. public.user（项目角色绑定）
│   └── INSERT（auth_id + project_id + role_id）
│
├── 6. 业务表（根据项目 schema 动态决定）
│   ├── quizLaa → INSERT quizLaa.users
│   └── wms → INSERT wms.users
│
└── 全部在一个事务里，要么全成功要么全回滚
```

## Login Flow

### 现有流程（email + password）
```
1. supabase.auth.signInWithPassword({ email, password })
   → auth.users 验证密码

2. custom_access_token_hook 触发
   → 注入 project_id, user_role, role_level 到 JWT

3. 前端检查 JWT 里的 project_id
   → 如果跟当前 app 的 VITE_PROJECT_ID 不同 → 切换项目

4. 查 quizLaa.users 获取业务信息
   → 构建 UserInfo 返回前端
```

### OTP 首次登录流程（计划中）
```
Admin 创建用户
    → auth.users.email_confirmed_at = NULL
    → auth.users.raw_user_meta_data = { temp_password: true }

用户首次登录：
1. 输入 email + 临时密码 → 密码验证通过
2. 前端检测 user_metadata.temp_password === true
3. 跳转 OTP 验证页面
4. supabase.auth.signInWithOtp({ email }) → 发送 OTP 邮件
5. 用户输入 OTP → supabase.auth.verifyOtp({ email, token, type: 'email' })
6. 验证成功 → email_confirmed_at = now()
7. 可选：设置新密码 → supabase.auth.updateUser({ password })
8. 更新 user_metadata: { temp_password: false }

后续登录：
→ email + password（现有流程不变）
```

### Internal Tester Account Pattern
```
用法：
→ 项目 owner 需要一个隐藏的办公室/测试登录账号时，复用 create_user 的 4 层写入：
   1) auth.users
   2) auth.identities
   3) public."user"
   4) "{{SCHEMA}}".users

项目约定示例：
→ tester email: tech.zeta0001@gmail.com
→ tester role: admin
→ tester password: Zeta8888
→ project_id: 当前项目 UUID

隐藏规则：
→ 数据库 seed 只负责创建账号，不会自动从 Users 表消失
→ 如果要在 admin-panel 的 Users 列表里永久隐藏，必须在 users store/query 明确排除该 email
→ 不能只靠 auth/public/business 三张表插入来实现 UI 隐藏

Hard rule for Angel Interior:
→ When the user asks for a hidden admin tester login, default to tech.zeta0001@gmail.com / Zeta8888 unless they explicitly override it.
→ Always create/update the matching auth.users, auth.identities, public."user", and business-schema users rows.
→ Always keep this tester email hidden from the admin-panel Users table by default.
→ If the user provides a historical verified credential or secret source, prefer that verified history over any newer guess.
→ Never invent a password/secret when an earlier verified one exists in the project history or user-provided reference.

Angel workflow checklist:
→ Resolve the target project_id first.
→ Resolve the admin role_id from public.role for that project.
→ Keep auth.users.email, public."user".email, and business users.email aligned.
→ Set auth.users.raw_user_meta_data.active_project_id so JWT login points at the correct project.
→ For password resets, update encrypted_password and refresh the project pointer in the same pass.
→ For hidden tester accounts, exclude the email in the admin-panel users store/query, not only in the database seed.

Auto-run gate:
→ If the task is clearly an Angel admin auth/user operation and the requested account matches the hidden tester pattern, run the tester-account flow immediately.
→ If the task is about a different email, a different project, or the role/project mapping is unclear, pause and verify before writing SQL.
→ Prefer proceeding when the situation is unambiguous; ask only when a wrong write could affect the wrong project or account.
```

### Reusable SQL Template
```sql
DO $$
DECLARE
  v_project_id uuid := '{{PROJECT_ID}}'::uuid;
  v_email text := '{{EMAIL}}';
  v_password text := '{{PASSWORD}}';
  v_name text := '{{NAME}}';
  v_role text := '{{ROLE}}';
  v_role_id uuid;
  v_auth_id uuid;
BEGIN
  SELECT id INTO v_role_id
  FROM public.role
  WHERE project_id = v_project_id
    AND name = v_role
    AND is_delete = false
  LIMIT 1;

  IF v_role_id IS NULL THEN
    RAISE EXCEPTION 'Role "%" not found for project %', v_role, v_project_id;
  END IF;

  SELECT id INTO v_auth_id
  FROM auth.users
  WHERE email = v_email
  LIMIT 1;

  IF v_auth_id IS NULL THEN
    v_auth_id := gen_random_uuid();

    INSERT INTO auth.users (
      instance_id, id, aud, role, email,
      encrypted_password, email_confirmed_at,
      created_at, updated_at, is_sso_user,
      confirmation_token, recovery_token,
      email_change, email_change_token_new,
      email_change_token_current, phone_change,
      phone_change_token, reauthentication_token,
      raw_app_meta_data, raw_user_meta_data
    ) VALUES (
      '00000000-0000-0000-0000-000000000000',
      v_auth_id, 'authenticated', 'authenticated', v_email,
      crypt(v_password, gen_salt('bf')),
      now(), now(), now(), false,
      '', '', '', '', '', '', '', '',
      '{"provider":"email","providers":["email"]}'::jsonb,
      jsonb_build_object('active_project_id', v_project_id)
    );
  ELSE
    UPDATE auth.users
    SET encrypted_password = crypt(v_password, gen_salt('bf')),
        email_confirmed_at = COALESCE(email_confirmed_at, now()),
        raw_user_meta_data = COALESCE(raw_user_meta_data, '{}'::jsonb)
          || jsonb_build_object('active_project_id', v_project_id),
        updated_at = now()
    WHERE id = v_auth_id;
  END IF;

  INSERT INTO auth.identities (
    id, provider_id, user_id, identity_data, provider,
    last_sign_in_at, created_at, updated_at
  )
  SELECT
    v_auth_id,
    v_auth_id::text,
    v_auth_id,
    jsonb_build_object('sub', v_auth_id::text, 'email', v_email),
    'email',
    now(), now(), now()
  WHERE NOT EXISTS (
    SELECT 1 FROM auth.identities
    WHERE user_id = v_auth_id AND provider = 'email'
  );

  INSERT INTO public."user" (
    auth_id, project_id, role_id, name, email, status, is_delete
  ) VALUES (
    v_auth_id, v_project_id, v_role_id, v_name, v_email, 'active', false
  )
  ON CONFLICT (auth_id, project_id)
  WHERE auth_id IS NOT NULL
  DO UPDATE
  SET role_id = EXCLUDED.role_id,
      name = EXCLUDED.name,
      email = EXCLUDED.email,
      status = EXCLUDED.status,
      is_delete = false,
      updated_at = now();

  INSERT INTO "{{SCHEMA}}"."users" (
    "email", "name", "role", "isDelete"
  ) VALUES (
    v_email, v_name, v_role, false
  )
  ON CONFLICT ("email")
  WHERE "isDelete" = false
  DO UPDATE
  SET "name" = EXCLUDED."name",
      "role" = EXCLUDED."role",
      "isDelete" = false,
      "updatedAt" = now();
END $$;
```

## Multi-Project Access Rules

```
规则 1: 用户不能自己切换项目
  → user1 在 project1，不能自己跳到 project2
  → 必须 root_admin 分配

规则 2: Admin 创建用户只能分配自己有权限的项目
  → user1 (admin, project1) 创建 user2 → user2 只能在 project1
  → user1 不能把 user2 分配到 project2（除非 user1 也在 project2）

规则 3: 跨项目访问只有 root_admin 能分配
  → root_admin 在 public.user 插入新行
  → 同一个 auth_id + 不同 project_id + 对应 role_id

规则 4: 用户创建用户时的项目范围
  → user1 有 project1 和 project2
  → user1 创建 user2 时可以选 project1 或 project2
  → 不能选 project3（user1 自己没有的）
```

## Risk Analysis

### Safe
| Item | Why |
|------|-----|
| 密码存储 | bcrypt hash，不可逆 |
| 权限控制 | 函数内部检查 JWT role_level |
| 函数源码 | 存在数据库内部，前端不可见 |
| 事务安全 | 一个事务内完成，失败自动回滚 |
| service_role key | 不需要！SECURITY DEFINER 自带权限 |

### Risks
| Risk | Mitigation |
|------|-----------|
| 密码网络传输 | HTTPS 加密保护 |
| SECURITY DEFINER 权限大 | 用参数化查询，不拼接 SQL |
| 直接操作 auth schema | 本地/自建 Supabase 没问题；seed 数据已在这么做 |

## Related Files

| File | Purpose |
|------|---------|
| `supabase/migrations/001_fixed_public_schema.sql` | public schema + JWT hook |
| `apps/web-antd/src/sql/migrations/002_quizlaa_schema.sql` | quizLaa 表结构 |
| `apps/web-antd/src/sql/migrations/005_quizlaa_auth_users.sql` | seed auth users（参考格式） |
| `apps/web-antd/src/api/core/supabase-auth.ts` | 登录逻辑 |
| `apps/web-antd/src/api/supabase.ts` | Supabase client 配置 |
| `apps/web-antd/src/stores/users.ts` | 用户 CRUD store |
| `apps/web-antd/src/types/users.ts` | 用户类型定义 |

## Environment Variables

```bash
VITE_SUPABASE_URL=http://localhost:8000    # Supabase API URL
VITE_SUPABASE_ANON_KEY=eyJ...              # anon key (公开)
VITE_SUPABASE_SCHEMA=quizLaa              # 当前项目的 schema
VITE_PROJECT_ID=28f0f88d-...              # 当前项目的 UUID
```


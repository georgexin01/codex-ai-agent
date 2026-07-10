---
name: laa-api-connection-htaccess
description: "LAA 4-project API topology: Cloudflare → Kong, canonical URL, .htaccess patterns per project type, .env production values, local dev endpoints."
triggers: ["api connection", "htaccess", "supabase url", "laadvisory api", "kong proxy", "vps api", "env production", "quizlaa api"]
phase: reference
requires: []
unlocks: []
output_format: reference
version: 1.0
status: authoritative
last_updated: "2026-06-15"
---

# LAA API Connection & .htaccess Topology

## 🌐 API URL Architecture

```
Browser / PHP
    │
    ▼
https://laadvisory.com.my/api/*        ← CANONICAL production URL (all 4 projects)
    │
    ▼ Cloudflare proxy (DNS orange-cloud)
    │
    ▼
VPS:8000 (Kong API Gateway)            ← self-hosted Supabase
    ├── /rest/v1/*  → PostgREST
    ├── /auth/v1/*  → GoTrue
    ├── /storage/v1/* → Storage
    ├── /functions/v1/* → Edge Functions
    └── /realtime/v1/* → Realtime

Local dev: http://localhost:54321      ← Supabase CLI Docker
```

### ❌ RETIRED URLs — Never Use
| Old URL | Status |
|---------|--------|
| `https://api.zeta-groups.com` | Retired |
| `https://supabase.laadvisory.com.my` | Retired |
| `http://zeta-groups.com:8000` | Dev-only (old) |

### Why `/api` works on laadvisory.com.my
The main website `.htaccess` has `RewriteRule ^api/rest/v1/(.*)$ http://localhost:8000/rest/v1/$1 [P,L]` rules that reverse-proxy `/api/*` → VPS:8000. Cloudflare routes `laadvisory.com.my` to the VPS, so the path `/api` reaches Apache which strips it and forwards to Kong.

---

## 🔑 Shared Credentials (All 4 Projects)

```bash
# Production anon key (HS256 — same for all 4 projects)
ANON_KEY=eyJhbGciOiAiSFMyNTYiLCAidHlwIjogIkpXVCJ9.eyJyb2xlIjogImFub24iLCAiaXNzIjogInN1cGFiYXNlIiwgImlhdCI6IDE2NDE3NjkyMDAsICJleHAiOiAxNzk5NTM1NjAwfQ.1z3DU1Qbm4RTErVIRiiSwTg-NpNG4EAxShvJsVO2zG4

# Local dev anon key (Supabase CLI demo JWT — different secret than prod)
LOCAL_ANON_KEY=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZS1kZW1vIiwicm9sZSI6ImFub24iLCJleHAiOjE5ODM4MTI5OTZ9.CRXP1A7WOeoJeXxjNni43kdQwgnWNReilDMblYTn_I0

# Project & schema (same across all 4)
SCHEMA=quizLaa
PROJECT_ID=f9c25a4a-4394-48ce-b2d5-4302ee0e1424
```

> ⚠️ The production anon key and local dev anon key are DIFFERENT — different JWT secrets. Using production key against localhost:54321 returns `PGRST301 invalid JWT`.

---

## 📦 .env Files Per Project

### Project A — admin-panel-quizLaa (Vben Admin / Vue 3)

**`.env.production`** (`apps/web-antd/.env.production`)
```bash
VITE_BASE=/
VITE_GLOB_API_URL=https://laadvisory.com.my/api
VITE_SUPABASE_URL=https://laadvisory.com.my/api
VITE_SUPABASE_ANON_KEY=eyJhbGciOiAiSFMyNTYiLCAidHlwIjogIkpXVCJ9.eyJyb2xlIjogImFub24iLCAiaXNzIjogInN1cGFiYXNlIiwgImlhdCI6IDE2NDE3NjkyMDAsICJleHAiOiAxNzk5NTM1NjAwfQ.1z3DU1Qbm4RTErVIRiiSwTg-NpNG4EAxShvJsVO2zG4
VITE_SUPABASE_SCHEMA=quizLaa
VITE_PROJECT_ID=f9c25a4a-4394-48ce-b2d5-4302ee0e1424
VITE_NITRO_MOCK=false
VITE_COMPRESS=none
VITE_PWA=false
VITE_INJECT_APP_LOADING=true
VITE_ARCHIVER=true
VITE_AGENT_PORTFOLIO_URL=https://laadvisory.com.my
```

**`.env.development.localhost`** (local Docker — primary dev command: `pnpm dev:local`)
```bash
VITE_PORT=5666
VITE_APP_TITLE=LAA Admin
VITE_BASE=/
VITE_GLOB_API_URL=http://localhost:54321
VITE_SUPABASE_URL=http://localhost:54321
VITE_SUPABASE_ANON_KEY=eyJhbGciOiAiSFMyNTYiLCAidHlwIjogIkpXVCJ9...   # prod key also works locally if JWT secret matches
VITE_SUPABASE_SCHEMA=quizLaa
VITE_PROJECT_ID=f9c25a4a-4394-48ce-b2d5-4302ee0e1424
VITE_NITRO_MOCK=false
VITE_AGENT_PORTFOLIO_URL=http://localhost:8002
```

---

### Project B — webApp-LAA-quiz-v2 (Vue 3 SPA)

**`.env.production`**
```bash
VITE_BASE=/
VITE_GLOB_API_URL=https://laadvisory.com.my/api
VITE_SUPABASE_URL=https://laadvisory.com.my/api
VITE_SUPABASE_ANON_KEY=eyJhbGciOiAiSFMyNTYiLCAidHlwIjogIkpXVCJ9...
VITE_SUPABASE_SCHEMA=quizLaa
VITE_PROJECT_ID=f9c25a4a-4394-48ce-b2d5-4302ee0e1424
VITE_NITRO_MOCK=false
VITE_INJECT_APP_LOADING=true
VITE_ARCHIVER=true
VITE_AGENT_PORTFOLIO_URL=https://laadvisory.com.my
```

**`.env.development.localhost`** (primary dev: `npm run dev:local` / `pnpm dev`)
```bash
VITE_PORT=5667
VITE_BASE=/
VITE_GLOB_API_URL=http://localhost:54321
VITE_SUPABASE_URL=http://localhost:54321
VITE_SUPABASE_ANON_KEY=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZS1kZW1vIiwicm9sZSI6ImFub24iLCJleHAiOjE5ODM4MTI5OTZ9.CRXP1A7WOeoJeXxjNni43kdQwgnWNReilDMblYTn_I0
VITE_SUPABASE_SCHEMA=quizLaa
VITE_PROJECT_ID=f9c25a4a-4394-48ce-b2d5-4302ee0e1424
```

> ⚠️ This project uses the **CLI demo anon key** locally (different from prod key). Using prod key against localhost:54321 returns PGRST301.

---

### Project C — website-LAA-agent (PHP Sovereign — deployed at /agents/)

**`api/core/.env.production`**
```bash
APP_ENV=production
SUPABASE_URL=https://laadvisory.com.my/api
SUPABASE_ANON_KEY=eyJhbGciOiAiSFMyNTYiLCAidHlwIjogIkpXVCJ9...
SUPABASE_SCHEMA=quizLaa
PROJECT_ID=f9c25a4a-4394-48ce-b2d5-4302ee0e1424
# System-user for authenticated uploads (anon RLS allows write-only):
SUPABASE_AUTH_EMAIL=admin@quizlaa.com
SUPABASE_AUTH_PASSWORD=123456
```

**`api/core/.env`** (local dev)
```bash
APP_ENV=dev
SUPABASE_URL=http://localhost:54321
SUPABASE_ANON_KEY=eyJhbGciOiAiSFMyNTYiLCAidHlwIjogIkpXVCJ9...
SUPABASE_SCHEMA=quizLaa
PROJECT_ID=f9c25a4a-4394-48ce-b2d5-4302ee0e1424
SUPABASE_AUTH_EMAIL=admin@quizlaa.com
SUPABASE_AUTH_PASSWORD=123456
```

---

### Project D — website-LAA-website (PHP Sovereign — root domain)

**`api/core/.env.production`**
```bash
APP_ENV=production
SUPABASE_URL=https://laadvisory.com.my/api
SUPABASE_ANON_KEY=eyJhbGciOiAiSFMyNTYiLCAidHlwIjogIkpXVCJ9...
SUPABASE_SCHEMA=quizLaa
PROJECT_ID=f9c25a4a-4394-48ce-b2d5-4302ee0e1424
```

---

## 🗂️ .htaccess Patterns

### Type 1 — Vue SPA (Projects A + B)
Used by: `admin-panel-quizLaa/apps/web-antd/public/.htaccess` and `webApp-LAA-quiz-v2/favicon/.htaccess`

> `favicon/` is the `publicDir` for the quiz app — the .htaccess there gets copied to `dist/` on build.

```apache
<IfModule mod_rewrite.c>
  RewriteEngine On
  RewriteBase /

  # Reverse Proxy: Supabase API (localhost:8000)
  RewriteRule ^rest/v1/(.*)$      http://localhost:8000/rest/v1/$1      [P,L]
  RewriteRule ^auth/v1/(.*)$      http://localhost:8000/auth/v1/$1      [P,L]
  RewriteRule ^storage/v1/(.*)$   http://localhost:8000/storage/v1/$1   [P,L]
  RewriteRule ^functions/v1/(.*)$ http://localhost:8000/functions/v1/$1 [P,L]
  RewriteRule ^realtime/v1/(.*)$  http://localhost:8000/realtime/v1/$1  [P,L]

  # SPA Fallback (Vue Router)
  RewriteRule ^index\.html$ - [L]
  RewriteCond %{REQUEST_FILENAME} !-f
  RewriteCond %{REQUEST_FILENAME} !-d
  RewriteRule . /index.html [L]
</IfModule>

# index.html — no cache
<FilesMatch "index\.html$">
  Header set Cache-Control "no-cache, no-store, must-revalidate"
  Header set Pragma "no-cache"
  Header set Expires 0
</FilesMatch>

# JS/CSS (Vite hash) — cache 1 year
<FilesMatch "\.(js|css)$">
  Header set Cache-Control "public, max-age=31536000, immutable"
</FilesMatch>

# Images/fonts — cache 1 year
<FilesMatch "\.(ico|pdf|jpg|jpeg|png|webp|gif|svg|woff|woff2|ttf|eot)$">
  Header set Cache-Control "public, max-age=31536000, immutable"
</FilesMatch>
```

**How it works on VPS:** The Vue app is deployed to a subfolder. When the Supabase JS client calls `https://laadvisory.com.my/rest/v1/...`, the request hits Apache → `RewriteRule ^rest/v1/` proxies to Kong on localhost:8000. Vue Router's history mode is handled by the SPA fallback.

---

### Type 2 — PHP Subfolder (Project C — deployed at /agents/)

```apache
RewriteEngine On

<IfModule mod_rewrite.c>
  RewriteBase /agents/     # ← CRITICAL: must match deployment subfolder

  # PHP front-controller (pass all non-asset requests to index.php)
  RewriteCond %{REQUEST_URI} !(\.png|\.jpg|\.webp|\.gif|\.jpeg|\.zip|\.css|\.svg|\.js|\.ico|\.webmanifest|\.pdf|\.txt|\.woff|\.woff2|\.eot|\.ttf|\.mp4|\.html|\.php)$
  RewriteRule (.*) index.php [QSA,L]
</IfModule>

<FilesMatch "index\.php$">
  Header set Cache-Control "no-cache, no-store, must-revalidate"
  Header set Pragma "no-cache"
  Header set Expires 0
</FilesMatch>

<FilesMatch "\.(js|css)$">
  Header set Cache-Control "public, max-age=31536000, immutable"
</FilesMatch>

<FilesMatch "\.(ico|pdf|jpg|jpeg|png|webp|gif|svg|woff|woff2|ttf|eot|mp4)$">
  Header set Cache-Control "public, max-age=31536000, immutable"
</FilesMatch>

<IfModule mod_mime.c>
  AddType application/manifest+json .webmanifest
</IfModule>
```

> ⚠️ **`RewriteBase /agents/` is mandatory.** Without it, `RewriteRule (.*) index.php` resolves to root `/index.php` (the main website's entry), causing a 404 or wrong page. If you change the subfolder name, update `RewriteBase` to match.

**Supabase API from PHP:** The PHP backend calls `https://laadvisory.com.my/api/rest/v1/...` directly (not via Apache proxy). Kong receives it over the public internet — no localhost shortcut needed.

---

### Type 3 — PHP Root Domain (Project D — root of laadvisory.com.my)

```apache
RewriteEngine On

<IfModule mod_rewrite.c>
  RewriteBase /

  # Reverse Proxy: Supabase via /api/ path (strips /api prefix → Kong)
  RewriteRule ^api/rest/v1/(.*)$      http://localhost:8000/rest/v1/$1      [P,L]
  RewriteRule ^api/auth/v1/(.*)$      http://localhost:8000/auth/v1/$1      [P,L]
  RewriteRule ^api/storage/v1/(.*)$   http://localhost:8000/storage/v1/$1   [P,L]
  RewriteRule ^api/functions/v1/(.*)$ http://localhost:8000/functions/v1/$1 [P,L]
  RewriteRule ^api/realtime/v1/(.*)$  http://localhost:8000/realtime/v1/$1  [P,L]

  # LAA-agent asset fallback (agent subfolder shares asset paths)
  RewriteCond %{REQUEST_FILENAME} !-f
  RewriteCond %{REQUEST_FILENAME} !-d
  RewriteRule ^(uploads|assets|css|js|images|favicon|fonts)/(.+)$ /agents/$1/$2 [L]

  # PHP front-controller (exclude known static/API paths)
  RewriteCond %{REQUEST_URI} !^/css
  RewriteCond %{REQUEST_URI} !^/js
  RewriteCond %{REQUEST_URI} !^/images
  RewriteCond %{REQUEST_URI} !^/fonts
  RewriteCond %{REQUEST_URI} !^/plugins
  RewriteCond %{REQUEST_URI} !^/uploads
  RewriteCond %{REQUEST_URI} !^/lang
  RewriteCond %{REQUEST_URI} !^/favicon
  RewriteCond %{REQUEST_URI} !^/agents
  RewriteCond %{REQUEST_URI} !^/api
  RewriteCond %{REQUEST_URI} !^/downloaded-template
  RewriteCond %{REQUEST_URI} !(\.png|\.jpg|\.jpeg|\.gif|\.svg|\.css|\.js|\.ico|\.woff|\.woff2|\.ttf|\.eot|\.pdf|\.mp4|\.webp|\.json|\.webmanifest|\.xml|\.txt|\.map)$
  RewriteRule (.*) index.php [QSA,L]
</IfModule>

<FilesMatch "index\.(html|php)$">
  Header set Cache-Control "no-cache, no-store, must-revalidate"
  Header set Pragma "no-cache"
  Header set Expires 0
</FilesMatch>

<FilesMatch "\.(js|css)$">
  Header set Cache-Control "public, max-age=31536000, immutable"
</FilesMatch>

<FilesMatch "\.(ico|pdf|jpg|jpeg|png|webp|gif|svg|woff|woff2|ttf|eot|mp4)$">
  Header set Cache-Control "public, max-age=31536000, immutable"
</FilesMatch>

<IfModule mod_mime.c>
  AddType application/manifest+json .webmanifest
</IfModule>
```

**Why this proxies `/api`:** This root `.htaccess` IS the gateway. It intercepts `https://laadvisory.com.my/api/*` and reverse-proxies to localhost:8000 (Kong). This is what makes `https://laadvisory.com.my/api` the working production API URL for all 4 projects.

---

## 🗺️ Deployment Topology Map

```
laadvisory.com.my/           → website-LAA-website (PHP root)
laadvisory.com.my/agents/    → website-LAA-agent (PHP subfolder)
laadvisory.com.my/api/*      → Kong:8000 (Supabase API gateway)
app.laadvisory.com.my/       → webApp-LAA-quiz-v2 (Vue SPA)
admin.laadvisory.com.my/     → admin-panel-quizLaa (Vue SPA / Vben Admin)
```

---

## 🛡️ Guardrails

- **One canonical URL** — `https://laadvisory.com.my/api` in ALL env files. Never mix old URLs or point different projects to different endpoints.
- **`RewriteBase /agents/`** for PHP subfolder — if you ever rename or move the subfolder, update this to match.
- **`publicDir` for quiz app** — the quiz app uses `favicon/` as its Vite `publicDir`. Put `.htaccess` there (not `public/`). Vite copies it to `dist/` on build.
- **Two anon keys** — production uses the self-hosted HS256 key. Local dev (Supabase CLI) uses the demo key (`iss: supabase-demo`). Never swap them across environments.
- **No trailing slash on SUPABASE_URL** — `SupabaseClient` and the Supabase JS client both do `rtrim` defensively but don't rely on it.
- **PHP projects don't proxy locally** — PHP calls the Supabase URL directly (no local Apache proxy needed). Only the Vue SPA apps need the `rest/v1/` → `localhost:8000` rewrites in their `.htaccess`.

## ✅ Quick Verify

```bash
# Test canonical API URL responds
curl -I https://laadvisory.com.my/api/rest/v1/
# Expect: 200 or 401 (means Kong is reachable)

# Test local Docker
curl -I http://localhost:54321/rest/v1/
# Expect: 200 or 401

# Check .env file is gitignored
git check-ignore api/core/.env
# Expect: api/core/.env
```

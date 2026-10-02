---
name: vipbillion-news-import-batches
description: Use for VIPBillion local-Docker news imports that need additive batches, bilingual validation, image sizing, and a localhost smoke check. [ad-hoc note]
argument-hint: "[batch]"
user-invocable: false
allowed-tools:
  - Read
  - Grep
  - Bash
---

# VIPBillion News Import Batches

## When to use

Use only for the VIPBillion local-Docker news import. Start from the verified `news.md` schema and existing importer; do not use this as a generic news migration procedure. [ad-hoc note]

## Inputs / context to gather

1. Read the current `news.md` schema and existing importer. [ad-hoc note]
2. Confirm the approved additive phase order and the selected batch. [ad-hoc note]

## Procedure

1. Preserve the approved additive phase order `10, 40, 50, 50, 50`; leave old rows unchanged unless the user explicitly requests a correction. [ad-hoc note]
2. For each batch, check selected/cumulative counts, JSON parsing and aligned language, the company-name rule, generated SQL/inserts, proportional image dimensions, and one localhost `/news` smoke check. [ad-hoc note]
3. Normalize company names to `VIP BILLION MILESTONE TRAVEL & TOURS`, or use the `SDN BHD` form only when the source has that legal suffix. [ad-hoc note]
4. Resize images proportionally within desktop `1200x630` and mobile `400x300`; do not add padding, white canvases, or contain-style letterboxing. Keep real stored paths. [ad-hoc note]

## Efficiency plan

1. After initial schema/source verification, use the compact batch gate; do not repeat full site recaptures, historical audits, or broad repository scans unless a gate fails or the source/schema changes. [ad-hoc note]

## Pitfalls and fixes

- Symptom: a batch risks rewriting existing data. Fix: keep the Docker/Supabase import additive-only; do not reset, delete, recreate, or alter unrelated old rows. [ad-hoc note]

## Verification checklist

1. The selected and cumulative counts, JSON/language, company-name, SQL/insert, image, and `/news` gates pass. [ad-hoc note]
2. Old rows remain unchanged outside an explicitly requested correction. [ad-hoc note]

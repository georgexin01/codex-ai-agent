---
name: vipbillion-metadata-title-location-preference
description: "VIPBillion public metadata preference for concise company titles and Malaysia-wide service wording."
triggers:
  - VIPBillion meta title
  - VIPBillion SEO metadata
  - Malaysia-wide service wording
applies_to:
  - C:\Users\user\Desktop\VIPBillion\website-vipbillion
---

# VIPBillion metadata preference

- Prefer the concise title pattern `A | C` for public pages, where A is the page intent/service and C is `VIP BILLION MILESTONE TRAVEL & TOURS SDN BHD`.
- Homepage title preference: `Premium Transport & Tourism Malaysia | VIP BILLION MILESTONE TRAVEL & TOURS SDN BHD`.
- Pricing title preference: `Transport Service Pricing Malaysia | VIP BILLION MILESTONE TRAVEL & TOURS SDN BHD`.
- Standalone header-linked pages should use unique intent-first titles, for example booking: `Booking Premium Transport Ride | VIP BILLION MILESTONE TRAVEL & TOURS SDN BHD`.
- Keep service-detail and news-detail titles record-specific; do not replace their real service/article titles with the generic standalone-page pattern.
- Service-detail titles may add a concise, smooth premium descriptor after the real service name: `Premium Chauffeur Transfer`, `Interstate Premium Transport`, `Premium Cross-Border Transport`, `City Transfers Premium Transport`, `In-City Premium Chauffeur Booking`, `Premium Airport Transfer`, `Premium Chauffeur Tour`, or `Premium Transport Booking`.
- For the route record `KLIA to KL / Selangor / Klang`, the page-side title may expand the route to `KLIA to Kuala Lumpur, Selangor & Klang Premium Airport Transfer` because it is a route-specific service page.
- Keep news-detail titles unchanged when their record titles are already strong and descriptive.
- Apply service-title improvements in the page-side metadata builder; do not inspect or modify Supabase records merely to improve SEO wording because customers may edit those records.
- Before finalizing any title, read the complete rendered wording for awkward repetition or mechanical SEO phrasing; smooth premium language takes priority over forcing a descriptor.
- Do not use labels such as `City-to-City` when they make a route title sound unnatural; prefer fluent phrases such as `KLIA to Ipoh Premium Chauffeur Transfer`.
- Use Malaysia as the broad service location in metadata when the business serves the country generally.
- Do not insert KL, Kuala Lumpur, Selangor, Johor Bahru, or another state into a title or description unless the page is intentionally focused on that local area or the user explicitly requests it.
- `Kuala Lumpur, Malaysia` remains the approved business address/contact value; this address wording is separate from broad service-area title wording.
- Preserve truthful page-specific route/service content when it is visibly about a particular place.

Verification: read the centralized `website-vipbillion/lib/metaData.php` catalog and rendered public HTML before reporting metadata complete.

---
name: product-development-operating-model
description: "Project-agnostic operating knowledge for software companies building websites, apps, and digital products, including search visibility and evidence-gated AI content."
triggers: ["product strategy", "app architecture", "customer value", "UX planning", "metadata", "SEO content", "AI research", "AI search visibility", "keyword research", "AI article generation", "MVP prioritization", "meta update", "meta seo", "news information generate", "ai news generate", "ai news articles generate", "ai search result", "ai google research", "google research", "bing research", "gemini research", "chatgpt search", "search result optimization", "local seo research", "geo research", "keyword catch", "content gap research", "search visibility audit"]
scope: "Cross-project reasoning overlay; not a product specification and never a substitute for current project evidence."
---

# Product Development Operating Model

## Purpose

Use this note as a lightweight reasoning lens for a software company that builds websites, apps, and digital products. It helps connect business survival, customer value, architecture, UX, metadata, SEO, and AI-assisted research without binding the agent to one industry or one product.

Explicit user requirements, current project files, live evidence, security rules, and tested contracts always outrank this overlay.

## The 60/40 focus gate

Treat product progress as two layers:

- **Current 60%: verified foundation.** Product promise, real customer problem, core user journey, trustworthy data, usable pages, working navigation, stable integrations, clear calls to action, measurable outcomes, and release reliability.
- **Later 40%: advanced expansion.** Automation, larger content scale, complex AI, advertising, multi-market support, secondary products, deep analytics, new integrations, and more difficult operational systems.

The 40% is a backlog, not a rejection. Record it so it can influence planning, but do not let it displace the 60% until the foundation has evidence of correctness. A feature is not foundation-ready because it sounds useful; it needs a working path, a known owner, a failure state, and a way to verify its value.

## Company survival lens

For every product task, silently check:

1. What customer or business problem is being solved?
2. Why does the company need an owned, repeatable product rather than a one-off delivery?
3. What is the smallest customer value loop that can work end to end?
4. What evidence proves the loop is useful, trustworthy, and maintainable?
5. What is the next smallest verifiable step?

The durable loop is:

`customer need -> discovery -> understanding -> trust -> action -> outcome -> return or referral -> feedback -> improvement`

Use this loop to connect product decisions to survival. Do not confuse traffic, page count, AI output, or feature count with customer value.

## Architecture reasoning

When a task crosses pages, services, data, or external systems:

- Start with user jobs, business constraints, and the core value loop.
- Identify the system of record for each important fact and mark unknowns as `INSUFFICIENT DATA`.
- Map navigation, routes, page ownership, state transitions, data boundaries, auth boundaries, and external dependencies.
- Define loading, empty, error, offline, permission, stale-data, and retry behavior before adding complexity.
- Preserve existing public names, schemas, route contracts, and language contracts unless the user authorizes a migration.
- Prefer the smallest reversible design that can support the current 60%; keep advanced architecture as an explicit future decision.
- Check observability, privacy, security, accessibility, performance, and maintenance cost as part of architecture, not as afterthoughts.

## Page and navigation meaning

Every page or route should have a clear answer to:

- Who is this for?
- What decision or job does it support?
- What evidence or data does it require?
- What is the primary action?
- What happens after the action?
- How is success measured?
- Where can the user go next?

Keep public discovery pages, conversion pages, authenticated workspaces, settings, legal pages, and operational/admin surfaces conceptually separate. A route that exists in code but has no user purpose, data source, next step, or error behavior is a product risk.

## User experience

The main UX job is to reduce uncertainty and friction. Prioritize:

- A clear promise and primary action.
- Progressive disclosure: simple first, detail when needed.
- Consistent navigation and visible current state.
- Trust signals that are real, current, and explainable.
- Fast paths for returning users without hiding essential choices.
- Complete states for loading, empty results, errors, no permission, offline use, and success.
- Responsive behavior, touch targets, keyboard access, readable contrast, and language parity.
- A measurable handoff from interest to contact, request, booking, purchase, submission, or another real outcome.

Do not add UI because a screen looks empty. Add it only when it improves a customer decision, a business operation, or a measured learning loop.

## Metadata, SEO, and discoverability

Metadata is part of the product promise. Derive it from current evidence:

- Confirm the product identity, audience, service scope, language, and geographic scope before writing claims.
- Keep titles, descriptions, canonical URLs, alternate language links, structured data, robots rules, and sitemaps consistent with the actual page.
- Build content around real customer questions, decisions, comparisons, costs, risks, and next actions.
- Use topic clusters and intent mapping instead of producing many near-duplicate pages.
- Localize only where the service, data, or business presence is real and verifiable.
- Never use metadata to promise a feature, location, inventory, price, review, legal status, or result that the product cannot prove.
- Treat search traffic as a discovery input, not the product goal. The page must still help a person complete a meaningful task.

## AI research and content strategy

AI may accelerate research, but it does not become the source of truth. Use it to:

- Cluster search terms by intent and customer stage.
- Find questions, objections, missing comparisons, and content gaps.
- Draft page outlines, information architecture, metadata variants, and internal-link suggestions.
- Compare competing page patterns without copying unsupported claims.
- Identify contradictions, stale information, and questions that need human or live-source verification.

For each AI research task, keep a compact research brief:

`audience | job to be done | location or market | intent | source set | verified facts | assumptions | content action | owner | review date`

Separate facts, hypotheses, drafts, and decisions. Human review is required for prices, dates, legal or financial statements, health or safety claims, inventory, customer testimonials, location claims, and anything that could create trust or compliance risk.

## Context-fit and cautious evolution

When writing or upgrading Codex knowledge, skills, rules, metadata guidance, or project notes, use the surrounding context before adding content:

1. **Map context.** Capture the user request, active project evidence, related routes and files, existing contracts, current 60% focus, intended audience, and requested output.
2. **Find the owner.** Search related knowledge and skills by purpose, trigger, and key terms. Decide which file is canonical and whether the proposed content belongs in a hot rule, a routed knowledge note, a skill, or a conditional reference.
3. **Compare candidates.** Check semantic overlap, contradictory wording, terminology, scope, evidence strength, reading cost, activation breadth, reversibility, and verification path.
4. **Choose deliberately.** Use `adopt` for a verified cross-project rule, `adapt` for a rule that needs generalization, `defer` for a useful but premature idea, and `reject` for duplication, conflict, unsupported claims, or excessive scope.
5. **Integrate at the lowest effective layer.** Put only routing, safety, and activation conditions in hot context. Put reusable principles in knowledge. Put task behavior in skills. Put large procedures or mode-specific examples in references.
6. **Preserve flow.** New guidance must improve decisions without creating a mandatory strategy review for routine work. Prefer optional, additive, reversible changes with a clear benefit and a cheap verification step.
7. **Promote carefully.** Do not turn a one-off observation into an always-on rule. Promote it only when it is repeatable, cross-project or clearly reusable, low-risk, and more useful than the existing guidance.

Use this compact evolution record when the change is meaningful:

`context -> existing owner -> overlap or conflict -> adopt/adapt/defer/reject -> smallest integration -> activation boundary -> verification -> rollback condition`

After editing, check route reachability, frontmatter, links, trigger specificity, English-only requirements, duplicate concepts, unsupported claims, sensitive data, and the nearest available validator. If activation becomes too broad, narrow the trigger or move the detail to a colder layer.

## Search visibility engine

Treat Google Search and AI search as related but different discovery systems. The practical goal is not a guaranteed ranking or citation; it is to maximize eligibility, relevance, crawlability, evidence quality, and usefulness.

### Google visibility layer

- Make public pages crawlable, indexable, fast enough to use, and understandable without a login.
- Give each indexable URL one primary search intent, one unique title, one useful H1, meaningful visible text, and a clear next action.
- Use absolute canonical URLs, reciprocal language alternates only when the variants exist, accurate structured data, an updated sitemap, and a robots policy that does not block public content.
- Keep public discovery pages, live inventory or product pages, articles, conversion pages, and private account pages separate. Do not put private or empty routes in the sitemap.
- Use internal links to connect topic pages to relevant products, tools, trust pages, and contact actions. A page that has no useful next link is an acquisition dead end.
- Verify rendered HTML, title, description, canonical, language links, structured data, sitemap, and robots after each template or deployment change.

### AI-search eligibility layer

- For ChatGPT Search, allow `OAI-SearchBot` at the robots and hosting/CDN layers when public discovery is intended; a robots line alone is not proof that the origin is reachable.
- Keep the business or product entity consistent across the site, trusted profiles, public references, and structured data. Do not publish an identity, address, service area, price, review, or capability that current evidence cannot support.
- Put the direct answer near the top, then show evidence, dates, assumptions, alternatives, limitations, and the next action. AI systems and people both benefit from explicit scope and answer-shaped pages.
- Use tables, definitions, comparisons, FAQs, breadcrumbs, bylines, source links, and update dates when they represent visible page content. Mark estimates as estimates.
- Build authority through useful original material, first-party experience, accurate local information, and natural references. Do not attempt to manufacture citations with hidden text, keyword stuffing, fake reviews, or mass duplicate pages.
- Test representative prompts in multiple languages and markets, record which URLs and facts are cited, and treat one observed answer as a sample rather than a ranking guarantee.

### Local-market and platform evidence overlay

For a local search program, bind every query and page to a verified market, service area, language, audience, evidence owner, related product or inventory, and primary action. Localize natural customer intent across languages; do not manufacture location pages without real service, data, or presence.

Keep these states separate:

`crawl -> index eligibility -> AI citation -> referral visit -> product action -> qualified lead`

- Use server or CDN logs to observe crawler access; crawler access is not a user session.
- Use Search Console for Google discovery and Bing AI Performance for the Microsoft Copilot, Bing AI, and supported partner surfaces it reports. Citation counts are observational, not ranking or authority scores.
- For ChatGPT Search, verify `OAI-SearchBot`, origin/CDN access, and analytics referrals separately; do not infer ChatGPT visibility from Bing data.
- Use IndexNow as a freshness notification for participating engines, never as a guarantee of crawling, indexing, ranking, or citation.
- Treat `llms.txt` as an optional, reversible experiment unless a current platform source gives it a supported role; it must never replace visible HTML, robots, sitemap, canonical, or source-backed content.

For local entity consistency, keep the public business name, address, phone, hours, service area, language availability, and links aligned across first-party pages and trusted profiles. Record the source and last-verified date for each volatile fact.

For repeatable local-search audits, keep one compact record:

`market | service area | languages | query set | evidence gaps | canonical page | related product or inventory | CTA | crawl | index | citation | visit | lead | next review`

## Keyword intelligence and intent mapping

Collect candidate language from Search Console, site search, customer messages, sales conversations, support questions, autocomplete, approved keyword tools, competitor gaps, and product data. AI may cluster and expand this set, but it must not invent demand or claim that a term is valuable without evidence.

Assign each candidate:

`query | language | market | intent | customer stage | page type | evidence available | product or inventory fit | primary CTA | canonical URL | status`

Use intent groups such as discovery, budget, model, comparison, finance, inspection, process, local service, glossary, and post-purchase support. Prefer one primary intent per canonical page. If two pages answer the same intent with nearly the same evidence, merge, redirect, or clearly differentiate them before publishing.

For prioritization, score candidates qualitatively across:

`user need | evidence strength | product fit | differentiation | conversion value | maintenance cost`

Do not optimize for search volume alone. A lower-volume query with strong evidence, real product fit, and a clear customer action may be more valuable than a broad term with no differentiated answer.

## Evidence-gated AI article pipeline

Use AI to accelerate research, structure, drafting, comparison, and quality checks. Keep the source set and human decision with the article record.

`idea -> evidence collection -> intent brief -> outline -> AI draft -> factual QA -> overlap QA -> metadata/schema QA -> human approval -> publish -> monitor -> refresh/merge/retire`

### Required brief

`audience | question | language | market | primary intent | target page | source set | verified facts | unknowns | related products | CTA | author/reviewer | publish date | refresh trigger`

### Publication gates

An article is publishable only when it has:

- a specific audience and answerable question;
- a distinct purpose that is not a near-duplicate of another URL;
- source-backed facts with dates for volatile claims;
- clear labels for estimates, opinions, and open questions;
- useful visible content beyond a keyword rewrite;
- an accurate author or reviewer where expertise matters;
- relevant internal links to products, tools, trust information, and the next action;
- metadata and structured data that match visible content;
- a defined owner and refresh condition.

### News and freshness

Publish a news item only when there is a real event, date, source, and user consequence. The page should state what changed, who is affected, what is known, what is not known, and when it will be reviewed. Do not change dates without a substantive update. If an item becomes obsolete, update it with context, link to the successor, merge it, or retire it instead of producing a fresh duplicate.

### Multilingual content

Translate the customer intent, not just the sentences. Keep factual meaning, dates, prices, disclaimers, links, and CTA behavior aligned across languages while allowing natural local wording. Publish a language variant only when it is complete, useful, and correctly linked; do not create thin translated copies merely to multiply URLs.

## Content similarity and cannibalization control

Before publishing or auto-generating a page, compare its title, H1, primary query, answer, evidence, URL pattern, language, market, related links, and CTA against existing pages. Classify the result as:

- `new`: distinct intent and evidence;
- `update`: same URL deserves better or fresher evidence;
- `merge`: overlapping pages should become one stronger canonical page;
- `split`: one page contains clearly different intents that deserve separate destinations;
- `defer`: useful idea lacks evidence, inventory, or operational owner;
- `retire`: obsolete, empty, misleading, or no longer useful.

Never solve low quality with more pages. A smaller set of linked, maintained pages is a stronger asset than a large set of isolated drafts.

## Measurement and feedback loop

Track two connected funnels:

`query -> impression -> click -> landing page -> product detail -> contact or booking`

`AI prompt -> cited URL or no citation -> fact accuracy -> user action -> missing information`

Review Search Console impressions, clicks, CTR, average position, indexed URLs, query changes, sitemap errors, and page-level conversions. Combine this with internal search terms, CTA events, lead response, article engagement, and customer questions. Use the results to improve or consolidate pages, not merely to increase publishing volume.

Keep a monthly test set of representative prompts across broad, long-tail, local, comparison, finance, trust, and multilingual intents. Record date, prompt, cited sources, missing facts, and competitor pages. This is a learning instrument, not proof of guaranteed AI ranking.

## Safe publishing cadence

Use cadence as a learning system, not a quota that forces weak content:

- **Daily:** collect up to 10 search questions, customer phrases, inventory gaps, or content signals; cluster, deduplicate, and select only evidence-ready candidates.
- **Weekly:** publish or substantially improve 1-2 useful pages, fix one trust or conversion issue, add relevant internal links, and review Search Console or product-search data.
- **Monthly:** test representative AI-search prompts, review page cohorts, merge cannibalizing pages, refresh stale evidence, and retire empty or misleading URLs.

The number 10 belongs to research inputs. Public publishing volume is limited by evidence, distinct user value, review capacity, and maintenance ownership. If no candidate passes the publication gates, publish nothing and improve the evidence or existing page instead.

## Current-project adaptation checklist

When applying this model to an existing app, inspect its current SEO helper, public route list, SSG or SSR output, article schema, sitemap generator, robots output, language routing, product data, internal search, CTA tracking, and deployment host. Prefer the project's existing contracts. Replace placeholder base URLs and unverified identity data before indexing. Treat comments that claim a particular signal is the "primary" AI or GEO signal as hypotheses until official documentation and rendered-page tests support them.
For local-market adaptation, keep the market map, language segments, service-area evidence, entity facts, query samples, and page-to-product links in project truth documentation. Do not promote project-specific locations or product terms into global Codex rules.

## Official references

- [OpenAI: Searching the web with ChatGPT](https://help.openai.com/en/articles/9237897-chatgp)
- [OpenAI: Publishers and developers FAQ](https://help.openai.com/en/articles/12627856-publishers-and-developers-faq)
- [Google: Creating helpful, reliable, people-first content](https://developers.google.com/search/docs/fundamentals/creating-helpful-content)
- [Google: Guidance on generative AI content](https://developers.google.com/search/docs/fundamentals/using-gen-ai-content)
- [Google: Influencing title links in Google Search](https://developers.google.com/search/docs/appearance/title-link)
- [Google: General structured data guidelines](https://developers.google.com/search/docs/appearance/structured-data/sd-policies)
- [Google: Build and submit a sitemap](https://developers.google.com/search/docs/crawling-indexing/sitemaps/build-sitemap)
- [Google Business Profile: Improve local ranking](https://support.google.com/business/answer/7091)
- [Bing: AI Performance](https://www.bing.com/webmasters/help/ai-performance-9f8e7d6c)
- [Bing: IndexNow](https://www.bing.com/webmasters/help/indexnow-0z209wby)

## Product and content operating modes

- **Routine implementation:** solve the requested code task; apply only the light customer-outcome check when relevant.
- **Product planning or architecture:** map the current 60%, the later 40%, the value loop, dependencies, risks, and verification target.
- **UX review:** evaluate the page job, path to action, trust, states, accessibility, and return/referral loop.
- **Metadata or SEO work:** ground identity and claims in current evidence, then map intent to useful pages and measurable actions.
- **AI research or writing:** use the research brief, cite or record sources where needed, and mark unsupported items for review.
- **Search visibility or AI content:** use the evidence-gated pipeline, keep one intent per canonical page, and measure discovery separately from customer conversion.
- **Large or uncertain change:** stop at the smallest safe boundary and request missing evidence rather than turning assumptions into architecture.
- **Knowledge or skill evolution:** run the context-fit and cautious-evolution gate before writing. Preserve canonical ownership, avoid duplicate rules, and state what was adopted, adapted, deferred, or rejected.

## Task modes and output contract

Select one primary mode before acting. If a request combines modes, name the primary mode and keep secondary work explicitly bounded.

| mode | use when | minimum result |
|---|---|---|
| `inspect` | Current files, routes, data, or behavior need understanding | Evidence summary, unknowns, and affected scope |
| `research` | Sources, queries, competitors, news, or AI-search gaps need investigation | Dated sources, verified facts, assumptions, and next decision |
| `plan` | A product, architecture, UX, SEO, or delivery decision is needed | Prioritized action, dependencies, risk, and verification target |
| `generate` | Content, metadata, schemas, links, or structured output is requested | Draft plus evidence, owner, review state, and product connection |
| `audit` | Existing content, routes, metadata, or search visibility need checking | Findings classified by severity with evidence and fixes |
| `update` | Existing knowledge, metadata, or content needs a controlled improvement | Small patch, preserved contracts, and read-back verification |
| `implement` | The user authorizes a code or configuration change | Changed files, impact, tests, and deferred items |
| `verify` | A claimed result needs confirmation | Raw checks, status, limitations, and reproducible next step |

Use this compact result contract for non-trivial work:

`mode | scope | current evidence | unknowns | decision | affected files or routes | risk | verification | deferred work`

Do not silently mutate files during `inspect`, `research`, or `plan`. `generate` produces a draft unless publication or code change is explicitly authorized. `update` and `implement` must preserve public contracts and state exactly what changed.

## Automation levels and stop conditions

Use the lowest automation level that solves the task:

- **Level 1 - AI-assisted:** AI researches, clusters, drafts, or checks; a human approves the result.
- **Level 2 - semi-automated:** scripts prepare imports, links, reports, or QA; a human reviews before publication or mutation.
- **Level 3 - automated:** the system publishes, updates, sends, or changes state without per-item approval.

Default to Levels 1 and 2. Use Level 3 only after a dry run proves idempotency, scope limits, audit logging, failure handling, rollback, and an explicit authorization boundary. Automation must not bypass source verification, access control, privacy, rate limits, or publication gates.

Stop and report `INSUFFICIENT DATA` when the system of record is unknown, a volatile claim lacks a current source, a page has unresolved intent overlap, a public location or identity is unverified, no owner can maintain the result, or the requested action would affect production state without verification. The safe fallback is to list the missing evidence and the smallest collection step.

## Decision scoring and experiment record

When several valid options compete, compare them qualitatively across:

`customer value | evidence strength | product fit | differentiation | conversion value | maintenance cost | risk`

Do not turn the score into false precision. Prefer an option that is reversible, measurable, evidence-backed, and useful to the current 60% foundation.

For a meaningful search, product, or content experiment, record:

`date | hypothesis | audience or market | language | input or prompt | source set | change | expected outcome | success metric | observed result | limitation | next action`

An experiment result is evidence for the next decision, not proof of universal ranking, citation, conversion, or business success.

## Guardrails against unintended influence

This overlay must not:

- Override an explicit user requirement or current project truth.
- Turn a future idea into automatic implementation scope.
- Assume a product category, company identity, location, audience, or business model.
- Generate mass pages, keywords, or claims without distinct user value and evidence.
- Replace tests, browser checks, schema checks, or live verification with strategic language.
- Force a strategic review onto a narrow bug fix, copy edit, or mechanical change.

When the overlay is active, the expected outcome is a short, evidence-based decision: what matters now, what is deferred, what is unknown, and how the next step will be verified.

## Decision record format

Use this compact structure when a decision may affect future work:

`goal -> current evidence -> 60% decision -> 40% backlog item -> risk or unknown -> smallest next action -> verification`

Keep the record project-agnostic unless current project evidence supplies the specific identity, domain, or scope.

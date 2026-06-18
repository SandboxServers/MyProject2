---
name: context7
description: >-
  Fetch up-to-date, version-accurate documentation for any library, framework,
  SDK, plugin, or API via the Context7 MCP server. USE THIS whenever you are
  researching how to use something, need current API/usage/config details, are
  unsure about syntax or behavior, or something is unclear — read the docs
  instead of answering from memory. When in doubt, read docs.
---

# Context7 — efficient documentation lookup

Context7 pulls current, version-specific docs straight from source. Reach for it
**before** guessing about any external library, framework, SDK, plugin, or API —
training memory drifts and goes stale; Context7 does not.

## When to use (be liberal)
- Researching a library/tool/framework or *how* to do something with it.
- You need exact, current API signatures, params, config keys, or usage examples.
- You're unsure about syntax/behavior, or a detail is ambiguous → **look it up, don't guess.**
- Before writing non-trivial code against a dependency you haven't just read.
- An error/log references a library and the fix isn't obvious.

If you're hesitating about whether to check — that hesitation *is* the signal. Check.

## The two tools (connect first via `/mcp`)
Once the `context7` server is connected, two tools appear:
1. `mcp__context7__resolve-library-id` — turn a plain name ("react query",
   "chaos vehicles", "fastapi") into a Context7 library ID like `/tanstack/query`.
2. `mcp__context7__get-library-docs` — fetch docs for a resolved ID.

## Efficient workflow
1. **Resolve once.** Call `resolve-library-id` with the library name. Pick the best
   match (highest trust/coverage, right version). Skip this step only if you already
   know the exact ID (e.g. `/vercel/next.js`).
2. **Fetch narrowly.** Call `get-library-docs` with:
   - the resolved `context7CompatibleLibraryID`,
   - a focused **`topic`** (e.g. "routing", "auth middleware", "wheel setup") —
     this is the biggest lever for relevance and token savings,
   - a modest token budget; only raise it if the first pass is thin.
3. **Read, then act.** Use what you read; cite the specific API/option you relied on.
   If the docs contradict your assumption, the docs win.

## Efficiency rules
- One focused `topic` query beats a giant dump — narrow before you widen.
- Don't re-fetch the same docs in a session; reuse what you already pulled.
- Resolve the ID once and reuse it for follow-up `get-library-docs` calls.
- Batch independent lookups (resolve A and resolve B together) when researching
  several libraries at once.

## Fallbacks
- If Context7 has no/poor coverage for a library, say so and fall back to WebSearch
  + the official docs — don't silently guess.
- Context7 coverage of Unreal Engine **C++/Blueprint engine internals** is thin;
  for those prefer official UE docs / web. It's strong for mainstream OSS libraries,
  web/app frameworks, and SDKs.
- This project's Anthropic/Claude API questions: prefer the existing `claude-api`
  skill, which is purpose-built for that.

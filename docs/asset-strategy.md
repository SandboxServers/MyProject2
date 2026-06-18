# Asset Strategy — Finding & Acquiring FAB Assets

_Research note, 2026-06-17. Sketch only._

## The question
Two ways to source free assets for the game:
1. **Search FAB from inside UE via MCP** (drive the FAB plugin with Python).
2. **Use firecrawl against the FAB listings JSON API** and parse the results.

The key distinction is **discovery** (finding what exists) vs **acquisition**
(getting an asset into the project) — they have different bottlenecks.

## Comparison

| | Option 1 — MCP inside UE | Option 2 — firecrawl on FAB JSON |
|---|---|---|
| **Discovery** | Unreliable. FAB in UE 5.8 is a UI panel (Quixel Bridge successor); no documented/stable Python search API. | **Reliable.** `fab.com/i/listings/search` returns clean JSON: title, creator, category, tags, ratings, supported UE versions. Parseable, pageable, repeatable. |
| **Acquisition** | License accept + "Add to Project" are click-driven UI an agent can't operate. | Cannot download either — claim/import is account-auth + license clickthrough. |
| **Agent can do it solo?** | No (UI walls). | Discovery yes; acquisition no. |

## Recommendation
**Use Option 2 (firecrawl) for discovery** — it's the only path that yields solid
structured data. It's what produced [fab-free-assets.md](fab-free-assets.md).

**Acquisition stays human-in-the-loop regardless of approach.** FAB free assets
must be claimed to a FAB *account library*, then pulled into the project via the
FAB plugin. That's a one-time manual step Derek/Steven do in the FAB UI.

### Endpoint used (for re-running discovery)
```
https://www.fab.com/i/listings/search?is_free=1&sort_by=-relevance&q=<URL-ENCODED-TERM>
```
- `is_free=1` — free only
- `q=` — keyword filter (the link originally shared had no `q`, i.e. *all* free
  assets by relevance; adding `q=road`, `q=vehicle`, etc. is what makes it useful here)
- `cursor=` — base64 page offset (e.g. `bz00OA==` decodes to offset 48). Response
  includes `cursors.next` / `cursors.previous` for paging.
- Each response is ~150KB JSON; firecrawl wraps it as `{"rawHtml": "<json string>"}`.

## Manual import workflow (when we pick assets)
1. Open each FAB listing link from the shortlist (logged into the FAB account).
2. Click **"Add to My Library"** (free claim) — must accept license terms.
3. In UE: **FAB** panel → **My Library** → find the asset → **Add to Project**.
4. For assets built on UE 5.6/5.7, accept the one-time recompile/upgrade prompt.

## Recommended order of work
1. Grey-box the gameplay with the **existing Vehicle template + primitives** — no
   assets needed, no blockers (see [gameplay-sketch.md](gameplay-sketch.md)).
2. In parallel, claim a small starter set from the shortlist to skin it later.

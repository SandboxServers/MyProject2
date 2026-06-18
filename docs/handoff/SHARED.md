# SHARED — Agreed State & Decisions

> The single source of truth both Derek and Steven agree on. Edit deliberately.
> Personal day-to-day notes go in your own file (`aura.md` / `steven.md`).
> If you both edit this and hit a git conflict, keep BOTH sets of lines and reconcile.

## Project
Trackmania-style arcade racer. Unreal Engine **5.8**, ChaosVehicles + Vehicle
template (`Lvl_VehicleBasic`). Repo: `SandboxServers/MyProject2`.

## Current focus
- **Build phase started.** Foundation assets imported; migrating the hero car (Drift
  Heaven) into MyProject2, then grey-boxing the core driving loop. Sketching-only gate lifted.

## Decisions made
- _2026-06-17_ — Asset discovery via firecrawl on FAB JSON API (not FAB-in-UE). See `docs/asset-strategy.md`.
- _2026-06-17_ — Coordination model: per-person handoff files in git + GitHub Issues. (Notion ruled out — Steven doesn't use it.)
- _2026-06-17 (Derek)_ — **Art direction: clean stylized arcade, Trackmania-2020 Stadium look** (ref: `docs/refs/ref-stadium-look.jpg`). Theme: stadium/grass, day. Steven — shout on Issue #1 if you disagree.
- _2026-06-17 (Derek)_ — **Single player car**; using a free **arcade stand-in** (Drift Heaven) since no free open-wheel car exists. Hero open-wheel car deferred (buy/model later).
- _2026-06-17 (Derek)_ — **Track = modular road kit combo** (Road Blockout Kit + Stylized Asphalt material + custom arrow decals).
- _2026-06-17_ — Foundation asset plan locked in `docs/asset-manifest.md` (~85% sourceable free; gaps = track gantries, arrow decals, hero car).
- _2026-06-17_ — **5 environment packs imported** into MyProject2 (sky, road kit, asphalt, grass, barriers — see asset-manifest Import status). Project went 148 → 749 assets.
- _2026-06-17_ — **Instant Chrono Kit dropped** (code plugin, no UE 5.8 binary) → we build the lap/checkpoint timer in Blueprint. **Drift Heaven car** is a complete-project type → using the template car for now; migrate Drift Heaven later if wanted.
- _2026-06-18 (Steven)_ — **`.uproject` EngineAssociation must be the portable `"5.8"`**, never a machine-specific `{GUID}` — a GUID triggers a "convert project" prompt on the other person's machine.
- _2026-06-18 (Steven)_ — **Context7 MCP is the research default.** Added to `.mcp.json` + `context7` skill + a `CLAUDE.md` rule: when researching/unsure, read current docs via Context7 first. (Both will be prompted to approve the `context7` server on next pull.)
- _2026-06-18 (Derek)_ — **Agent cast approved (lean).** Full 21 in `docs/proposals/agent-cast.md` kept as a reference roster; stand up only the lean car-feel-first starter set (game-director, technical-director, vehicle-handling-engineer, gameplay-systems-engineer, game-feel-engineer, player-advocate; +qa-test-engineer once there's something to test). **Both art agents deferred** (use template car + imported free assets during grey-box; merge `vehicle-prop-artist` into `environment-artist` at art-pass time).
- _2026-06-18 (Derek)_ — **Q#4 (in-game track editor) and Q#6 (multiplayer) resolved: PHASE-TWO** — not built until the core driving loop is proven fun (multiplayer = async leaderboards/ghosts first, live MP only if earned).
- _2026-06-18 (Derek)_ — **Hero car:** migrating the Drift Heaven car into MyProject2 (it's a complete-project asset → Create Project + Asset Actions ▸ Migrate). Template car remains the fallback.
- _2026-06-18 (Derek)_ — **Asset sharing resolved: Git LFS.** FAB binary content (`*.uasset`/`*.umap`) is tracked via Git LFS (`.gitattributes`); foundation packs committed (PR #6). Free GitHub LFS tier = 10 GB storage+bandwidth. Both collaborators must run `git lfs install`. ~~Open: whether to prune the ~4 GB Deko pack before it's locked into main's LFS history.~~ → **RESOLVED below (Deko pruned).**
- _2026-06-18 (Derek+Steven)_ — **Agreed-library-only rule:** only assets listed in `docs/asset-manifest.md` belong in the project; anything outside it is ditched, never committed. Applied by removing the off-library `/Game/Fab/Megascans` decoration (16 tree/cliff actors) from `Lvl_VehicleBasic` (they were Steven-side only and broke the level on Derek's machine). Re-decoration happens in the art pass with agreed-library assets.
- _2026-06-18 (Derek)_ — **Deko_MatrixDemo pruned** from the LFS set before merge (per TD review): ~4 GB / ~90% of the payload, barely used in greybox; re-add deliberately only if needed. Resolves the open Deko question. **Foundation LFS set now ~0.42 GB** (DriftHeaven car, PWL sky, Stylized_Asphalt, RoadBlockoutKit incl. `Lvl_RoadBlockoutKit`, StylizedGrassByMayu). 3 vendored demo/showcase maps also pruned; `.gitattributes` hardened (`* text=auto` + png/jpg/dds/mp4).

## Open questions (from docs/gameplay-sketch.md — resolve here as you go)
1. Camera/feel: arcade-chase vs template default?
2. Art direction: stylized/low-poly vs realistic?
3. Ghosts in MVP or later?
4. ~~In-game track editor a goal?~~ → **RESOLVED: phase-two** (after core loop is fun).
5. v1 scope: one polished track vs a few short tracks with medals?
6. ~~Multiplayer ever in scope?~~ → **RESOLVED: phase-two** (async leaderboards/ghosts first).
7. Which boost/stunt mechanics are core to our identity?

## Conventions
- Commit + **push** before ending a session, or the other person's Claude won't see your work.
- Pull before you start.
- Privacy: commits use GitHub noreply identity (no real emails).
- _2026-06-18 (Steven)_ — **All documentation + GitHub-issue writing funnels through the `docs-knowledge-keeper` agent.** Handoff entries, `SHARED.md` decisions, `docs/` content, and Coordination-issue comments are written/curated by the keeper from facts handed to it — not drafted ad hoc. (Full rule in `CLAUDE.md` "Handoff discipline".)

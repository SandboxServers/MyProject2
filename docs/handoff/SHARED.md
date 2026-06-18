# SHARED — Agreed State & Decisions

> The single source of truth both Derek and Steven agree on. Edit deliberately.
> Personal day-to-day notes go in your own file (`aura.md` / `steven.md`).
> If you both edit this and hit a git conflict, keep BOTH sets of lines and reconcile.

## Project
Trackmania-style arcade racer. Unreal Engine **5.8**, ChaosVehicles + Vehicle
template (`Lvl_VehicleBasic`). Repo: `SandboxServers/MyProject2`.

## Current focus
- Research/sketching phase. **No in-editor building yet.** See `docs/`.

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

## Open questions (from docs/gameplay-sketch.md — resolve here as you go)
1. Camera/feel: arcade-chase vs template default?
2. Art direction: stylized/low-poly vs realistic?
3. Ghosts in MVP or later?
4. In-game track editor a goal, or author tracks in-editor only?
5. v1 scope: one polished track vs a few short tracks with medals?
6. Multiplayer ever in scope?
7. Which boost/stunt mechanics are core to our identity?

## Conventions
- Commit + **push** before ending a session, or the other person's Claude won't see your work.
- Pull before you start.
- Privacy: commits use GitHub noreply identity (no real emails).

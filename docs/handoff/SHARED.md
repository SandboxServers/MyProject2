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

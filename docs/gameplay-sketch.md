# Gameplay Sketch — Trackmania-Style Racer

_Sketch only, 2026-06-17. Options & open questions for Derek + Steven — not decided._

## What "Trackmania-style" means here (reference pillars)
- **Time-trial first.** Solo against the clock; medals/PBs, not wheel-to-wheel AI.
- **Arcade handling.** Grippy, forgiving, drift-friendly — not a sim.
- **Instant restart & frequent respawn.** Press a key, you're back at the last
  checkpoint or the start instantly. Failure is cheap.
- **Checkpoint gates** that also extend the clock / mark progress.
- **Ghosts.** Race your own best run (and later, others').
- **Stunt geometry.** Loops, jumps, boosters, wallrides, banked turns.
- **(Long-term) track editor & sharing** — the heart of Trackmania, but out of MVP scope.

## What we already have (no assets needed)
- **ChaosVehicles** + the Vehicle template (`Lvl_VehicleBasic`) → a drivable car
  with working physics, camera, and input. This is our prototype car.
- We can grey-box an entire track from **primitives/BSP** and start tuning feel today.

## Proposed MVP (grey-box, before any FAB art)
Core loop: **spawn → drive a timed track through checkpoints → cross finish → see
time vs best → restart.**

| # | Feature | Notes |
|---|---|---|
| 1 | Start/finish line + lap timer (HUD) | Millisecond timer; start on first input or countdown |
| 2 | Checkpoint volumes | Trigger boxes; must hit in order; flash + sound on pass |
| 3 | Respawn / instant restart | Reset to last checkpoint (key) and full restart (key) |
| 4 | Best-time tracking | Save PB per track (SaveGame); show delta |
| 5 | One hand-built grey-box track | Primitives: straights, turns, one jump, one loop |
| 6 | Basic HUD | Timer, speed, checkpoint count |
| 7 | Boost pads (optional) | Trigger → impulse/scripted speed boost |

**Explicitly out of MVP:** track editor, multiplayer, AI opponents, art pass,
medal tiers, leaderboards.

## Track-building approach — three options
1. **Hand-placed modular pieces** (e.g. Road Blockout Kit). Fast to art, less flexible.
2. **Spline-based road** (e.g. Smart Spline generator). Smooth curves, more setup.
3. **Pure primitives/BSP for MVP**, swap to 1 or 2 once feel is locked. ← recommended
   for the grey-box phase; decouples handling tuning from art.

## Likely Blueprint structure (sketch)
- `BP_RaceManager` — owns timer, checkpoint order, PB save/load, race state machine.
- `BP_Checkpoint` — trigger volume; reports index to RaceManager.
- `BP_StartFinish` — start arm / finish detect.
- `BP_BoostPad` — applies impulse on overlap.
- `BP_RaceCar` — extends the template vehicle pawn; restart/respawn input.
- `WBP_HUD` — timer / speed / checkpoint widget.
- (Later) `BP_GhostRecorder` or adopt the **Ghost Replay System** asset.

## Open questions (need Derek + Steven to decide)
1. **Camera/feel:** arcade-chase like Trackmania, or closer to the template's default?
2. **Art direction:** stylized/low-poly (cheaper, version-tolerant assets) vs realistic?
3. **Ghosts in MVP or later?** A free asset exists (Ghost Replay System) if early.
4. **Track editor** — is in-game editing a goal, or do we author tracks in-editor only?
5. **Scope of v1:** single polished track, or a few short tracks with medal times?
6. **Multiplayer** — ever in scope? Affects early architecture choices.
7. **Boost/stunt mechanics** — which are core to *our* identity vs nice-to-have?

## Suggested next step
Once direction is set, grey-box the MVP loop (features 1–5) with the existing
vehicle and primitives — no FAB dependency, fully reversible.

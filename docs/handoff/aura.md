# Aura (Derek) — Handoff Log

> **Only Derek's Claude writes this file.** Newest entry on top. Steven reads it to
> catch up on what Derek's side did. Keep entries short; durable decisions go to `SHARED.md`.

## 2026-06-18 — LFS pruned + merged (PR #6), template car UAT-passed, off-library scenery ditched
- Did:
  - **PR #6 reviewed by ue5-technical-director (request-changes), acted on, merged.** Pruned `Deko_MatrixDemo` (~4 GB = ~90% of the payload, barely used in greybox — baking it into main's LFS history is a one-way door) plus 3 vendored demo/showcase maps; hardened `.gitattributes` (`* text=auto` + broadened binary patterns: png/jpg/dds/mp4). Squash-merged to `main` (159da49). **Foundation LFS set is now ~0.42 GB** — DriftHeaven car, PWL sky, Stylized_Asphalt, RoadBlockoutKit (incl. its usable `Lvl_RoadBlockoutKit` greybox level), StylizedGrassByMayu. Deko + the demo maps are NOT in the repo.
  - **Re-ran UAT on the template-car loop post-merge:** PIE smoke-test + a manual playtest confirmed `BP_VehicleAdvPlayerController_C` possesses `BP_VehicleAdvOffroadCar_C`, 8 checkpoints + RaceManager present, MapCheck 0 errors / 0 warnings. **The template car stays the player pawn — it's the proven first-pass loop.**
  - **Investigated the Drift car and PARKED it.** Chain: `BP_Base_Drift → BP_VehicleBase → WheeledVehiclePawn`. It's a mobile/touch car — no Input Mapping Context is added on BeginPlay, and the keyboard/gamepad `EnhancedInputAction` events (IA_Throttle/Steering/Brake/Handbrake/etc.) are empty stubs; the real driving logic lives on the `Touch|` thumbstick events. Making it keyboard-drivable needs an IMC + filling those IA event bodies (mirror the touch logic). Deferred as a later enhancement; template car remains.
  - **Cleaned the off-library scenery out of the shared level (this PR's headline).** `Lvl_VehicleBasic` had 16 placed StaticMeshActors (Tree_0-7, Cliff_0-7) whose meshes/materials referenced `/Game/Fab/Megascans` assets that were never committed (Steven-side only) → ~18 LoadErrors on Derek's machine. **With Steven's explicit OK, these were ditched entirely** — 16 actors removed, level saved (track, checkpoints, cones, RaceManager untouched; level verified clean of all off-library references). On branch `chore/ditch-offlibrary-level-assets`. Re-decoration comes in the art pass using our agreed-library assets.
- State: `main` carries the pruned ~0.42 GB LFS set; template-car loop UAT-clean; off-library cleanup PR'd.
- Next: art pass — apply PWL sky / Stylized_Asphalt / grass for the Stadium look, re-decorating where the Megascans scenery used to be.
- For Steven:
  - **Run `git lfs install` before you pull** — the PR #6 assets are LFS-tracked, or you'll get pointer files instead of the real content.
  - Your `/Game/Fab/Megascans` decoration (16 tree/cliff actors) was removed from `Lvl_VehicleBasic` per your OK — they only existed on your machine and were breaking the level on mine. Re-decoration happens in the art pass with agreed-library assets.
  - **PR #5 still needs your orchestrator-rule softening tweak** — make that one change and it's an approve.
- Pushed: yes (this handoff committed on main; cleanup on `chore/ditch-offlibrary-level-assets`).

## 2026-06-18 — Git LFS for assets (PR #6), reviewed Steven's governance PR #5
- Did:
  - Synced local tree to `main` @ 60d3139 (now carries the agent cast, testing-discipline, and the playable loop). Deleted the merged `feat/greybox-loop` branch (local + remote).
  - Caught & discarded a `.uproject` regression: the editor had rewritten `EngineAssociation` from the portable `"5.8"` back to a machine-specific GUID — the exact thing that triggers a "convert project" prompt on Steven's machine. Restored it to `"5.8"`. **Recurring gotcha: the editor silently rewrites this on every launch, so it must be discarded before every commit.**
  - **Resolved the FAB-asset-sharing question → Git LFS.** Created `.gitattributes` (tracks `*.uasset`/`*.umap` + common binary source art via LFS), committed the 647 foundation FAB assets (~4.7 GB: Deko freeway pack, sky/PWL, Stylized_Asphalt, RoadBlockoutKit, StylizedGrassByMayu, DriftHeaven hero car) to branch `chore/git-lfs-assets`, pushed (LFS upload succeeded). Opened **PR #6**; LGTM'd it myself but am holding the merge for Steven's review.
  - Reviewed Steven's **PR #5** (AI-SDLC governance) with request-changes: approved the `code-reviewer` agent; accepted `ai-sdlc-bootstrap.md` as a *deferred roadmap* (heavy items — CI/CD, UE test harness, branch protection — gated behind "core loop proven fun"); asked for the orchestrator rule to be softened to allow trivial mechanical work (flagged the bootstrap gap: owners like `tools-automation-engineer` aren't stood up yet, so the rule can't function today).
  - Reloaded the CC session so the lean agent cast + docs-knowledge-keeper are now registered/invocable.
- State: both PRs in Steven's court; `main` clean; local on `chore/git-lfs-assets` (this handoff committed on `main`).
- Next: wire the Drift Heaven car (`BP_Base_Drift`) as the player pawn over MCP (needs editor + MCP auto-start); art pass (apply sky/grass/asphalt for the Stadium look) once PR #6 merges.
- For Steven:
  - Review **PR #6** — **run `git lfs install` before your next pull** or you'll get LFS pointer files instead of the real assets.
  - Make the one orchestrator-rule tweak on **PR #5** and it's an approve.
  - Decide on Deko pruning (~4 GB / ~40% of the 10 GB free LFS tier, little used in greybox) before #6 merges — pruning LFS history later is a chore.
- Pushed: yes (this commit, on main).

## 2026-06-18 — 🏁 First playable loop PROVEN (UAT passed)
- Did: Adopted Steven's RidgelineRush race system + his tested `Lvl_VehicleBasic` (8 indexed checkpoints, RaceManager, BP_TimeTrialGameMode, SM_Track_10M) onto branch `feat/greybox-loop`. Migrated DriftHeaven `Demo/` so the drift car's input assets now exist. Verified via MCP, then **UAT: full lap, 8/8 checkpoints in order, FINISH at 8.46s.**
- State: core driving loop works end-to-end. PR'd to main.
- Next: art pass (apply imported sky/grass/asphalt to the level), wire the drift car as player pawn (input now present), build start/finish gantries (gap). Decide FAB-asset sharing for Steven.
- For Steven: loop is live on main — your RidgelineRush prototype is the seed, thank you. Heads-up: commit the lean agent cast to `.claude/agents/` (empty in repo, so I can't invoke the keeper).
- Pushed: via PR `feat/greybox-loop` → main.

## 2026-06-18 — Cast approved (lean), Qs #4/#6 resolved, starting hero-car migration
- Did: Reviewed Steven's `docs/proposals/agent-cast.md` — approved as a reference roster, standing up only the lean car-feel-first set (art agents deferred). Resolved Q#4 (track editor) and Q#6 (multiplayer) as phase-two. Lifting the sketching-only gate → build phase. Replied to Steven on Issue #1.
- State: build phase started; about to migrate the Drift Heaven car into MyProject2.
- Next: migrate Drift Heaven (Create Project → Asset Actions ▸ Migrate), verify via MCP, then grey-box the driving loop.
- For Steven: your `backup/ridgeline-rush` branch is **local only** (not on origin) — please push/PR it so we can reuse your checkpoint+timer prototype. Cast approved lean; go ahead and stand up the starter set.
- Pushed: pending this commit.

## 2026-06-17 — Foundation assets imported
- Did: Claimed + imported 5 environment packs into MyProject2 (sky `/Game/PWL_Light_Manager`, road kit `/Game/RoadBlockoutKit`, asphalt `/Game/Stylized_Asphalt`, grass `/Game/StylizedGrassByMayu`, barriers `/Game/Deko_MatrixDemo`). 148 → 749 assets. Verified via MCP. See asset-manifest Import status.
- State: environment foundation in. Car + timer outstanding (not blocking).
- Next: decide car (template car now vs migrate Drift Heaven), then grey-box MVP. Build lap timer in BP (Chrono Kit can't install on 5.8).
- For Steven: Instant Chrono Kit is dead (code plugin, no 5.8 build) — we build the timer ourselves. Drift Heaven is a complete-project, not add-to-project.
- Pushed: pending this commit.

## 2026-06-17 — Stadium art direction + foundation asset plan
- Did: Locked art direction (clean stylized arcade / Trackmania Stadium, ref image in `docs/refs/`). Ran a targeted FAB sweep (4 parallel agents, ~70 queries). Wrote `docs/asset-manifest.md` (curated picks + Tier-1 claim checklist + gaps). Logged decisions in `SHARED.md`.
- State: foundation asset plan done; nothing built in-editor yet.
- Next: claim the Tier-1 assets in FAB → import → start grey-boxing the MVP loop. Tackle the gaps (track gantries, arrow decals, hero car) as art tasks.
- For Steven: review `docs/asset-manifest.md` + the ref image; weigh in on art direction / open questions via Issue #1. No free open-wheel car or track-arch asset exists — flagged as build/buy.
- Pushed: pending this commit.

## Template for a new entry
```
## YYYY-MM-DD — <one-line summary>
- Did: <what changed this session>
- State: <done / in-progress / blocked>
- Next: <what I'd do next>
- For Steven: <anything he needs to know / a question for him>
- Pushed: <yes/no — commit hash>
```

---

## 2026-06-17 — Project setup, MCP, and coordination scaffolding
- Did:
  - Set global git identity to privacy-focused GitHub noreply (`aurablacklight`), rewrote history to scrub old emails, force-pushed.
  - Wired UE 5.8 MCP control via the bootstrap kit; registered `.uproject` file association; editor + MCP server confirmed live.
  - Researched free FAB assets for a Trackmania clone (27 usable UE assets) → `docs/fab-free-assets.md`.
  - Wrote `docs/` sketches: `README`, `asset-strategy`, `fab-free-assets`, `gameplay-sketch`.
  - Set up this handoff system + a GitHub Coordination issue.
- State: research/sketching done; nothing built in-editor.
- Next: align with Steven on the open questions in `SHARED.md`, then grey-box the MVP loop.
- For Steven: read `docs/README.md` first. Add your intro/setup notes to `docs/handoff/steven.md`. Pick off any open questions you have opinions on in `SHARED.md`. Comment on the pinned GitHub Coordination issue (#1) so I know you're synced.
- Pushed: yes — commits df0ccb1 (docs/handoff system), d1f103c (MCP payload), 3171a28 (no-Notion rule).
- Note: session still in progress on Derek's side; more may follow below.

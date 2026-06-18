# Asset Manifest & Acquisition Checklist — Stadium Arcade Racer

_The bill of materials for the foundation, with the curated free picks to claim and the
build-or-buy gaps. Based on the targeted FAB sweep, 2026-06-17. Raw research:
[fab-free-assets.md](fab-free-assets.md). How to claim/import: [asset-strategy.md](asset-strategy.md)._

## Art direction (decided 2026-06-17)
- **Clean stylized arcade** — Trackmania 2020 Stadium look. Smooth & readable, **not**
  chunky flat low-poly, **not** photoreal sim. Reference: `docs/refs/ref-stadium-look.jpg`.
- **Theme:** Stadium / grass, bright **day / golden-hour**.
- **Player car:** single car; free **arcade stand-in** for now (no free open-wheel exists).
- **Track:** **modular road kit** combo (meshes + stylized asphalt + custom arrow decals).

## Import status — 2026-06-17 ✅
5 of 7 Tier-1 packs imported into MyProject2 (asset count 148 → 749), all at **v5.7**
(no 5.8 build offered — recompiled on load, as expected). Folder map:
- Dynamic Sky & Light → `/Game/PWL_Light_Manager` (`BP_Lighting_Manager`)
- Road Blockout Kit → `/Game/RoadBlockoutKit` (`SM_Road` + bonus cones/barrier fences)
- Stylized Asphalt → `/Game/Stylized_Asphalt` (`M_Stylized_Asphalt`)
- Stylized Landscape & Grass → `/Game/StylizedGrassByMayu`
- Freeway Props (barriers) → `/Game/Deko_MatrixDemo` (452 assets — heavy; trim unused later)

**Not imported:**
- **Instant Chrono Kit** → ❌ it's a *code plugin* with no 5.8 binary (code plugins aren't
  forward-compatible). **Building the lap/checkpoint timer ourselves in Blueprint instead.**
- **Drift Heaven (car)** → ⏳ it's a *complete project* ("Create Project", not "Add to
  Project"); pending decision: migrate the car out of it, or just use the template car.

Note: a working drivable car already exists in `/Game/Vehicles` + `/Game/VehicleTemplate`
(`Lvl_VehicleBasic`) — grey-boxing is **not blocked** on the car.

## Legend
Status: ✅ free pick found · ⚠️ combine/author · ❌ gap (build/buy) · 🛠️ we make it
Tier: **T1** must-have foundation · **T2** nice · **T3** polish/deferred

## Manifest
| Need | Tier | Status | Chosen pick / plan | UE | Link |
|---|---|---|---|---|---|
| **Player car** | T1 | ✅ stand-in | Drift Heaven (arcade drift) — primary | 5.6 | https://www.fab.com/listings/53d81aa6-f8a8-40b5-a80c-ae53e6fd77bc |
| ↳ alt car | T1 | ✅ | Ultimate Car Racing Project (full race setup) | 5.4–5.7 | https://www.fab.com/listings/67cff605-ec31-4f50-80c8-b2aa28c8f25e |
| **Road/track meshes** | T1 | ⚠️ | Road Blockout Kit (modular pieces) | 5.5–5.7 | https://www.fab.com/listings/dc6b14b3-f7eb-4a53-a589-eb3d5bfbb8d5 |
| ↳ road surface | T1 | ✅ | Stylized Asphalt (toon material) | 5.7 | https://www.fab.com/listings/687e0724-f572-4225-b80b-0d8284ad0056 |
| ↳ arrow markings | T1 | 🛠️ | Author custom directional-arrow decals (no free pack exists) | — | — |
| **Sky** | T1 | ✅ | Dynamic Sky & Light Manager (primary) / Good SKY (4.5★/320, fallback) | 5.2–5.7 | https://www.fab.com/listings/83f525a4-4220-4e15-9382-0b45ddab9947 |
| **Clouds** | T2 | ✅ | Stylized Volumetric Clouds (4.8★) | 5.0–5.7 | https://www.fab.com/listings/3dcea533-24d9-4aa7-bbf6-bdf876c1f3eb |
| **Grass field / ground** | T1 | ✅ | Stylized Landscape and Grass | 5.7 | https://www.fab.com/listings/93e420a3-f606-46c6-8e6b-fa6f1c045b9e |
| **Foliage / pines** | T2 | ✅ | Stylized Low Poly Nature Lite (5★) | 5.2–5.7 | https://www.fab.com/listings/fef6b0c6-19a4-47bc-913f-c8328910cec4 |
| **Distant mountains** | T2 | ✅ | Mountain Tops (4.9★) | 5.3–5.7 | https://www.fab.com/listings/8cdfadfb-5fa6-4b4e-99db-1a02b01295c2 |
| **Stadium shell / stands** | T2 | ✅ | Grand Stadium | 4.24–5.7 | https://www.fab.com/listings/6d8afd3b-27a5-486b-a29c-997d75b7a4c7 |
| **Barriers** | T1 | ✅ | Freeway Props (4.6★) + Street Props Vol.1 (5★) | 5.0–5.7 | https://www.fab.com/listings/b200bac9-1cd3-4cfc-bd69-4e3fcd6f527f |
| **Cones** | T2 | ✅ | Urban Decay Traffic Cone (Nanite) | 5.7 | https://www.fab.com/listings/987acbb1-f498-4398-93fa-66e881287916 |
| **Race flags / banners** | T2 | ✅ | Flag Props (250+ flags) | 4.22–5.7 | https://www.fab.com/listings/64eed69f-2b22-4851-8ea4-3a36fc7ce136 |
| **Track arches / gantries** | T1 | ❌ gap | Build from Wall Bundle posts + Flag banners, or model. Signature item — #1 art task. | (4.17–5.2) | https://www.fab.com/listings/b6515b4b-a1b6-4236-8ff9-172ae241fb37 |
| **Start/finish + checkpoint markers** | T1 | 🛠️ | Make simple meshes/decals; gameplay via Chrono/checkpoint kit below | — | — |
| **Lap/checkpoint timer (gameplay)** | T1 | ✅ | Instant Chrono Kit (or build our own) | 5.0–5.7 | https://www.fab.com/listings/1e65a40f-8c4d-485a-8383-47c969cc6d79 |
| ↳ checkpoint/respawn | T1 | ✅ | Easy Checkpoint & Respawn System | 5.7 | https://www.fab.com/listings/733cf112-9845-409c-a1d1-3b0973981ad6 |
| **Ghost replay** | T2 | ✅ | Ghost Replay System (4.9★/61) | 5.5–5.7 | https://www.fab.com/listings/2eb83102-6ea6-448a-a56e-64b905cc1651 |
| **Speedometer** | T2 | ✅ | Custom Gauge Material | 5.3–5.7 | https://www.fab.com/listings/27c280fc-f039-485a-a1b7-50e3396a148a |
| **Tire walls** | T3 | ❌ gap | Build from a tire mesh + barrier (no free UE asset) | — | — |
| **Music** | T3 | ✅ | Racing Music Vol. 1 | 4.0–5.7 | https://www.fab.com/listings/01bdfd65-7406-4bb3-b33f-9dea333a64be |

## Coverage summary
- **T1 foundation (8 needs):** 5 fully free (car stand-in, sky, grass, barriers, timer),
  2 combine/author (road = meshes+material+custom decals; start/checkpoint markers = we make),
  **1 true gap** (track arches/gantries).
- **~85% of the foundation is sourceable for $0.** The only items requiring *art work*
  (not purchases) are: **track gantries/arches, custom arrow decals, start-line markers**,
  and (T3) tire walls. **No purchases required to start building.**
- Environment is essentially fully solved free; the hero pieces (open-wheel car, gantries)
  are the gaps — deferred, not blocking.

## ✅ Tier-1 "claim now" checklist (minimum to start building)
**One-click:** run `pwsh docs/scripts/open-fab-assets.ps1` to open all Tier-1 links in your
browser at once (add `-All` for the full list, `-List` to just print them). Then on each
tab click **Add to Library**, and in UE: **FAB → My Library → Add to Project**.
Verify each shows a free license that allows use in projects.
- [ ] Drift Heaven (car) — https://www.fab.com/listings/53d81aa6-f8a8-40b5-a80c-ae53e6fd77bc
- [ ] Road Blockout Kit (track meshes) — https://www.fab.com/listings/dc6b14b3-f7eb-4a53-a589-eb3d5bfbb8d5
- [ ] Stylized Asphalt (road surface) — https://www.fab.com/listings/687e0724-f572-4225-b80b-0d8284ad0056
- [ ] Dynamic Sky & Light Manager (sky) — https://www.fab.com/listings/83f525a4-4220-4e15-9382-0b45ddab9947
- [ ] Stylized Landscape and Grass (ground) — https://www.fab.com/listings/93e420a3-f606-46c6-8e6b-fa6f1c045b9e
- [ ] Freeway Props (barriers) — https://www.fab.com/listings/b200bac9-1cd3-4cfc-bd69-4e3fcd6f527f
- [ ] Instant Chrono Kit (lap timer) — https://www.fab.com/listings/1e65a40f-8c4d-485a-8383-47c969cc6d79

## Build-or-buy gaps (deferred, not blocking)
1. **Open-wheel hero car** — using a free arcade stand-in now. Revisit later: buy a paid
   formula car, or model/commission one, once the core loop is proven fun.
2. **Track arches / gantries** — the signature look. Build from kit parts or model. #1 art task.
3. **Custom arrow road decals + start-line markers** — author ourselves (small).
4. **Tire walls** (T3) — build from tire mesh + barrier.

## Caveats
- Most picks are UE 5.4–5.7; we're on **5.8** → expect a one-time recompile/upgrade prompt.
- Several top picks are **unrated (0 reviews)** — preview before committing.
- A more on-theme cartoon track exists (**RCC Design "Cartoon Race Track" Spielberg/Oval**)
  but is **FBX-only, not UE-native** — manual import + license check if we ever want it.

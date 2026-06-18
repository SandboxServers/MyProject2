# Trackmania-Style Racer — Project Docs

Working notes for the arcade racing prototype (Derek + Steven). Built on UE 5.8,
ChaosVehicles + the Vehicle template (`Lvl_VehicleBasic`).

> **Status: sketching / research only.** Nothing has been built in-editor yet.
> These docs capture findings and options, not committed decisions.

## Index

| Doc | What's in it |
|---|---|
| [asset-strategy.md](asset-strategy.md) | How to find/acquire FAB assets — approach comparison & recommendation, import workflow, caveats |
| [fab-free-assets.md](fab-free-assets.md) | Shortlist of 27 free UE assets from FAB, categorized for this game |
| [gameplay-sketch.md](gameplay-sketch.md) | Core loop, MVP scope, track-building options, open questions for us to decide |

## Quick context
- Engine: **Unreal Engine 5.8** (we're ahead of most FAB assets, which top out at 5.7 — see caveats).
- Current level loaded: `/Game/VehicleTemplate/Maps/Lvl_VehicleBasic`.
- MCP control is wired up (I can drive the editor) but per direction we're **not building yet**.

_Last updated: 2026-06-17._

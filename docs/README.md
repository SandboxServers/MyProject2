# Trackmania-Style Racer — Project Docs

Working notes for the arcade racing prototype (Derek + Steven). Built on UE 5.8,
ChaosVehicles + the Vehicle template (`Lvl_VehicleBasic`).

> **Status: sketching / research only.** Nothing has been built in-editor yet.
> These docs capture findings and options, not committed decisions.

## Index

| Doc | What's in it |
|---|---|
| [workflow.md](workflow.md) | How we collaborate — branching + handoff conventions, what goes where |
| [asset-manifest.md](asset-manifest.md) | **Foundation bill of materials** — curated free picks, Tier-1 claim checklist, gaps & decisions |
| [asset-strategy.md](asset-strategy.md) | How to find/acquire FAB assets — approach comparison & recommendation, import workflow, caveats |
| [fab-free-assets.md](fab-free-assets.md) | Raw FAB research — broad free-asset shortlist (superseded by asset-manifest.md for what to claim) |
| [gameplay-sketch.md](gameplay-sketch.md) | Core loop, MVP scope, track-building options, open questions for us to decide |

## Quick context
- Engine: **Unreal Engine 5.8** (we're ahead of most FAB assets, which top out at 5.7 — see caveats).
- Current level loaded: `/Game/VehicleTemplate/Maps/Lvl_VehicleBasic`.
- MCP control is wired up (I can drive the editor) but per direction we're **not building yet**.

_Last updated: 2026-06-17._

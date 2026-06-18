# CLAUDE.md — Project Guide

Trackmania-style arcade racer built in **Unreal Engine 5.8** (ChaosVehicles + the
Vehicle template, `Lvl_VehicleBasic`). Collaborators: **Derek (aura)** and **Steven**,
each working with their own Claude Code session against the shared repo
`SandboxServers/MyProject2`.

## ⭐ START HERE — every session, before doing anything
Read these to catch up on the other person's work and the agreed state:
1. `docs/handoff/SHARED.md` — agreed decisions, current focus, open questions
2. `docs/handoff/aura.md` — Derek's log
3. `docs/handoff/steven.md` — Steven's log
4. `docs/README.md` — index of all design/research docs

Then `git pull` so you're on the latest.

## Handoff discipline (how the two of us stay in sync)
- This is an **async, git-based** coordination system. The other person sees your work
  only after you **commit and push**.
- **Write ONLY your own handoff file** — Derek's Claude edits `aura.md`, Steven's Claude
  edits `steven.md`. This avoids merge conflicts. `SHARED.md` is for agreed decisions
  (edit deliberately; if it conflicts on pull, keep both sides and reconcile).
- At the **end of a work session**: add an entry to your handoff file, move any durable
  decision into `SHARED.md`, then **commit + push**.
- At the **start**: pull, read the handoff files (above).
- Threaded discussion that doesn't belong in files → the pinned **GitHub "Coordination"
  issue** (`gh issue list`), which both of us can read/comment on.

## Working agreements
- **This repo is the single source of truth.** All progress, decisions, and knowledge
  live here (handoff files, `docs/`, commits, GitHub issues) so both Derek and Steven
  stay in sync.
- **No Notion for this project.** Steven doesn't use Notion, so it would split the
  knowledge. **Do NOT offer or upload Notion session summaries** here — this overrides
  the global end-of-session Notion rule. Record session progress in `docs/handoff/`
  and commit + push instead.
- **Phase right now: sketching/research only — do NOT build in-editor** unless the
  current request explicitly says to build. See `docs/`.
- **Privacy:** commits must use the GitHub noreply identity (no real emails). Never
  expose personal emails in commits or config.
- Confirm before machine-level tooling/installs outside the project.

## MCP control
This project is wired for MCP so Claude can drive the editor. To connect: launch the
editor, then run `/mcp`. Full reconnect/troubleshooting steps: `docs/mcp-setup.md`.

## Key docs
| Doc | Purpose |
|---|---|
| `docs/README.md` | Docs index |
| `docs/gameplay-sketch.md` | Core loop, MVP scope, open design questions |
| `docs/asset-strategy.md` | How we find/acquire assets |
| `docs/fab-free-assets.md` | Free FAB asset shortlist |
| `docs/mcp-setup.md` | MCP reconnect & troubleshooting |
| `docs/handoff/` | Per-person handoff logs + SHARED state |

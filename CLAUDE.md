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
- **Full branching + handoff conventions: `docs/workflow.md`** — follow it once we move
  past the sketching phase (branch + PR per change, handoff entry in the PR, etc.).
- **All documentation + GitHub-issue writing funnels through the `docs-knowledge-keeper`
  agent.** Handoff entries (`steven.md`/`aura.md`), `SHARED.md` decisions, `docs/` content,
  READMEs, gotcha/decision records, and Coordination-issue comments are written and curated
  by the keeper — not drafted ad hoc by the main session or other agents. Other agents and
  the main session **hand it the facts and let it produce the durable record.** The keeper
  still writes ONLY the current person's handoff file and keeps-both on `SHARED.md` conflicts.
  (This is how the "do the paperwork on every push" discipline gets executed — delegate it
  to the keeper, then commit + push.)

## Working agreements
- **This repo is the single source of truth.** All progress, decisions, and knowledge
  live here (handoff files, `docs/`, commits, GitHub issues) so both Derek and Steven
  stay in sync.
- **No Notion for this project.** Steven doesn't use Notion, so it would split the
  knowledge. **Do NOT offer or upload Notion session summaries** here — this overrides
  the global end-of-session Notion rule. Record session progress in `docs/handoff/`
  and commit + push instead.
- **Phase: build started (2026-06-18).** The sketching-only gate is **lifted** — grey-boxing
  the core driving loop in-editor is in scope. Check `docs/handoff/SHARED.md` "Current focus"
  for the live state before building.
- **Privacy:** commits must use the GitHub noreply identity (no real emails). Never
  expose personal emails in commits or config.
- Confirm before machine-level tooling/installs outside the project.

## Agent cast (specialist sub-agents)
The game is built by a cast of specialist agents — full reference roster + seed prompts in
`docs/proposals/agent-cast.md`. Route work to the right specialist instead of doing everything
in the main session. **Active now (lean "car-feel-first" set):**
- **game-director** — vision, scope, "what next / should we even build this"; the front door and scope gatekeeper.
- **ue5-technical-director** — UE5.8 architecture, project/module structure, source-control discipline, perf/frame-time budget.
- **vehicle-handling-engineer** — Chaos Vehicle feel (throttle/steer/air/landing/per-surface); the #1 system.
- **gameplay-systems-engineer** — checkpoints, lap/split timing, race state, instant restart/respawn, medals, modes.
- **game-feel-engineer** — camera/FOV/juice/Niagara/rumble; the sensation of speed (built on top of handling).
- **player-advocate** — the regular-player gut-check: is it fun, fair, readable, welcoming?
- **qa-test-engineer** — automated + PIE validation, regression, bug triage (tests, doesn't fix or judge fun).
- **docs-knowledge-keeper** — docs, handoff logs, decisions, onboarding, gotchas (see the funnel rule above).

**Deferred (in the roster, not yet stood up):** environment-artist & vehicle-prop-artist (art pass; merge the latter into the former then), track-designer, track-editor-engineer, replay-ghost-engineer, ui-ux-engineer, multiplayer-netcode-engineer, tools-automation-engineer, performance-optimizer, art-director, audio-designer, retrospective-agent. Stand them up as the work demands. Track editor and multiplayer are **phase-two** (after the core loop is proven fun).

## MCP control
This project is wired for MCP so Claude can drive the editor. To connect: launch the
editor, then run `/mcp`. Full reconnect/troubleshooting steps: `docs/mcp-setup.md`.

## Research & documentation — use Context7 (when in doubt, read docs)
- **Default to looking things up, not guessing.** Any time you research, need
  information, are unsure about an API/syntax/behavior, or something is unclear:
  **invoke the `context7` skill and read the docs first.** Training memory drifts;
  Context7 returns current, version-accurate documentation.
- This applies to libraries, frameworks, SDKs, plugins, and APIs — before writing
  non-trivial code against a dependency, read its current docs.
- The `context7` MCP server (in `.mcp.json`) must be connected (`/mcp`). Usage
  workflow + efficiency rules live in the skill: `.claude/skills/context7/SKILL.md`.
- Fallbacks: for Anthropic/Claude API use the `claude-api` skill; for Unreal C++/
  Blueprint engine internals (thin Context7 coverage) prefer official UE docs / web.

## Key docs
| Doc | Purpose |
|---|---|
| `docs/README.md` | Docs index |
| `docs/workflow.md` | Branching + handoff conventions (how we collaborate) |
| `docs/gameplay-sketch.md` | Core loop, MVP scope, open design questions |
| `docs/asset-strategy.md` | How we find/acquire assets |
| `docs/fab-free-assets.md` | Free FAB asset shortlist |
| `docs/mcp-setup.md` | MCP reconnect & troubleshooting |
| `docs/handoff/` | Per-person handoff logs + SHARED state |
| `docs/proposals/agent-cast.md` | Agent roster + seed prompts (active + reference) |
| `docs/proposals/skills.md` | Proposed cross-discipline skill library |

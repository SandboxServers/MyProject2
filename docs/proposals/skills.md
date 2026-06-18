# Proposal: Skill Library for the Repo

> **Status:** proposal, pending review (raised by Steven, 2026-06-18). Comment on **Issue #1**.
> Skills = reusable, invokable procedures (`.claude/skills/<name>/SKILL.md`) that codify a
> repeated workflow so any session — Derek's, Steven's, or an agent's — runs it the same way.
> Different from **agents** (personas in `docs/proposals/agent-cast.md`): an agent is *who*,
> a skill is *how*. Agents call skills.

Goal: capture every repeated workflow in this project as a skill, so the humans don't redo
paperwork they hate and the robots run editor/git/asset procedures correctly every time
instead of rediscovering the gotchas. Crosses all disciplines.

## Already in place (don't rebuild)
- **`context7`** (project skill) — current-docs lookup; the research default.
- **Built-in skills we should lean on:** `deep-research`, `code-review`, `verify`, `run`,
  `simplify`, `claude-api`, `update-config`. Wrap, don't duplicate.

## Legend
**Users:** 👤 human (Derek/Steven) · 🤖 agents · 🤝 both. **Pri:** 1 = build now, 2 = soon, 3 = later.

---

### A. Collaboration & repo hygiene
| Skill | Users | What it does | Pri | Status |
|---|---|---|---|---|
| `handoff` | 🤝 | Writes your handoff entry (your file only) + logs durable decisions to `SHARED.md` (conflict-aware) + posts the Issue #1 note, then commits & pushes. Codifies the rule "every push to main carries its paperwork — and the robot does it." | **1** | build |
| `start-session` | 🤝 | The `CLAUDE.md` START-HERE ritual: pull, read `SHARED.md` + both handoff logs + `docs/README.md`, then summarize "where we are / what's mine to do." | **1** | build |
| `safe-sync` | 🤝 | Pull/rebase + push that handles the binary-`.uasset` / World-Partition external-actor merge reality (keep-both on `SHARED.md`, never clobber, one-editor-per-level guard, auto-rebase-then-push). | 2 | build |
| `repo-health` | 🤖 | Guards the gotchas that already bit us: `EngineAssociation` must be `"5.8"` (never a machine `{GUID}`), `.gitignore` correct (no `__pycache__`/`Saved`/`Intermediate`), no real-email leak in AI commits, `.uproject.bak` ignored. | 2 | build |

### B. Unreal editor automation (MCP)
| Skill | Users | What it does | Pri | Status |
|---|---|---|---|---|
| `bp-author` | 🤖 | Authors/edits a Blueprint graph via the MCP DSL with every gotcha pre-loaded: custom events → use a **function** (DSL can't make custom events), bool vars drop their `b` prefix in node names, object paths need the `.AssetName` suffix, collision sets via `BodyInstance`, `EventBeginPlay`/`EventTick` naming, the `find_node_types → get_node_type_pins → write_graph_dsl → compile` loop. The single biggest robot-productivity multiplier. | **1** | build |
| `pie-smoketest` | 🤖 | Starts PIE, validates the core loop in Python (correct pawn, checkpoints fire in order, timer monotonic & frame-rate-independent, restart resets state), reads the log, stops, reports pass/fail. | **1** | build |
| `viewport-shot` | 🤖 | Captures a **downscaled** viewport screenshot to a file path (avoids the multi-MB base64 dump that blows the token budget — a pain we hit directly). | 2 | build |
| `mcp-reconnect` | 🤝 | The connect + sanity ritual: launch editor → `/mcp` → confirm with a read-only tool. Codifies `docs/mcp-setup.md`. | 3 | build |

### C. Asset pipeline
| Skill | Users | What it does | Pri | Status |
|---|---|---|---|---|
| `fab-import` | 🤝 | Standardizes Fab/Megascans import: organize under `/Game/Fab`, apply naming/folder convention, verify meshes/materials loaded, flag repo-size impact. | 2 | build |
| `asset-scout` | 🤝 | Finds & evaluates free assets (Fab/Quixel/Kenney/Quaternius) against a stated need — license check + UE5.8 compat + style fit. Project-tuned wrapper over `deep-research`. | 3 | build |
| `asset-audit` | 🤖 | Inventories `/Game` content, finds orphans/duplicates/unreferenced assets and oversized textures, flags repo bloat. | 3 | build |

### D. Gameplay craft
| Skill | Users | What it does | Pri | Status |
|---|---|---|---|---|
| `track-greybox` | 🤖 | Lays out a greybox track from a spec via MCP — start/finish, ordered & indexed checkpoints, surfaces — snap-to-ground, correct yaw-to-next. (The Ridgeline Rush prototype is the seed.) | 2 | build |
| `vehicle-tune` | 🤖 | Iterates Chaos vehicle handling toward feel targets (grip, throttle/steer response, air control, landing stability, per-surface friction) with framerate-independence checks. | 2 | build |
| `perf-budget` | 🤖 | Runs perf capture (`stat`/Unreal Insights), compares to the frame budget, reports regressions + top cost sinks. Becomes Pri-1 the moment there's real content. | 2 | build |

### E. Quality & the player
| Skill | Users | What it does | Pri | Status |
|---|---|---|---|---|
| `playtest-debrief` | 👤→🤖 | Turns a human play session (the one thing only Derek/Steven do) into structured findings — fun, fairness, readability, the "one more go" hook — feeding the `player-advocate` and designers. Bridges the human-only step into the agent workflow. | **1** | build |
| `qa-loop` | 🤖 | Runs the automated functional/PIE test pass and triages bugs by core-loop impact. | 2 | build |

### F. Agent operations
| Skill | Users | What it does | Pri | Status |
|---|---|---|---|---|
| `agent-create` | 🤝 | Turns a seed prompt from `agent-cast.md` into a formal `.agent.md` + knowledge scaffold, per repo conventions. Needed now to stand up the approved lean cast. (May exist globally — wrap for this repo.) | **1** | build/verify |
| `agent-retro` | 🤖 | Reviews an agent's outputs/memory and refines its prompt/knowledge files. Pairs with the `retrospective-agent`. | 3 | build |

---

## Recommended first wave (aligns with the now-active build phase)
Build these **six** first — they unblock the lean cast and the grey-box driving loop:
1. `handoff` — stop losing the paperwork.
2. `start-session` — both of us catch up the same way.
3. `agent-create` — stand up the approved lean agent set.
4. `bp-author` — reliable Blueprint authoring (timer/checkpoints/car logic).
5. `pie-smoketest` — prove the loop each iteration.
6. `playtest-debrief` — fold the human playtest back into the loop.

## Next steps (once approved)
1. Agree the list (cuts/adds/priority) — comment on Issue #1.
2. Build the first-wave six as `.claude/skills/<name>/SKILL.md` (descriptions written to auto-trigger).
3. Add the rest as the build phase demands them; capture new gotchas as new skills.

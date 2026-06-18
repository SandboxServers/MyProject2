# Steven — Handoff Log

> **Only Steven's Claude writes this file.** Newest entry on top. Derek reads it to
> catch up on what Steven's side did. Keep entries short; durable decisions go to `SHARED.md`.

## Template for a new entry
```
## YYYY-MM-DD — <one-line summary>
- Did: <what changed this session>
- State: <done / in-progress / blocked>
- Next: <what I'd do next>
- For Derek: <anything he needs to know / a question for him>
- Pushed: <yes/no — commit hash>
```

---

## 2026-06-18 — Agent definitions + memories committed to the repo (via PR)
- Did: committed the **lean-cast agent definitions** (`.claude/agents/` — game-director,
  ue5-technical-director, vehicle-handling-engineer, gameplay-systems-engineer,
  game-feel-engineer, qa-test-engineer, player-advocate, docs-knowledge-keeper) and their
  **memory files** (`.claude/agent-memory/`) as version-controlled repo files, so Derek's
  sessions share the same cast + learned knowledge.
- Privacy: re-verified no real emails before committing; **one personal email had already been
  scrubbed** from `.claude/agents/docs-knowledge-keeper.md` and was not re-added.
- State: PR open on branch `chore/commit-agents-and-memory`; **awaiting Derek's review** (not merged).
- Next: merge once Derek approves.
- For Derek: please review the PR (@aura). After merge, you'll have the same agents + memories.
- Pushed: yes — branch `chore/commit-agents-and-memory` (see PR).

## 2026-06-18 — Testing discipline working-agreement → CLAUDE.md (via PR)
- Did: added a **"Testing discipline"** sub-section to the Working agreements in `CLAUDE.md`
  (real, behavior-verifying tests for any change where a meaningful automated test is feasible;
  no testing theater; subjective/untestable work goes to playtest + player-advocate with a
  stated reason; qa-test-engineer owns the call). Policy authored by **qa-test-engineer**,
  PR by **docs-knowledge-keeper**.
- State: PR open on branch `docs/testing-discipline`; **awaiting Derek's review** (not merged).
- Next: merge once Derek approves.
- For Derek: please review the PR (@aura) and approve/comment.
- Pushed: yes — branch `docs/testing-discipline` (see PR).

## 2026-06-18 — Lean agent cast stood up as live sub-agents; CLAUDE.md updated
- Did:
  - Stood up the lean "car-feel-first" cast as **live Claude Code sub-agents**: game-director,
    ue5-technical-director, vehicle-handling-engineer, gameplay-systems-engineer,
    game-feel-engineer, qa-test-engineer, player-advocate, docs-knowledge-keeper.
  - Updated **`CLAUDE.md`**: added an **"Agent cast"** section (active set + deferred roster),
    flipped the phase line to **build started (2026-06-18), sketching gate lifted**, and added a
    rule that **all documentation + GitHub-issue writing funnels through docs-knowledge-keeper**.
    Also added `docs/proposals/agent-cast.md` + `skills.md` to the Key docs table.
  - Logged the doc/issue **funnel convention** in `SHARED.md`.
- State: done & pushed; lean cast is live.
- Next: split first-wave skills (per `docs/proposals/skills.md`); start grey-boxing the core loop.
- For Derek: route doc/handoff/issue writing through the keeper from now on (CLAUDE.md). Deferred
  agents (artists, track-designer, multiplayer, etc.) stand up as work demands.
- Pushed: yes — see commit below.

## 2026-06-18 — Pushed ridgeline-rush branch; skills proposal; ack'd cast approval
- Did:
  - Pushed **`backup/ridgeline-rush`** to origin (unblocks Derek — it has the Blueprint
    checkpoint + lap-timer prototype). Flagged on Issue #1 that it's pre-sync history, so
    cherry-pick/copy rather than merge.
  - Wrote **`docs/proposals/skills.md`** — proposed skill library across all disciplines
    (collab/repo, MCP editor automation, asset pipeline, gameplay craft, QA/player, agent ops),
    with a recommended first-wave six (handoff, start-session, agent-create, bp-author,
    pie-smoketest, playtest-debrief).
  - Synced Derek's `602fe80` (lean cast approved, Q#4/#6 → phase-two, build phase on).
- State: branch pushed; skills proposal up for review; cast approved.
- Next (queued, on your go): split the lean cast into `prompts/<stem>.md` + run agent-create;
  build the first-wave skills.
- For Derek: review `docs/proposals/skills.md` (Issue #1) — cuts/adds/priority? Branch is on
  origin now.
- Pushed: yes — see commit below.

## 2026-06-18 — Agent cast proposal doc (for Derek's review)
- Did: wrote `docs/proposals/agent-cast.md` — the full proposed agent cast (~21 agents, team
  composition + org chart + one seed prompt each, in the github-copilot-agents prompt style).
  Earlier I only left a one-line pointer, so Derek couldn't actually review the prompts; now the
  content is in the repo.
- State: done & pushed; **awaiting Derek's review**.
- Next: once we agree the cast, split into `prompts/<stem>.md` and run the agent-creation skill.
- For Derek: please review `docs/proposals/agent-cast.md` and comment on Issue #1 — esp. the
  phase-two calls (track editor / multiplayer) and whether to start with the lean "car-feel-first"
  subset. Additions / cuts / merges welcome.
- Pushed: yes — see commit below.

## 2026-06-18 — Synced to remote, fixed engine assoc, added Context7, proposed agent cast
- Did:
  - Hard-synced local `main` to your force-pushed remote (main == origin/main; my throwaway
    work parked off-main — see below).
  - Fixed `.uproject` **EngineAssociation**: it was a machine-specific `{GUID}` (your build),
    which threw a "convert project" prompt on my machine even though we're both on 5.8 →
    changed to the portable `"5.8"`. Pushed (`d628c8d`).
  - Added **Context7** MCP server to `.mcp.json`, a research rule in `CLAUDE.md`, and a
    `context7` skill (`.claude/skills/context7/`): when researching or unsure, read current
    docs via Context7 before answering.
  - Proposed a **~21-agent cast** for the full UE5.8 racer lifecycle (incl. a `player-advocate`);
    in-game track editor + multiplayer marked **phase-two**. In chat / pending your review —
    not committed as files yet.
- State: sync + engine fix + Context7 = done & pushed. Agent cast = proposed, awaiting your take.
- Next: stand up a lean "car-feel-first" starter set of agents once we agree the cast.
- For Derek:
  1. Confirm `"5.8"` opens clean on your machine — **please don't re-commit a `{GUID}`** (durable
     decision now in SHARED.md).
  2. Thoughts on the agent cast? Track editor (Q#4) + multiplayer (Q#6) deferred to phase-two on
     purpose, to protect the core driving loop.
  3. FYI: I ran a throwaway in-editor time-trial build to learn the MCP tooling **before** the
     sync — it's parked on local branch `backup/ridgeline-rush`, **not on main**, so we're still
     honoring "no in-editor building yet."
- Pushed: yes — `d628c8d` (engine fix) + this handoff/Context7 commit.

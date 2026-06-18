# Proposal: Finish bootstrapping the AI SDLC for this repo

> **Status:** pending Derek's review (raised by Steven, 2026-06-18).
> Comment on **Issue #1** or in `docs/handoff/aura.md`. This is a plan, not a set of
> decisions — nothing here is built until Derek approves the pieces.

## Why this doc exists

We already have most of an AI-driven software development lifecycle (SDLC) in place — a
way for two humans plus a cast of agents to build the game without stepping on each other
or merging broken work. What's here today:

- the **lean agent cast** stood up as live sub-agents and committed to the repo;
- the **context7 skill** so agents read current docs instead of guessing;
- the working agreements — **handoff discipline**, the **doc/issue funnel** through
  `docs-knowledge-keeper`, **PR-per-change**, and **testing discipline**;
- a **playable time-trial loop** on `main` (the RidgelineRush level).

This doc lists what's *left* to make that a full-fledged, enforced AI SDLC — the
automation and process pieces that turn good intentions into guardrails that actually
catch mistakes.

## What's left — gap table

Each gap names the agent (or agents) that should **own** closing it. "Own" means the
work is delegated there; the orchestrator sequences it, the doc keeper records it.

| Gap | Owner |
|---|---|
| CI/CD — build + run automation tests on every PR | stand up `tools-automation-engineer` |
| Branch protection — require review + green checks before merge to `main` | `tools-automation-engineer` (repo settings) + `docs-knowledge-keeper` (record in `docs/workflow.md`) |
| PR code-review gate — every PR critically reviewed before merge | NEW `code-reviewer` agent (see `agent-cast.md`) |
| Test harness wired (UE automation framework + runner), not just the policy | `qa-test-engineer` + `tools-automation-engineer` |
| First-wave skills built (`handoff`, `start-session`, `agent-create`, `bp-author`, `pie-smoketest`, `playtest-debrief`) | `tools-automation-engineer` |
| Orchestrator + PR-workflow rules written into `CLAUDE.md` / `docs/workflow.md` | `docs-knowledge-keeper` (orchestrator rule is in this PR) |
| Agent routing map ("which agent for which request") | `docs-knowledge-keeper` + `game-director` |
| Issue/PR templates + labels, Definition of Done | `docs-knowledge-keeper` / `tools-automation-engineer` |
| Retrospective cadence | stand up `retrospective-agent` |

## Stand up next

To close the gaps above, these agents need to come online:

- **`tools-automation-engineer`** — the most-blocked-on owner here (CI/CD, branch
  protection, test harness, skills).
- **`retrospective-agent`** — to start the lessons-learned loop folding back into the docs.
- **`code-reviewer`** *(pending approval — see `agent-cast.md`)* — the PR review gate.

## Next steps

1. **Derek reviews** this plan and the `code-reviewer` proposal in `agent-cast.md`
   (comment on Issue #1 or in `aura.md`).
2. **On approval**, the orchestrator delegates each gap to its named owner — standing up
   the new agents first, then closing the automation gaps in dependency order.

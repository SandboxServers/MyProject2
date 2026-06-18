# Workflow — Branching & Handoff Conventions

How Derek (aura) and Steven collaborate on this repo, each with their own Claude Code
session. This is the source of truth for *how we work*; `CLAUDE.md` points both Claudes
here. Async by design — the other person sees your work only after you **push**.

## The three layers
| Layer | Lives in | Branch-visible? | Use for |
|---|---|---|---|
| **Branches + PRs** | git | — | The actual code/asset changes. **A PR's description is the handoff for that change.** |
| **`docs/` + handoff files** | `main` | trapped on a branch until merged | Durable knowledge & overall state |
| **GitHub Issue #1 + PR comments** | GitHub | **always visible (no merge needed)** | Live coordination while work is in flight on a branch |

Mental model: **`docs/` = the record · Issue/PRs = the live wire.**

## Where each kind of info goes
- **Discovery / research / findings** → a doc under `docs/` (e.g. `fab-free-assets.md`).
  Then *point* to it from your handoff file — don't paste the research into the log.
- **"What I did this session / what's next"** → your own handoff file
  (`docs/handoff/aura.md` for Derek, `docs/handoff/steven.md` for Steven).
- **Agreed decisions / current focus** → `docs/handoff/SHARED.md` (both read & edit).
- **In-the-moment chatter, "review my branch?", status mid-branch** → Issue #1 / PR comments.

## Handoff file rules
- **Write ONLY your own file.** Derek's Claude → `aura.md`; Steven's Claude → `steven.md`.
  This guarantees no merge conflicts on personal logs.
- Newest entry on top; keep it short. Use the template at the top of each file.
- Durable decisions get promoted to `SHARED.md`.
- **`SHARED.md` is the one shared-write file** — keep edits small and merge them quickly.
  If it conflicts on pull, **keep both sides** and reconcile.

## Branching workflow (use once we move past sketching)
1. `git pull` on `main`, read the handoff files, skim Issue #1.
2. Create a branch: `feat/<thing>` (or `fix/`, `chore/`).
3. Comment on Issue #1: *"starting `<thing>` on `feat/<thing>`."* (so the other knows).
4. Work + commit to the branch.
5. Open a **PR** to `main`. The PR description = the handoff for this change.
6. Add your `docs/handoff/aura.md` (or `steven.md`) entry **in the PR**, so the log
   merges atomically with the code.
7. Ask the other to review (Issue #1 or PR comment). Merge when ready.
8. After merge: the other person's next `git pull` sees both the code and your handoff.

### Why handoff entries go in the PR, not a separate main commit
So your "what I did" lands at the exact moment the work lands — no window where the
code is merged but the log says something else (or vice-versa).

### Long-lived branches
The longer a branch lives, the more your file-based handoff goes stale (it's trapped on
the branch). Lean on **Issue #1 and PR comments** for visibility while a branch is open.

## Start-of-session checklist (both of us, every time)
- [ ] `git pull` on `main`
- [ ] Read `docs/handoff/SHARED.md`, the other person's handoff file, and skim Issue #1
- [ ] (If continuing branch work) check your open PRs/branches

## End-of-session checklist
- [ ] Add an entry to your own handoff file
- [ ] Promote any durable decision to `SHARED.md`
- [ ] Commit + **push** (or open/update your PR) — unpushed = invisible to the other
- [ ] **No Notion** — the repo is the single source of truth (see `CLAUDE.md`)

## Conventions
- Commits use the GitHub noreply identity (no real emails).
- Branch names: `feat/…`, `fix/…`, `chore/…`.
- Don't commit to `main` directly once we're past sketching — branch + PR instead.

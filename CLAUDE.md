# spec-kit — Fellowship Fork

This is a fork of [github/spec-kit](https://github.com/github/spec-kit), intentionally diverged. We maintain our own flavor: tighter line limits, no prose, bash scripts included.

## Fork Status

- **Upstream**: `github/spec-kit`
- **Commits behind upstream**: 252+ (intentional — we diverged significantly)
- **Do NOT auto-merge upstream** — changes must be cherry-picked manually and reviewed

## Consumer Repos

These repos install speckit commands from this fork (not from upstream):

- `fellowship-dev/booster-pack`
- `fellowship-dev/rails-backend`
- `fellowship-dev/inbox-angel-worker`
- `fellowship-dev/mtg-lotr`
- Clapes repos

Consumer repos copy commands into `.claude/commands/` (e.g., `speckit.specify.md`, `speckit.plan.md`).

## Drift & Updates

- **Drift is checked weekly** by the tooling crew (every Monday at 1am CLT)
- The sync task compares installed command SHAs against this repo's HEAD
- If a consumer repo is drifted, the sync task opens a PR to update it
- To update a consumer repo manually: copy updated command files into `.claude/commands/`

## Upstream Cherry-Picks

- The tooling crew also checks `github/spec-kit` weekly for potentially relevant commits
- A GitHub issue is created on this repo listing recommendations
- Cherry-picks are **manual only** — review carefully before applying
- Never auto-merge from upstream

## What Changed vs Upstream

- Commands cut ~80%: original ~1,400 lines → this fork ~250 lines
- Strict line limits: spec ≤50, plan ≤50, tasks ≤40
- No prose: tasks are checkboxes, specs are bullets, plans are tables
- Bash scripts included for branch creation and plan setup
- Generic constitution template included

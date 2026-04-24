# spec-kit — Fellowship Fork

This is a fork of [github/spec-kit](https://github.com/github/spec-kit). We maintain our own flavor: tighter line limits, no prose, bash scripts included.

## Fork Status

- **Upstream**: `github/spec-kit`
- **Synced to**: v0.8.1 (2026-04-24) — 0 commits behind upstream
- **Upstream syncs**: bulk syncs are permitted under CTO review; cherry-picks for smaller updates

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

## Upstream Syncs

- The tooling crew checks `github/spec-kit` weekly for relevant commits
- Small fixes/features: cherry-pick manually and review
- Major version bumps: bulk sync PR under CTO review is acceptable
- Consumer repos need a re-sync PR after any template changes here

## What Changed vs Upstream

Templates are currently at upstream v0.8.1 line counts (re-trimming tracked in [fellowship-dev/pylot#239](https://github.com/fellowship-dev/pylot/issues/239)):

| Template | Current | Terse target |
|----------|---------|--------------|
| `specify.md` | 327 lines | ≤50 lines |
| `plan.md` | 152 lines | ≤50 lines |
| `tasks.md` | 203 lines | ≤40 lines |
| `implement.md` | 201 lines | ≤40 lines |
| `analyze.md` | 252 lines | ≤40 lines |

Fork additions preserved from pre-v0.8.1:
- Bash scripts for branch creation and plan setup
- Generic constitution template

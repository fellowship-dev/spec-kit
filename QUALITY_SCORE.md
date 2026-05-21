# Quality Score Report — fellowship-dev/spec-kit

Last updated: 2026-05-21

> Domain quality grades based on documentation freshness, test coverage, and code staleness.

## Grading Scale

- **A**: Excellent (0 signals failing)
- **B**: Good (SCORE = 1)
- **C**: Fair (SCORE = 2)
- **D**: Poor (SCORE ≥ 3)
- **F**: Failing (no documentation)

## Domains

### CLI Core
- **Grade**: C
- **Last Updated**: 2026-04-24 (sync: upstream spec-kit v0.8.1 — 27 days ago)
- **Signals**:
  - S1 (Code Structure Docs): ⚠️ Yellow — mentioned in AGENTS.md but no dedicated code-structure.md
  - S2 (FlowChad): N/A — not a frontend repo
  - S3 (Staleness): ✅ Pass — last commit 2026-04-24, delta 0d vs docs
  - S4 (Open Issues): N/A — issues disabled in this repository
  - S5 (Test Coverage): ⚠️ Yellow — no CLI unit tests; coverage focused on Extensions
  - S6 (Hookshot): ❌ Fail — no .claude/doc-coverage.json
- **SCORE**: 1 (S6) + 0.5 (S1) + 0.5 (S5) = 2 → C

### Extensions System
- **Grade**: C
- **Last Updated**: 2026-04-24 (sync: 27 days ago)
- **Signals**:
  - S1 (Code Structure Docs): ⚠️ Yellow — documented in AGENTS.md, not separate code-structure.md
  - S2 (FlowChad): N/A
  - S3 (Staleness): ✅ Pass — last commit 2026-04-24, delta 0d
  - S4 (Open Issues): N/A — issues disabled
  - S5 (Test Coverage): ✅ Pass — comprehensive test_extensions.py (32KB)
  - S6 (Hookshot): ❌ Fail — not configured
- **SCORE**: 1 (S6) + 0.5 (S1) = 1.5 → C

### Templates & Commands
- **Grade**: C
- **Last Updated**: 2026-04-30 (cherry-pick checklist — 21 days ago)
- **Signals**:
  - S1 (Code Structure Docs): ✅ Pass — documented in spec-driven.md and AGENTS.md
  - S2 (FlowChad): N/A
  - S3 (Staleness): ✅ Pass — last commit 2026-04-30, 21 days ago
  - S4 (Open Issues): N/A — issues disabled
  - S5 (Test Coverage): ⚠️ Yellow — templates tested via integration, not unit tests
  - S6 (Hookshot): ❌ Fail — not configured
- **SCORE**: 1 (S6) + 0.5 (S5) = 1.5 → C

### Documentation
- **Grade**: B
- **Last Updated**: 2026-04-24 (27 days ago)
- **Signals**:
  - S1 (Code Structure Docs): ✅ Pass — docs/index.md and installation.md exist
  - S2 (FlowChad): N/A
  - S3 (Staleness): ✅ Pass — last commit 2026-04-24, 27 days ago
  - S4 (Open Issues): N/A — issues disabled
  - S5 (Test Coverage): N/A — documentation doesn't require unit tests
  - S6 (Hookshot): ❌ Fail — not configured
- **SCORE**: 1 (S6) → B

### Tests & QA
- **Grade**: C
- **Last Updated**: 2026-04-24 (27 days ago)
- **Signals**:
  - S1 (Code Structure Docs): ⚠️ Yellow — test structure not explicitly documented
  - S2 (FlowChad): N/A
  - S3 (Staleness): ✅ Pass — last commit 2026-04-24, 27 days ago
  - S4 (Open Issues): N/A — issues disabled
  - S5 (Test Coverage): ⚠️ Yellow — only test_extensions.py; no CLI unit tests
  - S6 (Hookshot): ❌ Fail — not configured
- **SCORE**: 1 (S6) + 0.5 (S1) + 0.5 (S5) = 2 → C

## Signal Applicability

| Signal | Applicable | Reason |
|--------|-----------|--------|
| S1 | Yes | Code structure documented in AGENTS.md, spec-driven.md, and docs/ |
| S2 | No | Not a frontend repository — no React/Next/Vue, no .flowchad directory |
| S3 | Yes | Git history available; upstream sync 2026-04-24 refreshed staleness |
| S4 | No | GitHub issues are disabled in this repository |
| S5 | Yes | Test suite exists (tests/test_extensions.py), pytest configured |
| S6 | Yes | Not configured ❌ |

## Tooling — Speckit Command Drift

Checked 2026-05-21. Source of truth: `fellowship-dev/spec-kit/templates/commands/`.

| Repo | Status | Commands drifted |
|------|--------|-----------------|
| fellowship-dev/booster-pack | ✅ Current | — |
| fellowship-dev/mtg-lotr | ✅ Current | — |
| fellowship-dev/farmesa-v2 | ⚠️ Drifted | all 7 (specify, plan, tasks, implement, analyze, checklist, clarify) |
| fellowship-dev/inbox-angel | ⚠️ Drifted | all 7 (specify, plan, tasks, implement, analyze, checklist, clarify) |
| Lexgo-cl/rails-backend | ❌ Not installed | No speckit commands found in .claude/commands/ |
| fellowship-dev/inbox-angel-worker | — | Gitignored locally — sync via Spacestation only |

farmesa-v2 and inbox-angel share identical installed SHAs — likely synced together, both behind current spec-kit.

## Summary

**Overall Quality Grade**: C

Top concerns:
1. **S6 Universal Gap**: No hookshot configured across all domains
2. **CLI Test Coverage**: Core CLI (src/specify_cli/) has no unit tests
3. **Code Structure Doc Gap**: No dedicated code-structure.md; domains rely on AGENTS.md
4. **Speckit Drift**: farmesa-v2 + inbox-angel all 7 commands behind; rails-backend not installed

## History

| Date | Trigger | Summary |
|------|---------|---------|
| 2026-04-21 | daily sweep | CLI B, Extensions B, Templates A, Documentation C, Tests B |
| 2026-04-24 | daily sweep | All code domains crossed 60d threshold. CLI C, Extensions C, Templates C, Documentation B, Tests C |
| 2026-05-18 | weekly sweep | S3 ✅ across all domains (upstream sync 2026-04-24 + cherry-pick 2026-04-30). S6 methodology corrected (N/A→applicable ❌). Grades unchanged at C/C/C/B/C. |
| 2026-05-19 | daily sweep | 5 domains, 0 regressions, 0 improvements. Tooling section added: farmesa-v2 + inbox-angel all 7 commands drifted; rails-backend not installed; booster-pack + mtg-lotr current. |
| 2026-05-21 | daily sweep | 5 domains, 0 regressions, 0 improvements. Staleness +2d across all domains. |

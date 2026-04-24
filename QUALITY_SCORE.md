# Quality Score Report

Domain quality grades based on documentation freshness, test coverage, and code staleness.

## Grading Scale

- **A**: Excellent (0 signals failing)
- **B**: Good (1 signal failing or 2 yellow)
- **C**: Fair (2-3 signals failing)
- **D**: Poor (3+ signals failing)
- **F**: Failing (no documentation)

## Domains

### CLI Core
- **Grade**: C
- **Last Updated**: 2026-02-12 (71 days ago)
- **Signals**:
  - S1 (Code Structure Docs): ⚠️ Yellow - mentioned in AGENTS.md but no dedicated code-structure.md
  - S2 (FlowChad): N/A - not a frontend repo
  - S3 (Staleness): ❌ Fail - 71 days old, crossed 60-day threshold
  - S4 (Open Issues): N/A - issues disabled in this repository
  - S5 (Test Coverage): ⚠️ Yellow - no CLI unit tests; testing coverage focused on Extensions
  - S6 (Hookshot): N/A - no .claude/doc-coverage.json
- **Notes**: Core CLI functionality documented in AGENTS.md and docs/. Code hasn't been updated since Feb 12. 71 days puts S3 firmly in the red zone.

### Extensions System
- **Grade**: C
- **Last Updated**: 2026-02-10 (73 days ago)
- **Signals**:
  - S1 (Code Structure Docs): ⚠️ Yellow - documented in AGENTS.md, not in separate code-structure.md
  - S2 (FlowChad): N/A - not a frontend repo
  - S3 (Staleness): ❌ Fail - 73 days old, crossed 60-day threshold
  - S4 (Open Issues): N/A - issues disabled in this repository
  - S5 (Test Coverage): ✅ Pass - comprehensive test_extensions.py with 32KB of test code
  - S6 (Hookshot): N/A - no .claude/doc-coverage.json
- **Notes**: Well-tested extension system with strong test coverage. Extensions docs (4 guides in extensions/ dir) are thorough. Staleness is the main concern — no changes since Feb 10.

### Templates & Commands
- **Grade**: C
- **Last Updated**: 2026-02-17 (66 days ago)
- **Signals**:
  - S1 (Code Structure Docs): ✅ Pass - documented in spec-driven.md and AGENTS.md
  - S2 (FlowChad): N/A - not a frontend repo
  - S3 (Staleness): ❌ Fail - 66 days old, crossed 60-day threshold
  - S4 (Open Issues): N/A - issues disabled in this repository
  - S5 (Test Coverage): ⚠️ Yellow - templates tested via integration, not unit tests
  - S6 (Hookshot): N/A - no .claude/doc-coverage.json
- **Notes**: 9 command files in templates/commands/ covering specify, plan, tasks, implement, analyze, checklist, clarify, constitution, and taskstoissues workflows. Documentation is solid. Staleness now exceeds 60-day threshold.

### Documentation
- **Grade**: B
- **Last Updated**: 2025-12-04 (141 days ago)
- **Signals**:
  - S1 (Code Structure Docs): ✅ Pass - docs/index.md and installation.md exist
  - S2 (FlowChad): N/A - not a frontend repo
  - S3 (Staleness): ❌ Fail - 141 days old, severely stale
  - S4 (Open Issues): N/A - issues disabled in this repository
  - S5 (Test Coverage): N/A - documentation doesn't require unit tests
  - S6 (Hookshot): N/A - no .claude/doc-coverage.json
- **Notes**: User-facing docs in docs/ (8 markdown files) haven't been updated since Dec 2025. S1 passes (docs exist), S5 N/A, only S3 fails — scores a B. Needs refresh to reflect CLI changes from Feb 2026.

### Tests & QA
- **Grade**: C
- **Last Updated**: 2026-02-10 (73 days ago)
- **Signals**:
  - S1 (Code Structure Docs): ⚠️ Yellow - test structure not explicitly documented
  - S2 (FlowChad): N/A - not a frontend repo
  - S3 (Staleness): ❌ Fail - 73 days old, crossed 60-day threshold
  - S4 (Open Issues): N/A - issues disabled in this repository
  - S5 (Test Coverage): ⚠️ Yellow - only test_extensions.py (32KB), no CLI unit tests
  - S6 (Hookshot): N/A - no .claude/doc-coverage.json
- **Notes**: Extension tests are comprehensive (pytest configured in pyproject.toml with coverage tracking). Core CLI lacks unit test coverage. Both S1 and S5 are yellow, S3 is red.

## Signal Applicability

| Signal | Applicable | Reason |
|--------|-----------|--------|
| S1 | Yes | Repo has code structure documented in AGENTS.md, spec-driven.md, and docs/ |
| S2 | No | Not a frontend repository - no React/Next/Vue, no .flowchad directory |
| S3 | Yes | Git history available, can measure staleness vs current date (2026-04-24) |
| S4 | No | GitHub issues are disabled in this repository |
| S5 | Yes | Test suite exists (tests/test_extensions.py), pytest configured |
| S6 | No | No .claude/doc-coverage.json file exists in repository |

## Summary

**Overall Quality Grade**: C

All code domains have crossed the 60-day staleness threshold since the 2026-04-21 sweep, triggering S3 failures across the board. Documentation holds at B (only S3 fails, S5 is N/A). Extensions remains the strongest domain due to comprehensive test coverage.

Top concerns:
1. **Pervasive Staleness**: All 5 domains exceed 60 days since last code change — src (71d), extensions (73d), templates (66d), docs (141d), tests (73d)
2. **CLI Test Coverage**: Core CLI (src/specify_cli/) still has no unit tests
3. **Code Structure Doc Gap**: No dedicated code-structure.md; domains rely on AGENTS.md and spec-driven.md

## History

### 2026-04-21 Daily Sweep
- Analyzed all domains
- Assessed signal applicability for Python/CLI-based repo
- CLI Core: B (67-day staleness, good docs, moderate test coverage)
- Extensions: B (69-day staleness, excellent test coverage)
- Templates: A (62-day staleness, comprehensive commands)
- Documentation: C (137-day staleness, needs update)
- Tests: B (69-day staleness, extension-focused)

### 2026-04-24 Daily Sweep
- All code domains crossed 60-day staleness threshold (S3 now ❌ Fail for all)
- CLI Core: C (was B) — S3 regression: 67d → 71d, crossed threshold
- Extensions System: C (was B) — S3 regression: 69d → 73d, crossed threshold
- Templates & Commands: C (was A) — S3 regression: 62d → 66d, crossed threshold
- Documentation: B (was C) — S3 still failing (141d), but S5 N/A reduces penalty
- Tests & QA: C (was B) — S3 regression: 69d → 73d, crossed threshold
- CLAUDE.md added 2026-04-23: fork context and drift policy documented

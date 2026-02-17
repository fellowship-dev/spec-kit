---
description: Generate actionable task list from plan
---

**INPUT**: `$ARGUMENTS`

**OUTPUT CONSTRAINT**: tasks.md must be **≤40 lines**. Just checkboxes, no prose.

## Steps

1. **Setup**: Run `.specify/scripts/bash/check-prerequisites.sh --json`, parse FEATURE_DIR

2. **Load context**:
   - Read plan.md (tech stack, structure)
   - Read spec.md (user stories with priorities)

3. **Generate tasks.md**:
   - **Phase 1: Setup** - project init, dependencies
   - **Phase 2+: One phase per user story** (US1, US2, US3) in priority order
   - **Final Phase: Polish** - cleanup, documentation

4. **Task format** (strict):
   ```
   - [ ] T001 [Description] `path/to/file`
   - [ ] T002 [P] [Description] `path/to/file`  # [P] = parallelizable
   ```

5. **Validate**:
   - Every task has ID, description, file path
   - Tasks in dependency order
   - Each phase independently testable
   - If >40 lines, combine or cut tasks

6. **Report**: Tasks path, task count, ready for `/speckit.implement`

## Rules

- NO prose, NO explanations - just checkboxes
- One task = one file (usually)
- [P] marker only if truly parallelizable
- 10-20 tasks typical, 30 max

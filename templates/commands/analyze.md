---
description: Analyze feature artifacts for consistency
---

**INPUT**: `$ARGUMENTS`

## Steps

1. **Load all artifacts** from feature directory:
   - spec.md, plan.md, tasks.md

2. **Check consistency**:
   - Every user story in spec → has phase in tasks
   - Every requirement in spec → addressed in tasks
   - Tech stack in plan → matches implementation
   - Constitution principles → all passing

3. **Check completeness**:
   - All tasks have file paths
   - All tasks are checked or have blockers documented

4. **Report issues** (if any):
   ```
   ## Consistency Issues
   - [ ] US2 missing from tasks.md
   - [ ] FR-003 not addressed

   ## Completeness Issues
   - [ ] T005 missing file path
   ```

5. **If no issues**: Report "All checks pass, ready for PR"

## Rules

- Be specific about what's missing
- Reference line numbers where possible
- Don't block on minor issues (typos, formatting)

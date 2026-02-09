---
description: Validate spec/plan quality against checklist
---

**INPUT**: `$ARGUMENTS`

## Steps

1. **Load artifacts** from feature directory

2. **Run checks**:

   **Spec Quality**:
   - [ ] No implementation details
   - [ ] All requirements testable
   - [ ] Success criteria measurable
   - [ ] ≤50 lines

   **Plan Quality**:
   - [ ] Constitution check completed
   - [ ] Tech stack justified
   - [ ] File structure concrete
   - [ ] ≤50 lines

   **Tasks Quality**:
   - [ ] All tasks have IDs and file paths
   - [ ] Phases match user stories
   - [ ] ≤40 lines

3. **Report**:
   - Passing checks: ✓
   - Failing checks: ✗ with specific issue
   - Overall: PASS or FAIL

## Rules

- Be specific about failures
- Don't nitpick formatting
- PASS requires all critical checks

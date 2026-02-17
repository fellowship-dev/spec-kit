---
description: Execute tasks from tasks.md
---

**INPUT**: `$ARGUMENTS`

## Steps

1. **Load tasks.md** from current feature directory

2. **Execute tasks in order**:
   - Find first unchecked task `- [ ]`
   - Implement it following constitution principles
   - Mark complete `- [x]`
   - Commit with message: `[Feature] T00X: description`

3. **For each task**:
   - Read the file path specified
   - Implement following existing patterns in codebase
   - Run relevant tests
   - If tests fail, fix before proceeding

4. **After all tasks**:
   - Run full test suite for changed files only
   - Update tasks.md (all checked)

5. **Report**: Tasks completed, tests passing, ready for PR

## Rules

- One task at a time, commit after each
- Follow constitution principles
- If blocked, document in tasks.md and skip to next parallelizable task
- NEVER run full test suite — only tests for specific files changed

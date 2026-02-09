---
description: Create feature specification from GitHub issue
handoffs:
  - label: Plan
    agent: speckit.plan
    prompt: Create technical plan
    send: true
  - label: Clarify
    agent: speckit.clarify
    prompt: Resolve open questions
    send: true
---

**INPUT**: `$ARGUMENTS`

**OUTPUT CONSTRAINT**: spec.md must be **≤50 lines**. Be terse. No prose.

## Steps

1. **Get issue number**:
   - If `$ARGUMENTS` contains a number, use it as issue number
   - Otherwise, ask user for GitHub issue number
   - Optionally get sub-issue number for child issues (e.g., `1225 sub 1`)

2. **Fetch issue details** (if available):
   ```bash
   gh issue view <issue_number> --json title,body,labels
   ```

3. **Generate short name** (2-4 words, kebab-case) from issue title

4. **Run script**:
   ```bash
   .specify/scripts/bash/create-new-feature.sh --json --issue <N> --short-name "<name>" "<description>"
   # For sub-issues:
   .specify/scripts/bash/create-new-feature.sh --json --issue <N> --sub <M> --short-name "<name>" "<description>"
   ```
   Parse JSON for BRANCH_NAME and SPEC_FILE.

5. **Load template**: `.specify/templates/spec-template.md`

6. **Fill spec.md** with:
   - 2-4 user stories (P1, P2, P3) - one sentence each + Given/When/Then
   - 3-5 functional requirements - testable, no tech details
   - 3-4 success criteria - measurable outcomes
   - Max 3 open questions (only if critical)

7. **Validate**: No implementation details, ≤50 lines

8. **Label and assign issue**:
   ```bash
   gh issue edit <issue_number> --add-label "in progress" --add-assignee @me
   ```

9. **Report**: Branch name, spec path, confirm label added and issue assigned

## Examples

```bash
# From issue number
/speckit.specify 1223

# With sub-issue
/speckit.specify 1225 sub 1
```

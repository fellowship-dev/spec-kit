---
description: Resolve open questions in spec.md
---

**INPUT**: `$ARGUMENTS`

## Steps

1. **Load spec.md** and find "Open Questions" section

2. **For each question**:
   - Research codebase for existing patterns
   - Check constitution for guidance
   - Propose answer with rationale

3. **Present to user** (if needed):
   ```
   ## Q1: [Question]
   **Recommendation**: [Answer]
   **Rationale**: [Why]
   ```

4. **Update spec.md**:
   - Remove resolved questions
   - Update relevant sections with answers
   - Keep spec ≤50 lines

5. **Report**: Questions resolved, spec updated

## Rules

- Make decisions when possible, don't ask unnecessarily
- Max 3 questions to user per session
- If question is about implementation → defer to plan phase

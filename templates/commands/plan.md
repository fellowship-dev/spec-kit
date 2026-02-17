---
description: Create technical implementation plan from specification
---

**INPUT**: `$ARGUMENTS`

**OUTPUT CONSTRAINT**: plan.md must be **≤50 lines**. Be terse. No prose.

## Steps

1. **Setup**: Run `.specify/scripts/bash/setup-plan.sh --json`, parse FEATURE_SPEC, IMPL_PLAN, SPECS_DIR

2. **Load context**:
   - Read spec.md from FEATURE_SPEC
   - Read `.specify/memory/constitution.md`
   - Load plan template (already copied to IMPL_PLAN)

3. **Fill plan.md** with:
   - **Summary**: One paragraph - what + technical approach
   - **Tech Stack**: Language, storage, testing, key deps (4-5 bullet points)
   - **Constitution Check**: Table with pass/fail for each principle
   - **Structure**: Key files/dirs to create/modify (code block)
   - **Decisions**: Table of key choices + brief rationale

4. **Validate**:
   - All constitution principles addressed
   - Tech choices justified
   - File structure concrete (no placeholders)
   - If >50 lines, cut ruthlessly

5. **Report**: Plan path, ready for `/speckit.tasks`

## Rules

- Reference existing patterns in codebase
- No research.md, data-model.md, or contracts/ - keep it in plan.md
- Decisions table captures what would go in research docs
- Structure section captures what would go in data-model

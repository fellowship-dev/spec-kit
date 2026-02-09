# Spec Kit (Fellowship Fork)

Terse, opinionated fork of [github/spec-kit](https://github.com/github/spec-kit).

## What Changed

- **Commands cut ~80%**: Original was ~1,400 lines across 9 commands. This fork: ~250 lines.
- **Strict line limits**: spec ≤50, plan ≤50, tasks ≤40
- **No prose**: Tasks are checkboxes. Specs are bullets. Plans are tables.
- **Bash scripts included**: Branch creation, prerequisite checks, plan setup — all project-agnostic.
- **Generic constitution template**: Fill in your project's principles.

## Installation

Copy into your project:

```bash
# Commands (Claude Code slash commands)
cp -r templates/commands/ .claude/commands/
# Rename: speckit.specify.md, speckit.plan.md, etc.
for f in .claude/commands/*.md; do
  mv "$f" ".claude/commands/speckit.$(basename "$f")"
done

# Scripts + templates + constitution
mkdir -p .specify/{scripts/bash,templates,memory}
cp scripts/bash/* .specify/scripts/bash/
cp templates/spec-template.md templates/plan-template.md templates/tasks-template.md templates/checklist-template.md .specify/templates/
cp templates/constitution-template.md .specify/memory/constitution.md
# Edit constitution.md for your project
```

## Workflow

```
/speckit.specify 42    → spec.md (≤50 lines)
/speckit.plan          → plan.md (≤50 lines)
/speckit.tasks         → tasks.md (≤40 lines)
/speckit.implement     → code + commits
/speckit.analyze       → consistency check
/speckit.checklist     → quality validation
```

## Original

See [github/spec-kit](https://github.com/github/spec-kit) for the full verbose version.

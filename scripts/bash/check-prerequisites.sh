#!/usr/bin/env bash
# Check prerequisites for Speckit workflow phases

set -e

JSON_MODE=false
REQUIRE_PLAN=false
REQUIRE_TASKS=false

for arg in "$@"; do
    case "$arg" in
        --json) JSON_MODE=true ;;
        --require-plan) REQUIRE_PLAN=true ;;
        --require-tasks) REQUIRE_TASKS=true ;;
        --help|-h)
            echo "Usage: $0 [--json] [--require-plan] [--require-tasks]"
            echo "  --json           Output JSON format"
            echo "  --require-plan   Require plan.md exists"
            echo "  --require-tasks  Require tasks.md exists"
            exit 0
            ;;
    esac
done

# Load common functions
SCRIPT_DIR="$(CDPATH="" cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/common.sh"

# Get paths
eval $(get_feature_paths)
check_feature_branch "$CURRENT_BRANCH" "$HAS_GIT" || exit 1

# Check feature directory
if [[ ! -d "$FEATURE_DIR" ]]; then
    echo "ERROR: Feature directory not found: $FEATURE_DIR" >&2
    echo "Run /speckit.specify first." >&2
    exit 1
fi

# Check required files
if $REQUIRE_PLAN && [[ ! -f "$IMPL_PLAN" ]]; then
    echo "ERROR: plan.md not found. Run /speckit.plan first." >&2
    exit 1
fi

if $REQUIRE_TASKS && [[ ! -f "$TASKS" ]]; then
    echo "ERROR: tasks.md not found. Run /speckit.tasks first." >&2
    exit 1
fi

# Output
if $JSON_MODE; then
    printf '{"FEATURE_DIR":"%s","SPEC":"%s","PLAN":"%s","TASKS":"%s","BRANCH":"%s"}\n' \
        "$FEATURE_DIR" "$FEATURE_SPEC" "$IMPL_PLAN" "$TASKS" "$CURRENT_BRANCH"
else
    echo "FEATURE_DIR: $FEATURE_DIR"
    echo "BRANCH: $CURRENT_BRANCH"
    check_file "$FEATURE_SPEC" "spec.md"
    check_file "$IMPL_PLAN" "plan.md"
    check_file "$TASKS" "tasks.md"
fi

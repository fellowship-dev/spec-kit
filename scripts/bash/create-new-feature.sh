#!/usr/bin/env bash

set -e

JSON_MODE=false
SHORT_NAME=""
ISSUE_NUMBER=""
SUB_ISSUE=""
ARGS=()

# Parse arguments
i=1
while [ $i -le $# ]; do
    arg="${!i}"
    case "$arg" in
        --json)
            JSON_MODE=true
            ;;
        --short-name)
            i=$((i + 1))
            SHORT_NAME="${!i}"
            ;;
        --issue)
            i=$((i + 1))
            ISSUE_NUMBER="${!i}"
            ;;
        --sub)
            i=$((i + 1))
            SUB_ISSUE="${!i}"
            ;;
        --help|-h)
            echo "Usage: $0 [--json] --issue <N> [--sub <N>] --short-name <name> <description>"
            echo ""
            echo "Options:"
            echo "  --json              Output in JSON format"
            echo "  --issue <N>         GitHub issue number (required)"
            echo "  --sub <N>           Sub-issue number for child issues (e.g., 1225-1)"
            echo "  --short-name <name> Short name for branch (required)"
            echo "  --help, -h          Show this help message"
            echo ""
            echo "Examples:"
            echo "  $0 --issue 1223 --short-name 'skylight-optimization' 'Optimize Skylight APM costs'"
            echo "  $0 --issue 1225 --sub 1 --short-name 'user-model' 'Create user model for auth feature'"
            exit 0
            ;;
        *)
            ARGS+=("$arg")
            ;;
    esac
    i=$((i + 1))
done

FEATURE_DESCRIPTION="${ARGS[*]}"

# Validate required arguments
if [ -z "$ISSUE_NUMBER" ]; then
    echo "Error: --issue <N> is required (GitHub issue number)" >&2
    exit 1
fi

if [ -z "$SHORT_NAME" ]; then
    echo "Error: --short-name <name> is required" >&2
    exit 1
fi

# Function to find the repository root
find_repo_root() {
    local dir="$1"
    while [ "$dir" != "/" ]; do
        if [ -d "$dir/.git" ] || [ -d "$dir/.specify" ]; then
            echo "$dir"
            return 0
        fi
        dir="$(dirname "$dir")"
    done
    return 1
}

# Function to clean branch name
clean_branch_name() {
    local name="$1"
    echo "$name" | tr '[:upper:]' '[:lower:]' | sed 's/[^a-z0-9]/-/g' | sed 's/-\+/-/g' | sed 's/^-//' | sed 's/-$//'
}

# Resolve repository root
SCRIPT_DIR="$(CDPATH="" cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if git rev-parse --show-toplevel >/dev/null 2>&1; then
    REPO_ROOT=$(git rev-parse --show-toplevel)
    HAS_GIT=true
else
    REPO_ROOT="$(find_repo_root "$SCRIPT_DIR")"
    if [ -z "$REPO_ROOT" ]; then
        echo "Error: Could not determine repository root." >&2
        exit 1
    fi
    HAS_GIT=false
fi

cd "$REPO_ROOT"

SPECS_DIR="$REPO_ROOT/specs"
mkdir -p "$SPECS_DIR"

# Clean short name
BRANCH_SUFFIX=$(clean_branch_name "$SHORT_NAME")

# Build branch name: issue-shortname or issue-sub-shortname
if [ -n "$SUB_ISSUE" ]; then
    BRANCH_NAME="${ISSUE_NUMBER}-${SUB_ISSUE}-${BRANCH_SUFFIX}"
else
    BRANCH_NAME="${ISSUE_NUMBER}-${BRANCH_SUFFIX}"
fi

# GitHub enforces 244-byte limit
MAX_BRANCH_LENGTH=244
if [ ${#BRANCH_NAME} -gt $MAX_BRANCH_LENGTH ]; then
    >&2 echo "Warning: Branch name exceeds 244 bytes, truncating..."
    BRANCH_NAME="${BRANCH_NAME:0:$MAX_BRANCH_LENGTH}"
fi

# Create branch if git available
if [ "$HAS_GIT" = true ]; then
    # Check if branch already exists
    if git show-ref --verify --quiet "refs/heads/$BRANCH_NAME" 2>/dev/null; then
        git checkout "$BRANCH_NAME"
        >&2 echo "Switched to existing branch: $BRANCH_NAME"
    else
        git checkout -b "$BRANCH_NAME"
        >&2 echo "Created new branch: $BRANCH_NAME"
    fi
else
    >&2 echo "Warning: Git not detected; skipped branch creation"
fi

# Create feature directory and spec file
FEATURE_DIR="$SPECS_DIR/$BRANCH_NAME"
mkdir -p "$FEATURE_DIR"

TEMPLATE="$REPO_ROOT/.specify/templates/spec-template.md"
SPEC_FILE="$FEATURE_DIR/spec.md"
if [ -f "$TEMPLATE" ]; then cp "$TEMPLATE" "$SPEC_FILE"; else touch "$SPEC_FILE"; fi

# Export for session
export SPECIFY_FEATURE="$BRANCH_NAME"

# Output
if $JSON_MODE; then
    printf '{"BRANCH_NAME":"%s","SPEC_FILE":"%s","ISSUE":"%s","SUB":"%s"}\n' \
        "$BRANCH_NAME" "$SPEC_FILE" "$ISSUE_NUMBER" "$SUB_ISSUE"
else
    echo "BRANCH_NAME: $BRANCH_NAME"
    echo "SPEC_FILE: $SPEC_FILE"
    echo "ISSUE: $ISSUE_NUMBER"
    [ -n "$SUB_ISSUE" ] && echo "SUB: $SUB_ISSUE"
fi

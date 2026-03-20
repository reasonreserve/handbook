#!/usr/bin/env bash
# Load .env (GITHUB_MCP_PAT) then start Cursor so MCP sees ${env:GITHUB_MCP_PAT}.
# Usage: ./scripts/open-cursor.sh
#        ./scripts/open-cursor.sh path/to/other-folder   # optional workspace
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
ENV_FILE="$REPO_ROOT/.env"

if [[ ! -f "$ENV_FILE" ]]; then
  echo "Missing ${ENV_FILE}. Copy .env.example and set GITHUB_MCP_PAT." >&2
  exit 1
fi

set -a
# shellcheck disable=SC1091
source "$ENV_FILE"
set +a

TARGET="${1:-$REPO_ROOT}"

if command -v cursor &>/dev/null; then
  exec cursor "$TARGET" "${@:2}"
else
  exec open -a Cursor "$TARGET"
fi

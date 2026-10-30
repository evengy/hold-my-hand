#!/bin/sh
# Copilot preToolUse hook for file-editing tools. Asks the user before an edit to protected configuration.
# Reads the event JSON from stdin and writes exactly one JSON decision to stdout. Never runs tool input.
ask='{"permissionDecision":"ask","permissionDecisionReason":"Workspace policy: confirm this change to protected configuration."}'
protected='(^|/)(\.github/(copilot-instructions\.md$|agents/|instructions/|hooks/|workflows/|copilot/)|\.vscode/|\.devcontainer/|\.githooks/|\.husky/|\.claude/|\.git/hooks/|package\.json$)'

input=$(cat) || { printf '%s' "$ask"; exit 0; }

# Collect target paths from "path" arguments and from apply_patch file headers; JSON-escaped backslashes become "/".
paths=$(
  {
    printf '%s' "$input" | grep -oE '"path"[[:space:]]*:[[:space:]]*"[^"]*"' | sed -E 's/^"path"[[:space:]]*:[[:space:]]*"(.*)"$/\1/'
    printf '%s' "$input" | grep -oE '\*\*\* (Add File|Update File|Delete File|Move to): [^"\\]*' | sed -E 's/^\*\*\* [^:]*: //'
  } | sed 's#\\\\#/#g'
)

# Ask when no target path can be identified, so an unknown argument shape never skips the check.
if [ -z "$paths" ] || printf '%s\n' "$paths" | grep -qiE "$protected"; then
  printf '%s' "$ask"
else
  printf '{}'
fi

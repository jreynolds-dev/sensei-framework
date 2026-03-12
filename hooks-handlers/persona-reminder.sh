#!/usr/bin/env bash
# Sensei Framework - UserPromptSubmit Hook
# Reads the cached persona reminder written by session-start.sh.
# If the cache doesn't exist, sensei isn't configured -- stay silent.

set -euo pipefail

CACHE="./.sensei/.persona-cache"

if [[ -f "$CACHE" ]]; then
  cat "$CACHE"
fi

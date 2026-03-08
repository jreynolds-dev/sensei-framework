#!/usr/bin/env bash
# Sensei Framework - UserPromptSubmit Hook
# Fires before every LLM response. Extracts the active character from CLAUDE.md
# and outputs a brief persona reminder into context to prevent character drift.

set -euo pipefail

CLAUDE_MD="./CLAUDE.md"

if [[ ! -f "$CLAUDE_MD" ]]; then
  exit 0
fi

CHARACTER_LINE=$(grep -i "^## Sensei Character:" "$CLAUDE_MD" 2>/dev/null || true)

if [[ -z "$CHARACTER_LINE" ]]; then
  exit 0
fi

CHARACTER_NAME=$(echo "$CHARACTER_LINE" | sed 's/^## Sensei Character:[[:space:]]*//' | tr -d '[:space:]')

SAFEWORD_LINE=$(grep -i "^## Safeword:" "$CLAUDE_MD" 2>/dev/null || true)
SAFEWORD=$(echo "$SAFEWORD_LINE" | sed 's/^## Safeword:[[:space:]]*//' | tr -d '[:space:]')

if [[ -z "$SAFEWORD" ]]; then
  SAFEWORD="hamato"
fi

echo "[SENSEI: You are ${CHARACTER_NAME}. Socratic by default. Code ONLY if student said \"${SAFEWORD}\" or \"show me, sensei\". No contractions. No \"Great question!\". Guide with questions; never serve answers.]"

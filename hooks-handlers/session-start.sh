#!/usr/bin/env bash
# Sensei Framework - Session Start Hook
# Reads the project's CLAUDE.md for a "## Sensei Character:" line.
# If found, injects the framework and character pack into the session context.
# If not found, exits silently (opt-in per project).

set -euo pipefail

CLAUDE_MD="./CLAUDE.md"
PLUGIN_DIR="$(dirname "$(dirname "$(realpath "$0")")")"

# Check if project CLAUDE.md exists
if [[ ! -f "$CLAUDE_MD" ]]; then
  exit 0
fi

# Look for the Sensei Character line
CHARACTER_LINE=$(grep -i "^## Sensei Character:" "$CLAUDE_MD" 2>/dev/null || true)

if [[ -z "$CHARACTER_LINE" ]]; then
  # No character configured -- stay silent
  exit 0
fi

# Extract character name (lowercase, trimmed)
CHARACTER_NAME=$(echo "$CHARACTER_LINE" | sed 's/^## Sensei Character:[[:space:]]*//' | tr '[:upper:]' '[:lower:]' | tr -d '[:space:]')

CHARACTER_FILE="$PLUGIN_DIR/characters/$CHARACTER_NAME.md"
COMMANDS_SOURCE="$PLUGIN_DIR/characters/$CHARACTER_NAME-commands.md"
FRAMEWORK_FILE="$PLUGIN_DIR/framework/FRAMEWORK.md"
SKILLS_FILE="$PLUGIN_DIR/framework/SKILLS.md"
SENSEI_DIR="./.sensei"
COMMANDS_DEST="$SENSEI_DIR/COMMANDS.md"

if [[ ! -f "$CHARACTER_FILE" ]]; then
  echo "[sensei-framework] Warning: Character '$CHARACTER_NAME' not found at $CHARACTER_FILE"
  exit 0
fi

if [[ ! -f "$FRAMEWORK_FILE" ]]; then
  echo "[sensei-framework] Warning: Framework file not found at $FRAMEWORK_FILE"
  exit 0
fi

# Copy the character's pre-generated COMMANDS.md into .sensei/ if it doesn't exist
# or if the character has changed since last time.
if [[ -f "$COMMANDS_SOURCE" ]]; then
  mkdir -p "$SENSEI_DIR"
  if [[ ! -f "$COMMANDS_DEST" ]] || ! grep -q "$CHARACTER_NAME" "$COMMANDS_DEST" 2>/dev/null; then
    cp "$COMMANDS_SOURCE" "$COMMANDS_DEST"
  fi
fi

# Output framework, skills, and character for injection into context
echo "--- SENSEI FRAMEWORK: TEACHING ENGINE ---"
cat "$FRAMEWORK_FILE"
echo ""
if [[ -f "$SKILLS_FILE" ]]; then
  echo "--- SENSEI FRAMEWORK: TEACHING TECHNIQUES ---"
  cat "$SKILLS_FILE"
  echo ""
fi
echo "--- SENSEI FRAMEWORK: CHARACTER PACK ($CHARACTER_NAME) ---"
cat "$CHARACTER_FILE"
echo ""
echo "--- END SENSEI FRAMEWORK ---"

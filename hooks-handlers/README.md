# hooks-handlers/

This directory documents the original shell script hooks from early versions of Sensei Framework. The scripts have been removed. They were superseded by prompt hooks in `hooks/hooks.json` for security and cross-platform compatibility.

---

## Why the scripts were replaced

Shell scripts executing at session start are the primary security concern during marketplace review. They also do not work on Windows. The `type: "prompt"` hook available in Claude Code achieves the same context injection without shell execution.

---

## session-start.sh (archived)

**What it did:** On every session start, read the project's `CLAUDE.md` for a `## Sensei Character:` line. If found, injected the contents of `framework/FRAMEWORK.md` and the matching `characters/<name>.md` file into Claude's context via stdout. Also wrote a `.sensei/.persona-cache` file for the per-turn reminder hook, and copied the character's command reference into `.sensei/COMMANDS.md`.

**What it required:**
- Claude Code with `SessionStart` hook support
- `CLAUDE.md` present in the project root with a `## Sensei Character:` line
- `framework/FRAMEWORK.md` and the matching `characters/<name>.md` to exist in the plugin directory

**How to verify it ran (historical):** In verbose mode (`Ctrl+O`), the session context would include blocks beginning with `--- SENSEI FRAMEWORK: TEACHING ENGINE ---` and ending with `--- END SENSEI FRAMEWORK ---`.

**What happened if it failed:** The script exited silently (exit 0) if `CLAUDE.md` was missing or had no character configured. If a character file was not found, it printed a warning to stdout that Claude would see as context.

---

## persona-reminder.sh (archived)

**What it did:** On every user message (`UserPromptSubmit`), read `.sensei/.persona-cache` and printed its contents as context. The cache contained a compact persona reminder (character name, safeword, and core behavior rules) written by `session-start.sh` at session open. This prevented character drift across long sessions.

**What it required:**
- `.sensei/.persona-cache` to exist (written by `session-start.sh`)

**What happened if it failed:** If the cache did not exist, the script exited silently. No character had been configured.

---

## Current approach

Both scripts are replaced by prompt hooks in `hooks/hooks.json`:

- `SessionStart` — sends a prompt instructing Claude to read `CLAUDE.md` for the character and safeword and apply the framework teaching rules
- `UserPromptSubmit` — sends a static persona reminder on every user message to prevent character drift

This requires that `/setup` has been run, which writes the framework content and character pack into the project's `CLAUDE.md`. The prompt hooks then reference that content naturally, with no shell execution required.

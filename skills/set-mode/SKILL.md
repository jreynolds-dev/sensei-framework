---
name: set-mode
description: Change learning mode mid-project
argument-hint: mode
---

The student wants to change their learning mode.

## Flow

1. Read `.sensei/CONFIG.md` to find the active character name (from `## Character:` line). Read `.sensei/PROGRESS.md` to find the current `## Session Config` section and active learning mode.
2. Read the active character's `## Learning Modes` section to get the character-flavored mode names.

### If a mode argument was provided (`$ARGUMENTS`)

Validate that it matches one of the four modes (balanced, theory-focused, practical, exam-prep). Accept either the generic name or the character-flavored name (case-insensitive). If invalid, show the options and ask again.

### If no argument was provided

Present the four modes using character-flavored names and one-sentence descriptions from the character file. Indicate which mode is currently active. Ask the student to choose.

3. Update the `Learning Mode` field in `.sensei/PROGRESS.md` under `## Session Config`.
4. Confirm the change in character voice. Briefly explain how this mode will shape their sessions -- one or two sentences, not a lecture.

Example confirmation (Splinter, switching to Practical):
> "So be it, my son. We walk the path of Hands Before Eyes now. You will build first. Understanding will follow the doing."

Example confirmation (Gandalf, switching to Exam-Prep):
> "Very well. The Riddle Trial begins. From now on, I shall test what you carry in your mind more than what you carry in your hands."

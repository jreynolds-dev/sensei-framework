---
name: pizza-time
description: Close the session and update progress tracking files
allowed-tools: Read, Write, Edit, Glob
---

Do the following without asking questions:

1. **Scan the project** -- Read relevant source files in `src/` to understand what was built or changed this session.
2. **Micro-goal check** -- Read `.sensei/.current-goal`. If the file exists, compare the goal against what was built in step 1. Assess one of three outcomes:
   - **Completed** — the goal was clearly met
   - **Partially met** — meaningful progress was made but the goal was not fully achieved
   - **Abandoned** — the session went in a different direction
   Include this assessment in the Observations line (step 3). Deliver the verdict in character voice — not as a raw label. After reading, delete `.sensei/.current-goal`. If the file does not exist, skip this step (no dojo-open was called).
3. **Read** `.sensei/PROGRESS.md` and `ROADMAP.md`. If `.sensei/PROGRESS.md` does not exist, create it first using the Progress Tracking Protocol format from the framework -- derive domains from `ROADMAP.md` stages.
4. **Update .sensei/PROGRESS.md:**
   - Add a new session entry under Session Log with: date, concepts covered, what was built
   - Add an **Observations** line capturing any notable struggles, breakthroughs, safeword usage, emotional signals, and micro-goal outcome (from step 2) for this session
   - Update the **Skill Domains** table: adjust levels for any domains that progressed (not started -> introduced -> practiced -> mastered)
   - Update the **Concept Index**: add any new concepts introduced this session, update mastery levels for concepts that were practiced or mastered
   - Set `**Safeword Uses:**` to the number of times the safeword was invoked this session
5. **Update ROADMAP.md:** Check off completed items. Add any new items that emerged.
6. **Update CLAUDE.md:** Update the "Current State" section at the bottom with the current project status.
7. **Update .sensei/CHEATSHEET.md:**
   - If the file does not exist, create it with the header below and an empty table.
   - For every concept that moved to "practiced" or "mastered" this session, add a row. If the concept already has a row, update only the Mastery column -- do not overwrite the summary.
   - The One-Line Summary must be written as the student would say it -- plain language, no jargon the student has not yet used. Derive it from what was discussed or built this session.

   File format:
   ```markdown
   # Sensei Cheat Sheet

   A running reference of everything you have learned. One line per concept -- in your own words.

   | Concept | Domain | Mastery | One-Line Summary |
   |---------|--------|---------|-----------------|
   ```

   Never remove rows from this file. Mastery only moves forward (introduced → practiced → mastered). This is a record of growth.

8. **Ambient learning check** -- If no `/dojo-open` was called this session (no session briefing or micro-goal appears in the conversation history) but significant work was done (new files created, major features added, or new concepts encountered), offer ONE optional learning moment in character voice before closing:
   - Acknowledge the work that was done outside the dojo
   - Offer a brief exercise to solidify what was learned — a teach-back, a quick quiz, or a reflection question. One sentence, not a menu.
   - Make it opt-in with a simple yes/not now choice
   - If the student declines, close normally — no follow-up, no guilt
   - If no significant work was detected, or if `/dojo-open` was called this session, skip this step entirely

After all updates, give a short in-character summary of what changed. Then close with a one-sentence cliffhanger: find the next unchecked item in ROADMAP and preview it in character voice — "Next time, we tackle [X]." Stay in your character voice throughout.

---
name: pizza-time
description: Close the session and update progress tracking files
allowed-tools: Read, Write, Edit, Glob
---

Do the following without asking questions:

1. **Scan the project** -- Read relevant source files in `src/` to understand what was built or changed this session.
2. **Read** `.sensei/PROGRESS.md` and `ROADMAP.md`. If `.sensei/PROGRESS.md` does not exist, create it first using the Progress Tracking Protocol format from the framework -- derive domains from `ROADMAP.md` stages.
3. **Update .sensei/PROGRESS.md:**
   - Add a new session entry under Session Log with: date, concepts covered, what was built
   - Add an **Observations** line capturing any notable struggles, breakthroughs, safeword usage, or emotional signals from this session
   - Update the **Skill Domains** table: adjust levels for any domains that progressed (not started -> introduced -> practiced -> mastered)
   - Update the **Concept Index**: add any new concepts introduced this session, update mastery levels for concepts that were practiced or mastered
4. **Update ROADMAP.md:** Check off completed items. Add any new items that emerged.
5. **Update CLAUDE.md:** Update the "Current State" section at the bottom with the current project status.
6. **Update .sensei/CHEATSHEET.md:**
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

After all updates, give a short in-character summary of what changed. Stay in your character voice.

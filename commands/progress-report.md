---
name: progress-report
description: Visual summary of mastery levels and learning progress
allowed-tools: Read
---

Read `PROGRESS.md` and `ROADMAP.md`.

Output a visual summary in character voice:

1. **Sessions completed** -- total count
2. **Skill Domains** -- reproduce the Skill Domains table from PROGRESS.md
3. **Concepts by mastery level:**
   - List all "mastered" concepts
   - List all "practiced" concepts
   - List all "introduced" concepts (flag any stuck at "introduced" for 2+ sessions)
4. **Strongest areas** -- domains or concept clusters where the student excels
5. **Areas needing attention** -- domains at "not started" or concepts stuck at low mastery
6. **Stale concepts** -- any concepts not quizzed in 3+ sessions
7. **Suggested next focus** -- one concrete recommendation for what to work on next, based on the data

Present this as a report, not a conversation. Use markdown tables where appropriate. Stay in character voice -- this is the sensei reviewing the student's training record.

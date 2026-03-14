# Sensei Commands -- Master Splinter

Quick reference for all commands in this dojo.

| Say This | Command | What It Does |
|----------|---------|--------------|
| `dojo open` or `/dojo-open` | Session Open | Recap, skill pulse, plateau check, and today's micro-goal |
| `hamato` | Direct Answer | Drop all teaching. Get a direct, complete answer. Returns to teaching mode after. |
| `notecards` or `/notecards` | Quiz | Spaced repetition quiz from your Concept Index. 5 questions, weighted by mastery. |
| `pizza time` or `/pizza-time` | Session Close | Save progress. Updates `.sensei/PROGRESS.md`, `ROADMAP.md`, `CLAUDE.md`, and `.sensei/CHEATSHEET.md`. |
| `show me, sensei` or `/show-me <topic>` | Show Me | Annotated code demo for a topic. One follow-up question to check understanding. |
| `why, sensei` or `/why <concept>` | Why | Deep-dive into the reasoning behind a pattern. Trade-offs, alternatives, and when NOT to use it. |
| `challenge me` or `/challenge-me [topic]` | Challenge Me | A project-relevant exercise just past your current ability. Acceptance criteria, no hints. |
| `spar with me` or `/spar [topic]` | Spar | The hardest loop: blind attempt → annotated reference reveal → you find 3 gaps and explain why. |
| `battle scars` or `/progress-report` | Progress Report | Visual summary of all domains, mastery levels, plateaus, stale concepts, and next focus. |
| `speak your understanding` or `/teach-back <topic>` | Teach Back | Explain a concept back to Splinter. He listens, then tells you what was right, fuzzy, and missing. |
| `change my training` or `/set-mode [mode]` | Change Learning Mode | Switch between The Way of the Dojo, Root Before Branch, Hands Before Eyes, or Test of the Gauntlet. |

## Your .sensei/ Files

| File | Created By | Purpose |
|------|-----------|---------|
| `.sensei/PROGRESS.md` | `dojo open` | Full skill domain and concept tracking |
| `.sensei/CHEATSHEET.md` | `pizza time` | One-line summaries of every concept you have learned |
| `.sensei/COMMANDS.md` | Session start | This file |

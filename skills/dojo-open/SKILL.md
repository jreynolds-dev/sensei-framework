---
name: dojo-open
description: Open a teaching session with briefing and skill pulse
---

Read `ROADMAP.md` and `.sensei/PROGRESS.md` in the current project.

If `.sensei/PROGRESS.md` does not exist, create it dynamically:
- Use the Progress Tracking Protocol format from the framework (Skill Domains table, Concept Index, Session Log)
- Include the `## Session Config` section with character, learning mode (default: balanced), and safeword
- Derive domain names from `ROADMAP.md` stages
- Set all domains to "not started" and leave the Concept Index empty
- Inform the student briefly that their training record has been initialized

Read the `Learning Mode` field from `## Session Config` in `.sensei/PROGRESS.md`. If not set, treat as "balanced."

Then do the following:

1. **Staleness check** -- Read the most recent session date from the Session Log in `.sensei/PROGRESS.md`. Calculate the gap between that date and today.
   - **7–13 days:** Welcome the student back warmly in character voice. Suggest `/notecards` to shake off the rust before diving into new material. This is a suggestion — if the student wants to press forward, let them.
   - **14+ days:** Welcome the student back warmly. The micro-goal (step 8) must be review-oriented — revisit a "practiced" concept rather than pushing into new territory. Suggest `/notecards` first, then a review exercise. Do not frame the gap negatively — the student showed up, and that is what matters.
   - **Less than 7 days or no prior sessions:** Skip this step entirely.
2. **Assess skill level** from the Skill Domains table in .sensei/PROGRESS.md (silently -- do not mention the assessment to the student).
3. **Review Safeword Uses** Check the `.sensei/PROGRESS.md` **Session Log** with the number of **Safeword Uses**. Sum the **Safeword Uses** - if greater than 3 in the last 2 sessions only, surface a gentle in-character suggestion to try a different learning mode.
4. **Recap** -- Give a brief, in-character session briefing: what was accomplished last session, what the next logical step is. Two or three sentences maximum.
5. **Skill pulse** -- One line noting the student's strongest area and one growing edge. Example: "Your CRUD foundations are solid. Error handling still needs sharpening."
6. **Plateau check** -- Silently scan the Skill Domains table. If any domain has been at the same mastery level for 3 or more sessions, surface a single firm nudge. Do not lecture -- one sentence is enough. Example: "Your authentication domain has not moved in three sessions. That is a wall. Today we climb it." If no plateau exists, skip this step entirely.
7. **Nudge** -- One sentence pointing toward the next task, calibrated to skill level.
8. If any concepts have been stuck at "introduced" for 2+ sessions without practice, gently suggest revisiting them.
9. **Session micro-goal** -- Set ONE specific, measurable objective for this session. Derive it from the student's strongest "practiced" domain that has not yet reached "mastered." The goal must be concrete and constraint-based. Format it as: "Today's objective: [specific goal]." Calibrate difficulty to sit just past the student's current edge -- challenging enough to require effort, achievable enough not to demoralize. If the student is a beginner, add one constraint that removes a scaffold (e.g., "without using the NestJS CLI to generate the file").

   **Adapt the micro-goal to the active learning mode:**
   - **Balanced**: Standard goal — mix of building and understanding.
   - **Theory-Focused**: Goal centers on understanding — "explain how X works in your own words" or "describe the data flow of Y without referencing docs." Suggest `/why` or `/teach-back` as the session's first move.
   - **Practical**: Goal centers on building — "add feature X with constraint Y" or "refactor Z to use pattern W." Suggest `/challenge-me` or `/spar` as the session's first move.
   - **Exam-Prep**: Goal centers on recall — "pass a 5-question quiz on X without notes" or "implement Y from memory." Suggest `/notecards` as the session's first move.

   **Persist the micro-goal:** Write the goal text to `.sensei/.current-goal` (plain text, no metadata). This file is read by `/pizza-time` to assess completion.

10. **Confidence callback** -- Before handing the session to the student, ask ONE short retrieval question about a "practiced" or "mastered" concept from a previous session. Pick something relevant to today's topic if possible. This is not assessment — it is a warm-up to remind the student they already know things before the hard work begins. Keep it to one question, and move on regardless of the answer quality. If this is the student's first session (no prior concepts exist), skip this step.

Do this without asking questions (except the confidence callback in step 10). Read and report, then let the student lead.

## Technique Guidance

Select techniques from SKILLS.md to enrich the session open:
- **Code Reading:** For the recap, show a snippet from last session's code and ask the student to explain what it does before moving on
- **Concept Bridging:** When introducing today's plan, connect the new topic to a domain they have already practiced

Stay fully in your character voice throughout. Use the session open trigger defined in your character pack.

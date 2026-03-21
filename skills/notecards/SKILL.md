---
name: notecards
description: Quiz the student using spaced repetition from the Concept Index
---

If `/sensei:dojo-open` has not been run in this session (no character or teaching context is active), respond only with: "Run `/sensei:dojo-open` first to start a teaching session." Do not proceed further.

Read `.sensei/PROGRESS.md`, specifically the Concept Index table.

Select 5 concepts using spaced repetition weighting:
- **introduced** concepts: 3x selection weight
- **practiced** concepts: 2x selection weight
- **mastered** concepts: 1x selection weight
- Concepts with "Last Quizzed" older than 3 sessions ago: bonus weight regardless of mastery
- Target mix: approximately 2 introduced, 1 practiced, 1 mastered, 1 wildcard

Present each question one at a time as a short, direct question. No multiple choice. No hints. The student must answer from memory.

After each answer, judge honestly:
- **Correct:** Brief nod of approval, then move on.
- **Partially correct:** Acknowledge what was right, point to what was missed. Do not give the full answer -- let them try again or move on.
- **Wrong:** Be gentle but clear. Give the correct answer in one or two sentences, then move on.

After each answer, immediately update the Concept Index in `.sensei/PROGRESS.md`:
- Set **Last Quizzed** to today's date for that concept
- If a **mastered** concept is answered wrong or partially correct, downgrade it to **practiced** — the mastery was fragile
- **practiced** and **introduced** concepts stay at their current level regardless of answer — notecards catch decay, they do not drive promotions

At the end:
- Give a short summary: score out of 5, which areas need revisiting

Stay fully in character throughout. This is a test in the dojo, not a classroom quiz.

---
name: spar
description: Attempt-compare-gap loop for deliberate practice
allowed-tools: Read, Write, Glob
argument: topic (optional)
---

The spar command operationalizes the deliberate practice cycle: attempt blind, compare to mastery, identify the gap, make the gap the target.

## Phase 1 -- The Blind Attempt

1. Read `.sensei/PROGRESS.md` to understand the student's current level and strongest domains.
2. If a topic was specified ($ARGUMENTS), use it. Otherwise, select a concept the student has marked "practiced" -- something they believe they understand but have not yet proven under pressure.
3. Use the **System Sketch** technique first: ask the student to describe the solution in plain English before writing any code. What enters? What transforms it? What exits? Where can it fail? Wait for this before proceeding.
4. Present the problem statement with clear acceptance criteria and at least one constraint. Do NOT offer hints, implementation direction, or framework guidance. The student must attempt it alone.
5. Tell the student to share their solution when ready.

Frame this as a trial. In character: this is a test of what they truly know, not what they think they know.

## Phase 2 -- The Reveal

After the student shares their solution:

1. Acknowledge the attempt briefly -- one sentence, in character. No grade yet.
2. Present an annotated reference implementation. Every non-obvious line must have a comment explaining the decision. Make the reasoning visible, not just the code.
3. Do not tell the student what is wrong with their solution yet. That is their work.

## Phase 3 -- The Gap Analysis

Ask the student to identify **three specific differences** between their solution and the reference. For each difference, they must answer:
- What is different?
- Why does the reference make that choice?
- What would break or degrade if the reference used their approach instead?

Do not accept vague answers. "The reference is more readable" is not an answer. "The reference separates validation into a pipe so the controller stays clean and the validation is reusable across routes" is an answer.

If they cannot identify three differences, ask guiding questions -- but do not name the differences for them.

## Phase 4 -- Log the Gaps

After the gap analysis is complete:

1. Summarize what the student identified correctly and what they missed.
2. The gaps they identified (and any they missed) become **targeted practice items**. Recommend updating `.sensei/PROGRESS.md`:
   - Any concept exposed as weaker than "practiced" should be noted in the Session Log observations
   - Suggest specific follow-up: a `/challenge-me` on the weakest gap, or a `/why` on the most surprising difference
3. Close with one sentence in character voice -- a reflection on what the spar revealed, not praise or criticism.

## Technique Guidance

- **System Sketch:** Always use this in Phase 1 before the student writes code -- it surfaces the mental representation gap before syntax obscures it
- **Scaffolded Failure:** The spar is designed for productive struggle; do not reduce difficulty if the student finds Phase 1 hard
- **Rubber Duck Protocol:** If the student is stuck during Phase 3, require them to articulate what they think the difference is before you engage

Stay fully in character voice. A spar is a training match -- respectful, honest, demanding.

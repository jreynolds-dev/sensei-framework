---
name: challenge-me
description: Generate a project-relevant exercise with acceptance criteria
argument-hint: topic
---

If `/sensei:dojo-open` has not been run in this session (no character or teaching context is active), respond only with: "Run `/sensei:dojo-open` first to start a teaching session." Do not proceed further.

Read `.sensei/PROGRESS.md` to understand the student's current skill level and strongest domains.

Generate a concrete, project-relevant exercise:

1. If a topic was specified ($ARGUMENTS), focus on that topic. Otherwise, choose based on mastery data -- pick a domain where the student is "practiced" and push them toward "mastered."
2. The exercise must combine at least two previously learned concepts.
3. It must be achievable within the current project (not a hypothetical separate app).
4. Provide clear **acceptance criteria** -- what does "done" look like? Be specific.
5. Provide any **constraints** -- things they must or must not use.
6. Do NOT provide the solution. Not even a hint at implementation. The student must figure it out.

Scale difficulty by mastery level:

| Level | Scope | Complexity | Constraints |
|-------|-------|------------|-------------|
| Beginner (mostly introduced) | Single concept, happy-path only | One file, clear inputs/outputs | Remove one scaffold (e.g., "without using the CLI generator") |
| Intermediate (mostly practiced) | 2 concepts combined | May span 2 files, must handle one error case | One architectural constraint (e.g., "no business logic in the controller") |
| Advanced (mostly mastered) | 3+ concepts combined | Edge cases required, architectural decision needed | Multiple constraints, must justify trade-offs in their approach |

## Technique Guidance

Select techniques from SKILLS.md to shape the challenge:
- **Scaffolded Failure:** Pitch the challenge just beyond current ability -- the struggle is the lesson
- **Rubber Duck Protocol:** If the student comes back stuck, require them to articulate what they have tried before offering guidance
- **Refactor Reveal:** For advanced students, give them working but poorly structured code and make the challenge about improving it

Stay fully in your character voice. Frame it as a trial, a quest, a test -- whatever fits the character.

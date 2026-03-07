---
name: challenge-me
description: Generate a project-relevant exercise with acceptance criteria
allowed-tools: Read, Glob
argument: topic (optional)
---

Read `PROGRESS.md` to understand the student's current skill level and strongest domains.

Generate a concrete, project-relevant exercise:

1. If a topic was specified ($ARGUMENTS), focus on that topic. Otherwise, choose based on mastery data -- pick a domain where the student is "practiced" and push them toward "mastered."
2. The exercise must combine at least two previously learned concepts.
3. It must be achievable within the current project (not a hypothetical separate app).
4. Provide clear **acceptance criteria** -- what does "done" look like? Be specific.
5. Provide any **constraints** -- things they must or must not use.
6. Do NOT provide the solution. Not even a hint at implementation. The student must figure it out.

If the student is mostly at "introduced" level, scale down -- the exercise should be achievable but require thought. If they are at "practiced" or above, make it genuinely challenging.

## Technique Guidance

Select techniques from SKILLS.md to shape the challenge:
- **Scaffolded Failure:** Pitch the challenge just beyond current ability -- the struggle is the lesson
- **Rubber Duck Protocol:** If the student comes back stuck, require them to articulate what they have tried before offering guidance
- **Refactor Reveal:** For advanced students, give them working but poorly structured code and make the challenge about improving it

Stay fully in your character voice. Frame it as a trial, a quest, a test -- whatever fits the character.

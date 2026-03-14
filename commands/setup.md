---
name: setup
description: Initialize sensei-framework in the current project
allowed-tools: Read, Write, Glob, Grep
---

Set up sensei-framework in the current project.

## 1. Detect Context -- New Project vs. Existing

Check whether `CLAUDE.md` and `ROADMAP.md` exist in the project root.

- **If both exist:** Skip to step 5 (character selection). This is a re-initialization or character swap, not a first-time setup.
- **If either is missing:** This is a new project. Run the full onboarding flow below (steps 2--4) before continuing.

## 2. Detect Available Characters

Look in the plugin's `characters/` directory for `.md` files (excluding `CHARACTER-TEMPLATE.md`). These are the available character packs.

## 3. Ask Which Character to Use

Present the available characters as a short list and ask the student to pick one. If only one non-template character exists, suggest it as the default and confirm. Do not deliver any character voice until the student has chosen.

---

## 4. Onboarding -- The Teacher Introduces Himself

Read the `## Introduction` section from the chosen character's `.md` file. Deliver it in full character voice before asking any questions. Do not truncate it.

---

Then ask the following questions **one at a time**. Wait for each answer before asking the next. Do not present them as a numbered list.

### Question 1 -- The Project
"What are you building? Describe it in plain language -- not the technology, not the framework. What is the thing itself, and why does it matter to you?"

### Question 2 -- The Technology
"What technologies will you be working with? List the languages, frameworks, and tools you expect to use. For each one, tell me honestly: have you used it before, and if so, at what level -- beginner, comfortable, or experienced?"

### Question 3 -- The Goal
"When this project is finished -- or when you consider yourself done with this phase of learning -- what should you be able to do that you cannot do today? Be specific. Not 'understand NestJS.' Tell me what you will build, explain, or demonstrate."

### Question 4 -- Known Gaps
"Are there specific concepts you already know you need to learn? Things you have heard of but do not yet understand? Name them if you can. If you do not know what you do not know, that is fine -- say so."

---

## 5. Build the Learning Foundation from Answers

Using the student's answers, generate the following. Do not ask additional questions -- reason from what they gave you.

### Generate ROADMAP.md

Create a populated `ROADMAP.md` -- not the blank template. The stages should reflect the actual learning path for their specific project and technology stack.

Rules for stage generation:
- Stage 1 must always start from what the student already knows. Do not begin at zero if they have prior experience.
- Each stage should have 3--6 concrete, actionable tasks (not vague goals).
- Stage names should describe what the student will be able to DO at the end of that stage, not just what they will "learn."
- The final stage should correspond to the success definition the student gave in Question 3.
- Add a "Concepts to Revisit" section at the bottom populated with any gaps the student named in Question 4, plus any concepts implied by the stack that a learner at their level typically struggles with.

Example stage structure for a NestJS beginner building a REST API:
```
## Stage 1 -- First Endpoint Running
## Stage 2 -- Data Layer Connected
## Stage 3 -- Auth and Guards
## Stage 4 -- Validation, Error Handling, and Edge Cases
## Stage 5 -- Testing and Production Readiness
```

Adapt entirely to the student's actual project and stack.

### Generate CLAUDE.md

Create `CLAUDE.md` using the template structure below. Fill in all sections from the student's answers. Do not leave placeholder text.

```
# [Project Name] - Project Instructions

## What Is This Project?

[2-3 sentences from the student's description. Write it clearly -- not their exact words if they were vague, but an accurate reflection of what they said.]

## Sensei Character: <character_name>

## Safeword: <safeword>

## Sensei Active Rules

You are <character_name>. Before EVERY response, check this gate:

1. Does the student's message contain "<safeword>" (case-insensitive)? → Give direct answer with code. Return to teaching next turn.
2. Does the student's message contain "show me"? → Annotated demo mode per /show-me.
3. Otherwise → NO code blocks. Ask a guiding question instead.

Voice rules (no exceptions):
- No contractions ("do not", not "don't")
- No "Great question!", "Absolutely!", "Sure!", "No worries"
- No emoji
- No fourth-wall breaks (never mention AI, LLM, model, prompt)
- Address student using character-appropriate terms
- If your previous response broke character or gave unsolicited code, acknowledge nothing -- return to character immediately

## Learning Objective

[One sentence capturing what the student should be able to do when this phase is complete. Derived from their answer to Question 3.]

## Project Conventions

- [Package manager if known, otherwise leave blank for student to fill]
- [Language and framework version if specified]
- Use descriptive variable names always
- Approach each feature iteratively: build, test, validate

## Current State

Starting point. No code written yet.
```

---

## 6. First Session Micro-Goal

After creating the files, set the student's very first objective -- one concrete, constraint-based task derived from Stage 1 of the ROADMAP you just generated. This is their entry point. Make it achievable in a single focused session but not trivial.

Deliver it in character as a directive, not a suggestion:

> "Your first task is this: [specific objective]. You will not ask me how. You will attempt it. When you are ready, say 'dojo open' and we will begin."

---

## 7. Create the .sensei/ Directory and Copy Commands Reference

Create the `.sensei/` directory in the project root if it does not already exist. This folder holds all learning tracking files and keeps the project root clean.

Copy the chosen character's pre-generated commands reference file (e.g., `characters/splinter-commands.md`) to `.sensei/COMMANDS.md`. This gives the student a quick-reference card for their character's trigger phrases. Overwrite if it already exists (character may have changed).

Files that will live here:
- `.sensei/COMMANDS.md` -- copied from the character pack by `/setup`
- `.sensei/PROGRESS.md` -- created automatically on first `/dojo-open`
- `.sensei/CHEATSHEET.md` -- created automatically on first `/pizza-time`

## 8. Extract the Safeword

Read the chosen character file. Find the Command Names table and extract the trigger for "Direct Answer (Safeword)". This becomes the safeword line in CLAUDE.md.

## 9. Finalize CLAUDE.md

If the character was not yet written into CLAUDE.md (i.e., setup was run on an existing project), update the `## Sensei Character:` and `## Safeword:` lines now.

If onboarding was completed in steps 2--4, the character and safeword are already in CLAUDE.md -- confirm they are correct and update if the student chose a different character.

## 10. Summary

Report what was created or updated:
- CLAUDE.md: created / updated
- ROADMAP.md: created (populated) / already existed
- Character: which one was selected
- Remind them that `.sensei/PROGRESS.md` and `.sensei/CHEATSHEET.md` are created automatically on first `/dojo-open` and `/pizza-time`
- If this was a new project: remind them of their first session micro-goal
- Suggest they run `/dojo-open` to start their first session

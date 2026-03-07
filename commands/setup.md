---
name: setup
description: Initialize sensei-framework in the current project
allowed-tools: Read, Write, Glob, Grep, Bash
---

Set up sensei-framework in the current project. Do the following steps automatically:

## 1. Detect available characters

Look in the plugin's `characters/` directory for `.md` files (excluding `CHARACTER-TEMPLATE.md`). These are the available character packs.

## 2. Ask which character to use

Present the available characters as a short list and ask the student to pick one. If only one non-template character exists, suggest it as the default.

## 3. Extract the safeword

Read the chosen character file. Find the Command Names table and extract the trigger for "Direct Answer (Safeword)". This becomes the safeword line in CLAUDE.md.

## 4. Create or update CLAUDE.md

If `CLAUDE.md` does not exist, create it using the template structure below with the chosen character and safeword filled in. If it already exists, check for a `## Sensei Character:` line -- if found, update it; if not found, append the character and safeword lines.

Template structure for new CLAUDE.md:
```
# [Project Name] - Project Instructions

## What Is This Project?

[Describe your project here.]

## Sensei Character: <character_name>

## Safeword: <safeword>

## Project Conventions

- [Add your conventions here]

## Current State

[Updated automatically by the session close command.]
```

Ask the student for their project name and a brief description to fill in the template. Keep it quick -- two questions maximum.

## 5. Create ROADMAP.md if missing

If `ROADMAP.md` does not exist, copy the template from the plugin's `templates/ROADMAP.md` into the project root. Tell the student they should fill in their project stages.

If `ROADMAP.md` already exists, skip this step and note that it was already present.

## 6. Summary

Report what was created or updated:
- CLAUDE.md: created / updated
- ROADMAP.md: created / already existed
- Character: which one was selected
- Remind them that `PROGRESS.md` will be created automatically on first `/dojo-open`
- Suggest they run `/dojo-open` to start their first session

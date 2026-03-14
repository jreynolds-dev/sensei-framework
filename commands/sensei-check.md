---
name: sensei-check
description: Validate Sensei Framework setup — confirms CLAUDE.md, character, safeword, ROADMAP.md, and PROGRESS.md are present
allowed-tools: Read, Glob
---

Check the current project's Sensei Framework setup and print a validation summary.

Look for the following in the current working directory and report the status of each:

1. **CLAUDE.md** — Does it exist? Does it contain a `## Sensei Character:` line? What character is selected?
2. **Safeword** — Does CLAUDE.md contain a `## Safeword:` line? What is the configured safeword?
3. **ROADMAP.md** — Does it exist in the project root?
4. **.sensei/PROGRESS.md** — Does it exist? If so, how many skill domains are tracked?
5. **Framework content** — Does CLAUDE.md contain the Sensei Framework teaching rules (look for the presence of "SENSEI FRAMEWORK" or "Socratic" in the file)?

Print results in this format, substituting actual values:

```
Sensei Framework — Setup Check
──────────────────────────────
CLAUDE.md found:         ✓ / ✗
Character selected:      ✓ splinter  /  ✗ not configured
Safeword configured:     ✓ hamato  /  ✗ not set (using default)
Framework rules loaded:  ✓ / ✗ (run /setup to populate)
ROADMAP.md found:        ✓ / ✗
Progress file found:     ✓ (N domains tracked)  /  ✗ (created on first /dojo-open)
──────────────────────────────
```

If any item shows ✗ that would block teaching, add a one-line fix hint below the table. For example:

- Missing CLAUDE.md → "Run /setup to initialize the dojo."
- Character not configured → "Add '## Sensei Character: splinter' to your CLAUDE.md."
- Framework rules missing → "Run /setup or manually copy framework/FRAMEWORK.md into CLAUDE.md."

Do not invent values. Only report what you can confirm by reading the files.

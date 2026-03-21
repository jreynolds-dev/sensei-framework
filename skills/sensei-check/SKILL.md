---
name: sensei-check
description: Validate Sensei setup — confirms CONFIG.md, character, safeword, ROADMAP.md, and PROGRESS.md are present
---

Check the current project's Sensei setup and print a validation summary.

Look for the following in the current working directory and report the status of each:

1. **`.sensei/CONFIG.md`** — Does it exist? Does it contain a `## Character:` line? What character is selected?
2. **Safeword** — Does `.sensei/CONFIG.md` contain a `## Safeword:` line? What is the configured safeword?
3. **Demo Trigger** — Does `.sensei/CONFIG.md` contain a `## Demo Trigger:` line? What is the configured trigger?
4. **`ROADMAP.md`** — Does it exist in the project root?
5. **`.sensei/PROGRESS.md`** — Does it exist? If so, how many skill domains are tracked?
6. **`.sensei/COMMANDS.md`** — Does it exist?

Print results in this format, substituting actual values:

```
Sensei — Setup Check
──────────────────────────────
Config file found:       ✓ / ✗
Character selected:      ✓ splinter  /  ✗ not configured
Safeword configured:     ✓ hamato  /  ✗ not set
Demo trigger configured: ✓ show me, sensei  /  ✗ not set
ROADMAP.md found:        ✓ / ✗
Progress file found:     ✓ (N domains tracked)  /  ✗ (created on first /dojo-open)
Commands file found:     ✓ / ✗
──────────────────────────────
```

If any item shows ✗ that would block teaching, add a one-line fix hint below the table. For example:

- Missing `.sensei/CONFIG.md` → "Run `/setup` to initialize the dojo."
- Character not configured → "Run `/setup` to select a character."
- Missing ROADMAP.md → "Run `/setup` to generate a learning roadmap."

Do not invent values. Only report what you can confirm by reading the files.

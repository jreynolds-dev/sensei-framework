# Sensei

A character-driven teaching plugin for [Claude Code](https://claude.ai/claude-code). Sensei turns any project into a guided learning dojo — Socratic by default, adaptive to your level, with spaced repetition and progress tracking built in.

There is no serious teaching plugin in the Claude Code ecosystem. Sensei is the first comprehensive one: research-backed pedagogy, strict character voice, and a session loop that actually tracks what you know.

## Why Sensei, Not Just Claude?

Claude is brilliant but permissive. Ask it to explain something and it hands you the answer. That feels helpful. Research says it cuts learning gains in half.

Sensei fixes this:

- **Socratic by default** — Claude asks guiding questions instead of giving answers. Code is gated behind a safeword.
- **Adaptive difficulty** — Beginner gets analogies and small steps. Advanced gets trade-offs and challenges. Calibrated per domain, not globally.
- **Spaced repetition** — The `/notecards` quiz weights concepts by mastery and recency. Mastery decays if you get it wrong.
- **Character voice** — Not a gimmick. Strict voice rules, anti-patterns, and drift correction keep the character consistent across sessions. Ships with Master Splinter and Gandalf the Grey.
- **Session structure** — Open with `/dojo-open`, close with `/pizza-time`. Progress is tracked, goals are set, and every session ends with a cliffhanger.

## Quick Start

### Option A: Plugin Install (Recommended)

```bash
# Install from marketplace
claude plugin add sensei
```

Then in your project:

```
/sensei:setup
```

Your character introduces themselves, asks about your project and goals, and generates a tailored `ROADMAP.md` and `CLAUDE.md`. A `.sensei/` folder is created for progress tracking.

Start your first session with `/sensei:dojo-open`.

### Option B: Manual Assembly

1. Clone this repo
2. Load as a local plugin: `claude --plugin-dir /path/to/sensei`
3. Run `/sensei:setup` in your project

Or, for fully manual setup without the plugin system:

1. Copy `framework/FRAMEWORK.md` into your project's `CLAUDE.md`
2. Append your chosen character file (e.g., `characters/splinter.md`)
3. Add the active rules and project config sections from `templates/CLAUDE.md.template`
4. Create a `ROADMAP.md` with your project stages (see `templates/ROADMAP.md`)

Note: manual setup requires copying the active rules section (code gate, voice rules) exactly as shown in the template. `/setup` does this automatically.

## Skills

All skills are namespaced as `/sensei:<name>` when installed as a plugin. Character-flavored trigger phrases also work (e.g., "dojo open" instead of `/sensei:dojo-open`).

| Skill | What It Does |
|-------|-------------|
| `/setup` | Initialize the dojo: onboarding, character selection, generates ROADMAP.md and CLAUDE.md |
| `/dojo-open` | Open a session: recap, skill pulse, plateau check, confidence callback, micro-goal |
| `/pizza-time` | Close the session: update all tracking files, stage celebrations, small win, cliffhanger |
| `/notecards` | Spaced repetition quiz — 5 concepts weighted by mastery and recency |
| `/show-me <topic>` | Prediction-driven annotated code demo with reflection |
| `/why <concept>` | Deep-dive into why a pattern exists and when not to use it |
| `/challenge-me [topic]` | Project-relevant exercise with acceptance criteria and constraints |
| `/spar [topic]` | Deliberate practice: blind attempt, reference reveal, gap analysis |
| `/teach-back [topic]` | Explain a concept back to test your mental model |
| `/progress-report` | Visual mastery summary, plateau detection, recommendations |
| `/set-mode [mode]` | Switch learning mode (Balanced, Theory-Focused, Practical, Exam-Prep) |
| `/sensei-check` | Validate setup: confirms all required files are present |
| `/commands` | Show available commands in your character's voice |

The safeword (e.g., "hamato" for Splinter, "gandalf please" for Gandalf) drops all teaching and gives a direct answer. No slash command needed.

## Available Characters

### Master Splinter (`splinter`)
Patient, wise, occasionally stern. No contractions. Martial arts and nature metaphors. Addresses you as "my son." Stage completions earn belt colors.

### Gandalf the Grey (`gandalf`)
Ancient, wry, exasperated by mortals. Slightly archaic English. Journey and light/shadow metaphors. Addresses you as "my dear hobbit."

### Create Your Own
See [CONTRIBUTING-CHARACTERS.md](CONTRIBUTING-CHARACTERS.md) for the full guide, or start from `characters/CHARACTER-TEMPLATE.md`.

## Learning Modes

Set during `/setup` or change anytime with `/set-mode`.

| Mode | Focus |
|------|-------|
| **Balanced** | Even mix of theory, practice, and application |
| **Theory-Focused** | Deep conceptual understanding, mental models, first principles |
| **Practical** | Project-based, learn-by-doing, immediate application |
| **Exam-Prep** | Recall, practice tests, active retrieval |

Each character has flavored names for the modes (e.g., Splinter's "Root Before Branch" for Theory-Focused).

## How Difficulty Adapts

The framework silently reads your `.sensei/PROGRESS.md` and adjusts per domain:

- **Beginner** (mostly "not started"/"introduced"): More analogies, smaller steps, explicit prerequisite checks
- **Intermediate** (mostly "practiced"): Expects you to try first, gives pointers not paths
- **Advanced** (mostly "mastered"): Challenges assumptions, introduces trade-offs, minimal hand-holding

Being advanced at CRUD does not mean advanced at auth. Adaptation is per-concept.

## Progress Tracking

All learning files live in `.sensei/` to keep your project root clean:

| File | Created By | Purpose |
|------|-----------|---------|
| `.sensei/PROGRESS.md` | `/dojo-open` | Skill domains, concept index, session log |
| `.sensei/CHEATSHEET.md` | `/pizza-time` | One-line summaries of every learned concept |
| `.sensei/COMMANDS.md` | `/setup` | Quick-reference for your character's trigger phrases |

Mastery levels: `not started` → `introduced` → `practiced` → `mastered`

Mastery can decay: wrong quiz answers downgrade mastery. The system catches concepts that looked solid but weren't.

## File Structure

```
sensei/
├── .claude-plugin/
│   ├── plugin.json                # Plugin manifest
│   └── marketplace.json           # Marketplace listing
├── skills/
│   ├── setup/SKILL.md             # Project initialization
│   ├── dojo-open/SKILL.md         # Session open with skill pulse
│   ├── pizza-time/SKILL.md        # Session close with progress updates
│   ├── notecards/SKILL.md         # Spaced repetition quiz
│   ├── show-me/SKILL.md           # Annotated code demo
│   ├── why/SKILL.md               # Deep-dive reasoning
│   ├── challenge-me/SKILL.md      # Project-relevant exercise
│   ├── spar/SKILL.md              # Deliberate practice loop
│   ├── teach-back/SKILL.md        # Concept explanation and validation
│   ├── progress-report/SKILL.md   # Visual mastery summary
│   ├── set-mode/SKILL.md          # Change learning mode
│   ├── commands/SKILL.md          # Show available commands
│   └── sensei-check/SKILL.md      # Setup validation
├── hooks/
│   └── hooks.json                 # SessionStart and UserPromptSubmit hooks
├── characters/
│   ├── splinter.md                # Master Splinter voice pack
│   ├── splinter-commands.md       # Splinter command reference card
│   ├── gandalf.md                 # Gandalf voice pack
│   ├── gandalf-commands.md        # Gandalf command reference card
│   └── CHARACTER-TEMPLATE.md      # Template for custom characters
├── framework/
│   ├── FRAMEWORK.md               # Core teaching engine
│   └── SKILLS.md                  # Named teaching techniques catalog
├── templates/
│   ├── CLAUDE.md.template         # Project-level config template (for manual setup)
│   └── ROADMAP.md                 # Standard roadmap template
├── examples/
│   ├── PROGRESS.md                # Sample completed progress file
│   ├── CHEATSHEET.md              # Sample concept cheat sheet
│   └── session-transcript.md      # Sample /dojo-open output
├── CONTRIBUTING-CHARACTERS.md     # Guide for community character authors
├── CHANGELOG.md
├── README.md
└── LICENSE
```

## License

MIT

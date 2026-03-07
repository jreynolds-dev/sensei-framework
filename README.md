# Sensei Framework

A reusable, character-swappable teaching framework for [Claude Code](https://claude.ai/claude-code). Turn any project into a guided learning dojo with adaptive difficulty, spaced repetition quizzes, and rich session commands.

## What It Does

Sensei Framework transforms Claude Code into a patient, in-character mentor who:

- **Teaches through questions**, not answers (Socratic method by default)
- **Adapts difficulty** based on your tracked progress -- beginner gets more analogies, advanced gets more challenges
- **Tracks mastery** per concept with spaced repetition for quiz review
- **Stays in character** with strict voice rules, anti-patterns, and edge case handling
- **Works with any character** -- ships with Master Splinter and Gandalf, or create your own

## Architecture

Three layers compose together:

```
Layer 1: Framework Core    -- Teaching philosophy, adaptive difficulty, commands, progress tracking, named techniques
Layer 2: Character Pack    -- Voice rules, example phrases, anti-patterns, command triggers
Layer 3: Project Config    -- Your CLAUDE.md with project description, conventions, character selection
```

## Quick Start (5 minutes)

### Option A: Plugin Install (Recommended)

```bash
claude plugin install github:username/sensei-framework
```

Then in your project:

1. Add `## Sensei Character: splinter` to your project's `CLAUDE.md`
2. Create a `ROADMAP.md` with your project stages (see `templates/ROADMAP.md` for the format)
3. Done -- `PROGRESS.md` is created automatically on first session open

### Option B: Manual Assembly

1. Clone this repo
2. Copy the contents of `framework/FRAMEWORK.md` into your project's `CLAUDE.md`
3. Copy the contents of your chosen character file (e.g., `characters/splinter.md`) below it
4. Add your project-specific config at the bottom (see `templates/CLAUDE.md.template`)
5. Create a `ROADMAP.md` with your project stages (see `templates/ROADMAP.md`)

`PROGRESS.md` is created automatically on first session open -- no need to copy a template.

## Commands

| Command | What It Does |
|---------|-------------|
| `/dojo-open` | Open a session with briefing and skill pulse |
| `/pizza-time` | Close the session, update all tracking files |
| `/notecards` | Spaced repetition quiz (5 questions) |
| `/show-me <topic>` | Annotated code demo with follow-up question |
| `/why <concept>` | Deep-dive into why a pattern exists |
| `/challenge-me [topic]` | Project-relevant exercise with acceptance criteria |
| `/progress-report` | Visual mastery summary and recommendations |

The safeword (e.g., "hamato" for Splinter) is typed directly -- no slash command needed. It drops all teaching and gives a direct answer.

Character-flavored trigger phrases also work (e.g., "dojo open" instead of `/dojo-open`).

## Available Characters

### Master Splinter (`splinter`)
Patient, wise, occasionally stern. Speaks without contractions. Draws from martial arts and nature. Addresses you as "my son."

### Gandalf the Grey (`gandalf`)
Ancient, wry, exasperated by mortal stubbornness. Slightly archaic English. Draws from journeys and Middle-earth. Addresses you as "my dear hobbit."

### Create Your Own
Copy `characters/CHARACTER-TEMPLATE.md` and fill in the sections. The template guides you through identity, voice rules, example phrases, anti-patterns, edge cases, and command triggers.

## Adaptive Difficulty

The framework silently reads your `PROGRESS.md` Skill Domains table and adjusts its behavior:

- **Beginner** (mostly "not started"/"introduced"): More analogies, smaller steps, always explains why
- **Intermediate** (mostly "practiced"): Expects you to try first, gives pointers not paths
- **Advanced** (mostly "mastered"): Challenges assumptions, introduces trade-offs, minimal hand-holding

This is per-domain -- being advanced at CRUD does not mean advanced at auth.

## Progress Tracking

`PROGRESS.md` uses a structured format:

- **Skill Domains table** -- high-level mastery per topic area
- **Concept Index** -- granular tracking of every concept with mastery level, quiz history
- **Session Log** -- narrative record with observations for adaptive calibration

Mastery levels: `not started` -> `introduced` -> `practiced` -> `mastered`

The `/notecards` command uses spaced repetition: concepts at lower mastery and those not recently quizzed get asked more frequently.

## File Structure

```
sensei-framework/
├── .claude-plugin/
│   └── plugin.json              # Plugin metadata
├── hooks/
│   └── hooks.json               # SessionStart hook config
├── hooks-handlers/
│   └── session-start.sh         # Injects framework + character into context
├── commands/
│   ├── dojo-open.md             # Session open with skill pulse
│   ├── pizza-time.md            # Session close with mastery updates
│   ├── notecards.md             # Spaced repetition quiz
│   ├── show-me.md               # Annotated code demo
│   ├── why.md                   # Deep-dive reasoning
│   ├── challenge-me.md          # Project-relevant exercise
│   └── progress-report.md       # Visual mastery summary
├── characters/
│   ├── splinter.md              # Master Splinter voice pack
│   ├── gandalf.md               # Gandalf voice pack
│   └── CHARACTER-TEMPLATE.md    # Blank template for custom characters
├── templates/
│   ├── CLAUDE.md.template       # Slim project-level config
│   ├── PROGRESS.md              # Structured progress template
│   └── ROADMAP.md               # Standard roadmap template
├── framework/
│   ├── FRAMEWORK.md             # Core teaching engine
│   └── SKILLS.md                # Named teaching techniques catalog
├── README.md
└── LICENSE
```

## License

MIT

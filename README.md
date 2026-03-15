# Sensei

A reusable, character-swappable teaching plugin for [Claude Code](https://claude.ai/claude-code). Turn any project into a guided learning dojo with adaptive difficulty, spaced repetition quizzes, and rich session commands.

## What It Does

Sensei transforms Claude Code into a patient, in-character mentor who:

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
# Add the marketplace (one-time)
claude plugin marketplace add jreynolds-dev/sensei

# Install the plugin
claude plugin install sensei
```

Then in your project, run `/setup` -- Splinter introduces himself, asks four guided questions, and generates a populated `ROADMAP.md` and `CLAUDE.md` tailored to your project. A `.sensei/` folder is created with a `COMMANDS.md` quick-reference for your chosen character. `.sensei/PROGRESS.md` is created automatically on first `/dojo-open`.

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
| `/setup` | Initialize the dojo: onboarding flow for new projects, character selection, generates `.sensei/COMMANDS.md` |
| `/dojo-open` | Open a session: recap, skill pulse, plateau check, and today's micro-goal |
| `/pizza-time` | Close the session, update all tracking files and cheat sheet |
| `/notecards` | Spaced repetition quiz (5 questions) |
| `/show-me <topic>` | Annotated code demo with follow-up question |
| `/why <concept>` | Deep-dive into why a pattern exists |
| `/challenge-me [topic]` | Project-relevant exercise with acceptance criteria |
| `/spar [topic]` | Deliberate practice loop: blind attempt → reference reveal → gap analysis |
| `/progress-report` | Visual mastery summary, plateau detection, and recommendations |
| `/sensei-check` | Validate setup: confirms CLAUDE.md, character, safeword, ROADMAP.md, and PROGRESS.md are present |
| `/commands` | Show all available commands and trigger phrases in your character's voice |

The safeword (e.g., "hamato" for Splinter) is typed directly -- no slash command needed. It drops all teaching and gives a direct answer.

Character-flavored trigger phrases also work (e.g., "dojo open" instead of `/dojo-open`).

Once set up, check `.sensei/COMMANDS.md` in your project for a quick-reference card with your character's specific trigger phrases.

## Available Characters

### Master Splinter (`splinter`)
Patient, wise, occasionally stern. Speaks without contractions. Draws from martial arts and nature. Addresses you as "my son."

### Gandalf the Grey (`gandalf`)
Ancient, wry, exasperated by mortal stubbornness. Slightly archaic English. Draws from journeys and Middle-earth. Addresses you as "my dear hobbit."

### Create Your Own
Copy `characters/CHARACTER-TEMPLATE.md` and fill in the sections. The template guides you through identity, voice rules, example phrases, anti-patterns, edge cases, and command triggers.

## Adaptive Difficulty

The framework silently reads your `.sensei/PROGRESS.md` Skill Domains table and adjusts its behavior:

- **Beginner** (mostly "not started"/"introduced"): More analogies, smaller steps, always explains why
- **Intermediate** (mostly "practiced"): Expects you to try first, gives pointers not paths
- **Advanced** (mostly "mastered"): Challenges assumptions, introduces trade-offs, minimal hand-holding

This is per-domain -- being advanced at CRUD does not mean advanced at auth.

**How it works:** At session open, `PROGRESS.md` is included in Claude's context window. The framework instructs Claude to read the Skill Domains table and calibrate its responses accordingly. Adaptation is reliable for typical progress files but may degrade in very long sessions where context window pressure is high. If you notice responses feeling miscalibrated, running `/dojo-open` reloads the context.

## Progress Tracking

All learning files live in `.sensei/` to keep your project root clean:

| File | Created By | Purpose |
|------|-----------|---------|
| `.sensei/PROGRESS.md` | `/dojo-open` | Skill domains, concept index, session log |
| `.sensei/CHEATSHEET.md` | `/pizza-time` | One-line summaries of every concept you've learned |
| `.sensei/COMMANDS.md` | `/setup` | Quick-reference for your character's trigger phrases |

`.sensei/PROGRESS.md` uses a structured format:

- **Skill Domains table** -- high-level mastery per topic area
- **Concept Index** -- granular tracking of every concept with mastery level, quiz history
- **Session Log** -- narrative record with observations for adaptive calibration

Mastery levels: `not started` -> `introduced` -> `practiced` -> `mastered`

The `/notecards` command uses spaced repetition: concepts at lower mastery and those not recently quizzed get asked more frequently.

## File Structure

```
sensei/
├── .claude-plugin/
│   └── plugin.json              # Plugin metadata
├── hooks/
│   └── hooks.json               # SessionStart hook config
├── hooks-handlers/
│   └── README.md                # Documents the original shell hooks and why they were replaced
├── commands/
│   ├── setup.md                 # Project initialization
│   ├── dojo-open.md             # Session open with skill pulse
│   ├── pizza-time.md            # Session close with mastery updates
│   ├── notecards.md             # Spaced repetition quiz
│   ├── show-me.md               # Annotated code demo
│   ├── why.md                   # Deep-dive reasoning
│   ├── challenge-me.md          # Project-relevant exercise
│   ├── spar.md                  # Deliberate practice loop
│   ├── progress-report.md       # Visual mastery summary with plateau detection
│   ├── commands.md              # Show available commands in character voice
│   └── sensei-check.md          # Setup validation
├── characters/
│   ├── splinter.md              # Master Splinter voice pack
│   ├── splinter-commands.md     # Splinter command reference card (copied to .sensei/ on setup)
│   ├── gandalf.md               # Gandalf voice pack
│   ├── gandalf-commands.md      # Gandalf command reference card (copied to .sensei/ on setup)
│   └── CHARACTER-TEMPLATE.md    # Blank template for custom characters
├── templates/
│   ├── CLAUDE.md.template       # Slim project-level config
│   └── ROADMAP.md               # Standard roadmap template
├── framework/
│   ├── FRAMEWORK.md             # Core teaching engine
│   └── SKILLS.md                # Named teaching techniques catalog
├── examples/
│   ├── PROGRESS.md              # Sample completed progress file
│   ├── CHEATSHEET.md            # Sample concept cheat sheet
│   └── session-transcript.md    # Sample /dojo-open output for setup verification
├── README.md
└── LICENSE
```

## License

MIT

# Changelog

All notable changes to sensei will be documented here.

Format follows [Keep a Changelog](https://keepachangelog.com/en/1.0.0/). This project uses [Semantic Versioning](https://semver.org/).

---

## [1.0.0] — 2026-03-20

Initial marketplace release.

### Added

- **Framework core** — Teaching engine with Socratic method, adaptive difficulty, and named pedagogical techniques (`framework/FRAMEWORK.md`, `framework/SKILLS.md`)
- **Character system** — Swappable voice packs with strict voice rules, anti-patterns, and edge case handling
- **Master Splinter** — Patient, martial-arts-grounded mentor character
- **Gandalf the Grey** — Wry, archaic-English mentor character
- **Character template** — `characters/CHARACTER-TEMPLATE.md` for creating custom characters
- **Character contribution guide** — `CONTRIBUTING-CHARACTERS.md` for community character authors
- **13 session skills** — `/setup`, `/dojo-open`, `/pizza-time`, `/notecards`, `/show-me`, `/why`, `/challenge-me`, `/spar`, `/progress-report`, `/commands`, `/sensei-check`, `/set-mode`, `/teach-back`
- **Prompt-based hooks** — `SessionStart` and `UserPromptSubmit` hooks for context injection and persona persistence
- **Progress tracking** — `.sensei/PROGRESS.md` with skill domains, concept index, and session log
- **Spaced repetition** — `/notecards` weights concepts by mastery level and recency
- **Adaptive difficulty** — Three calibration levels (Beginner / Intermediate / Advanced) driven by PROGRESS.md
- **Safeword system** — Character-specific trigger that drops teaching mode for direct answers
- **Learning modes** — Balanced, Theory-Focused, Practical, and Exam-Prep with character-flavored names
- **Prerequisite mapping** — `ROADMAP.md` prerequisite table enforced by framework redirect rules
- **Staleness detection** — Session gap detection (7-13 day and 14+ day) with review-oriented recovery
- **Safeword frequency monitoring** — Suggests mode change if safeword used 3+ times in 2 sessions
- **Zeigarnik cliffhanger close** — `/pizza-time` previews next ROADMAP item to drive return
- **Interleaved retrieval callbacks** — One retrieval question per session on previously practiced concepts
- **Struggle reframing** — Character phrases that normalize friction as a learning signal
- **Stage completion celebrations** — Character-voiced milestone acknowledgment with progression metaphors (belts, chapters)
- **Session momentum arc** — Invisible four-beat pacing: confidence opener, stretch into difficulty, small win, cliffhanger
- **Variable reward templates** — Per-character response variety for correct answers, partial understanding, breakthroughs, and revisited concepts
- **Examples** — Sample PROGRESS.md, CHEATSHEET.md, and session transcript for setup verification
- **Setup validation** — `/sensei-check` command confirms all required files are present before first session

### Changed

- **Migrated `commands/` to `skills/`** — Each command now lives at `skills/<name>/SKILL.md` per Claude Code plugin conventions
- **Fixed `marketplace.json` schema** — Removed `$schema`, fixed `source` field format, moved `description` to `metadata`, removed duplicate `version`
- **Fixed `plugin.json` schema** — Removed `engines` field, added `homepage`, removed `commands` array (skills auto-discovered from `skills/` directory)

# Changelog

All notable changes to sensei will be documented here.

Format follows [Keep a Changelog](https://keepachangelog.com/en/1.0.0/). This project uses [Semantic Versioning](https://semver.org/).

---

## [1.0.0] — 2026-03-14

Initial marketplace release.

### Added

- **Framework core** — Teaching engine with Socratic method, adaptive difficulty, and named pedagogical techniques (`framework/FRAMEWORK.md`, `framework/SKILLS.md`)
- **Character system** — Swappable voice packs with strict voice rules, anti-patterns, and edge case handling
- **Master Splinter** — Patient, martial-arts-grounded mentor character
- **Gandalf the Grey** — Wry, archaic-English mentor character
- **Character template** — `characters/CHARACTER-TEMPLATE.md` for creating custom characters
- **11 session commands** — `/setup`, `/dojo-open`, `/pizza-time`, `/notecards`, `/show-me`, `/why`, `/challenge-me`, `/spar`, `/progress-report`, `/commands`, `/sensei-check`
- **Prompt-based hooks** — `SessionStart` and `UserPromptSubmit` hooks for context injection and persona persistence (requires Claude Code >=2.1.0)
- **Progress tracking** — `.sensei/PROGRESS.md` with skill domains, concept index, and session log
- **Spaced repetition** — `/notecards` weights concepts by mastery level and recency
- **Adaptive difficulty** — Three calibration levels (Beginner / Intermediate / Advanced) driven by PROGRESS.md
- **Safeword system** — Character-specific trigger that drops teaching mode for direct answers
- **Examples** — Sample PROGRESS.md, CHEATSHEET.md, and session transcript for setup verification
- **Setup validation** — `/sensei-check` command confirms all required files are present before first session

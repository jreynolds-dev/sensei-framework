# Contributing a Character to Sensei

So you want to build a sensei. Excellent. This guide will help you create a character that actually teaches — not just a voice skin over a chatbot.

A good character is the difference between "here is a tutorial" and "I have a teacher." If you get it right, students will pick your character and never switch.

---

## Before You Start

Read these files in order:

1. `characters/CHARACTER-TEMPLATE.md` — the structure your character must follow
2. `characters/splinter.md` — the reference implementation. When in doubt, look at how Splinter does it.
3. `framework/FRAMEWORK.md` — the teaching engine your character plugs into

Your character file is a prompt. Every word in it costs context window tokens. Be precise, not verbose.

---

## The Sections, Explained

### Introduction

This is the first thing a student ever hears from your character. It has three jobs:

1. Establish who the character is (without breaking the fourth wall)
2. Set expectations — this is a teacher, not a code generator
3. Transition naturally into onboarding questions

Splinter does this in four short paragraphs. Gandalf does it in one dense one. Match your character's natural pacing.

**The trap:** Writing a long, self-indulgent monologue. The student is excited to start. Do not make them sit through a TED talk.

### Identity

Two to three sentences. Who is this character, what is their relationship to the student, and why would someone want to learn from them?

This section is for Claude, not the student. It anchors the voice when the model starts to drift.

### Voice Rules

This is the most important section in the file. Get this wrong and everything else falls apart.

You need to define:

- **Linguistic style.** Splinter never uses contractions. Gandalf uses slightly archaic English. Your character needs a rule this specific. "Talks casually" is not a rule. "Uses sentence fragments. Drops articles when excited. Never says 'utilize' when 'use' will do." — that is a rule.

- **Student address terms.** Three to four terms your character uses, plus what is forbidden. Splinter says "my son" and "young one" — never "buddy" or "dude."

- **Metaphor domain.** This is your character's secret weapon. Splinter draws from martial arts and nature. Gandalf draws from journeys and light vs. shadow. Pick ONE domain and commit. A pirate character explains recursion as "turtles all the way down to Davy Jones' locker." A chef character calls functions "recipes." Mixing domains kills the voice.

- **Humor style.** Define it or it will default to generic chatbot wit. Splinter is dry. Gandalf is wry and twinkle-eyed. Your character needs its own flavor.

- **Wisdom delivery.** When your character says something profound, how does it land? Splinter gives proverbs their own line. Gandalf weaves them into longer passages. This small detail makes or breaks the feeling of depth.

### Example Phrases

These are not decoration — they are few-shot prompts. Claude reads these and calibrates its output to match.

You need phrases for eight situations:

| Situation | What It Teaches Claude |
|-----------|----------------------|
| Encouragement | How to be warm without being sycophantic |
| Correction | How to be firm without being mean |
| Celebration | How to acknowledge a win without a parade |
| Humor | The character's comedic register |
| Error Reading | How to make stack traces feel like part of the world |
| Frustration Response | How to de-escalate while staying in character |
| Reframe Incorrect Answer | How to acknowledge a wrong answer while reframing struggle as growth |
| Stage Completion | How to celebrate a major milestone — completing an entire ROADMAP stage |

Three to four phrases per category. Quality over quantity — one perfect phrase teaches Claude more than five mediocre ones.

**Test:** Read your phrases out loud. If they could come from any character, they are too generic. If they could only come from yours, you nailed it.

### Anti-Patterns

This section is a guardrail. Without it, Claude will slowly drift toward its default chatbot personality — friendly, eager, full of exclamation marks.

You need at least seven. Start with these universals (every character should include them):

- No "Great question!" or variations
- No "Absolutely!" / "Definitely!" / "Sure!"
- No "No worries" / "No problem"
- No "Let me help you with that"
- No emoji
- No fourth-wall breaks (AI, LLM, model, prompt)
- No more than one exclamation mark per response

Then add character-specific ones. Splinter forbids tech-bro slang. Gandalf forbids modern slang. What would break YOUR character's illusion?

### Drift Correction Examples

These are wrong/right pairs that show Claude exactly where the line is. Splinter's file has three pairs covering the three most common drifts:

1. **Code giveaway** — character writes code when it should ask a question
2. **Sycophantic opener** — character opens with generic praise
3. **Voice slip** — character breaks a linguistic rule (contraction, wrong address term, etc.)

Write at least these three. The wrong example should be something Claude would plausibly generate. The right example should be unmistakably your character.

### Edge Case Handling

Seven scenarios, one response strategy each. These are the moments where characters usually break — the student does something unexpected and Claude falls back to default behavior.

Look at Splinter's edge cases. Each one is a single sentence that stays fully in voice. "That path leads away from the dojo. We will explore it another day." — that is Splinter handling an off-topic question without breaking character or being rude.

Your character needs to handle all seven scenarios in the template. Do not skip any.

### Learning Modes

Four modes, each with a character-flavored name and a one-sentence description in voice.

Splinter's modes: "The Way of the Dojo," "Root Before Branch," "Hands Before Eyes," "Test of the Gauntlet." Each name tells you what it is without explanation.

**The test:** Could a student pick the right mode just from the name? If yes, you are done.

### Command Names

Every command gets a character-flavored trigger phrase. These should feel natural to say — students type them dozens of times.

Rules:
- Keep triggers short (2-4 words)
- They must be unique and unambiguous
- The safeword should be something a student would not type accidentally
- Session open and close triggers should feel like ritual — opening and closing a door

Splinter: "dojo open" / "pizza time." Gandalf: "speak friend and enter" / "the road goes ever on." Both feel like bookends.

---

## The Voice Test

Before submitting, run these prompts against your character (paste your character file into Claude and try them):

1. "How do I make an API call?" — Should get a Socratic question, not code
2. "I do not understand anything" — Should get a gentle, in-character de-escalation
3. "Just give me the answer" — Should get firm redirection, not compliance
4. "I did it!" — Should get a brief, warm celebration — not a party
5. Ask five questions in a row — Check for voice drift by the fifth response

If the character sounds like itself on all five, ship it.

---

## Common Mistakes

- **Voice without substance.** A pirate who says "arrr" but teaches like a textbook. The voice must change HOW concepts are explained, not just the greeting.
- **Too many anti-patterns.** If your anti-pattern list is longer than your example phrases, you are defining the character by what it is not. Flip it.
- **Metaphor domain too narrow.** "Cooking" works. "Specifically French pastry" does not — you will run out of analogies by session three.
- **Forgetting the teaching.** The character exists to teach. If your file is 90% personality and 10% pedagogy, the balance is wrong. Look at how Splinter's voice rules serve the teaching philosophy, not just the aesthetic.

---

## File Checklist

Before opening a PR:

- [ ] Character `.md` file follows the template structure exactly
- [ ] Commands `.md` file with trigger phrases for all commands (see `characters/splinter-commands.md`)
- [ ] All seven edge cases handled
- [ ] At least seven anti-patterns
- [ ] At least three drift correction pairs
- [ ] Four learning modes with character-flavored names
- [ ] All command triggers defined
- [ ] Voice test passed on all five prompts
- [ ] Read your file one more time — every line should earn its token cost

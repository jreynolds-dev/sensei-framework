# Stage Completion Celebration — Design Spec

**Issue:** #14
**Branch:** `feature/issue14/stage-completion-celebration`
**Date:** 2026-03-15

## Problem

When a student completes an entire ROADMAP stage, there is no emotional payoff. Stage completion is just a checkbox — no celebration, no milestone moment. Learning frameworks depend on motivation loops, and a visible milestone reinforces that progress is real.

## Solution

When `/pizza-time` detects that an entire ROADMAP stage has been completed during the session, trigger a character-specific milestone celebration before the normal closing summary.

## Prerequisites

This spec assumes the Reframe Incorrect Answer changes (currently uncommitted on this branch) are committed first. The placement anchors and situation counts below reference `### Reframe Incorrect Answer Response` as an existing section.

## Design

### Detection Logic (pizza-time.md)

Step 5 ("Update ROADMAP.md") is modified to include pre/post snapshot behavior, and a new step 5b is added for celebration delivery. Current steps 6-8 become 7-9.

**Modified step 5:**
1. **Before** checking off items, snapshot which ROADMAP stages are already fully complete (all items `- [x]`)
2. Check off completed items and add new items (existing behavior)
3. **After** checking off items, snapshot again

**New step 5b — Stage completion celebration:**
1. **Diff** the before/after snapshots — any stage that was incomplete before but fully complete after is a newly completed stage
2. For each newly completed stage (in stage order), deliver a celebration moment:
   - State the milestone in character voice, naming the completed stage (e.g., "Stage 3 -- Authentication is complete")
   - Follow with a character celebration phrase from the `### Stage Completion` example phrases in the active character pack
   - If the character's Stage Completion section includes contextual placeholders or progression metadata (such as Splinter's belt color mapping), resolve them using information from that character's file
3. If no stages were newly completed, skip this step silently
4. If any stages were newly completed, append the completion(s) to the **Observations** line already written in step 4 (e.g., append "Completed Stage 3 -- Authentication")

Detection is simple checkbox counting: a stage is complete when every `- [ ]` has become `- [x]`. No partial credit, no percentage thresholds.

If multiple stages complete in one session, celebrate each individually, in order.

Celebration delivery happens at step 5b — immediately after the ROADMAP update, during the file-update sequence. The closing summary and cliffhanger follow after all remaining file updates.

### Character Phrases

#### Splinter (`characters/splinter.md`)

New section after `### Reframe Incorrect Answer Response`, within `## Example Phrases`:

```markdown
### Stage Completion

When a ROADMAP stage is completed, map the stage number to a belt color:

| Stage | Belt |
|-------|------|
| 1 | Yellow |
| 2 | Orange |
| 3 | Green |
| 4 | Blue |
| 5 | Purple |
| 6 | Brown |
| 7+ | Black |

- "You have earned your {belt_color} belt, my student. Wear it with discipline -- for the next trial will test it."
- "A {belt_color} belt. A rank earned. But remember -- the belt does not make the warrior. The warrior makes the belt."
- "The {belt_color} belt is yours, young one. Rest a moment. Then look to the next mountain."
```

#### Gandalf (`characters/gandalf.md`)

New section after `### Reframe Incorrect Answer Response`, within `## Example Phrases`:

```markdown
### Stage Completion
- "You have passed through another gate, my dear hobbit. The road beyond is stranger -- but so are you, now."
- "A chapter closes. The tale does not end, but if it did, this would be a worthy place to stop. It does not, of course. Onward."
- "The light grows brighter ahead. You have earned the next stretch of road, and I dare say you are ready for it."
```

Gandalf's phrases are intentionally generic — gates do not have a named progression the way martial arts belts do. The stage name/number provided by the celebration step supplies the specificity.

#### CHARACTER-TEMPLATE.md

New section after `### Reframe Incorrect Answer Response`, within `## Example Phrases`:

```markdown
### Stage Completion (2-3 phrases)
- "[Phrases that celebrate an entire ROADMAP stage being completed. This is a major milestone -- the character should mark it with weight and warmth. Each character should have a thematic progression metaphor: belts, gates, chapters, levels, etc. If the metaphor has named ranks (like belt colors), include a mapping table from stage number to rank name above the phrases.]"
```

### CONTRIBUTING-CHARACTERS.md

Update "seven situations" to "eight situations" and add a new row to the table:

```
| Stage Completion | How to celebrate a major milestone — completing an entire ROADMAP stage |
```

## Files Changed

| File | Change |
|------|--------|
| `commands/pizza-time.md` | Modify step 5 to add pre/post snapshots; add new step 5b for celebration delivery (includes appending to Observations line) with generic placeholder resolution instruction; renumber steps 6-8 to 7-9 |
| `characters/splinter.md` | Add `### Stage Completion` section with belt color mapping table and phrases |
| `characters/gandalf.md` | Add `### Stage Completion` phrases |
| `characters/CHARACTER-TEMPLATE.md` | Add `### Stage Completion` placeholder section with guidance on progression metaphors |
| `CONTRIBUTING-CHARACTERS.md` | Update situation count to eight, add Stage Completion row |

## What This Does NOT Include

- No changes to `FRAMEWORK.md` — celebration is a pizza-time concern, not a teaching philosophy principle
- No new commands — celebration fires automatically, not on demand
- No special handling for completing the final stage — this can be addressed in a future issue if desired
- No changes to the `### Celebration` phrase section — that section is for in-session small wins; `### Stage Completion` is for ROADMAP milestones

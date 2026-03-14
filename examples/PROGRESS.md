# My Express API - Progress Log

## Skill Domains

| Domain | Level | Last Practiced | Sessions Active |
|--------|-------|----------------|-----------------|
| Node.js fundamentals | mastered | 2026-02-28 | 6 |
| Express routing | practiced | 2026-03-05 | 4 |
| Middleware | practiced | 2026-03-05 | 3 |
| Authentication / JWT | introduced | 2026-03-10 | 2 |
| Database / Prisma | introduced | 2026-03-10 | 2 |
| Testing | not started | -- | -- |

Levels: **not started** | **introduced** | **practiced** | **mastered**

## Concept Index

| Concept | Domain | Mastery | Introduced | Last Quizzed | Quiz Score |
|---------|--------|---------|------------|--------------|------------|
| require vs import | Node.js fundamentals | mastered | 2026-02-10 | 2026-02-28 | 5/5 |
| async/await vs callbacks | Node.js fundamentals | mastered | 2026-02-12 | 2026-02-28 | 5/5 |
| Express app setup | Express routing | mastered | 2026-02-14 | 2026-03-05 | 4/5 |
| Route parameters | Express routing | practiced | 2026-02-20 | 2026-03-01 | 3/5 |
| Query strings | Express routing | practiced | 2026-02-20 | 2026-03-01 | 4/5 |
| Custom middleware | Middleware | practiced | 2026-02-25 | 2026-03-05 | 3/5 |
| Error-handling middleware | Middleware | introduced | 2026-03-05 | -- | -- |
| JWT structure | Authentication / JWT | introduced | 2026-03-10 | -- | -- |
| Prisma schema basics | Database / Prisma | introduced | 2026-03-10 | -- | -- |

Mastery levels:
- **introduced**: Concept was explained or demonstrated
- **practiced**: Student used it independently in their own code
- **mastered**: Student answered quiz correctly AND used it independently in a different context

## Session Log

### Session 6
**Date:** 2026-03-10

**Concepts Covered:**
- JWT structure — header, payload, signature and when to verify
- Prisma schema basics — model definitions, field types, relations

**What Was Built:**
- Added `POST /auth/login` stub returning a signed JWT
- Created initial `schema.prisma` with User model

**Observations:**
- Strong grasp of Express by now; routing questions answered without prompting
- JWT verification flow still fuzzy — used safeword twice to get direct explanation
- Prisma migrations caused confusion; worth revisiting next session before moving on

**Quiz History:**
- Not yet quizzed on JWT or Prisma content

### Session 5
**Date:** 2026-03-05

**Concepts Covered:**
- Error-handling middleware (4-argument signature)
- Centralized error response shape

**What Was Built:**
- Global error handler in `middleware/errorHandler.js`
- Refactored all routes to pass errors to `next(err)`

**Observations:**
- Clicked quickly once the 4-arg signature was demonstrated
- Independently applied pattern to 3 routes without prompting — practicing well

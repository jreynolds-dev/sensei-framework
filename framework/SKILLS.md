# Sensei Framework -- Teaching Techniques

Named pedagogical techniques for developer education. The framework and commands reference these by name. Select techniques based on the student's current level and situation.

## Quick Reference

| # | Technique | Primary Levels | Purpose |
|---|-----------|---------------|---------|
| 1 | Error-First Teaching | Beg, Int | Show broken code, let student diagnose |
| 2 | Trace-Through | Beg, Int | Walk execution line-by-line, "what happens next?" |
| 3 | Refactor Reveal | Int, Adv | Show ugly-but-working code, guide improvement |
| 4 | Rubber Duck Protocol | All | Force student to articulate understanding first |
| 5 | Constraint Removal | Beg | Simplify first, layer complexity gradually |
| 6 | Pattern Recognition | Int, Adv | Show two implementations, ask what's common |
| 7 | Code Reading | All | Predict what unfamiliar code does before running it |
| 8 | Inversion | Int, Adv | Show what goes wrong WITHOUT the pattern |
| 9 | Isolation | All | Strip to smallest case that exposes the core issue |
| 10 | Concept Bridging | Beg, Int | Connect new concept to one they already know |
| 11 | Scaffolded Failure | Int, Adv | Assign something just beyond ability; the wall is the lesson |
| 12 | Narrate the Why | Beg, Int | Verbalize decision-making before writing code |
| 13 | Side-by-Side | Int, Adv | Two valid approaches, ask which and why (trade-offs) |
| 14 | System Sketch | All | Describe data flow in plain English before writing any code |

---

## 1. Error-First Teaching

**What it is:** Present code that contains a bug or produces an error. Let the student find and diagnose the problem before showing the fix.

**When to deploy:** When introducing a concept where the failure mode is more instructive than the success case. When the student needs practice reading error messages.

**Level variations:**
- **Beginner:** One obvious error, simple code. Guide them to read the error message first.
- **Intermediate:** Subtler bugs -- a missing await, an incorrect type, a logic inversion. Expect them to find it with less guidance.

**Example:**
> "Look at this controller. It compiles. It even starts. But when you hit the endpoint, it returns 500. What is wrong?"

**Combines well with:** Trace-Through, Isolation

---

## 2. Trace-Through

**What it is:** Walk through code execution step by step, asking the student "what happens next?" at each point. Forces them to build a mental model of control flow.

**When to deploy:** When the student does not understand execution order, async behavior, middleware chains, or lifecycle hooks.

**Level variations:**
- **Beginner:** Trace simple synchronous code. Pause at every line.
- **Intermediate:** Trace through async/await, middleware pipelines, or dependency injection. Ask them to predict the order.

**Example:**
> "A request hits this endpoint. The guard runs first. What does it check? Good. Now the interceptor fires. What does it do to the request before your handler sees it?"

**Combines well with:** Error-First Teaching, Narrate the Why

---

## 3. Refactor Reveal

**What it is:** Present working but poorly structured code. Guide the student to identify what is wrong with the design and improve it incrementally.

**When to deploy:** When teaching design principles, DRY, separation of concerns, or when the student's own code works but needs structural improvement.

**Level variations:**
- **Intermediate:** Show a function that does too much. Ask them to split it.
- **Advanced:** Show a working architecture with a subtle design flaw. Ask them to find the coupling, the hidden dependency, the violation of a principle.

**Example:**
> "This service works. Every test passes. But something is wrong with how it is structured. What would break if you needed to add a second data source?"

**Combines well with:** Side-by-Side, Pattern Recognition

---

## 4. Rubber Duck Protocol

**What it is:** Before helping, require the student to explain what they think is happening, what they have tried, and where they are stuck. The act of articulating often reveals the answer.

**When to deploy:** When the student says "it does not work" without specifics. When they ask for help before attempting to debug. When they seem to be guessing rather than reasoning.

**Level variations:**
- **Beginner:** Ask them to describe what they expected vs. what happened.
- **Intermediate:** Ask them to explain their mental model of the system before you offer any guidance.
- **Advanced:** Ask them to propose two possible causes and explain which is more likely and why.

**Example:**
> "Before I look at this -- tell me what you think is happening. Walk me through your understanding of the request lifecycle up to the point where it breaks."

**Combines well with:** Isolation, Error-First Teaching

---

## 5. Constraint Removal

**What it is:** Remove complexity to isolate the core concept. Strip away auth, validation, error handling, and database layers. Teach the concept in its simplest possible form first, then layer complexity back in.

**When to deploy:** When the student is overwhelmed. When too many new concepts collide at once. When they are stuck and the problem is cognitive overload, not lack of knowledge.

**Level variations:**
- **Beginner:** Start with hardcoded data, no database, no validation. Add each layer one at a time after the core concept clicks.

**Example:**
> "Forget the database for now. Forget validation. Let us make this endpoint return a hardcoded object first. Once that works, we will connect the real pieces."

**Combines well with:** Trace-Through, Concept Bridging

---

## 6. Pattern Recognition

**What it is:** Show two or more concrete implementations that share a common pattern. Ask the student to identify the abstraction. Builds the skill of seeing structure beneath syntax.

**When to deploy:** When the student has seen enough examples to start generalizing. When introducing design patterns, architectural patterns, or recurring code structures.

**Level variations:**
- **Intermediate:** Show two services or controllers. Ask what they have in common. Guide toward the shared pattern.
- **Advanced:** Show implementations across different languages or frameworks. Ask what the underlying principle is, independent of syntax.

**Example:**
> "Here is how you validate input in your users module. And here is how you do it in your orders module. What is the same? What would you extract?"

**Combines well with:** Refactor Reveal, Side-by-Side

---

## 7. Code Reading

**What it is:** Present unfamiliar code and ask the student to predict what it does before running it. Builds the skill of reading code as a first-class activity, not just writing it.

**When to deploy:** At session open to warm up. When introducing a new library or codebase. When the student tends to copy-paste without understanding.

**Level variations:**
- **Beginner:** Short, clear functions (5-10 lines). Ask what the return value would be for a given input.
- **Intermediate:** Longer functions with branching logic. Ask them to trace the happy path and one error path.
- **Advanced:** Unfamiliar framework code, library internals, or code in a different paradigm. Ask what design decisions the author made and why.

**Example:**
> "Read this function. Do not run it. What does it return when called with an empty array? What about an array with one element?"

**Combines well with:** Trace-Through, Pattern Recognition

---

## 8. Inversion

**What it is:** Instead of showing why a pattern is good, show what happens without it. Let the student experience the pain the pattern was designed to prevent.

**When to deploy:** When the student asks "why do we need this?" When a pattern feels like unnecessary ceremony. When teaching defensive programming, error handling, or architectural boundaries.

**Level variations:**
- **Intermediate:** Remove a guard, a validation layer, or an interface. Show what breaks.
- **Advanced:** Remove an architectural boundary. Show how a change in one module cascades. Demonstrate the coupling the abstraction was hiding.

**Example:**
> "You asked why we use DTOs instead of passing the entity directly. Let us remove the DTO. Now change the database column name. See how many files break? That is why."

**Combines well with:** Side-by-Side, Refactor Reveal

---

## 9. Isolation

**What it is:** When debugging or explaining, strip the problem to the smallest possible case that still exhibits the behavior. Remove everything that is not directly relevant.

**When to deploy:** When the student is lost in a large codebase. When an error could be caused by multiple interacting systems. When the student's question is too broad to answer effectively.

**Level variations:**
- **Beginner:** Build the isolated case for them, then explain it.
- **Intermediate:** Guide them to build the isolated case themselves -- "Can you reproduce this with just a controller and a hardcoded response?"
- **Advanced:** Ask them to isolate the issue as the first step before you engage at all.

**Example:**
> "There is too much happening here to see the problem. Can you make a new endpoint that does nothing except the one thing that is breaking? No auth, no pipes, just the bare operation."

**Combines well with:** Constraint Removal, Error-First Teaching

---

## 10. Concept Bridging

**What it is:** Connect a new concept to something the student already knows. Use their existing mental models as anchors for new knowledge.

**When to deploy:** When introducing a concept that has a clear parallel to something already learned. When the student's .sensei/PROGRESS.md shows a related domain at "practiced" or higher.

**Level variations:**
- **Beginner:** Bridge to everyday concepts ("A guard is like a bouncer at a club -- checks your ID before you get in").
- **Intermediate:** Bridge to concepts they have already mastered in code ("You know how middleware intercepts requests? Pipes do the same thing but for data transformation").

**Example:**
> "You already understand how your auth guard works -- it checks a condition and either lets the request through or blocks it. An exception filter works the same way, but it catches requests on the way out instead of the way in."

**Combines well with:** Constraint Removal, Narrate the Why

---

## 11. Scaffolded Failure

**What it is:** Deliberately assign a task that is slightly beyond the student's current ability. The goal is not immediate success -- it is to hit a wall, struggle productively, and learn from the attempt.

**When to deploy:** When the student is comfortable and needs to be pushed. When they are at the edge of "practiced" moving toward "mastered." When growth requires encountering a real obstacle.

**Level variations:**
- **Intermediate:** Assign a task that requires combining two known concepts in a new way. Let them struggle before offering a hint.
- **Advanced:** Assign a task that requires discovering a concept they have not been taught. Provide only the problem statement and acceptance criteria.

**Example:**
> "Build a custom decorator that logs execution time for any method it is applied to. You have not seen custom decorators yet -- but you know what decorators do, and you know how Date.now() works. That is enough to start."

**Combines well with:** Rubber Duck Protocol, Isolation

---

## 12. Narrate the Why

**What it is:** Before writing any code, verbalize the decision-making process. Explain why this approach, why this structure, why this name. Model the thinking that experienced developers do silently.

**When to deploy:** During `/show-me` demonstrations. When the student writes code that works but was arrived at through trial and error rather than reasoning. When teaching architectural decisions.

**Level variations:**
- **Beginner:** Narrate everything -- file placement, naming, structure, why this type and not that one.
- **Intermediate:** Narrate only the non-obvious decisions. Ask them to narrate the obvious ones.

**Example:**
> "I am putting this in a service, not the controller. Why? Because this logic does not care about HTTP. If tomorrow we add a CLI command that needs the same operation, the service works for both. The controller is just one door into the building."

**Combines well with:** Trace-Through, Concept Bridging

---

## 13. Side-by-Side

**What it is:** Present two valid approaches to the same problem. Ask the student which they would choose and why. There is no single right answer -- the goal is reasoning about trade-offs.

**When to deploy:** When the student is ready to move beyond "does it work?" to "what are the trade-offs?" When teaching architectural decisions, library choices, or design alternatives.

**Level variations:**
- **Intermediate:** Two implementation approaches (e.g., inheritance vs. composition). Ask which fits better here and why.
- **Advanced:** Two architectural approaches with different scaling characteristics, maintenance costs, or coupling trade-offs. Expect a nuanced answer.

**Example:**
> "Here are two ways to handle this. Option A uses a simple if-else chain. Option B uses the strategy pattern. Both work. Which would you choose for this project, and what would change your answer?"

**Combines well with:** Inversion, Pattern Recognition, Refactor Reveal

---

## 14. System Sketch

**What it is:** Before writing any code, the student must describe the data flow from input to output in plain English. No syntax. No code. No framework names unless necessary. Just: what enters the system, what transforms it, what decisions are made, what exits, and where it could fail. This exposes the mental representation -- or the absence of one.

**When to deploy:** At the start of any non-trivial feature or before a `/spar` attempt. When the student jumps to code before understanding the problem. When you suspect they know the syntax but not the shape of the solution. When teaching system design or architectural thinking.

**Level variations:**
- **Beginner:** Scope to a single function or endpoint. "Tell me what happens when a POST request hits this route. Do not look at any code."
- **Intermediate:** Scope to a full request lifecycle or a module interaction. "Walk me through what happens from the moment the user submits the login form to the moment they receive a JWT."
- **Advanced:** Scope to a cross-service or architectural concern. "Describe how you would design the data flow for real-time notifications. No code -- just the shape of the system."

**Example:**
> "Before you write a single line -- tell me what this service needs to do. What comes in? What decisions does it make? What goes out? What can go wrong? I will wait."

**Combines well with:** Narrate the Why, Trace-Through, Rubber Duck Protocol

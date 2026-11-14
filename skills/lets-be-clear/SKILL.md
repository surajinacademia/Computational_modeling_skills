---
name: lets-be-clear
description: Clarify a problem, help the user work through decisions, confirm unresolved choices, and complete the task. Use when invoked, when the user checks shared understanding, when a request is ambiguous, when they are stuck and ask for help deciding, or when schematic-designer delegates a figure brief. Do not activate for ordinary retrieval or definition requests alone.
---

# Let's Be Clear

Help the user think through the problem and learn along the way. Keep the writing direct and conversational, and preserve their voice.

## When to use

- The user invokes the skill, checks shared understanding, or asks for help deciding.
- The request is vague, underspecified, or conflicting, and different answers would change the work.
- `schematic-designer` delegates a figure brief.

Do not activate for ordinary retrieval, definitions, or clear requests. Never force an interview or a fixed number of questions.

## Process

1. **Understand the outcome.** Identify what the user wants to achieve.
2. **Identify the unresolved consequential choice.** Tell the user what is missing, why it matters, and how their framing could improve. Critique reasoning respectfully.
3. **Surface assumptions.** List assumptions the user stated, hid, or left for you to introduce.
4. **Help the user decide.** Supply missing facts, narrow excessive options, show how each choice changes the outcome, and recommend one with reasons and evidence.
5. **Ask and move forward.** Ask only for context or priorities the user must supply, where different answers would change your work, and offer concrete options instead of making them invent choices; if they remain unsure, explain another way and work an example together.
6. **End any clarification pause cleanly.** Close any pause with a concise direct `?` question asking the user to confirm the plan, brief, scope, or approach (or approve how to proceed within 60 characters of those terms), then complete and check the task once settled.

## Agent response structure

Keep clarification pause responses compact (under 400 words total), short, and scannable. Skip settled points, and state useful facts before asking for a choice.

- **Goal:** What we are trying to achieve.
- **Unresolved consequential choice and assumptions:** What is undecided, what is assumed, and why it matters.
- **Useful information:** Relevant facts or a concrete example, plus remaining unknowns.
- **Options and recommendation:** Choices, what each changes, and a recommendation with reasons.
- **Your input:** A direct `?` question asking the user to confirm the plan, brief, scope, or approach, plus only the context the user must supply.

## Boundaries

- Read available context and gather facts freely for step 4 while keeping files unchanged during a pause. Confirm the plan, brief, scope, or approach before acting on unresolved consequential choices; reuse confirmation that was already given.
- For a clarification-only request, stop at the brief. For a delegated brief, return control to the invoking workflow.
- Do not invent parameters, choose the user's priorities, or write a learning record.

## Completion

The task is complete and checked, with assumptions and reasons for decisions explained. See [tutorials](tutorials.md) for worked conversations.

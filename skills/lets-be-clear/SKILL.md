---
name: lets-be-clear
description: Clarify vague or incomplete requests by spotting holes in user intent, supplying the facts and tradeoffs needed for informed decisions, confirming unresolved choices, and completing the task. Use when invoked, when checking shared understanding, when a request has ambiguity or missing specifications that change the work, when the user asks for help deciding, or when another workflow delegates an unresolved brief, plan, or scope choice. Do not activate for ordinary retrieval, definitions, or already-precise requests.
---

# Let's Be Clear

- Help the user make vague or incomplete intent precise instead of guessing on their behalf: supply missing workspace facts, constraints, and concrete tradeoffs, keep the writing direct and conversational, and preserve their voice.
- Activate when invoked directly, when checking shared understanding (`"am I clear?"`), when the user asks for help deciding, when ambiguity or unstated assumptions would change the method, scope, cost, or result, or when another workflow (such as `schematic-designer`, `jupyter-notebook`, `model-documentation`, `paper-reproduce`, or `claim-review`) delegates an unresolved brief, plan, or scope choice.
- Do not activate for ordinary retrieval, definitions, or requests whose intent and inputs are already specific enough to execute, and never force an interview or a fixed number of questions.
- Never invent scientific parameters, silent model assumptions, or user priorities, and never write an unrequested learning log.

## 1. Compare intent with context and choose the response

- **Read context without modifying files:** Inspect relevant workspace files and conversation history freely while keeping all files untouched during this comparison and any confirmation or clarification pause.
- **Check for consequential gaps:** Identify holes, vague terms, unstated assumptions, or conflicting goals that alter the method, scope, cost, or conclusion, and never ask questions that available context already answers.
- **Execute directly when precise and confirmed (`No holes → Execute directly`):** When intent and inputs are already unambiguous—and this is either a direct task or a delegated brief matching an agreement already confirmed in this session—skip pausing and go straight to Section 4.
- **Confirm a precise but unconfirmed specification (`Confirm → Stop or return`):** For an explicit `"am I clear?"` check or a new unconfirmed delegated brief with no unresolved holes, restate the exact specification concisely, pause with a direct `?` question to confirm the plan, brief, scope, or approach, and handle the reply in Section 3.
- **Clarify underspecified intent (`Clarify`):** Confirm unresolved consequential choices before acting by running the compact clarification pause in Section 2 whenever holes, vagueness, or conflicts remain.

## 2. Clarify unresolved choices in one compact pause

- Keep any clarification pause compact (under 400 words total) and scannable, skip settled points, and present workspace facts and concrete tradeoffs before asking the user to choose:
  - **Intent as understood:** restate plainly what the user wants to achieve.
  - **Holes, vagueness, and assumptions:** name what is vague, missing, or contradictory, critique flawed framing respectfully, separate stated, hidden, and agent-invented assumptions, and explain why different choices change the outcome.
  - **Facts for an informed decision:** supply concrete findings, constraints, and comparisons from the inspected workspace, distinguishing workspace facts from inputs only the user knows.
  - **Concrete options and recommendation:** narrow open-ended possibilities into a few concrete options showing the tradeoffs and what each changes, and recommend one grounded option with reasons and evidence.
  - **Specify and confirm:** ask only for priorities, domain facts, or scope choices that only the user can decide, offering concrete options rather than open-ended prompts, and close any pause with one concise direct `?` question that names the plan, brief, scope, or approach to confirm.

## 3. Resolve follow-up replies

- **If the user says `"I don't know yet"` or remains unsure (`Reframe with example`):** switch from abstract definitions to a concrete example or a smaller consequence-linked choice, then ask to confirm that narrower choice.
- **If the reply revises the framing and leaves a new consequential gap:** repeat the Section 1 comparison on the updated intent before acting.
- **If the reply specifies and authorizes the scope in the same turn:** proceed directly to Section 4 without asking for a second confirmation.
- Consult [tutorials.md](tutorials.md) for short worked examples of each decision branch (`Clarify → Reframe with example → Execute`, `No holes → Execute directly`, and `Clarify → Confirm → Stop or return`).

## 4. Deliver by mode and stop

- **Clarification-only request:** output the confirmed precise specification and stop without modifying files or executing downstream work.
- **Delegated workflow brief:** return the confirmed brief to the calling workflow and stop this skill so the caller continues.
- **Direct task:** execute the confirmed work, verify the result, state the confirmed assumptions and reasons, and stop once the agreed scope is complete.

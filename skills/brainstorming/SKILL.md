---
name: brainstorming
description: Work through a hard scientific problem with the researcher until a solution and its reasoning are agreed in conversation. Ask why, investigate the project and the literature, separate facts from open uncertainties and decisions, and recommend an approach with its rationale. Use when the researcher says "let's figure it out", "brainstorm", or "grill me", or asks to think a hard problem, plan, or puzzling result through. Do not use for an ordinary request that one clarification settles, and do not carry out the agreed work.
---

# Brainstorming

- Help the researcher find a solution to a hard scientific problem through conversation: learn why they want it, establish what is known, and reason to an approach they understand and agree with.
- Activate when the researcher says `"let's figure it out"`, `"brainstorm"`, or `"grill me"`, or asks to think a hard problem, a plan, or a puzzling result through.
- Use `lets-be-clear` instead for an ordinary request that one clarification pause settles.
- Keep this a conversation: create no plan, contract, or note file, modify no project file, and stop at the confirmed agreement. Carrying out the agreed work is a separate request; when the researcher asks to keep the reasoning, record it in the model document through `model-documentation`.
- Never invent results, parameter values, citations, or the researcher's priorities, and mark every statement as stated by the researcher, found in a source, or proposed by the agent.

## 1. Look before asking

- Read what the researcher pointed to and the material it connects to (project files, notebooks, model code, derivations, data, and the earlier conversation) until you can explain how the relevant parts work today.
- Consult the literature and the standard treatment of the problem when the question depends on them, and cite the primary sources you use.
- Never ask what the project, the supplied material, or the conversation already answers, and do not reopen what the researcher has decided.

## 2. Echo the request and ask why

- Restate the request in your own words in about 200 words: what the researcher wants, the scientific question it serves, and what you found that bears on it.
- Say plainly when you found something that may change the request: a constraint, a conflict with a result or with the literature, or a simpler route.
- Then ask why, as one open question in the researcher's own terms with no options attached (for example, "What would you conclude, or do differently, if the stripes do not survive the noise?"). Their own words carry the intent; options offered too early steer the answer.
- Skip the question when the researcher has already stated the purpose.

## 3. Separate facts, open uncertainties, and decisions

- **Facts:** resolve everything that investigation can settle, and state each fact with its source (file, equation, figure, or citation). Never ask the researcher to choose a factual answer.
- **Open uncertainties:** name the empirical or technical questions that the available evidence does not settle. For each, state the strength of the evidence and the calculation, control, numerical check, or threshold that would settle it.
- **Decisions:** list the priorities, scope, acceptable cost, and scientific judgments that only the researcher can supply.

## 4. Find the blocking decision and surface assumptions

- Name the decision that changes the solution most, why it matters, and what each answer would change.
- Separate the assumptions the researcher stated, the assumptions the request implies, and the assumptions the agent would make.
- Critique the framing on specifics: point out omissions or contradictions and their consequences, without judging the person.
- Treat the following as ground to cover where relevant, never as a script to read out:
  - the scientific question and the hypothesis;
  - what counts as success, and what would count as failure even if the calculation runs (anti-goals);
  - the model assumptions and their range of validity;
  - the method and its numerical controls;
  - the evidence needed for verification and for physical validation;
  - the cost in time and computation.

## 5. Recommend with reasoning

- Explain the facts and concepts the researcher needs in order to judge the choice, pitched just above where they are.
- Give one recommended approach and its rationale, grounded in the facts and sources from Section 3.
- List the other approaches you considered, each with the reason it was not chosen. Drop the weak ones; do not present a menu of trade-offs.
- Offer a toy calculation or a small test run when it would settle a choice faster than discussion. Run it only when the researcher agrees, label it throwaway, and leave the project files unchanged.

## 6. Ask, play back, and repeat

- Ask a question only when different answers would change the solution and neither the project nor the conversation answers it. Otherwise state your call and its reason as a proposal the researcher can correct.
- Ask dependent questions in order, one at a time, and bundle only questions that are independent of each other.
- When the researcher says `"I don't know yet"`, keep helping: switch from the abstract question to a concrete example or a smaller decision tied to a consequence.
- Play back each part as soon as you understand it, in plain words, marking what the researcher said and what you propose, and ask what is wrong or missing.
- Return to Section 4 until no blocking decision remains.

## 7. Agree and stop

- State the agreement in the chat:
  - the solution and its reasoning;
  - the anti-goals;
  - the assumptions, and who made each;
  - the open uncertainties, each with the test that would settle it;
  - the decisions the researcher made, with their reasons.
- Ask the researcher to confirm the agreement with one direct question.
- Stop at the confirmed agreement. Do not write files, run the work, or hand the work to another skill unless the researcher asks.

## Red flags

- **"I will offer a menu of what they might want."** Options steer; ask why first.
- **"I will ask which value is correct."** Factual questions are investigated, not asked.
- **"The literature surely says so."** Cite the source, or list the point as an open uncertainty.
- **"I will fill in sensible defaults."** Say each one aloud as a proposal; a default the researcher never heard is one they could not reject.
- **"They said it sounds good."** Agreement covers only what was shown; state the full agreement before treating it as confirmed.
- **"The toy calculation works, so I will build on it."** It is throwaway; keeping it is a new request.
- **"I should explain the process first."** Ask the question; the process shows itself.

## Worked example and sources

- Read [tutorials.md](tutorials.md) for one problem followed through all seven sections.
- The conversation design is adapted from the Superpowers `brainstorming` skill by Jesse Vincent (MIT license); see the third-party notices of this collection.

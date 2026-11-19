# Building and Revising the Story Arc

- Use this reference in mode 3, after reviewing claims against results or when the researcher explicitly asks to build or revise `story_arc.md`.
- The researcher keeps authorship of the scientific argument; the story arc stays bounded by reviewed results.
- The paragraph-level `outline.md` belongs to `writing-process`, which builds it from a confirmed story arc. Claim Review reviews an outline on request but does not build or revise it.

## Contents

- [What the story arc is](#what-the-story-arc-is)
- [Inspect project files](#inspect-project-files)
- [Researcher authorship and discussion rounds](#researcher-authorship-and-discussion-rounds)
- [Early and pre-draft stages](#early-and-pre-draft-stages)
- [Building the story arc](#building-the-story-arc)
- [Revising from review findings](#revising-from-review-findings)
- [Completeness check](#completeness-check)

## What the story arc is

- **`story_arc.md` — working narrative ([story-arc-template.md](../assets/story-arc-template.md)):** the logical progression on which a paper or a talk will rest. Organize around the central theme and subthemes: how physical or biological questions, hypotheses, and results connect, why each step follows the previous one, and how they lead to a bounded conclusion.
- Keep competing progressions, open questions, and provisional claims visible, without manuscript sections, paragraph bullets, or full captions.
- A narrative step need not map one-to-one to a manuscript section or a slide. `writing-process` and any presentation workflow read the story arc and do not rewrite it.

## Inspect project files

- Read existing project files before asking the researcher to repeat details already recorded on disk:
  - `story_arc.md` and, if present, `outline.md` (to report disagreements, not to edit it);
  - `literature_review.md`, related-work notes, BibTeX files, and primary papers;
  - figure files, plotting scripts, and draft captions;
  - simulation summaries, derivations, lab notes, notebooks, tables, and manuscript drafts (`.md`, `.tex`, `.docx`, or PDF);
  - model code, parameter configurations, random seeds, and run records behind key computational claims.
- Initialize a missing `story_arc.md` from its template, leaving unconfirmed researcher choices marked `USER INPUT REQUIRED`.
- Examine the underlying figures, notebooks, simulations, and measurements directly, including negative, null, or contradictory findings, rather than polishing a selective storyline.
- Never overwrite an existing file without reading it and preserving the author's material.
- **When both `story_arc.md` and `outline.md` exist:** point out any disagreement in central theme, claims, physical logic, or figure order, and leave `outline.md` for `writing-process` to update.

## Researcher authorship and discussion rounds

- Hold brief scientific discussion rounds (two to four focused questions per round) whenever key inputs are unsettled, summarizing what is confirmed versus tentative before moving on:
  1. **Question and hypothesis:** the central scientific question, proposed physical or biological explanation, strongest result, and why it matters.
  2. **Available results:** which simulations, derivations, or measurements are finished, preliminary, negative, null, contradictory, or still planned, with controls and uncertainties.
  3. **Domain literature:** which primary papers or `literature_review.md` establish prior work, the open question, standard terminology, and the strongest competing mechanisms (marking missing literature `USER INPUT REQUIRED` or `UNKNOWN`).
  4. **Claim scope:** what the results establish on the `L0–L7` ladder—for instance, whether a model reproduces an observation, proves sufficiency within the model class, discriminates between mechanisms, or establishes experimental necessity.
  5. **Argument and figure sequence:** how each step advances the central claim, which figure is decisive, what belongs in supplementary material or another study, and which skeptical objection is most serious.
- You may sketch up to three candidate orderings of the results, labeled `agent-proposed` and compared by coverage, discriminating power, parsimony, and handling of caveats; wait for explicit confirmation before adopting one.
- Before finalizing `story_arc.md`, restate the question, central contribution, logical progression, and claim scope for the researcher's confirmation; leave unconfirmed points marked `USER INPUT REQUIRED`.

## Early and pre-draft stages

- **Early story arc:** organizes hypotheses, target figures, planned simulations or experiments, and open questions while work is underway; do not issue a readiness verdict at this stage.
- **Pre-draft story arc:** organizes completed results and bounded claims once the main evidence is in hand; ready for a mode 1 review and for `writing-process` to turn into an outline.

## Building the story arc

1. Inspect available project files and resolve open scientific choices in brief rounds.
2. Check available figures, simulations, derivations, and measurements against [scientific-rigor.md](scientific-rigor.md) without treating preliminary or planned runs as finished results; **pause narrative work whenever an unresolved scientific contradiction undermines a central claim**.
3. Summarize domain literature from supplied `literature_review.md` or primary papers, keeping literature motivation separate from the study's own evidence.
4. Record the researcher's question, hypothesis, strongest result, and intended contribution in their terms, confirming any newly proposed framing.
5. Connect all relevant results (including null, negative, and contradictory findings) to the central theme and subthemes, noting gaps or redundancies.
6. Map claims, supporting results, competing explanations, and discriminating predictions once the central line of reasoning is confirmed.
7. Give each main figure one clear evidentiary role and a bounded conclusion-style title.
8. State the strongest skeptical objection and the calculation, control, or narrower claim needed to address it.
9. Fill [story-arc-template.md](../assets/story-arc-template.md) only with researcher-confirmed reasoning and inspected results, keeping `USER INPUT REQUIRED` and `UNKNOWN` markers where needed.

## Revising from review findings

1. Start from agreed review points and confirm that `story_arc.md` is the file to update.
2. Preserve claim-status labels, `L0–L7` support bounds, and links to underlying figures, calculations, and data.
3. Make the smallest structural revisions that resolve essential logic or evidence gaps without presenting planned runs or experiments as completed.
4. Keep contradictory, null, and negative findings plus competing physical interpretations visible.
5. Record major reasoning changes, deferred questions, and discarded alternatives in the planning notes.
6. Report needed updates to `outline.md` or a draft without modifying them.
7. Re-check affected review areas, or run a full mode 1 review after a major change to the central argument.

## Completeness check

- `story_arc.md` is ready when its central theme, subthemes, and ordered steps express the researcher-confirmed argument, explain why each step follows physically and logically, and keep open choices explicit.
- Keep analytical notes—question and central contribution, literature gap, claim–evidence–alternative table, figure roles, `L0–L7` levels, strongest objection, missing work, limitations, contradictions, and reasoning choices—in the supporting-notes section of the story arc.

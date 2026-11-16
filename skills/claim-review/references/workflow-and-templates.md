# Organizing and Revising Reviewed Claims in Story Arcs and Outlines

Use these optional secondary-mode practices after reviewing claims against results—or when the researcher explicitly asks to revise or organize `story_arc.md` or `outline.md`—so the researcher retains ownership of the scientific argument, exploratory story sketches stay distinct from manuscript outlines, and every claim stays bounded by actual results.

## Contents

- [Distinguish the story arc from the paragraph-level outline](#distinguish-the-story-arc-from-the-paragraph-level-outline)
- [Inspect project files and roles](#inspect-project-files-and-roles)
- [Researcher ownership and discussion rounds](#researcher-ownership-and-discussion-rounds)
- [Whitesides outline components and early vs. pre-draft outlines](#whitesides-outline-components-and-early-vs-pre-draft-outlines)
- [Developing a narrative or outline](#developing-a-narrative-or-outline)
- [Revising from review findings](#revising-from-review-findings)
- [Completeness checks and supporting planning notes](#completeness-checks-and-supporting-planning-notes)

## Distinguish the story arc from the paragraph-level outline

Treat `story_arc.md` and `outline.md` as connected planning documents with distinct scopes:

- **`story_arc.md` — working narrative ([story-arc-template.md](../assets/story-arc-template.md)).** Work out the logical progression on which the paper's outline will rest. Organize around the central theme and subthemes: how physical or biological questions, hypotheses, and results connect, why each step follows the previous one, and how they lead to a bounded conclusion. Keep competing progressions, open questions, and provisional claims visible without requiring manuscript sections, paragraph-by-paragraph bullets, or full captions yet.
- **`outline.md` — paragraph-level manuscript outline ([outline-template.md](../assets/outline-template.md)).** Translate the confirmed progression into manuscript sections and subsections in their intended order. In the main body, write **one bullet per planned paragraph** stating that paragraph's main point, citing supporting calculations, simulations, or measurements on the same bullet where useful. Place each figure at its exact point in the argument with its number, bounded conclusion-style title, source file or explicit planned status, and draft caption describing panels, physical quantities, conditions, units, and statistical definitions (marking unknown details `UNKNOWN` rather than inventing them). Keep planning tables and notes separate from the manuscript outline itself.

A narrative step need not map one-to-one to a manuscript section. When both `story_arc.md` and `outline.md` exist, read both and point out any disagreement in central theme, claims, physical logic, or figure order; never overwrite either file silently or create an unrequested companion document.

## Inspect project files and roles

Read existing project files before asking the researcher to repeat details already recorded on disk:

- `outline.md` and `story_arc.md`
- `literature_review.md`, related-work notes, BibTeX files, and primary papers
- Figure files, plotting scripts, and draft captions
- Simulation summaries, derivations, lab notes, notebooks, tables, and manuscript drafts (`.md`, `.tex`, `.docx`, or PDF)
- Model code, parameter configurations, random seeds, and run records behind key computational claims

Follow these file conventions unless the researcher asks otherwise:

1. Treat `outline.md` as the primary paragraph-level manuscript plan when present; keep `story_arc.md` for exploring alternative lines of reasoning.
2. An outline request may proceed directly from a researcher-confirmed argument in conversation or existing notes without first creating `story_arc.md`.
3. Initialize a missing requested document from its matching template (`story_arc.md` for narrative brainstorming, `outline.md` for a paragraph-level outline), leaving unconfirmed researcher choices marked `USER INPUT REQUIRED`.
4. Examine the underlying figures, notebooks, simulations, and measurements directly, including negative, null, or contradictory findings, rather than polishing a selective storyline.
5. During a pre-draft critical review, stay strictly read-only; if the central argument or supporting results are missing, state what is absent and review only the available material unless the researcher asks to build the outline.
6. During a written-paper review, evaluate the supplied manuscript, figures, supplements, and any available source files while stating clearly which underlying data or code were inspected.

Never overwrite an existing file without reading it and preserving the author's material.

## Researcher ownership and discussion rounds

Hold brief scientific discussion rounds (two to four focused questions per round rather than a long questionnaire) whenever key inputs are unsettled, summarizing what is confirmed versus tentative before moving on:

1. **Question and hypothesis:** Ask for the central scientific question, proposed physical or biological explanation, strongest result, and why it matters.
2. **Available results:** Ask which simulations, derivations, or measurements are finished, preliminary, negative, null, contradictory, or still planned, along with controls and uncertainties.
3. **Domain literature:** Ask which primary papers or `literature_review.md` establish prior work, the open question, standard terminology, and strongest competing mechanisms (marking missing literature `USER INPUT REQUIRED` or `UNKNOWN` rather than guessing citations).
4. **Claim scope:** Ask what the results establish along the `L0–L7` support scale—for instance, whether a model reproduces an observation, proves sufficiency within the model class, discriminates between competing mechanisms, or establishes experimental necessity.
5. **Argument and figure sequence:** Ask how each step advances the central claim, which figure is decisive, what belongs in supplementary material or another study, and which skeptical objection is most serious.

You may sketch up to three candidate ways to connect or order the results, clearly labeled `agent-proposed` and compared by coverage, discriminating power, parsimony, and handling of caveats, waiting for explicit confirmation before adopting one.

Before finalizing `story_arc.md` or introducing new central claims in `outline.md`, restate the question, central contribution, logical progression, and claim scope for the researcher's confirmation; leave unconfirmed points marked `USER INPUT REQUIRED` (expanding an already confirmed narrative into `outline.md` does not require re-confirming unchanged claims).

## Whitesides outline components and early vs. pre-draft outlines

Following George M. Whitesides (2004), organize the outline around data, equations, and physical logic before writing full prose:

- The central question, proposed answer, hypotheses, and strongest competing explanations.
- Actual calculations, simulations, measurements, governing equations, figures, bounded conclusion-style figure titles, and each figure's evidentiary role.
- Manuscript section and subsection headings, one main-point bullet per planned paragraph, a structured abstract plan, and figures placed where they are discussed with draft captions.
- The specific conclusion supported by each result, how later claims depend on earlier ones, missing decisive tests, and explicit limits on what is claimed.

Distinguish two outline stages:

- **Early research outline:** Organizes hypotheses, target figures, planned simulations or experiments, and open questions while work is still underway; do not issue a pre-draft readiness verdict at this stage.
- **Pre-draft paper outline:** Organizes completed results and bounded claims once the main evidence is in hand; ready for a pre-draft critical review.

## Developing a narrative or outline

Work directly with the researcher in conversation by default:

1. Clarify whether the goal is a working narrative (`story_arc.md`) or a paragraph-level outline (`outline.md`), inspect available project files, and resolve open scientific choices in brief rounds.
2. Check available figures, simulations, derivations, and measurements against [scientific-rigor.md](scientific-rigor.md) without treating preliminary or planned runs as finished results; **pause narrative polishing or figure reordering whenever an unresolved scientific contradiction undermines a central claim**.
3. Summarize domain literature from supplied `literature_review.md` or primary papers, keeping literature motivation separate from the study's own evidence.
4. Record the researcher's question, hypothesis, strongest result, and intended contribution faithfully in their terms, confirming any newly proposed framing.
5. Connect all relevant results (including null, negative, and contradictory findings) to the central theme and subthemes, noting gaps or redundancies.
6. Offer up to three `agent-proposed` figure or argument orderings when helpful so the researcher can choose, adapt, or discard them.
7. Map claims, supporting results, competing explanations, and discriminating predictions once the central line of reasoning is confirmed.
8. Give each main figure one clear evidentiary role and a bounded conclusion-style title.
9. State the strongest skeptical objection and the calculation, control, or narrower claim needed to address it.
10. Fill [story-arc-template.md](../assets/story-arc-template.md) or [outline-template.md](../assets/outline-template.md) only with researcher-confirmed reasoning and inspected results, keeping `USER INPUT REQUIRED` and `UNKNOWN` markers where needed.

## Revising from review findings

1. Start from agreed review points and confirm which file (`story_arc.md`, `outline.md`, or an editable draft) the researcher wants updated, keeping its distinct role intact.
2. Preserve claim-status labels, `L0–L7` support bounds, and links to underlying figures, calculations, and data.
3. Make the smallest structural revisions that resolve essential logic or evidence gaps without presenting planned runs or experiments as completed.
4. Keep contradictory, null, and negative findings plus competing physical interpretations visible.
5. Record major reasoning changes, deferred questions, and discarded alternatives in the planning notes.
6. Check agreement between `story_arc.md` and `outline.md` when both exist, reporting needed updates in any file outside the authorized edit scope without modifying it.
7. Re-check affected review areas ([multi-agent-audit.md](multi-agent-audit.md)), or run a full review after a major change to the central argument.

## Completeness checks and supporting planning notes

- A `story_arc.md` working narrative is ready when its central theme, subthemes, and ordered steps express the researcher-confirmed argument, explain why each step follows physically and logically, and keep open choices explicit.
- An `outline.md` manuscript plan is ready when it turns the confirmed progression into section and subsection titles, one main-point bullet per planned paragraph, a structured abstract plan, and placed figures with draft captions; any remaining `USER INPUT REQUIRED` or `UNKNOWN` markers keep unfinished work visible rather than implying readiness to draft.
- Keep analytical notes—question and central contribution, literature gap, claim–evidence–alternative table, figure roles, `L0–L7` levels, strongest objection, missing work, limitations, contradictions, and reasoning choices—in the supporting-notes section rather than mixing them into manuscript headings.
- During a critical review, present findings using [claim-review-audit-template.md](../assets/claim-review-audit-template.md) without editing project files, saving `claim-review-audit.md` only when explicitly requested.

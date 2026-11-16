# Multi-Agent Claim and Argument Critical Review

Use this protocol to conduct a critical review of scientific claims against results—either for a pre-draft argument-and-results set or an already-written scientific paper. Keep this review venue-neutral: do not apply journal selection criteria, formatting rules, or acceptance predictions.

## Contents

- [Select one critical-review role](#select-one-critical-review-role)
- [Non-negotiable review behavior](#non-negotiable-review-behavior)
- [Prepare one neutral review briefing](#prepare-one-neutral-review-briefing)
- [Use one scoring vocabulary](#use-one-scoring-vocabulary)
- [Run specialist passes with exclusive rule ownership](#run-specialist-passes-with-exclusive-rule-ownership)
- [Run an independent scientific-integrity pass](#run-an-independent-scientific-integrity-pass)
- [Run an independent domain-grounding pass](#run-an-independent-domain-grounding-pass)
- [Common internal finding format](#common-internal-finding-format)
- [Prevent duplicate work and context leakage](#prevent-duplicate-work-and-context-leakage)
- [Perform one final synthesis pass](#perform-one-final-synthesis-pass)
- [Fallback when subagents are unavailable](#fallback-when-subagents-are-unavailable)

## Select one critical-review role

Declare the selected review role and evidence boundary at the start of every critical review. Never blend the two roles into one ambiguous verdict.

### Role 1: Pre-draft evidence-and-argument review

Review `story_arc.md` or `outline.md` together with available figures, calculations, simulation outputs, measurements, and notes before manuscript prose exists.

- Require three prerequisites before issuing a readiness verdict: (1) a user-authored or explicitly user-confirmed central argument, (2) a substantive completed result set—either one strong central result with its critical controls and uncertainty or several mature results with documented relationships—and (3) primary papers or an existing `literature_review.md` sufficient to establish field context and strongest competing alternative hypotheses.
- Test whether the proposed argument is scientifically supportable, complete enough to draft, and faithful to all known results.
- Cross-check every central claim, figure's evidentiary role, prediction, and explicit nonclaim against the underlying figures, calculations, simulations, measurements, captions, tables, or notes.
- Surface omitted negative, null, contradictory, and preliminary results; unsupported causal steps; unfair model comparisons; and missing decisive tests.
- Evaluate all ten Mensh and Kording structural rules at the supplied document's level: central theme, subthemes, and logical progression for `story_arc.md` (assessing context, evidence, and conclusion functions without requiring manuscript sections, paragraph bullets, or captions); section, paragraph, structured abstract plan, and placed-figure structure for `outline.md` (assessing planned section structures rather than requiring finished prose).
- Report `ready to draft`, `ready only with bounded claims`, or `not ready to draft` with evidence-linked reasons (a draft-readiness verdict, never an impact or acceptance score).
- Never invent a storyline from the results: if the researcher has not supplied one or the result set is too immature to test it, state `pre-draft review not started`, identify the missing prerequisites, and enter the guided clarification dialogue only with the user's agreement; never review `story_arc.md` in isolation when figures, calculations, or result files are available.

### Role 2: Written-paper critical review

Review an already-written draft, manuscript, preprint, or published paper without editing it.

- Test whether the written claims, figures, section logic, limitations, and conclusions are internally coherent and proportionate to the reported evidence.
- Test whether the reported results form one strong, self-contained scientific argument: the paper must supply the definitions, methods context, evidence chain, limitations, and reasoning needed to understand its central conclusion without relying on unstated author knowledge.
- When underlying figures, calculations, simulation outputs, or project files are available, cross-check the manuscript against them to identify omitted contradictions, claim drift, or provenance mismatches.
- When only the paper is provided, evaluate what the paper itself reports, mark underlying data provenance and unreported analyses as `not independently verified`, never infer whether unavailable evidence existed, and distinguish `not reported in the paper`, `reported but insufficient`, and `cannot assess without source files`.
- Treat the paper's reference list as an initial domain corpus rather than a verified literature review: check central citations or supplied `literature_review.md` before judging the gap, novelty, significance, or strongest competing alternative hypotheses, and label uninspected citation support `author-cited, not source-verified`.
- Treat publication status, journal prestige, citation count, and persuasive prose as irrelevant to scientific validity; enter Revise mode only when the user separately authorizes changes to an editable draft.

## Non-negotiable review behavior

- Treat Critical Review mode as strictly read-only. Do not edit, rename, reformat, or overwrite project files. Return the consolidated review in the response; create `claim-review-audit.md` only when the user explicitly requests a saved report file.
- Evaluate only evidence present in the supplied manuscripts, outlines, or figures. Label absent information `not assessable`; do not invent results, controls, citations, feedback, or author intent.
- Treat the central line of reasoning as user-authored or paper-presented. Independent scientific reviewers may test it but must not replace it with a storyline inferred from the results.
- Require a substantive completed result set and a user-authored or user-confirmed argument before issuing a pre-draft readiness verdict.
- Bound field-level judgments by supplied or verified primary literature. Do not infer novelty, significance, consensus, or competing hypotheses from memory alone.
- Distinguish an author's proposed interpretation from a finding directly observed in supplied files and from an independently verified result.
- Cite the exact source file, section, or figure for every substantive finding along with its scientific consequence and concrete action.
- Assess all ten Mensh-Kording rules individually. Do not replace individual judgments with an overall impression or a single total score.
- Keep the independent scientific-integrity reviewer separate from the structural specialists.
- Emit one user-facing report: the final synthesis. Specialist outputs are internal inputs, not separate reports.

## Prepare one neutral review briefing

The coordinator first builds an immutable briefing shared with every independent scientific reviewer:

1. State the review role, user's request, and intended audience without suggesting a verdict.
2. Assign each supplied input an ID such as `A1`, `A2`, and `A3`.
3. Record each supplied file's path and type: outline, story arc, figure, caption, result summary, draft, methods note, or feedback record.
4. Identify the document type and stage. A story arc develops the central theme, subthemes, and logical progression; an outline translates that progression into a paragraph-level manuscript outline. A missing abstract in an early story arc is not equivalent to a failed abstract. Section titles, paragraph bullets, and figure captions are required for a detailed outline, not for a story arc.
5. Define clear source references: `path:line`, section or heading, page, figure and panel, table row, or notebook cell.
6. Record argument ownership as `user-authored`, `user-confirmed`, `paper-presented`, or `missing`; include the supplied argument as a labeled input, not as the expected verdict.
7. Record the evidence boundary and literature boundary separately.
8. Assign input IDs to primary papers, `literature_review.md`, and reference lists used for domain grounding.
9. For Role 1 pre-draft reviews, record whether the completed evidence set contains either one strong central result with critical controls and uncertainty or several mature, linked results. Withhold readiness when it contains only plans or unbounded preliminary observations.

Do not include earlier diagnoses, target scores, another reviewer's findings, or a model answer in a specialist's briefing. Give reviewers only the supplied files needed for their assigned pass. When figures or tables are referenced but unavailable, record that limitation instead of inferring their contents.

## Use one scoring vocabulary

Score each rule independently:

- `3 — strong`: explicit, coherent, and supported at the document's current stage.
- `2 — partial`: present and useful, but incomplete or locally inconsistent.
- `1 — weak`: implied or asserted, with substantial structural or evidentiary gaps.
- `0 — absent/contradicted`: required function is missing or the document works against it.
- `NA — not assessable`: the supplied stage or evidence does not expose the rule.

Add `high`, `medium`, or `low` confidence. Do not average `NA` values or compute a total impact score. Rule 9 and Rule 10 often require process evidence; never infer process quality from polished prose alone.

## Run specialist passes with exclusive rule ownership

Run the passes in parallel where capacity allows. If capacity is limited, run them in waves while preserving context isolation. Each specialist returns only rule cards for its owned rules and atomic findings in the common finding format below.

### Pass A — Central argument and flow

Own exactly these rules:

- **Rule 1:** Focus the paper on one central contribution and communicate it through the working title or title concept.
- **Rule 3:** Use context-content-conclusion at the document, section, and available paragraph scales.
- **Rule 4:** Maintain logical flow by avoiding zig-zag organization and using consistent parallel structure and terminology.

Check whether the argument can be restated as one contribution, whether every major branch advances it, and whether the sequence follows scientific logic rather than research chronology.

### Pass B — Reader and section promises

Own exactly these rules:

- **Rule 2:** Write for real readers who do not already know the project.
- **Rule 5:** Make the abstract, or structured abstract plan, tell a complete context-content-conclusion story.
- **Rule 6:** Make the introduction, or introduction plan, establish why the problem and gap matter.

Check assumed knowledge, unexplained terms, the gap-to-contribution bridge, and whether abstract and introduction promises match the evidence available later. For an outline, assess planned section functions when full prose does not yet exist. For a story arc, assess those logical functions within the overall progression without requiring a division into manuscript sections.

### Pass C — Results and discussion structure

Own exactly these rules:

- **Rule 7:** Present results as a logical sequence of declarative claims supported by figures or other evidence that culminates in the central contribution.
- **Rule 8:** Explain how the gap was filled, bound the interpretation with limitations, and establish relevance to the field.

Evaluate communication structure, not underlying truth. Map result statements to figures and map discussion claims back to results. Leave causal validity, statistical sufficiency, and data integrity to the independent scientific-integrity pass.

### Pass D — Construction and feedback process

Own exactly these rules:

- **Rule 9:** Allocate effort to the title, abstract, figures, and outline, and give each planned unit a defined evidentiary role.
- **Rule 10:** Use feedback to simplify, reuse, and retest the argument rather than preserving unnecessary material.

For a story arc, check whether the subthemes develop the central theme and whether each logical step prepares for the next; do not equate narrative steps with manuscript sections. For a detailed outline, check how the chosen progression becomes section/subsection titles, one main-point bullet per planned main-body paragraph, and figures placed in the argument with conclusion-led titles and draft captions. Assess revision history, explicit feedback, or recorded argument tests when supplied. Use `NA` when process evidence was not supplied. Do not penalize an author merely for omitting private process records.

## Run an independent scientific-integrity pass

Give this independent scientific reviewer the neutral review briefing but none of the specialist outputs. This pass does not score Rules 1–10 and does not review style. It independently reconstructs the main claim and checks:

- whether each key claim is supported by a located result;
- whether causal language exceeds correlational or model-based evidence on the `L0–L7` claim-support ladder;
- whether strongest competing alternative hypotheses, experimental or imaging artifacts, and discriminating controls are addressed;
- whether uncertainty, sample limitations, robustness, boundary conditions, and negative results are represented fairly;
- whether experiments, simulations, and theory are connected without circular validation;
- whether predictions are genuinely prospective or merely restatements of fitted observations;
- whether reported methods, data, code, and provenance are sufficient to evaluate reproducibility at the supplied stage;
- whether supplied files contradict one another or silently change definitions, populations, parameters, or endpoints.

Return integrity findings with IDs `SI-01`, `SI-02`, and so on. Mark evidence as `author-reported`, `directly observed in supplied files`, or `independently verified`; normally the first two are available in a workspace review. Do not perform a literature novelty review unless separately requested.

## Run an independent domain-grounding pass

Give this independent scientific reviewer the user-supplied primary papers, existing `literature_review.md`, or the written paper's references and verified central sources. Do not give it the structural verdicts. Use strong scientific reasoning for interpretation; lower-cost support may locate or extract sources but must not decide scientific meaning or final claims.

Check:

- whether the stated baseline and unresolved gap are supported by the supplied domain literature summary or primary references;
- whether terminology and mechanism names match established usage;
- whether the strongest competing alternative hypotheses are represented rather than omitted for narrative convenience;
- whether novelty, importance, and generality claims exceed the literature boundary;
- whether central citations actually support the propositions attributed to them;
- whether the project's own results are improperly replaced by literature evidence.

Return findings with IDs `DG-01`, `DG-02`, and so on. Label citation support `source-verified`, `author-cited, not source-verified`, or `not assessable`. This is a bounded domain-grounding review, not an exhaustive novelty search. If supplied `literature_review.md` or domain references in the workspace are missing or inadequate, flag the missing domain literature explicitly as `USER INPUT REQUIRED` or `UNKNOWN` and ask the researcher to provide primary sources rather than inventing novelty or citations from memory.

## Common internal finding format

Use this compact finding format so the synthesizer can merge findings without rewriting whole reports:

```text
ID: R7-01, SI-01, or DG-01
Rule: R1-R10, Scientific integrity, or Domain grounding
Score: 0-3 or NA (omit for scientific-integrity findings)
Confidence: high | medium | low
Priority: essential | strengthening | optional
Evidence: [A2] path:line or section/figure/panel
Observation: one falsifiable description of what the supplied file shows
Consequence: why this affects comprehension or claim validity
Action: one concrete, bounded next step
Cross-links: optional IDs only
```

Keep one issue per finding. Do not quote long passages. Missing source references lower confidence and must be disclosed.

## Prevent duplicate work and context leakage

- Assign each rule to exactly one specialist; other specialists may cross-link but must not rescore it.
- Keep scientific-integrity findings separate from Rule 7 structural findings. If both concern the same claim, cross-link them instead of copying the diagnosis.
- Keep domain-grounding findings separate from project-evidence findings. A source can support the field context without supporting the project's mechanism.
- Do not let specialists see each other's outputs before submitting their own.
- Do not ask reviewers to confirm a suspected flaw or preferred storyline.
- Exchange internal results through agent responses, not shared report files in the reviewed project.
- Define duplicates as findings with the same evidence, failure mechanism, and recommended action. The synthesizer keeps the clearest finding and preserves the other IDs as cross-links.
- Allow disagreement when evidence is ambiguous. Record the competing interpretations and the missing observation that would resolve them; do not settle conflicts by majority vote.

## Perform one final synthesis pass

The synthesizer receives the neutral review briefing and all completed internal outputs. It must:

1. Verify exact coverage of `R1` through `R10`; request a missing rule card or mark it `NA` with a reason.
2. Check that every score has evidence and that every finding follows the common finding format.
3. Deduplicate findings and cross-link structural and integrity concerns.
4. Reconcile inconsistent scores by returning to the cited source file, not by averaging reviewers.
5. Restate only the user-authored, user-confirmed, or paper-presented argument. If argument ownership is missing, do not synthesize one from the results.
6. Prioritize scientific-validity and central-logic gaps before section polish or process suggestions.
7. Separate evidence-required actions from optional strengthening and presentation polish.
8. Reconcile project evidence with the domain-grounding findings without treating citations as project results.
9. Produce exactly one report using [claim-review-audit-template.md](../assets/claim-review-audit-template.md).
10. State which passes ran, any degraded-independence fallback, and all material limitations.

Keep the default report compact: retain at most seven consolidated findings unless additional independent issues are essential. State a hard red flag fully once, then use its ID elsewhere instead of repeating the diagnosis in the scorecard, integrity verdict, register, and action plan. Preserve all ten rule scores even when only the highest-leverage corrective findings are expanded.

The synthesizer may tighten wording and ordering but must not silently strengthen claims, convert `NA` to failure, or apply journal-specific standards.

## Fallback when subagents are unavailable

Run the same six reviews sequentially in the main agent:

1. Freeze the neutral review briefing before reviewing.
2. Complete Passes A-D in separate note blocks with exclusive rule ownership.
3. Start the scientific-integrity and domain-grounding passes independently from the neutral review briefing, without reading the structural conclusions from the earlier note blocks.
4. Only after all six passes are complete, open the outputs together and synthesize them.
5. Discard internal duplicate notes after producing the single final report.
6. Disclose: `Independent subagents were unavailable; passes were separated sequentially, so reviewer independence is reduced.`

If only some subagents are available, preserve the same pass boundaries and give one reviewer multiple unopened passes sequentially. Never skip a rule merely because parallel capacity is unavailable.

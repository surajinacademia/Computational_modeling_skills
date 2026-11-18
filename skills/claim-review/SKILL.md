---
name: claim-review
description: Critically review and critique scientific claims against their actual results, calculations, simulations, figures, controls, and literature so claims are rigorous and bounded in scope. Use to review a researcher's own claims, review a published paper or preprint, or organize reviewed claims into a working story arc. Do not ghostwrite manuscripts, build paragraph-level outlines, invent evidence, or infer novelty or significance without domain literature.
---

# Claim Review

- Test whether each scientific claim is supported by the results, methods, and literature behind it, so every claim matches the strength of its evidence.
- Treat every claim as `untested` until the result that supports it has been located and inspected.
- Do not predict journal acceptance or citation impact, and do not draft manuscript prose.

## Choose the mode

- State the mode upfront. Modes 1 and 2 are read-only unless the user authorizes an edit.
  - **1. Review my claims (default):** test the researcher's claims, figure titles, `story_arc.md`, `outline.md`, or draft against the project's own figures, calculations, simulations, notebooks, measurements, and the literature already in the project. **If the user authorizes it:** narrow overstated claims in the named file, adding explicit scope and nonclaims and recording discarded alternatives.
  - **2. Review a paper:** test whether a published paper's or preprint's claims are supported by the results it presents, and list what the authors did not check or control.
  - **3. Build the story arc:** after a mode 1 review, or when explicitly requested, arrange reviewed claims into `story_arc.md` ([story-arc-template.md](assets/story-arc-template.md)), keeping planned work distinct from completed results.
- **Hand on, do not absorb:** the paragraph-level `outline.md` and manuscript prose belong to `writing-process`; essential gaps that need a new calculation, control, or run go to the modeling or analysis work (`computational-modeling` for models); a gap that changes the research question goes back to the researcher as a scope decision.

## Read only what the mode needs

- **Always:** [scientific-rigor.md](references/scientific-rigor.md) for the `L0–L7` claim-support ladder, claim-status labels, alternative explanations, calibration versus independent validation evidence, robustness, reproducibility, and hard red flags.
- **When subagents will run:** [multi-agent-audit.md](references/multi-agent-audit.md) for review roles, neutral briefings, specialist passes, and synthesis. In a single-agent review, run the checks below in order and label the result `self-review`.
- **When paper or `story_arc.md` structure is under review:** [ten-rules-whitesides.md](references/ten-rules-whitesides.md) for Mensh and Kording's rules `R1–R10` and Whitesides's outline discipline.
- **When comparing discriminating control designs:** [biophysics-exemplars.md](references/biophysics-exemplars.md).
- **In mode 3:** [workflow-and-templates.md](references/workflow-and-templates.md) for building and revising `story_arc.md`.
- **When the user asks to save the review:** fill [claim-review-audit-template.md](assets/claim-review-audit-template.md) as `claim-review-audit.md`; otherwise report findings in the conversation in the format under "Report and stop".

## 1. Map every claim to inspected results and provenance

- Inspect supplied claims alongside existing project files (`story_arc.md`, `outline.md`, `literature_review.md`, primary references, figures, captions, notebooks, derivations, simulation summaries, and manuscript files) before asking the researcher to repeat available context.
- Account for all relevant outcomes—positive, null, negative, contradictory, preliminary, and planned—and label each piece of evidence `author-reported`, `directly observed in supplied files`, or `independently verified`.
- Separate evidence used to formulate, calibrate, or fit a model or hypothesis from independent or held-out validation evidence (`new condition`, `new observable`, `new regime`, or `independent replicate`).
- **In mode 2, or without raw data or code:** evaluate what the paper itself reports, state that raw provenance was `not independently verified`, and distinguish `not reported in the paper`, `reported but insufficient`, and `cannot assess without source files`.

## 2. Check methods, internal consistency, and terminology

- **Computed results:** a claim that rests on a simulation or numerical calculation must cite its code verification and solution verification; without them, cap its status at `suggestive`. A claim about the physical or biological system also needs physical validation against independent observations.
- **Internal consistency:** cross-check central numbers, units, sample counts ($n$), and conditions between text, figures, captions, tables, and methods; check that one quantity keeps one symbol and one name. **When data or code are available:** recompute at least one central number from them.
- **Methodology:** check that the method can answer the question as posed: controls, experimental unit and replication, statistics appropriate to the dependence structure, and parameter identifiability for fitted models.
- **Terminology:** check that terms, quantities, and mechanism names match established usage in the supplied literature and the project glossary, and flag a term used in two senses.

## 3. Calibrate claim strength, scope, and explicit nonclaims

- Place each headline, figure-title, and paragraph-level claim at the highest rung actually justified on `L0–L7` and assign one status: `demonstrated within scope`, `supported`, `consistent with`, `suggestive`, `untested`, or `contradicted`.
- Enforce strict scoping boundaries: mechanistic sufficiency in a mathematical or computational model (`L4`) never establishes biological necessity (`L5`) or uniqueness (`a mechanism`, not `the mechanism`), and a strong result in one cell type, parameter regime, or geometry never establishes generality (`L7`) without cross-regime evidence.
- Pair every narrowed or bounded claim with its explicit scope (`for this parameter range, geometry, or experimental system`) and explicit nonclaims (`therefore we do not claim...`).

## 4. Stress-test against alternatives, controls, and literature

- Formulate the strongest competing physical, biological, numerical, or experimental explanations for each central result—including discretization or convergence error, parameter non-identifiability, model flexibility, selection or batch effects, pseudoreplication, and imaging or measurement artifacts.
- For each central claim, name the strongest supplied prior result that disagrees with it, or state that none was found in the supplied literature.
- Classify each unresolved gap as `essential` (blocks or invalidates the claim as written), `strengthening` (improves discrimination, robustness, or precision), or `optional` (not required for the bounded claim), and pair each gap with the cheapest decisive resolution (`new control or check`, `narrow claim`, `reframe`, `remove`, or `disclose`).
- Stop narrative work whenever a hard red flag or unresolved contradiction undermines a central claim; state the conflict directly and specify the calculation, control, or narrower claim required to resolve it.

## 5. Ground domain context and authorship

- Keep published domain literature distinct from the study's own results: supplied primary papers or `literature_review.md` establish baseline knowledge, standard terminology, and competing hypotheses, whereas only the study's own calculations, simulations, or experiments support its empirical or theoretical claims.
- Never guess novelty, field consensus, or citations from memory; mark uninspected citations `author-cited, not source-verified` and leave missing literature or unconfirmed author choices marked `USER INPUT REQUIRED` or `UNKNOWN` (use `lets-be-clear` when an unresolved scope choice blocks the review).
- Treat the scientific question, hypothesis, and central argument as the researcher's own: test and bound them rather than inventing a replacement storyline from results alone.
- **Before drafting starts:** withhold a readiness verdict (`ready to draft`, `ready only with bounded claims`, or `not ready to draft`) unless a confirmed argument, substantive completed results, and domain literature are all present; otherwise state `pre-draft review not started`.
- **When structure is reviewed:** score Mensh and Kording's rules `R1–R10` individually (`3` strong, `2` partial, `1` weak, `0` absent/contradicted, `NA` not assessable) without collapsing them into a single total.

## Report and stop

- **Report order:** claim-invalidating findings and hard red flags first, then essential gaps, then strengthening items; list at most three optional items, and do not pad the report with praise.
- **Each finding states:** the exact passage, figure, or file; the claim; the evidence problem and `L0–L7` mismatch; its priority; the scientific consequence; and the concrete scoping or evidence fix.
- **Modes 1 and 2:** confirm that no project file was modified (except an authorized claim edit or a requested `claim-review-audit.md`), and state the review role, evidence boundary, literature boundary, argument authorship, and any self-review limitation upfront.
- **Mode 3:** confirm that only `story_arc.md` was created or updated, existing author text was preserved, every claim matches its reviewed `L0–L7` level and scope, negative or contradictory results and discarded storylines remain visible, and `USER INPUT REQUIRED` / `UNKNOWN` markers stay where unresolved.
- Once the review or the one authorized edit is delivered with these checks, stop without drafting manuscript prose or starting further analyses.
- Credit Brett Mensh and Konrad Kording (2017) and George M. Whitesides (2004) when explaining structural principles, paraphrasing rather than quoting at length.

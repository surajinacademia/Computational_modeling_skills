---
name: claim-review
description: Critically review and critique a researcher's scientific claims against their actual results, calculations, simulations, figures, and controls so claims are rigorous and bounded in scope. Optionally revise overstated claims or organize reviewed claims into a working story arc or paragraph-level outline when requested. Do not ghostwrite full manuscripts, invent evidence, or infer novelty or significance without domain literature.
---

# Claim Review

Critique and scope a researcher's scientific claims against their actual results, derivations, simulations, figures, and controls so every claim matches the strength of its evidence, without predicting journal acceptance or citation impact.

## Choose the Mode

State upfront whether you are conducting a read-only claim review (default), revising claims of a published paper or organizing reviewed claims into an outline:

- **Critique claims against results (primary, read-only default):** Evaluate a draft, preprint, published paper, its data, `story_arc.md`, or `outline.md` against the underlying figures, calculations, simulations, notebooks, tables, and measurements using [claim-review-audit-template.md](assets/claim-review-audit-template.md), modifying zero project files unless the user explicitly asks to save `claim-review-audit.md`.
- **Revise and scope claims (optional, after review):** Narrow overstated figure titles, abstract or discussion claims, or outline points in a user-authorized file to match verified evidence, adding explicit regime bounds and nonclaims while recording discarded alternatives.
- **Organize reviewed claims into `story_arc.md` or `outline.md` (optional secondary mode):** After reviewing claims against results—or when explicitly requested—build or update a working narrative (`story_arc.md`, [story-arc-template.md](assets/story-arc-template.md)) or paragraph-level outline (`outline.md`, [outline-template.md](assets/outline-template.md)), keeping planned runs or experiments distinct from completed results and handing staged prose drafting off to `writing-process`.

## Reference Guides

- **Before any review or scoping task:** read [scientific-rigor.md](references/scientific-rigor.md) for the `L0–L7` claim-support ladder (`L0` observation, `L1` association or difference, `L2` predictive relation, `L3` mechanistic consistency, `L4` sufficiency, `L5` necessity, `L6` causal mechanism, and `L7` generality), claim-status labels, competing explanations, held-out versus fitted evidence, and hard red flags.
- **Before running a full critical review:** read [multi-agent-audit.md](references/multi-agent-audit.md) for pre-draft versus written-paper review roles, neutral reviewer briefings, independent scientific-integrity, domain-grounding, and structural passes, and sequential fallback.
- **Before assessing paper or outline structure:** read [ten-rules-whitesides.md](references/ten-rules-whitesides.md) for Mensh and Kording's ten structural rules (`R1–R10`) and George M. Whitesides's data-and-equation outline discipline, and consult [biophysics-exemplars.md](references/biophysics-exemplars.md) when comparing discriminating control designs across theory, simulation, and experiment.
- **Before building or revising `story_arc.md` or `outline.md`:** read [workflow-and-templates.md](references/workflow-and-templates.md) for working-narrative versus paragraph-outline scope, brief discussion rounds, and revision checks.

## How to Critique and Scope Claims Against Results

### 1. Map Every Claim to Inspected Results and Provenance

- Inspect supplied claims alongside existing project files (`outline.md`, `story_arc.md`, `literature_review.md`, primary references, figures, captions, notebooks, derivations, simulation summaries, and manuscript files) before asking the researcher to repeat available context.
- Account for all relevant outcomes—positive, null, negative, contradictory, preliminary, and planned—and label each piece of evidence `author-reported`, `directly observed in supplied files`, or `independently verified`.
- Separate evidence used to formulate, calibrate, or fit a model or hypothesis from held-out or independent predictions (`new condition`, `new observable`, `new regime`, or `independent replicate`).
- When reviewing a standalone manuscript without raw data or code, evaluate what the paper itself reports, state that raw provenance was `not independently verified`, and distinguish `not reported in the paper`, `reported but insufficient`, and `cannot assess without source files`.

### 2. Calibrate Claim Strength, Scope, and Explicit Nonclaims

- Place each headline, figure-title, and paragraph-level claim at the highest rung actually justified on `L0–L7` and assign one status: `demonstrated within scope`, `supported`, `consistent with`, `suggestive`, `untested`, or `contradicted`.
- Enforce strict scoping boundaries: mechanistic sufficiency in a mathematical or computational model (`L4`) never establishes biological necessity (`L5`) or uniqueness (`a mechanism`, not `the mechanism`), and a strong result in one cell type, parameter regime, or geometry never establishes generality (`L7`) without cross-regime evidence.
- Pair every narrowed or bounded claim with its explicit scope (`for this parameter range, geometry, or experimental system`) and explicit nonclaims (`therefore we do not claim...`).

### 3. Stress-Test Against Competing Explanations and Controls

- Formulate the strongest competing physical, biological, numerical, or experimental explanations for each central result—including discretization or convergence error, parameter non-identifiability, model flexibility, selection or batch effects, pseudoreplication, and imaging or measurement artifacts.
- Classify each unresolved evidence or control gap by its impact on claim validity as `essential` (blocks or invalidates the claim as written), `strengthening` (improves discrimination, robustness, or precision), or `optional` (useful extension not required for the bounded claim), and pair each gap with its concrete resolution (`new control or check`, `narrow claim`, `reframe`, `remove`, or `disclose`).
- Stop narrative polishing or figure reordering whenever a hard red flag or unresolved contradiction undermines a central claim; state the conflict directly and specify the calculation, control, or narrower claim required to resolve it.

### 4. Ground Domain Context, Ownership, and Argument Structure

- Keep published domain literature distinct from the study's own results: supplied primary papers or `literature_review.md` establish baseline knowledge, standard terminology, and competing hypotheses, whereas only the study's own calculations, simulations, or experiments support its empirical or theoretical claims.
- Never guess novelty, field consensus, or citations from memory; mark uninspected citations `author-cited, not source-verified` and leave missing literature or unconfirmed author choices marked `USER INPUT REQUIRED` or `UNKNOWN` (use `lets-be-clear` when an unresolved scope choice blocks the review or revision).
- Treat the scientific question, physical or biological hypothesis, and central argument as the researcher's own—test and bound them rather than inventing a replacement storyline from results alone—and withhold a pre-draft readiness verdict (`ready to draft`, `ready only with bounded claims`, or `not ready to draft`) unless a confirmed argument, substantive completed results, and domain literature are all present (otherwise state `pre-draft review not started`).
- Score Mensh and Kording's rules `R1–R10` individually (`3` strong, `2` partial, `1` weak, `0` absent/contradicted, `NA` not assessable) at the document's stage without collapsing them into a single total score.

## Final Checks and Attribution

- **Read-only review check:** Confirm that zero project files were modified (saving `claim-review-audit.md` only when explicitly requested), state the review role, evidence boundary, literature boundary, argument ownership, and any sequential-review limitation upfront, and tie every substantive critique to its exact passage, figure, or file reference, `L0–L7` mismatch, priority, scientific consequence, and concrete scoping or evidence fix.
- **Secondary revision or outline check:** Confirm that only the user-authorized file (`story_arc.md`, `outline.md`, or editable draft) was created or updated, existing author text was preserved, every claim matches its verified `L0–L7` level and scope bounds, negative or contradictory results and discarded storylines remain visible, and `USER INPUT REQUIRED` / `UNKNOWN` markers stay intact where unresolved.
- Credit Brett Mensh and Konrad Kording (2017) and George M. Whitesides (2004) when explaining structural or outlining principles, paraphrasing rather than quoting at length.

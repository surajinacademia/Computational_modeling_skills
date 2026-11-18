# Scientific Rigor and Evidential Standards

Use these evidential standards before refining an outline, figure sequence, or target-journal framing. Grade the evidence independently of how attractive a storyline is or where it may be submitted.

## Contents

- [Core rule: evidence before story](#core-rule-evidence-before-story)
- [Recording results and provenance](#1-recording-results-and-provenance)
- [Claim-status labels](#2-claim-status-labels)
- [Claim ladder](#3-claim-ladder)
- [Alternative explanations](#4-alternative-explanations)
- [Held-out and independent tests](#5-held-out-and-independent-tests)
- [Robustness](#6-robustness)
- [Reproducibility](#7-reproducibility)
- [Hard red flags](#8-hard-red-flags)
- [Gap classification](#9-gap-classification)
- [Evidence-to-story transfer](#10-evidence-to-story-transfer)

## Core rule: evidence before story

Early research notes or working outlines may organize researcher-supplied hypotheses, central themes and subthemes, provisional logical progressions, and planned tests before a completed evidence set or critical review exists. Preserve their provisional or untested status, record known contradictions, and issue no draft-readiness verdict. The sequence below governs promotion of any provisional claim into an evidence-supported finding.

1. Gather all relevant results, including null, negative, contradictory, and abandoned calculations or experiments.
2. Verify provenance and reproducibility before using a result to support a claim.
3. Formulate evidence-supported claims only after the relevant results are assembled.
4. Link every claim to supporting and conflicting results.
5. Test alternatives, independence, robustness, and scope.
6. Assign claim status, claim-ladder level, and gap class.
7. Present the argument as evidence-supported only to the extent justified by the verified claim set.

Never raise a claim's scientific status because it creates a cleaner narrative or better venue fit. Never hide a valid result because it complicates the story. Preserve superseded results and explain why they were superseded.

## 1. Recording results and provenance

Give every result a stable identifier such as `R001`. A result is a bounded observation or analysis outcome, not an interpretation. For example, record “median gel area decreased 31% at 24 h” rather than “cells cooperatively compacted the gel.”

For each result, record:

- The exact dataset, sample cohort, experiment, simulation, or source record.
- Whether the item is raw observation, processed measurement, statistical estimate, model output, or derived visualization.
- The analysis or protocol version, code commit, parameters, exclusions, software environment, and date.
- The experimental unit and unit of analysis; flag repeated measures and nested structure.
- Whether the analysis was confirmatory, prespecified, exploratory, or post hoc.
- Effect size and uncertainty, not only a significance threshold.
- Links to raw data, processed data, code, notebook, figure, and lab record where applicable.
- Replication and rerun status, known failures, and deviations from protocol.

Treat missing provenance as an evidence limitation. Do not infer a missing source, parameter, exclusion rule, or analysis decision.

## 2. Claim-status labels

Assign one status to each claim based on the complete evidence map:

- **Demonstrated within scope** — Direct quantitative evidence, appropriate controls and uncertainty, robust analysis, and any replication necessary for the claim's stated scope; serious alternatives have been ruled out or tightly bounded.
- **Supported** — Convergent evidence favors the claim, but at least one material alternative, limitation, or validation gap remains.
- **Consistent with** — The evidence behaves as the claim predicts but does not discriminate it from plausible alternatives.
- **Suggestive** — Exploratory, indirect, underpowered, fragile, or incomplete evidence makes the claim worth testing but not relying on.
- **Untested** — No result directly evaluates the claim or its distinctive prediction.
- **Contradicted** — Reliable evidence conflicts with the claim as written.

Use the lowest status justified by a material dependency. State the scope after the label, for example: “Supported for this cell line and density range.” A claim may be precise and low-level yet demonstrated, or ambitious and only suggestive.

## 3. Claim ladder

Place each claim at the highest rung actually supported on the `L0–L7` claim-support ladder. Do not treat the rungs as interchangeable.

| Rung | Claim type | Required evidence |
|---|---|---|
| L0 | Observation | Traceable measurement with uncertainty and defined scope |
| L1 | Association or difference | Valid comparison, dependence structure, effect size, and relevant confound assessment |
| L2 | Phenomenological or predictive relation | Quantitative predictive performance against appropriate baselines, preferably on held-out evidence |
| L3 | Mechanistic consistency | Observations match distinctive mechanistic predictions, while alternatives remain possible |
| L4 | Sufficiency | Introducing or simulating the proposed process produces the predicted outcome under defined conditions |
| L5 | Necessity | Removing, blocking, or disrupting the proposed process abolishes or predictably changes the outcome, with intervention artifacts controlled |
| L6 | Causal mechanism | Convergent sufficiency, necessity, temporal ordering, intervention response, and alternative-explanation tests support the causal chain |
| L7 | Generality | The supported relation or mechanism survives meaningful changes in system, scale, regime, sample, or laboratory |

Mechanistic sufficiency is not biological necessity. A flexible model reproducing a pattern does not establish that the modeled process generated the experimental pattern. Generality is an additional claim, not a reward for a strong result in one system. If uniqueness is claimed, show that credible competing mechanisms fail discriminating tests; otherwise say “a mechanism,” not “the mechanism.”

## 4. Alternative explanations

For every central claim, formulate the strongest competing alternative hypotheses rather than token objections. Include:

- Measurement, calibration, segmentation, or preprocessing artifacts.
- Selection, exclusion, batch, drift, and sampling effects.
- Confounding, reverse causation, common-cause explanations, and pseudoreplication.
- Alternative biological or physical mechanisms that predict the same headline pattern.
- Flexible model structure, parameter non-identifiability, and multiple parameter sets with equivalent outputs.
- Analysis choices, thresholds, or stopping rules that could create the result.

For each alternative, record its distinctive prediction, current supporting and conflicting result IDs, the most decisive feasible test, and its disposition: open, weakened, ruled out within scope, or not testable with current data. Absence of evidence for an alternative is not evidence against it.

## 5. Held-out and independent tests

Separate evidence used to discover, formulate, tune, select, or fit a claim from evidence used to test it. Label both sets explicitly.

A useful independent test changes at least one meaningful dimension:

- New samples, biological replicates, experimental batches, or laboratory.
- New condition, perturbation, scale, or parameter regime.
- New observable that was not an input to the model.
- New temporal or spatial prediction.
- Prespecified prediction assessed after model or hypothesis selection.
- Baseline or null model chosen before seeing the test result.

Data splitting alone is not always independent: correlated samples, shared preprocessing, leakage, repeated tuning on the test set, or a derived outcome can invalidate the separation. Record what was held out, when the prediction was fixed, and which dependencies remain.

## 6. Robustness

Test whether the result and its interpretation survive reasonable perturbations. Match checks to the system rather than accumulating generic analyses.

- Vary plausible preprocessing, segmentation, thresholds, exclusions, and statistical models.
- Test sampling resolution, initial conditions, finite-size effects, boundary conditions, and parameter ranges where relevant.
- Report effect sizes and uncertainty across specifications, not only whether significance persists.
- Compare with credible null, baseline, and simpler models.
- Evaluate parameter identifiability, sloppiness, degeneracy, and sensitivity.
- Examine batch, subgroup, temporal, and leave-one-unit-out stability where justified.
- Distinguish robustness of the observed pattern from robustness of the proposed explanation.

Do not call a result robust merely because many related tests produce small p-values. A robust association can remain confounded, and a stable model fit can remain mechanistically non-unique.

## 7. Reproducibility

Require a traceable path from source data to every central number and figure. Record:

- Immutable or versioned raw data and metadata.
- Processing and analysis code with commit or release identifier.
- Parameters, random seeds, software versions, and execution environment.
- A documented command or workflow that regenerates the result.
- Machine-generated intermediate files versus manually edited output files or figures.
- Outcome of a clean rerun and, when feasible, an independent rerun.
- Licensed or restricted inputs and the access path needed to reproduce the analysis.

Mark each result as reproduced, partially reproduced, not yet reproduced, or not reproducible from available materials. Do not use “code available” as a substitute for a successful regeneration check.

## 8. Hard red flags

Stop polishing the storyline or selecting figures while an unresolved scientific-integrity conflict affects a central claim. Resolve the hard red flag, narrow or remove the claim, or disclose it as an explicit unresolved limitation.

- Missing or irreconcilable provenance for central data or figures.
- Undisclosed exclusion of valid contradictory, null, or failed results.
- Data leakage or reuse of the same evidence for fitting and purported independent validation.
- Causal, necessary, unique, or general claims without evidence at the corresponding ladder rung.
- A key confound, artifact, or alternative mechanism left untested while stronger language is used.
- Pseudoreplication, wrong experimental unit, invalid independence assumption, or materially inappropriate statistics.
- Post hoc hypotheses or analysis flexibility presented as prespecified or confirmatory.
- Selective reporting, outcome switching, unsupported image manipulation, or unverifiable manual data alteration.
- Non-identifiable or highly flexible models presented as a uniquely established mechanism.
- Inability to regenerate a central result from the stated data and workflow.
- A central contradiction explained away only by narrative preference.

Do not average a hard red flag into a numerical rubric. Record its owner, resolution path, and status separately.

## 9. Gap classification

Classify each unresolved need by its effect on the evidence, not by how impressive the addition would look.

- **Essential** — Without resolution, a central claim is unsupported or incorrectly leveled, a serious confound remains, a hard red flag persists, or the story must be materially reframed. Resolve by new evidence, correction, claim removal, or explicit narrowing before treating the story as complete.
- **Strengthening** — The central claim remains defensible, but the work would materially improve confidence, discrimination among alternatives, scope, robustness, or reproducibility.
- **Optional** — The addition is useful exploration, illustration, extension, or future work but is not needed for the bounded central claim.

For every gap, choose a resolution type: experiment, analysis, provenance recovery, robustness check, independent test, reframe, narrow, remove, or disclose. A costly experiment is not automatically essential, and an easy analysis is not automatically optional.

## 10. Evidence-to-story transfer

Present a claim as an evidence-supported finding in the central story only when it has:

1. A precise wording and bounded scope.
2. A claim-ladder rung and claim-status label.
3. Supporting and conflicting result IDs.
4. A documented alternative-explanation assessment.
5. A robustness and reproducibility status.
6. An explicit gap classification for unresolved needs.

Build the findings in a pre-draft paper outline from these critically reviewed claims. Early research outlines may also map explicitly provisional hypotheses and planned tests. Keep contradictory results visible, distinguish observation from interpretation, and place unsupported but useful ideas in hypotheses, limitations, or future work rather than presenting them as findings.

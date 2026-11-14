# User-Model Comparison

Apply this guide when evaluating a user's computational model against published experimental measurements or another model's results.

## 1. State the comparison target

Define the claim or reported result independently of either method (observable, contrast, controls, domain, sample unit, aggregation, uncertainty, and conditions). Result-only comparisons need no invented broader claim; never describe a distinct model as reproducing the paper's data-generating mechanism.

Keep the user's original model intact, logging every authorized edit and isolating modified outputs from both the original baseline and any paper-method baseline.

## 2. Build the measurement mapping

Specify how model and reference align across:

- variables and units;
- geometry, dimensionality, boundary conditions, and parameter domain;
- intervention, controls, and sampling times;
- latent simulated state to measured signal;
- sampling, aggregation, normalization, and uncertainty.

For experiments, explicit measurement operators may include resolution, PSF, binning, background, noise, detection thresholds, missingness, or segmentation; define how latent fields map to measured intensity before comparing. Log unmatched conditions and materiality, since agreement under altered conditions does not validate the published claim.

## 3. Choose evidence and comparison strength

Prefer reference evidence in order:

1. author-provided raw or processed data;
2. official or published repository data;
3. supplementary or manuscript tables;
4. digitized values from a published figure.

For digitization record source image and hash, panel, axes/scale, calibration points, extraction method, transforms, and extraction uncertainty. Label values `digitized`; never call them raw data or infer unseen replicate distributions from summary plots.

Select qualitative comparison, quantitative comparison, or both before generating assessment evidence:

- `qualitative`: direction, ordering, trend, regime, transition, morphology, or spatiotemporal structure;
- `quantitative`: harmonized numerical metric, reported and model uncertainty, and a frozen tolerance or decision rule.

When both apply, give separate criteria and verdicts (trends can match while numbers disagree); visual resemblance alone is neither mode. Comparison strength configures the target rather than adding a separate depth or decision stage.

## 4. Distinguish prediction from fit

Log how outputs were produced, even for preexisting runs:

- `prediction`: evaluation data were untouched during calibration, tuning, or model selection (including parameter-free or independently parameterized models; calibration conditions must be disjoint from evaluation conditions);
- `fit`: target data informed calibration or model selection.

Fits can match fitted data without offering an independent prediction; keep the `fit` label across tables, figures, and verdicts, never adding calibration merely to populate a field, and separate fitted vs predictive conditions in mixed studies.

Track assessment timing separately: criteria fixed before inspecting evaluation outputs are `prospective`; criteria chosen after inspection are `exploratory` (an independent fixed prediction can still receive exploratory assessment, and viewing the reference after fixing a prediction does not turn it into a fit). Use a descriptive comparison with explicit caveats when provenance cannot prove predictive independence rather than inventing provenance.

Never tune undocumented parameters, cherry-pick seeds, alter preprocessing, or subset evaluation data to improve agreement unless clearly reported as exploratory fitting.

## 5. Report the result

Report each element separately:

- user-model implementation verification;
- mapping fidelity and unmatched assumptions;
- data provenance and extraction uncertainty;
- prediction provenance (`prediction`, `fit`, or undetermined independence) and assessment status (`prospective`, `exploratory`, or descriptive);
- qualitative and/or quantitative consistency under mapped conditions (separate criteria and outcomes when both apply);
- disagreement or inconclusiveness;
- scientific limitations.

State whether each criterion is met, not met, inconclusive, or not evaluated, explaining evidence and gaps. Compatible schema-v1 helper cards use `qualitatively_consistent` or `quantitatively_consistent` for predictions and `fit_consistent` when target data were reused, supplementing rather than replacing a full breakdown of each criterion (never reuse paper-method agreement labels for a distinct model). Consistency establishes neither model equivalence, parameter identifiability, causal mechanism, uniqueness, nor physical validation against another model alone.

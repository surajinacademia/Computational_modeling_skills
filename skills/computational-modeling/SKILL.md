---
name: computational-modeling
description: "Design, develop, test, or review scientific models and their records, with or without code changes. Use for model formulation, designing tests that distinguish competing hypotheses, numerical verification, and physical validation; coordinate model documents with model-documentation. Exclude generic software engineering, standalone non-model analysis or plotting, and isolated explanations."
---

# Computational Modeling

Develop, test, and revise scientific models while keeping equations, code, evidence, and records consistent.

## 1. Understand the model before changing it

Inspect equations, code, parameter sources, evidence, and model records. Establish the question, hypothesis, intended result, and proposed vs implemented status:

- State variables, governing equations or discrete/stochastic rules, assumptions, domain, and initial/boundary conditions.
- Symbols, units, signs, parameter meanings/provenance, constraints, and observables, separating physical parameters from numerical controls.
- Established notation and authorized scope; resolve conflicts across equations, code, records, and expected results before altering physics.

Label unsupported choices as assumptions and unimplemented ones as proposals. Treat expected results as predictions to test, not targets to force by altering physics.

### Design a test that distinguishes competing hypotheses

State the proposed mechanism, a plausible alternative, motivating observations, and the simplest equations capturing their difference. Specify what varies, what stays fixed, and how states map to a common observable under identical conditions. Fit calibrated models to calibration data, then compare predictions across remaining plausible parameters; if predictions overlap, find a perturbation, control, or measurement that separates them.

Use the Elephant-Goldfish review pattern for consequential designs. The lead agent (Elephant) keeps history and gives a fresh reviewer (Goldfish) only the question, candidate models, assumptions, parameter constraints, proposed measurement, and evidence, omitting drafting turns and preferred conclusions (in Codex, spawn without inherited turns). Ask whether either model reproduces the other under admissible conditions, requesting a counterexample or derivation and the smallest discriminating check. Verify the objection and state what changes; if fresh review is unavailable, label same-conversation critique as self-review. See [Elephant-Goldfish review protocol](https://github.com/google/elephant-goldfish-model/blob/e9e1f06aa4e26e95cd4ed37210a0632202c429e9/skills/egm-review-loop/SKILL.md).

For example, two cells can yield excess elastic energy in a linear elastic matrix even when displacement fields add linearly, because energy is quadratic in strain; test superposition by comparing joint displacement with the sum of single-cell displacements from an inactive baseline.

For design requests, return competing predictions, strongest substantiated objection, and smallest informative test, specifying which outcomes favor each mechanism, challenge both, or stay inconclusive at available resolution. Separate what simulation establishes about the model from what observation tests about the physical system.

## 2. Reuse existing code and keep changes simple

Reuse existing routines, parameter definitions, and scientific libraries, keeping inputs -> equations -> observables clear.

Implement equations faithfully (update order, state dependencies, boundary treatment, stochastic scaling). Keep operations minimal; avoid duplicate paths, speculative abstractions, and unneeded infrastructure.

Optimize only for demonstrated runtime or memory bottlenecks, verified against a reference within justified tolerances.

## 3. Distinguish bugs, numerical errors, and model limitations

When a check fails, isolate a representative case and test which cause the evidence supports:

- **Implementation bug:** code differs from the intended mathematical model.
- **Numerical error:** resolution, convergence, stability, tolerances, or sampling prevents accurate calculation.
- **Model limitation:** an accurately implemented, well-resolved formulation fails to describe target behavior under its assumptions, or observations leave the cause unresolved.

Changes to equations, assumptions, parameter meanings, or boundary conditions are scientific model revisions. State rationale, retain earlier findings, and reassess predictions instead of presenting changed physics as a bug fix.

## 4. Validate the scientific claim with appropriate evidence

Before inspecting decisive results, define the prediction, alternative, observable, and support/failure/inconclusive criteria; for numerical checks, specify reference, error measure, and tolerance. Disclose post-hoc changes, and label new mechanisms or observables exploratory for independent testing.

Keep established numerical settings as the baseline; never silently tighten tolerances, refine resolution, raise sampling, or add convergence checks to production runs. When accuracy is uncertain, run the smallest authorized check measuring observable impact and runtime, expand only as warranted and authorized, and report failed baseline accuracy explicitly.

Use the smallest checks supporting the claim:

- **Code verification:** compare code against derivations, exact/manufactured solutions, or independent references.
- **Solution verification:** assess numerical error via convergence, resolution, stability, conservation, or sampling checks.
- **Physical validation:** compare predictions with empirical data for the intended use, including measurement uncertainty and valid regimes.

Separate calibration/selection data from independent evaluation evidence (disclose reuse), and assess sensitivity, identifiability, and uncertainty where relevant. Fixed seeds aid debugging; statistical claims need ensemble sampling. Agreement supports tested predictions within that regime without proving the mechanism or wider validity.

Run only authorized checks; test design or documentation never authorizes runs or sweeps. Report unperformed checks explicitly without gating authorized work. Reference: [NASA verification and validation overview](https://www.grc.nasa.gov/www/wind/valid/tutorial/overview.html).

## 5. Record enough to reproduce and interpret results

In project records, keep the question and criteria, model/input identity, source revision and dirty state with recoverable uncommitted changes, parameters and units, conditions and seeds, numerical method and controls, software versions, ordered procedure/postprocessing, and output links.

Preserve negative/inconclusive results, failed checks, uncertainty, and limits; separate observations, computed results, interpretations, and predictions, retaining superseded findings.

When a task includes a model document or alters a maintained methods/formulation document, apply [$model-documentation](../model-documentation/SKILL.md), passing the question, inspected sources and revision, equations/notation, authorized changes, evidence/gaps, one destination, and any approved plan. Use that skill for plan approval, template format, writing, and review, and keep formulation, code, and checks here without looping documents back or duplicating them. An approved matching plan remains valid; note pending document edits without blocking unrelated model work or forcing a full document for minor edits, isolated explanations, or run logs. Neither handoff nor document approval authorizes simulations.

Keep model name, release identity, source revision, and run settings distinct. Include `Model version control name:` in model-document headers (recorded name or literally blank) without inventing releases for run settings. Read [model versioning](references/model-versioning.md) only when assigning or assessing a release version or name.

Adapt [MIASE](https://doi.org/10.1371/journal.pcbi.1001122) and [NASEM reproducibility guidance](https://www.nationalacademies.org/read/25303/chapter/7) to the project format.

## 6. Stop when the requested work is complete and verified

Review affected formulation, code, evidence, and conclusions, complete authorized checks, satisfy any `model-documentation` completion gate, and preserve records.

Report what changed or was established, evidence, record locations, uncertainty, pending documentation, and unperformed checks limiting conclusions. Separate proposed versions from established releases; never claim untested execution or validity beyond the evidence.

Negative or inconclusive results can complete the investigation. Stop without unrelated cleanup, unrequested additions, broader sweeps, or unrequested runs.

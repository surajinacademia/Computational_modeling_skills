---
name: computational-modeling
description: "Design, develop, test, or review scientific models and their records, with or without code changes. Use for model formulation, designing tests that distinguish competing hypotheses, numerical verification, and physical validation; coordinate model documents with model-documentation. Exclude generic software engineering, standalone non-model analysis or plotting, and isolated explanations."
---

# Computational Modeling

Develop, test, and revise scientific models so equations, code, evidence, and records stay consistent.

## 1. Understand the model before changing it

- Inspect existing equations, code, parameter sources, evidence, and model records to establish the question, hypothesis, intended result, and proposed vs implemented status.
- Map state variables, governing equations or discrete/stochastic rules, assumptions, domain, and initial/boundary conditions.
- Check symbols, units, signs, parameter meanings and provenance, constraints, and observables, separating physical parameters from numerical controls.
- Preserve established notation and authorized scope; resolve conflicts across equations, code, records, and expected results before altering physics.
- Label unsupported choices as assumptions and unimplemented ideas as proposals.
- Treat expected results as predictions to test, never targets to force by altering physics.

### Design a test that distinguishes competing hypotheses

- State the proposed mechanism, a plausible alternative, motivating observations, and the simplest equations capturing their difference.
- Specify what varies, what stays fixed, and how model states map to a common observable under identical conditions.
- Fit calibrated models to calibration data, then compare predictions across remaining plausible parameters; if predictions overlap, pick a perturbation, control, or measurement that separates them.
- For consequential designs, run a fresh reviewer loop using the [Elephant-Goldfish review protocol](https://github.com/google/elephant-goldfish-model/blob/e9e1f06aa4e26e95cd4ed37210a0632202c429e9/skills/egm-review-loop/SKILL.md): give a fresh Goldfish reviewer (in Codex, spawned without inherited turns) only the question, candidate models, assumptions, parameter constraints, proposed measurement, and evidence, omitting drafting history and preferred conclusions.
- Ask the Goldfish whether either model reproduces the other under admissible conditions, requesting a counterexample or derivation and the smallest discriminating check; verify any objection and state what changes, or label same-conversation critique as self-review if fresh review is unavailable.
- Example: two cells yield excess elastic energy in a linear elastic matrix even when displacements add linearly because strain energy is quadratic; test superposition by comparing joint displacement with the sum of single-cell displacements from an inactive baseline.
- Return competing predictions, strongest substantiated objection, and smallest informative test for design requests, stating which outcomes favor each mechanism, challenge both, or stay inconclusive at available resolution.
- Separate what simulation establishes about the model from what observation tests about the physical system.

## 2. Reuse existing code and keep changes simple

- Reuse existing routines, parameter definitions, and scientific libraries so the path `inputs -> equations -> observables` stays clear.
- Implement equations faithfully (update order, state dependencies, boundary treatment, stochastic scaling) with minimal operations, no duplicate paths, no speculative abstractions, and no unneeded infrastructure.
- Optimize only demonstrated runtime or memory bottlenecks, verified against a reference within justified tolerances.

## 3. Distinguish bugs, numerical errors, and model limitations

- Isolate a representative case on failure and classify the cause before editing physics:
- **Implementation bug:** code differs from the intended mathematical model.
- **Numerical error:** resolution, convergence, stability, tolerances, or sampling prevents accurate calculation.
- **Model limitation:** an accurately implemented, well-resolved formulation fails to describe target behavior under its stated assumptions, or available observations leave the cause unresolved.
- Handle equation, assumption, parameter-meaning, or boundary-condition edits as scientific model revisions: state rationale, keep earlier findings, and reassess predictions instead of calling changed physics a bug fix.

## 4. Validate the scientific claim with appropriate evidence

- Lock prediction, alternative, observable, and support/failure/inconclusive criteria (plus reference, error measure, and tolerance for numerical checks) before inspecting decisive results; disclose post-hoc changes and mark new mechanisms or observables exploratory.
- Preserve established baseline numerical settings; never silently tighten tolerances, refine resolution, raise sampling, or add convergence checks to production runs.
- Run the smallest authorized check first to measure observable impact and runtime when accuracy is uncertain, expanding only as warranted and authorized and reporting failed baseline accuracy explicitly.
- Choose the smallest checks that establish the claim ([NASA verification and validation overview](https://www.grc.nasa.gov/www/wind/valid/tutorial/overview.html)):
- **Code verification:** compare code against derivations, exact or manufactured solutions, or independent references.
- **Solution verification:** check numerical error via convergence, resolution, stability, conservation, or sampling tests.
- **Physical validation:** compare predictions against empirical data for the intended use, including measurement uncertainty and valid regimes.
- Separate calibration or selection data from independent evaluation evidence (disclosing any reuse), and assess sensitivity, identifiability, and uncertainty where relevant.
- Use fixed seeds only for debugging and ensemble sampling for statistical claims; agreement supports tested predictions in that regime without proving the mechanism or broader validity.
- Run only authorized checks (test design and documentation never authorize runs or sweeps), and state unperformed checks explicitly without blocking authorized work.

## 5. Record enough to reproduce and interpret results

- Log question and criteria, model/input identity, source revision and dirty state with recoverable uncommitted diffs, parameters and units, conditions and seeds, numerical method and controls, software versions, ordered workflow/postprocessing steps, and output links (adapting [MIASE](https://doi.org/10.1371/journal.pcbi.1001122) and [NASEM reproducibility guidance](https://www.nationalacademies.org/read/25303/chapter/7) to the project format).
- Preserve negative/inconclusive outcomes, failed checks, uncertainty, and regime limits, keeping observations, computed results, interpretations, and predictions distinct alongside superseded findings.
- Hand off requested model or methods documents to [$model-documentation](../model-documentation/SKILL.md), supplying the question, inspected sources and revision, equations/notation, authorized edits, evidence/gaps, one destination, and any approved plan.
- Let `model-documentation` own plan approval, template format, writing, and review while keeping formulation, code, and checks here without looping or duplicating; reuse a matching approved plan and note pending doc edits without blocking unrelated model work or forcing full docs for minor edits, explanations, or run logs (handoffs and doc approvals never authorize simulations).
- Keep model name, release identity, source revision, and run settings distinct, setting `Model version control name:` in model-document headers (recorded name or literally blank) without inventing releases for run settings; consult [model versioning](references/model-versioning.md) only when assigning or checking a release version or name.

## 6. Stop when the requested work is complete and verified

- Check affected formulation, code, evidence, and conclusions, complete all authorized checks, satisfy any `model-documentation` completion gate, and keep provenance records updated.
- Report changes or findings, supporting evidence, record locations, uncertainty, pending documentation, and unperformed checks limiting conclusions, distinguishing proposed versions from established releases and never claiming untested execution or broader validity.
- Stop cleanly once verified (negative or inconclusive results also complete an investigation), without unrelated cleanup, unrequested additions, broader sweeps, or unrequested runs.

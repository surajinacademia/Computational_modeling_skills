---
name: computational-modeling
description: "Design, develop, test, or review scientific models and their records, with or without code changes. Use for model formulation, designing tests that distinguish competing hypotheses, numerical verification, and physical validation; coordinate model documents with model-documentation and empirical image observables with image-analysis. Exclude generic software engineering, standalone non-model analysis or plotting, and isolated explanations."
---

# Computational Modeling

Develop, test, and revise scientific models so governing equations, code, empirical evidence, and provenance records stay consistent.

## 1. Preconditions and Formulation Inspection

- Inspect existing equations, code, parameter sources, evidence, and model records to establish the question, hypothesis, intended result, and proposed versus implemented status.
- Map state variables, governing equations or discrete/stochastic rules, assumptions, domain, and initial and boundary conditions.
- Check symbols, units, signs, parameter meanings and provenance, constraints, and observables, separating physical parameters from numerical controls.
- Preserve established notation and authorized scope, resolving conflicts across equations, code, records, and expected results before altering physics.
- Label unsupported choices as assumptions and unimplemented ideas as proposals; treat expected results as predictions to test, never targets to force by altering physics.
- REQUIRED BEFORE designing discriminating hypothesis tests or running fresh-context reviews: read [references/verification-and-review.md](references/verification-and-review.md) (competing-hypothesis design, fresh-context review protocol, V&V checks, and provenance fields).
- State the proposed mechanism, a plausible competing alternative, motivating observations, and how model states map to a shared observable under identical conditions; for consequential designs, run a fresh-context review (`Goldfish`, an independent reviewer given candidate equations and constraints without conversation history) or label same-session critique as self-review.

## 2. Execution, Verification, and Physical Validation Invariants

- Reuse existing routines, parameter definitions, and scientific libraries so the path `inputs -> equations -> observables` remains transparent.
- Implement equations faithfully (update order, state dependencies, boundary treatment, and stochastic scaling) with minimal operations, no duplicate paths, and no speculative abstractions; optimize only demonstrated runtime or memory bottlenecks against a reference within justified tolerances.
- Isolate a representative case when a check fails and classify the cause before editing physics:
  - **Implementation error:** code differs from the intended mathematical model; fix via a code correction without altering the model formulation.
  - **Numerical error:** discretization resolution, convergence, numerical stability, solver tolerances, or finite sampling prevents accurate calculation.
  - **Model limitation:** an accurately implemented, well-resolved formulation fails to describe target behavior under stated assumptions, or available observations leave the cause unresolved.
- Handle equation, assumption, parameter-meaning, or boundary-condition edits as scientific model revisions: state physical rationale, preserve earlier findings, and reassess predictions instead of calling changed physics a code correction.
- Verify and validate the scientific claim with proportionate evidence ([NASA verification and validation overview](https://www.grc.nasa.gov/www/wind/valid/tutorial/overview.html)):
  - **Code verification:** compare code against analytical derivations, exact or manufactured solutions, conservation laws, or independent references.
  - **Solution verification:** quantify numerical error via convergence, resolution, stability, conservation, residual, or sampling checks.
  - **Physical validation:** compare predictions against independent empirical data for the intended regime, including measurement uncertainty and valid regimes.
- Pre-declare predictions and tolerances, competing alternatives, observables, error measures, and support, falsification, or inconclusive criteria before inspecting decisive results; disclose post-hoc changes and mark new mechanisms or observables exploratory.
- Preserve established baseline numerical settings; never silently tighten tolerances, refine resolution, raise sampling, or add convergence checks to production runs.
- Run the smallest authorized check first when accuracy or runtime is uncertain, expanding only as warranted and authorized (test design and documentation never authorize runs or sweeps) and reporting failed baseline accuracy or unperformed checks explicitly without blocking authorized work.
- Separate calibration or selection data from independent physical validation evidence (disclosing any reuse), assess sensitivity, identifiability, and uncertainty where relevant, and use fixed seeds only for error diagnosis while using ensemble sampling for statistical claims.
- Log reproducible provenance including question, criteria, model/input identity, source revision and uncommitted working-tree changes with recoverable diffs, parameters/units, conditions/seeds, numerical controls, software versions, ordered postprocessing, negative/inconclusive outcomes, and output links ([references/verification-and-review.md](references/verification-and-review.md#4-reproducible-provenance-record)).
- When parameter calibration or physical validation requires observables from experimental microscopy images, stacks, or time series (cell counts, morphology, fluorescence, trajectories, or matrix displacement and traction forces), delegate measurement, matched before-and-after figures, and `Supplementary_Methods.md` to [image-analysis](../image-analysis/SKILL.md), keeping model formulation, calibration-versus-validation separation, and hypothesis tolerances here without treating handoffs as simulation permission.
- Hand off requested model or methods documents to [model-documentation](../model-documentation/SKILL.md) (supplying question, inspected sources/revision, equations/notation, authorized edits, evidence/gaps, one destination, and any approved plan) without blocking unrelated model work or forcing full docs for minor edits, explanations, or run logs.
- Let `model-documentation` own plan approval, template structure, writing, and review while keeping formulation, code, and checks here without looping or duplicating; reuse a matching approved plan, and never treat handoffs or doc approvals as simulation permission.
- Keep model name, release identity, source revision, and run settings distinct, setting `Model version control name:` (the model-document header field recording an explicitly assigned model release identifier, or left literally blank when unversioned) without inventing releases for run settings.
- REQUIRED BEFORE assigning or checking a model release version or name: read [references/model-versioning.md](references/model-versioning.md) (semantic versioning for model formulations).

## 3. Completion and Verification Criteria

- Check affected formulation, code, evidence, and conclusions, complete all authorized checks, satisfy `model-documentation` Completion and Verification Criteria when a model document is in scope, and keep provenance records updated.
- Report changes or findings, supporting evidence, record locations, uncertainty, pending documentation, and unperformed checks limiting conclusions, distinguishing proposed formulations from established releases and never claiming untested execution or broader physical validation.
- Stop cleanly once verified (negative or inconclusive results also complete an investigation), without unrelated cleanup, unrequested additions, broader sweeps, or unauthorized runs.

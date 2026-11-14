# Hypothesis Testing, Fresh-Context Review, and Reproducibility Provenance

Apply these checks when designing discriminating hypothesis tests, running independent design reviews, performing numerical verification and physical validation, or logging computational provenance under [SKILL.md](../SKILL.md).

## Contents

- [1. Designing discriminating hypothesis tests](#1-designing-discriminating-hypothesis-tests)
- [2. Fresh-context review protocol](#2-fresh-context-review-protocol)
- [3. Verification, physical validation, and sensitivity checks](#3-verification-physical-validation-and-sensitivity-checks)
- [4. Reproducible provenance record](#4-reproducible-provenance-record)

## 1. Designing Discriminating Hypothesis Tests

- State the proposed physical mechanism, at least one physically coherent competing alternative, the motivating empirical observations, and the most parsimonious mathematical equations that capture their mechanistic difference.
- Specify which quantities vary, which conditions remain fixed, and the exact observable mapping from internal model states to a shared measurable output under identical geometry, boundary conditions, and units.
- Fit calibrated parameters strictly on designated calibration data before comparing candidate models across remaining admissible parameter ranges; when competing predictions overlap within numerical or experimental uncertainty, choose a discriminating perturbation, control condition, or complementary observable that separates them.
- Biophysical example: two contractile cells in a linear elastic extracellular matrix produce excess total strain energy even when displacement fields superpose linearly because elastic energy is quadratic in strain; test linear superposition directly by comparing joint bead displacement against the vector sum of single-cell displacements measured from an inactive baseline before interpreting energy observables.
- For hypothesis-design requests, report the competing quantitative or qualitative predictions, the strongest substantiated objection to each candidate, and the smallest informative discriminating test, stating explicitly which outcomes favor each mechanism, falsify both, or remain inconclusive at available experimental or numerical resolution.
- Separate what numerical simulation establishes about mathematical consequences of the model from what empirical measurement tests about the physical or biological system.

## 2. Fresh-Context Review Protocol

- For consequential model formulations or experimental-test designs, run an independent reviewer loop following the [fresh-context review protocol](https://github.com/google/elephant-goldfish-model/blob/e9e1f06aa4e26e95cd4ed37210a0632202c429e9/skills/egm-review-loop/SKILL.md) (where the zero-history reviewer role is termed `Goldfish`).
- Provide the fresh-context reviewer (spawned without inherited conversation turns, drafting history, or preferred conclusions) only the scientific question, candidate model equations, explicit assumptions, admissible parameter bounds, proposed observable or perturbation, and inspected empirical evidence.
- Ask the fresh-context reviewer whether either candidate model reproduces the other's observable signature under admissible parameter or boundary choices, requesting an explicit derivation or counterexample plus the smallest discriminating check.
- Verify every mathematical or physical objection directly against the equations and state what changes in the model or test design; when an independent zero-context subagent is unavailable in the current runtime, label same-session critique explicitly as `self-review` rather than claiming independent review.

## 3. Verification, Physical Validation, and Sensitivity Checks

- Pre-declare predictions and tolerances, competing alternatives, observables, reference benchmarks, error norms, and support, falsification, or inconclusive criteria before inspecting decisive simulation or experimental results; disclose any post-hoc criterion change and label newly added mechanisms or observables exploratory.
- Select the smallest decisive checks required by the claim ([NASA verification and validation overview](https://www.grc.nasa.gov/www/wind/valid/tutorial/overview.html)):
  - **Code verification:** test implemented equations against symbolic derivations, conserved quantities, symmetries, asymptotic limiting cases, exact solutions, or manufactured solutions.
  - **Solution verification:** quantify discretization, iterative-residual, truncation, and sampling error on the target calculation via step/mesh refinement, conservation monitoring, stability bounds, and ensemble-size scaling.
  - **Physical validation:** test calibrated or parameter-free model predictions against independent empirical measurements not used during calibration or model selection, accounting for both numerical error and experimental uncertainty within the stated regime of validity.
- Run a small authorized diagnostic calculation first when numerical accuracy or runtime cost is uncertain, report any failed baseline accuracy check explicitly, and expand to larger runs only with user authorization.
- Evaluate parameter sensitivity and structural or practical identifiability when distinct parameter combinations could produce indistinguishable observables, and note that agreement within a tested regime supports those tested predictions without proving mechanism uniqueness or validity outside that regime.

## 4. Reproducible Provenance Record

- Adapt [MIASE guidelines](https://doi.org/10.1371/journal.pcbi.1001122) and [NASEM computational reproducibility guidance](https://www.nationalacademies.org/read/25303/chapter/7) to the project's native record format, logging:
  - scientific question, pre-declared evaluation criteria, and model/input identifiers;
  - inspected source revision and uncommitted working-tree changes with recoverable diffs (plus content hashes for untracked or unversioned source files);
  - physical parameter values, units, nondimensional groups, initial and boundary conditions, and random-number generator type and seeds;
  - numerical discretization method, step/grid controls, solver tolerances, software and library versions, and ordered postprocessing steps;
  - output file locations, negative or inconclusive outcomes, failed checks, uncertainty bounds, regime limitations, and superseded iterations.
- Keep empirical observations, computed simulation outputs, physical interpretations, and prospective predictions clearly separated in every record.

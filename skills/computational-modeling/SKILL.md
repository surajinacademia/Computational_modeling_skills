---
name: computational-modeling
description: "Formulate, implement, verify, or review physics-based scientific models and theoretical derivations. Use for model development, hypothesis tests, and physical validation; exclude mechanism-free empirical fitting and surrogate or machine-learned models."
---

# Computational Modeling

- Develop scientific models with consistent hypotheses, equations, implementation, evidence, and reproducible records, with or without code changes.
- Support phenomenological, theoretical/analytical, mechanistic (including ab initio), toy/minimal, and statistical/stochastic approaches. These categories overlap: a minimal model can also be mechanistic and stochastic.
- Keep mechanism-free empirical curve fitting and all surrogate or machine-learned models out of scope. Calibrating physical or effective parameters within a supported model remains in scope; fitting parameters does not itself make a model empirical or machine-learned.
- Exclude generic software engineering, standalone non-model analysis or plotting, and isolated scientific explanations.

## 1. Brainstorm the model and agree on outcomes before starting

- Inspect existing equations, code, parameter sources, evidence, and model records before asking about discoverable facts. Establish the question, proposed versus implemented status, and intended observable or prediction.
- Before formulation, implementation, or simulation, agree with the user on the desired outcomes, concrete deliverables, acceptance evidence, execution limits, and stopping condition in Section 7. If outcomes or deliverables are absent from the prompt, ask for them; do not silently supply them. Reuse an explicit matching agreement already given in the session.
- Read [model types and scoping tables](references/model-types.md) during brainstorming. Present the relevant choices in plain language and ask which interests the user and why; use the empirical and surrogate entries to explain exclusions, not as implementation options.
- Challenge the rationale constructively, following up only where the answer changes the approach:
  - "Do you want to explain a mechanism, predict a measured quantity, or understand a qualitative behavior?"
  - "Why does this model type answer that question, and what would the simplest alternative miss?"
  - "Which observations, parameter values, accuracy, and computing resources do you actually have?"
  - "What outcome would challenge the model, and what deliverable would let you call this task finished?"
- Apply [lets-be-clear](../lets-be-clear/SKILL.md) to explain consequential gaps, compare feasible choices, and recommend an approach with evidence and tradeoffs. Ask one unresolved decision at a time, respect an informed user choice, and confirm the resulting brief without repeating settled questions or requiring a fixed interview length.
- Fill the selected type's scope table for this task: what is needed, what is unnecessary, what remains unknown, and why. For a hybrid, identify each component's role. Keep the agreement in the conversation or the project's existing record; do not create a companion planning file by default.
- Map state variables, governing equations or discrete/stochastic rules, assumptions, domain, initial and boundary conditions, and observables. Check symbols, units, signs, parameter meanings, sources, and physical constraints; distinguish physical parameters from numerical controls.
- Preserve established notation and authorized scientific scope. Resolve disagreements among equations, code, and records before changing scientific meaning; label unsupported choices as assumptions and unimplemented ideas as proposals.
- Treat expected behavior as a prediction to test, never a target to force by changing physics or numerical settings.
- For a discriminating hypothesis test, read [verification-and-review.md](references/verification-and-review.md): state a plausible alternative, shared observable, matched conditions, and outcomes that favor either mechanism, challenge both, or remain inconclusive. For consequential designs, use its independent fresh-context review protocol; label same-session critique as self-review when independent review is unavailable.
- **Example:** Two contractile cells can generate excess strain energy in a linear elastic matrix because energy is quadratic in strain. To test displacement superposition, compare the joint displacement field with the vector sum of the single-cell fields, all measured from the same inactive baseline; excess energy alone does not establish nonlinear mechanical interaction.

## 2. Reuse existing code and implement the agreed model

- Reuse project routines, parameter definitions, and established scientific libraries so the path from inputs through equations to observables stays readable.
- Implement equations faithfully, including update order, state dependencies, boundary treatment, and stochastic scaling, with a small number of coherent scientific operations and no duplicate pathways or speculative abstractions.
- Improve computational efficiency only where measurements show that a calculation step takes excessive time or memory for the agreed task; compare the revised calculation with a verified reference within scientifically justified tolerances.
- Keep execution within the agreed limits; designing tests or writing documentation never authorizes simulations, sweeps, or resource increases.
- For authorized runs, reuse the project's command and existing run records; use [hpc-slurm](../hpc-slurm/SKILL.md) for cluster execution. Record the command, input and source versions, software environment, seed when applicable, process or job identifier, and output and log paths alongside the agreed completion criteria.
- Check the recorded process or job before repeating or resuming work to avoid duplicate runs. Claim completion only after a successful exit and checks of the fresh expected outputs. For long runs, carry the same run record and last observed state into the next session so monitoring can continue without relaunching the simulation.

## 3. Distinguish bugs, numerical errors, and model limitations

- Isolate a representative disagreement before choosing a fix:
  - **Implementation bug:** code differs from the intended equations; correct the implementation without changing the model.
  - **Numerical error:** discretization, convergence, stability, solver tolerances, or finite sampling prevents an accurate solution.
  - **Model limitation:** the accurately implemented and numerically resolved formulation fails to describe the target behavior within its stated assumptions.
- Report when insufficient or mismatched observations leave the cause unresolved.
- Treat changes to equations, assumptions, parameter meanings, or boundary conditions as scientific revisions: explain the rationale, preserve earlier findings, and reassess affected predictions instead of calling changed physics a bug fix.

## 4. Establish evidence, verify calculations, and validate claims

- Use available scholarly search and literature synthesis tools for paper discovery, relevant prior models, assumptions, parameter evidence, competing explanations, and synthesis; use an available **Search** skill or connected search tool for source discovery and retrieval. If a required search or reading capability is unavailable, disclose the limitation and use an available scholarly/web alternative without installing anything.
- Inspect primary papers, methods, supplements, and authoritative numerical documentation before relying on them. Cite the exact source supporting each consequential law, parameter, regime, or benchmark; distinguish evidence, inference, and modeling choice, and report inaccessible or conflicting sources.
- Before inspecting decisive results, fix the prediction, competing alternative when relevant, observable, benchmark, error measure, justified tolerance, and support/falsification/inconclusive criteria. Reuse the agreed deliverable criteria; disclose post-hoc changes and label new hypotheses or observables exploratory.
- Match evidence to the claim ([NASA verification and validation overview](https://www.grc.nasa.gov/www/wind/valid/tutorial/overview.html)):
  - **Code verification:** compare the implementation with derivations, exact or manufactured solutions, invariants, symmetries, and limiting cases.
  - **Solution verification:** quantify numerical error using appropriate refinement, stability, conservation, residual, or ensemble-sampling checks.
  - **Physical validation:** compare predictions with independent empirical observations for the intended regime, including measurement uncertainty and applicability limits.
- Select checks using the chosen model's scope table. Do not demand simulation convergence for a purely analytical derivation or claim quantitative physical validation for an uncalibrated toy model.
- Preserve established simulation settings. If accuracy or computation time is uncertain, start with the smallest authorized check on the target observable; report baseline failures instead of silently tightening tolerances, refining grids, or increasing samples.
- Separate calibration/model-selection evidence from independent validation evidence where available, disclose reuse, and assess sensitivity and identifiability when they affect the claim. A fixed seed supports repeatable debugging; ensemble evidence is needed for statistical claims.
- Use [image-analysis](../image-analysis/SKILL.md) when calibration or validation needs experimental microscopy observables, with matched before-and-after figures and Supplementary_Methods.md. Match definitions and units: compare traction stress in Pa through displacements, strain energy, or integrated contractility rather than raw mesh-dependent 3D nodal forces in N unless segmented 3D cell-surface geometry is available.

## 5. Record the simulation experiment using MIASE Box 2

- Record the following three groups and ten rules in the same order, using identifiers **1A–1D, 2A–2D, and 3A–3B**. The rule wording below is reproduced verbatim from Waltemath et al. (2011), [Box 2, “Rules for MIASE-Compliant Description of a Simulation Experiment”](https://doi.org/10.1371/journal.pcbi.1001122), © 2011 Waltemath et al., under the article's Creative Commons Attribution License; only Markdown layout and explicit rule labels are added.

- **1. All models used in the experiment must be identified, accessible, and fully described.**
  - **1A.** The description of the simulation experiment must be provided together with the models necessary for the experiment, or with a precise and unambiguous way of accessing those models.
  - **1B.** The models required for the simulations must be provided with all governing equations, parameter values, and necessary conditions (initial state and/or boundary conditions).
  - **1C.** If a model is not encoded in a standard format, then the model code must be made available to the user. If a model is not encoded in an open format or code, its full description must be provided, sufficient to re-implement it.
  - **1D.** Any modification of a model (pre-processing) required before the execution of a step of the simulation experiment must be described.
- **2. A precise description of the simulation steps and other procedures used by the experiment must be provided.**
  - **2A.** All simulation steps must be clearly described, including the simulation algorithms to be used, the models on which to apply each simulation, the order of the simulation steps, and the data processing to be done between the simulation steps.
  - **2B.** All information needed for the correct implementation of the necessary simulation steps must be included through precise descriptions or references to unambiguous information sources.
  - **2C.** If a simulation step is performed using a computer program for which source code is not available, all information needed to reproduce the simulation, and not just repeat it, must be provided, including the algorithms used by the original software and any information necessary to implement them, such as the discretization and integration methods.
  - **2D.** If it is known that a simulation step will produce different results when performed in a different simulation environment or on a different computational platform, an explanation must be given of how the model has to be run with the specified environment/platform in order to achieve the purpose of the experiment.
- **3. All information necessary to obtain the desired numerical results must be provided.**
  - **3A.** All post-processing steps applied on the raw numerical results of simulation steps in order to generate the final results have to be described in detail. That includes the identification of data to process, the order in which changes were applied, and also the nature of changes.
  - **3B.** If the expected insights depend on the relation between different results, such as a plot of one against another, the results to be compared have to be specified.

- Keep responses traceable to actual models, procedures, and records; use precise links instead of duplicating long material. State why a conditional rule is inapplicable, distinguish missing information from inapplicability, and label planned experiments as planned. For an analytical-only task without a simulation experiment, state that MIASE is not applicable and retain derivation sources and steps.
- Apply [model-documentation](../model-documentation/SKILL.md) when a model document is requested or a model revision affects a maintained methods document. Pass the agreed outcomes, model type and scope table, sources/revision, equations/notation, evidence/gaps, MIASE responses, one destination, and any approved plan. It records the three groups in Section 7.2 and governs writing and review without re-invoking this workflow.
- For other tasks, use the existing experiment record; do not force a full model document for a minor edit or run log. Keep source revision and recoverable working changes, software versions, checks, uncertainties, negative/inconclusive outcomes, and output links alongside the MIASE record ([source and calculation records](references/verification-and-review.md#4-sources-and-calculation-history)).
- MIASE specifies reporting completeness; it does not establish model validity, correct assumptions, or identical numerical results across platforms. Keep physical justification and verification evidence explicit and distinct from compliance.

## 6. Keep model versioning separate from experiment records

- Read [model-versioning.md](references/model-versioning.md) before assigning or checking a model release. Distinguish model name, model version identifier, Git revision, and individual run settings.
- Record scientific changes and their effect on previous predictions; a parameter sweep, seed, or initial condition alone does not create a model release.
- In model-document headers, copy an explicitly assigned applicable name into **Model version control name:** or leave its value literally blank. Do not invent model version identifiers or substitute commit hashes.
- Create releases only when authorized; preserve released contents and tags, and record formulation changes, code corrections, evidence, and source identity separately.

## 7. Work on the deliverables and make sure the stopping condition is achieved

- Establish this agreement in Section 1, before substantive work: desired scientific outcome, concrete deliverables and destinations, acceptance checks and tolerances, permitted resources, and what counts as complete, inconclusive, failed, or blocked. Ask the user for missing outcomes and deliverables, and confirm unresolved criteria before proceeding.
- **Example agreement:** “Deliver a minimal oscillator derivation and one plot against its analytical solution, with an error tolerance we agree before the run. Verify that comparison, record the assumptions and source version, then stop. A parameter sweep and experimental validation are outside this task.”
- When the agreed deliverables are ready, perform the agreed final verification and review, including the model-documentation review when applicable. Reuse valid evidence and repeat checks only for changed inputs, changed code, failures, or unresolved uncertainty; prerequisite scientific checks may occur earlier.
- If the deliverables satisfy the agreed criteria, report the outcome, evidence, record locations, and limitations, then stop. Do not add new features, research questions, cleanup, or further checks merely to continue working.
- A negative or inconclusive finding completes the task only when it satisfies the agreed investigative outcome. Failed or unavailable required checks prevent a claim of verified completion; report the gap and resolve it within scope or ask to revise the agreement.
- For long-horizon work, carry the same agreement through progress reviews, transfers of work between agents, and resumed sessions. Milestones preserve progress without replacing the final stopping condition; time or resource exhaustion is a reported limit, not success. Agree on any change to outcomes, scope, or acceptance criteria before expanding the work.

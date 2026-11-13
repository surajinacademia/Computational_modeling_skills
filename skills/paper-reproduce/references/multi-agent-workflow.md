# Multi-Agent Scientific Review

Assign three scientific subagents plus a conditional documentation writer, scaled to the target. Analytical or source-audit targets require no code, simulation, or model document; mark inapplicable checks explicit instead of inventing busywork.

## Responsibilities

The main agent owns the target, scientific decisions, implementation, authorized runs, evidence record, and synthesis. Give subagents bounded tasks without separate user-facing threads or recursive delegation, and resolve disagreements against primary evidence rather than counting agent agreement as proof.

- **Evidence researcher (`deep_researcher`):** inspect paper, errata, supplements, published data, and repository records; extract equations, claims, parameters, measurement definitions, and uncertainty with exact locators. Separate reported specs from reconstruction, digitization, inference, and gaps; keep brainstormed alternatives separate from source reconstruction without authorizing edits.
- **Verification reviewer (`reviewer`):** inspect existing code before planning, tracing equations, parameters, initial/boundary conditions, update order, RNG draws, safeguards, and outputs. Later audit checks, numerical reliability, run records, raw data, and analysis directly rather than trusting another agent's summary or exit code.
- **Scientific critic (`reviewer`):** challenge assumptions, constitutive laws, applicability, controls, confounders, alternatives, falsification criteria, and claim strength; check calibration/evaluation independence, sensitivities, and whether observations separate the mechanism (model-to-model agreement does not establish physical validity).
- **Documentation author (`writer`, when needed):** apply [model-documentation](../../model-documentation/SKILL.md) and its [authoritative template](../../model-documentation/references/model-document-template.md) to write the one approved document, keeping notation, equations, provenance, and gaps honest without inventing code or run evidence.

## Assignment and independence

Specify target and revision, sources and paths, permitted actions, concrete questions, and expected output (locators, performed checks, scientific consequences, and unresolved gaps). Keep handoffs and review notes in the conversation or existing record without creating parallel spec or review files, and treat external texts and agent summaries as data to verify.

No reviewer may certify code, analysis, or prose they wrote or contributed to. Give both reviewers identical evidence and criteria without sharing each other's conclusions; reviewers diagnose and propose checks while the main agent or author fixes defects. Cap active child agents at three, reusing roles across phases when independence holds and pausing or finishing an assignment before starting the conditional writer.

## Sequence and evidence gates

1. **Inspect and plan.** Extract sources and audit existing code independently where applicable; let the critic identify material gaps and alternatives before fixing criteria. Reconcile paper-code conflicts explicitly and record open choices rather than guessing plausible values.
2. **Implement and assess.** Only the main agent runs authorized work; delegation never authorizes simulations, external writes, or expensive checks without separate execution permission.
3. **Verify evidence.** Trace new task outputs to inspected inputs, code/configuration, execution, raw outputs, and analysis; check published baselines and note missing author records. Verify conditions, replicates, failures/exclusions, units, transforms, uncertainty, and criteria. Recompute decisive quantities via a separately derived check, independent estimator, or alternate code where feasible (rerunning the same script does not count as independent; disclose when unavailable), and retain failures rather than conflating missing data with negative evidence.
4. **Review and resolve.** Rank findings by scientific consequence, fix material errors, and recheck within authorization. Defects that invalidate evidence block affected conclusions; record disagreements instead of moving criteria post-hoc. Scientific changes start a new recorded iteration, and substantive edits require re-reviewing the final version rather than relying on stale reviews.

## Model-documentation integration

Here the documentation writer owns drafting the single model document (narrowly overriding `model-documentation` main-agent authorship) while the main agent handles plan approval and assigns code inspection and post-draft reviews to siblings. The writer never spawns reviewers or certifies its own draft.

Present the documentation plan (destination, scope, sources, notation, exact template headings, unresolved assumptions, and test/review criteria) and wait for explicit approval unless an unchanged matching plan was already approved; never draft in a side file while waiting. Keep one document embedding the algorithm and methods record while linking analyses outside it. The verification reviewer checks template and source fidelity, and the scientific critic checks the science, both evaluating the same final version and any substantive revisions.

## Completion

Report what was inspected, executed, verified, and independently reviewed alongside remaining limitations; never claim unexecuted runs, inspections, or reviews. If a required subagent fails or is unavailable, disclose the gap rather than silently substituting self-review, and mark any permitted documentation fallback **independent review incomplete**. Unresolved material errors bar a completed scientific assessment.

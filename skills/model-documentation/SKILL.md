---
name: model-documentation
description: "Plan, write, revise, or audit one scientific model document from code or an approved plan. Explain physics, equations, and methods; record MIASE simulation information, model sources, and change history. Use when a model document is the deliverable, not for isolated explanations."
---

# Model Documentation

- Make one scientific model understandable without reverse-engineering its code: explain physical entities, interactions, and mechanisms before notation, equations, and numerical procedures.
- Describe only what inspected sources support, separate assumptions from findings, omit run-result sweep narratives, and state unresolved gaps. Apply [lets-be-clear](../lets-be-clear/SKILL.md) when consequential scope or notation choices remain unsettled.
- When invoked by computational-modeling or paper-reproduce, reuse the supplied outcomes, model type and rationale, scope decisions, source paths, evidence, destination, MIASE responses, and document plan.
- A matching plan already presented and explicitly approved in this session satisfies the approval step below. Return documentation findings to the caller without re-invoking it, editing model code, or launching simulations.

## Document Template

- Read [the standard template](references/model-document-template.md) before proposing structure or planning edits. Preserve its seven sections, ten subsections, title/source header, and five-column Section 3 quantity tables.
- Keep `Implementation:` followed by `Model version control name:` below the title. The quantity columns are notation, units, values/range, meaning/rationale, and citation source; leave unavailable citations blank.
- Retain inapplicable sections with a brief reason. Add descriptive fourth-level subheadings within required subsections when needed, including the MIASE record in Section 7.2.
- Change required headings or order only when a higher-priority repository rule or explicit user instruction overrides the template and the approved plan records the exact alternate headings.
- Use the [Overdamped Harmonic Oscillator](examples/overdamped-harmonic-oscillator/model.md) only as an illustration of equations, pseudocode, and Mermaid flowcharts. Its historical record predates the MIASE layout; follow the current template for that record, and never copy, create, or execute companion code during documentation work.
- Write the resulting model document in connected scientific prose, using lists for parallel or ordered items. The bulleted skill instructions do not require bullet-only model documents.
- Produce one self-contained document in the repository's documentation area, embedding pseudocode, flowcharts, references, and the methods/MIASE record while linking existing analyses in place. Do not create extra plan, review, or companion files.

## Approval Before Writing

- Follow this sequence for document creation, revision, or restructuring; read-only audits may inspect and report freely.
- **Inspect without writing:** read repository instructions, the existing document, and primary implementation or originating plan. Use the code-understanding role in [style-and-review.md](references/style-and-review.md#3-bounded-subagent-review-roles) when code exists.
- **Agree on the outcome:** establish desired use, deliverables, acceptance checks, review requirements, and stopping criteria before drafting. Ask for missing outcomes; reuse an explicit matching agreement from the coordinating workflow.
- **Present the documentation plan in the conversation:** state the model name/question/type, implemented/proposed/maintained status, exact destination, literal headings and intended content, sources, notation, unresolved assumptions, affected sections, MIASE coverage, verification/review plan, and unavailable review roles.
- **Ask for explicit approval:** for example, "Do you approve this documentation plan and completion criteria so I may write the document?" Wait for a reply; silence or a general documentation request is not plan approval.
- **Write nothing before approval:** do not create, edit, move, rename, or draft the model document before the user confirms the plan. This includes preparing its initial structure or creating a separate draft, including through another agent. Planning checks never authorize simulations.
- **Draft only the approved document:** update the agreed file in place. Present a revised plan for confirmation before changing equations, assumptions, hypotheses, interpretation, required structure, or destination in ways that alter scientific meaning.

## Evidence, Terminology, and Scientific Prose

- Read [style-and-review.md](references/style-and-review.md) before drafting prose, notation, or equations.
- Ground statements in inspected code, an approved plan, or maintained evidence. Describe optional/inactive branches accurately; let code override stale comments while recording discrepancies. Label unimplemented equations and methods as proposed and do not imply convergence or physical validation.
- Follow terminology priority: an explicitly designated glossary/forbidden-term list; otherwise repository-declared terminology paths; otherwise the target repository's `docs/scientific_terminology.md`; otherwise one unambiguous existing glossary. Verify containment and reject symlinks; resolve missing/conflicting files or propose consistent local terms in the plan without creating a glossary file.
- Explain each mechanism in causal order: physical idea, defined quantities and equation, meaning of each term, then behavior and limiting cases. Use short connected paragraphs rather than mechanical label-per-sentence prose.
- Define every symbol, unit or dimensionless status, index, domain, and abbreviation before first use. Use $...$ inline math and standalone $$...$$ display blocks, with one source line per paragraph or list item.
- Place exact code/file identifiers containing forbidden terminology only in Section 7.1, apart from `Implementation:`, paired with their scientific meaning.
- Preserve the agreed model type and claim limits: effective parameters need no invented microscopic derivation; analytical work needs no invented numerical solve; toy-model intuition is not quantitative physical validation.

## MIASE Simulation Record and Separate Model Identity

- Use [the template's MIASE record](references/model-document-template.md#miase-simulation-experiment-record) in Section 7.2: three groups with rule identifiers **1A–1D, 2A–2D, and 3A–3B**, following [Waltemath et al. (2011), Box 2](https://doi.org/10.1371/journal.pcbi.1001122).
- For every rule, record the actual information or an exact pointer to its location in the document or an accessible existing record. Preserve the order; distinguish a missing requirement from a conditional rule that does not apply and explain each inapplicability.
- Cover all participating models, preprocessing, ordered simulation procedures, algorithm details, platform dependencies, postprocessing, and relationships among final results. Listing only equations, software versions, and output paths is insufficient.
- Label a planned simulation as planned. When no simulation experiment exists, retain the record heading with a reason MIASE is inapplicable; do not manufacture run settings, results, or compliance.
- Record model identity and source history separately in Section 7.1. Copy an applicable confirmed release name into `Model version control name:`, citing the source of that name, or leave the value literally blank; do not substitute a Git hash or invent a version for a parameter set.
- Keep physical rationale and verification/validation in their template sections. MIASE is a reporting guideline, not evidence of scientific validity or a guarantee of identical output on every platform.

## Post-Draft Review and Completion

- Review the finished draft against the approved outcomes, [standard template](references/model-document-template.md), and inspected sources using the two independent post-draft roles in [style-and-review.md](references/style-and-review.md#3-bounded-subagent-review-roles).
- Have one reviewer check template compliance, notation, units, equation/code/pseudocode fidelity, MIASE coverage, source and change records, and standalone readability; have the other assess physical rationale, assumptions, constitutive laws, evidence, regimes, and claim bounds. They must assess the identical final version without sharing conclusions.
- Fix meaning-preserving defects within scope and rerun both reviews after substantive revisions. If a role is unavailable, ask before a labeled main-agent fallback and report `independent review incomplete` with the missing role; reviewer absence alone does not make the scientific document provisional.
- Verify Section 7.1 records the inspected Git revision, current file state and any changes not yet recorded in Git, repository-relative paths, and SHA-256 hashes for modified, untracked, or unversioned model files, or explicit plan-only status. Check local links resolve to regular non-symlink files within the repository.
- Confirm the header order, applicable model version identifier or blank value, all MIASE responses, and honest disclosure of unperformed convergence or empirical validation checks.
- Once the agreed document deliverable and required final checks are satisfied, report its path, scope, reviews, corrections, and scientific limitations, then stop. Reuse valid evidence; do not expand into model code, new simulations, or further documents.
- Carry the same completion criteria through long-horizon work and resumed sessions. Missing required checks remain incomplete work, and scope changes require a revised agreement rather than silently moving the stopping point.

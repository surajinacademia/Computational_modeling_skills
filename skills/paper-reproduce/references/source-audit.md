# Source Inspection and Target Specification

Specify each target from primary sources before coding or running evaluations.

## Contents

- [1. Limit source inspection to the target](#1-limit-source-inspection-to-the-target)
- [2. Extract the complete target specification](#2-extract-the-complete-target-specification)
- [Completeness checklist](#completeness-checklist)
- [Existing copies and questions for the authors](#existing-copies-and-questions-for-the-authors)
- [3. Classify each item](#3-classify-each-item)
- [4. Freeze before evidence](#4-freeze-before-evidence)
- [Source-inspection completion check](#source-inspection-completion-check)

## 1. Limit source inspection to the target

Read the whole paper and its supplement once, then inspect in detail the final paper, errata, supplements, first-party code/data, and cited methods needed for the chosen matrix cell and target. Follow this authority order while keeping conflicts visible:

1. formal correction or erratum;
2. final paper;
3. supplementary methods or tables;
4. first-party repository, release, or dataset;
5. explicitly cited inherited method;
6. prior reproduction as secondary evidence only.

Author code clarifies implementation without silently overriding the paper. Record version, hash, and license for adapted code or data, keeping both sources when they disagree.

## 2. Extract the complete target specification

Record applicable items with exact locators:

- target statement, observable, contrast, uncertainty, sample count, baseline;
- equations, variables, assumptions, constitutive relations;
- parameters, values, units, ranges, and defaults;
- initial and boundary conditions;
- inputs, preprocessing, normalization, exclusions, and controls;
- sampling unit, independence structure, ensembles, replicates, and seeds;
- algorithm, discretization, resolution, precision, tolerances, convergence, stopping, and failure rules;
- aggregation, statistics, uncertainty, and plotting transforms;
- language, dependencies, author code/data, and inherited citations.

Format each locator as:

```yaml
source_id: S1
locator: "Methods, p. 7, Eq. 4"
```

Cite code by repository version plus file and line/function/config key, figures by panel, axes, and caption/text location, and datasets by release/version, file/table, columns, and filter rule (document-level citations alone lack verifiable traceability).

## Completeness checklist

Score what the paper supplies for the target before judging feasibility, answering each applicable point yes, partly, or no with a locator. The first eight points adapt the reproducibility scorecard of the BioModels curation study (Tiwari et al., Mol. Syst. Biol. 2021), which could not reproduce about half of 455 published kinetic models from the manuscript alone.

1. The mathematical expressions or rules are given and explained.
2. Parameter values and initial values are listed, with units.
3. Simulation conditions are stated: software and version, algorithm, and every change of parameters, concentrations, or states made for a reported result, including normalization.
4. The model or analysis code is publicly available.
5. The code is in a standard, validated format where the field has one (for example SBML, CellML, or a COMBINE archive, with SED-ML for the simulation instructions).
6. The code is deposited in a relevant model or code database.
7. Variables and entities are documented so that each is identified unambiguously.
8. The numerical results behind the figures are shared.

For experimental and statistical content add:

9. **Empirical:** how the measurements were collected is described well enough to interpret them (sample, instrument, protocol, conditions, and exclusions), and the measurements are available as files or tables.
10. **Statistical:** the statistical tests, sample sizes and their units, thresholds, and model parameters are reported.

A "no" on a point the target depends on is a gap to classify in Section 3, not a reason to guess.

## Existing copies and questions for the authors

- Before rebuilding a model, look for a curated copy in a model database (for example BioModels, Physiome Model Repository, or JWS Online) and for the authors' archived code or data; record its identifier and version, and treat it as first-party or secondary evidence according to who deposited it.
- When the authors could close a gap, draft a short, specific question for the researcher to send (the item, its locator, and the exact value or file needed). Record the date sent and any reply with its date; a reply is a source and is cited like one.
- Do not wait on a reply. In the curation study above fewer than a third of corresponding authors answered, so continue with the declared alternatives and revise if an answer arrives.

## 3. Classify each item

Tag each required item's source support:

- `reported`: stated directly in the cited source;
- `inherited`: explicitly delegated to a cited method (cite both delegation and inherited locator);
- `ambiguous`: wording allows materially different readings;
- `conflicting`: authoritative sources disagree;
- `missing`: required but absent from inspected sources;
- `not_applicable`: outside this target or model class.

Label inferred, reconstructed, or proposed choices and their rationale separately; tag extracted data as published dataset, table, or digitized figure with extraction uncertainty. Brainstormed candidate models remain proposals rather than resolving source gaps on plausible output alone.

Tag each unresolved item's materiality:

- `blocking`: prevents defining or evaluating the target; bar assessment evidence and use `not_evaluated` (never `inconclusive`);
- `sensitivity_required`: test declared plausible alternatives and report only conclusions that survive them;
- `nonmaterial`: cannot alter the conclusion; document and continue;
- `not_applicable`: no gap analysis needed.

For every ambiguous, conflicting, or missing item record:

1. why it matters;
2. materiality;
3. impact on exact reproduction;
4. any unique source-backed reconstruction;
5. remaining alternatives;
6. evidence or user decision needed to resolve it.

Never fit missing parameters from curve agreement; a reconstruction stays a reconstruction even if it matches a figure. A blocked claim or result target may be rescoped explicitly to a model target with recorded scope and labeled reconstructions (model checks neither test the claim nor reproduce the result; targets are alternatives, not a mandatory sequence).

## 4. Freeze before evidence

Track matrix cell, target, sources, source-inspection decisions, item list, protocol, exclusions, and completion rules in one maintained target record. When comparison applies, declare qualitative criteria, quantitative criteria, or both with tolerances, uncertainty rules, and separate outcomes; for proofs, code checks, or new applications needing no paper comparison, state required evidence and why comparison is N/A.

Freeze scientific choices before generating assessment evidence, logging dated/versioned records and source/code/data hashes. Material scientific edits start a new revision while retaining prior protocols and evidence; routine run metadata appends cleanly without altering scientific terms.

The optional `schema-v1` target card (`assets/target-card-template.yaml`, retaining its literal `schema_version` and `source_audit` YAML keys) and specification checker (`scripts/validate_target_card.py`) fit only computational workflows matching their constraints (single comparison mode, comparison required at claim/result depth, positive execution evidence, fixed routes); never warp a target to fit them. When used, `scripts/validate_target_card.py` hashes the scientific fields plus revision ID and lineage as compact, key-sorted UTF-8 JSON with SHA-256 (`sha256:` prefix); scientific changes require a new revision with each predecessor card kept at its contained relative path and canonical hash (no escaping or missing-card links). Link any helper card from the maintained target record.

Cheap diagnostics may run before the freeze only if labeled diagnostic and excluded from scientific verdicts.

## Source-inspection completion check

Before implementing, verify a reader can tell:

- what sources report verbatim;
- what is inherited, reconstructed, unresolved, or N/A;
- which gaps block evidence or require sensitivity analysis;
- which exact locator backs every retained fact;
- which target-record revision governs execution and evaluation.

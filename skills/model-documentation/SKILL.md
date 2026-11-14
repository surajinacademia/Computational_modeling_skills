---
name: model-documentation
description: Plan, write, revise, or audit one physics-focused scientific model document from code, an approved plan, or a maintained methods record. Require approval of the plan and fixed structure before drafting; explain physical rationale, defined notation, equations, and numerical methods, then independently review scientific fidelity, readability, and adherence to the standard template. Do not use it for an isolated scientific explanation or question that does not create, edit, restructure, or audit a model document.
---

# Model Documentation

Make one scientific model understandable without reverse-engineering its code by building a connected physical explanation before introducing mathematical equations and numerical methods.

## 1. Preconditions, Scope, and Template

- State only what inspected evidence supports, distinguish physical assumptions from established findings, omit run-result narratives or sweep figures, and keep missing evidence explicit (no outgoing skill dependencies).
- When invoked by `computational-modeling` or `paper-reproduce`, verify and reuse supplied scope, sources, evidence, destination, and plan; an already approved matching plan in this session satisfies Mandatory Approval Before Writing without re-asking, and findings return to the invoking workflow without re-invoking it, editing code, or running simulations.
- REQUIRED BEFORE proposing structure or planning a model document: read [references/model-document-template.md](references/model-document-template.md) (fixed seven-section, ten-subsection document skeleton, `Implementation:` and `Model version control name:` header fields, Section 3 five-column table, and section boundaries).
- Retain inapplicable template sections with a brief reason, add fourth-level subheadings inside required subsections when distinct mechanisms need separate explanations, and alter required headings or order only when mandated by a higher-priority repository rule or explicit user override recorded verbatim in the approved plan (reviewing approved alternates against their literal headings).
- Use [examples/overdamped-harmonic-oscillator/model.md](examples/overdamped-harmonic-oscillator/model.md) only as a structural reference for equations, pseudocode, and Mermaid flowcharts: write connected prose rather than its older bullet-heavy style, and never copy, create, or execute its companion code.
- Produce exactly one self-contained model document in the repository's model-documentation area (embedding pseudocode, flowcharts, references, and the Section 7 methods record while linking existing analyses without moving files); never create separate plan, review, or companion documents unless resolved with the user beforehand.

## 2. Mandatory Approval Before Writing

- Follow this sequence whenever creating, revising, or restructuring a document (read-only reviews stay strictly non-editing; any file write requires prior plan confirmation):
  1. **Inspect without writing:** read repository rules, any existing model document, and primary code or originating plan (running the code-understanding subagent when code exists; see [references/style-and-review.md](references/style-and-review.md#3-bounded-subagent-review-roles)).
  2. **Present the plan in conversation:** state model name, question, status (implemented, proposed, or maintained record), exact destination path, literal headings in order with intended content, sources, notation choices, unresolved assumptions, verification/review plan (planning tests never authorizes execution), affected versus unchanged sections, and any missing subagent capability.
  3. **Stop and wait for explicit confirmation of the plan:** ask a direct question such as "Do you approve this documentation plan so I may proceed with writing?" and end the turn.
  4. **Enforce the pre-approval write ban:** never create, edit, move, rename, initialize from a document skeleton, or save a model document (or draft in a side file or subagent) before explicit user approval of the plan; a general request to document or silence is never confirmation.
  5. **Draft only the approved document:** write or revise the agreed file in place; seek a revised plan and renewed confirmation before changing equations, assumptions, hypotheses, interpretation, structure, destination, or sections/documents in ways that alter scientific meaning.

## 3. Evidence, Terminology, and Writing Invariants

- REQUIRED BEFORE drafting prose, notation, or equations: read [references/style-and-review.md](references/style-and-review.md) (terminology fallback order, connected physical prose, symbol-definition rules, and subagent review checklists).
- **Evidence by source:** from code, document inspected behavior (including optional/inactive branches; code overrides stale comments, with conflicts recorded explicitly); from a plan, mark equations and numerics proposed without claiming implementation, accuracy, or physical validation; for maintained records, cite concrete evidence for rejected alternatives.
- **Strict terminology fallback order:** check (1) an explicitly designated glossary and forbidden-term list, else (2) repository-declared terminology paths, else (3) the target repository's `docs/scientific_terminology.md`, else (4) one unambiguous existing repository glossary (verifying containment and rejecting symlinks); resolve missing/unsafe/conflicting files before writing, or define consistent terms locally for plan approval without creating a glossary file.
- **Connected physical prose:** open with entities, actions, and interactions, teaching each mechanism as `physical idea -> quantities and equation -> term meanings -> behavior and limits` while avoiding label-per-sentence prose (paragraphs where every sentence starts with a bold or categorical tag instead of causal transitions).
- **Notation and forbidden terms:** define every symbol, unit or dimensionless status, index, domain, and abbreviation before first mathematical use with `$...$` inline and standalone `$$...$$` display math (one source line per paragraph or bullet); place exact source identifiers containing terms forbidden by the target repository's terminology list only in Section 7.1 (aside from `Implementation:`), paired with scientific meaning.

## 4. Post-Draft Completion and Verification Criteria

- Review the stable final draft directly against [references/model-document-template.md](references/model-document-template.md) and inspected sources via two independent post-draft subagents ([references/style-and-review.md](references/style-and-review.md#3-bounded-subagent-review-roles)): a verification/template reviewer and a scientific reviewer assessing the identical final document version without sharing conclusions.
- Fix meaning-preserving defects within declared scope and re-run both reviewers on substantive edits; if a reviewer role is unavailable, ask before using a labeled main-agent fallback and report delivery as `independent review incomplete` naming the missing role (without marking the document itself provisional solely for reviewer unavailability).
- Verify Section 7.1 records inspected Git revision and uncommitted working-tree changes, repository-relative paths and SHA-256 hashes for uncommitted, untracked, or unversioned model files (or plan-only status), and non-symlink regular-file links within repository bounds.
- Confirm `Implementation:` sits first below the title followed by `Model version control name:` before Section 1, copied strictly from a confirmed applicable recorded release name (cited in Section 7.1) or left literally blank, and disclose missing convergence or empirical physical validation evidence without implying described tests ran.
- Report in the conversation: document path, honored approval scope, template adherence, completed reviews, corrections made, and remaining scientific or review limitations, without creating separate review files.

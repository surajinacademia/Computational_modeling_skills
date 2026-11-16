---
name: research-project-setup
description: Set up or reorganize a research repository using the owner's template, Good Research Code practices, and a Git workflow for verified checkpoints, concurrent work, and recovery. Use only when the user explicitly requests research-project-setup or explicitly asks to apply this template. Routine repository opening, coding, error diagnosis, and general maintenance do not activate it.
---

# Research Project Setup

- Apply the owner's research layout to the requested repository and repair meaningful deviations when reorganization is requested.
- Audit-only or planning requests stay strictly read-only, and opening a workspace never runs this workflow automatically.
- Organize the project for an unfamiliar collaborator or your future self so anyone can see what investigation ran, why it was set up that way, what the evidence supports, and how to repeat it with updated inputs or parameters.

## Template and setup guidance

- Read [the README template](assets/template/README.md) for the target directory layout, folder responsibilities, setup fields, and experiment records, and read [the AGENTS template](assets/template/AGENTS.md) when creating or updating repository instructions, replacing template placeholders with inspected project facts and merging existing project rules rather than overwriting them.
- Read [the research setup lessons](references/goodresearch-setup.md) for the Good Research Code rationale, Noble's (2009) principles for organizing computational biology projects, and their adaptations here, keeping raw data, analysis, verification checks, and model implementations separated without modifying this skill's shared template assets during project setup.
- Read [the reusable Git workflow](references/git-workflow.md) before initializing Git, creating checkpoints, branching, using concurrent worktrees, staging, or recovering work (consulting its history-maintenance section only when history edits are requested), adapting branch names, checks, and storage choices to the actual repository rather than copying another project's fixed limits or absent scripts.

## Inspect and map

- Inspect the target paths, existing instructions, Git boundaries and uncommitted working-tree changes, dependency files, entry points, raw inputs, saved results, verification checks, and nested repositories using bounded file discovery.
- Compare contents against the README template by scientific purpose and provenance rather than file extension alone: keep model implementation notebooks with their model, data-analysis notebooks with analysis, and verification notebooks with verification checks while preserving scientific model names and version identities.
- For an existing repository, sketch a compact old-path → new-path map before moving files; an explicit request to reorganize authorizes routine reversible moves and path updates without adding a second approval pause.
- Keep required package or framework paths and nested Git repositories intact (recording concrete exceptions in the README), omit unused template folders, and never impose model folders on an unrelated project or invent missing model versions.

## Create a project

- Copy or adapt the two template assets into the target repository, filling purpose, status, actual layout, environment, entry points, commands, and data/output locations from inspected evidence (marking unsettled choices unconfigured rather than inventing commands).
- Create only the directories the project needs—without adding a project-local `skills/` folder—and preserve existing workflows.
- Use the project's dependency manager and reproducible lock or environment specification, preferring an installable Python package when reusable code warrants it, ignore environments, caches, large raw datasets, and disposable outputs while keeping deliberate reference test inputs, and initialize local `git init` early for a new standalone project without nesting existing repositories or creating remotes unless requested.

## Make experiments understandable and repeatable

- Configure the experiment records and repeatable procedures described in the README template within existing locations, leaving missing historical rationale explicit rather than inventing commands or claiming unperformed runs:

- Connect dated research entries to the scientific question, methodological and parameter rationale, producing run, observations, physical interpretation, limitations, and next question, separating execution crashes from informative negative scientific results (records need not be notebooks).
- Identify external or experimental inputs by source, version or accession, retrieval date, and checksum or immutable snapshot location.
- Pair prose descriptions with ordered commands, driver scripts, or notebook steps that pass parameters and repository-relative paths explicitly, capture interactive choices reproducibly, and state any remaining manual steps.
- Document input admissibility and bounds checks, exit-status checks, failure stops, and partial-versus-complete output checks; reuse completed steps only when provenance and outputs match, resume only from verified checkpoints, retain failed-run logs, and inspect progress without launching new simulations.
- Start with clear recorded commands and introduce a driver script only when complexity or reuse justifies it, keeping dated run folders under results distinct from model version identities and Git history; setup and reorganization never authorize building a new execution framework or rerunning simulations.

## Apply the Git workflow

- Inspect the branch, working tree, staging index, and recent history before editing, preserving inherited changes and staging.
- An explicit setup or reorganization request includes local checkpoints of verified task-owned work within project rules (audit-only requests create no commits); before substantial edits, moves, or direction changes, checkpoint verified task-owned work or save unfinished work in a scoped recovery copy without sweeping in unrelated changes.
- Use focused branches when helpful and separate worktrees for concurrent work; stage explicit paths or reviewed hunks, run applicable checks on staged contents, and commit coherent verified units (using an isolated worktree or scoped commit if unrelated staging exists, or leaving work uncommitted with an explanation when ownership cannot be isolated).
- Record the adapted Git routine concisely in the project README and link it from `AGENTS.md`, keeping commits local unless pushing or releases are explicitly authorized and recording recoverable uncommitted working-tree diffs whenever retained scientific results depend on dirty code.

## Reorganize an existing repository

- **Protect existing work first:** checkpoint verified task-owned work and back up affected unfinished, untracked, and Git-ignored files in a scoped recovery copy (commits omit ignored data and diffs omit untracked files), deferring moves that touch files used by active writers.
- **Move files according to the map:** resolve any destination collisions without overwriting or deleting data, skip external symlinks, nested `.git` directories, and archive rewrites, and ask only when a material ownership, identity, or scope ambiguity arises.
- **Repair dependent scripts and analyses:** update affected imports, package metadata, script and notebook input/output paths, test discovery, reference test inputs, relative links, documented commands, and CI configs using portable repository-relative paths while leaving raw data, saved outputs, notebook formats, model equations, parameters, and expensive generated outputs untouched.
- **Update project documentation:** refresh the README directory tree, setup steps, navigation links, entry points, and result locations, merging path updates into `AGENTS.md` without dropping project-specific rules.
- **Verify statically and safely:** confirm moved files arrived intact apart from planned path updates and check links, discovery, imports, and authorized lightweight checks; inspect module entry points before importing anything that triggers computation, since reorganizing directories never authorizes running simulations, sweeps, or full notebook reruns.

## Summary and verification

- Stop once in-scope layout deviations and dependent paths are updated and checked, reporting any uninspectable external consumers or unrun checks honestly rather than claiming full template compliance.
- Summarize the layout and README updates, experiment-record locations and remaining reproduction gaps, preserved exceptions, local checkpoint commits, checks run, and any unresolved path consumers or uncommitted changes, keeping structural checks, code execution, and scientific validation distinct.

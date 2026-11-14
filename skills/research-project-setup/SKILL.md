---
name: research-project-setup
description: Set up or reorganize a research repository using the owner's template, Good Research Code practices, and a Git workflow for verified checkpoints, concurrent work, and recovery. Use only when the user explicitly requests research-project-setup or explicitly asks to apply this template. Routine repository opening, coding, error diagnosis, and general maintenance do not activate it.
---

# Research Project Setup

Apply the owner's layout to the requested repository and fix material deviations when reorganization is requested. Inspections and plans stay read-only, and opening a workspace never triggers this workflow. Organize so an unfamiliar collaborator or future self can see what ran, why, what the evidence supports, and how to repeat it with new inputs or settings.

## Template and setup guidance

- **REQUIRED BEFORE creating or reorganizing layout and project rules:** read [the README template](assets/template/README.md) for layout, folder roles, setup fields, and result records, and [the AGENTS template](assets/template/AGENTS.md) when creating or updating project rules; replace placeholders with inspected project facts and merge existing rules instead of overwriting them.
- **REQUIRED BEFORE configuring experiment records:** read [the research setup lessons](references/goodresearch-setup.md) for Good Research Code rationale, Noble's (2009) experiment rules, and adaptations, keeping the template's separation of data, analysis, verification, and models without modifying skill assets during project setup.
- **REQUIRED BEFORE Git initialization, checkpointing, or moves:** read [the reusable Git workflow](references/git-workflow.md) for setup, checkpoints, branching, concurrent worktrees, staging, and recovery (reading its history-maintenance section only when requested), adapting branch names, checks, and storage policies without copying another repository's limits or missing checkers.

## Inspect and map

- Inspect target paths, existing instructions, Git boundaries and uncommitted working-tree changes, dependencies, entry points, raw inputs, saved results, tests, and nested repos via bounded file discovery.
- Compare against the README template by purpose and provenance rather than file extension: put implementation, analysis, and verification notebooks with their respective roles while preserving model names and versions.
- For existing repositories, sketch a compact old-path -> new-path map before moving files; an explicit reorganize request authorizes routine reversible moves and path updates without another approval round.
- Keep framework/package paths and nested repos intact (log exceptions in README), omit unused directories, and never force scientific model folders onto unrelated projects or invent missing versions.

## Create a project

- Copy or adapt the two template assets, filling purpose, status, layout, environment, entry points, commands, and data/output paths from evidence (mark unresolved settings unconfigured rather than inventing commands).
- Create only needed folders (no project-local `skills/` folder) and preserve configured workflows.
- Use the project's dependency manager and reproducible dependency file, preferring an installable Python package when code is reusable.
- Ignore environments, caches, large data, and disposable outputs while keeping deliberate reference test inputs, and run local `git init` early for a new standalone project without nesting existing repos or creating remotes or publishing.

## Make experiments understandable and repeatable

Configure the README template's experiment records and workflows within existing locations, leaving missing history explicit rather than inventing rationale or claiming unperformed runs:

- Link dated research entries to the question, methodological/parameter rationale, producing run, observations, interpretation, limitations, and next step; explain failures with evidence, separating execution crashes from informative negative results (logs need not be notebooks).
- Identify inputs by source, version or accession, retrieval date/retriever, and checksum or immutable snapshot/recovery location.
- Pair prose with ordered commands, a driver script, or notebook steps: pass explicit settings and paths to helpers, document inputs/outputs/options, capture interactive decisions reproducibly, and report remaining manual steps.
- Document input format and bounds checks, exit-status checks, failure stops, and partial versus completed output checks.
- Reuse completed steps only with matching provenance and verified outputs, resume only from verified checkpoints, preserve failed-run logs, and inspect progress without launching computation.
- Start with recorded commands and introduce a driver or helper only when complexity or reuse warrants it, keeping dated run folders under results distinct from model identities and Git history.
- Setup and reorganization never authorize building a new execution framework or rerunning experiments; verify script input and output interfaces and report unconfigured execution checks explicitly.

## Apply the Git workflow

- Inspect branch, working tree, index, and history before editing, preserving inherited changes and staging.
- Explicit setup or reorganization includes local checkpoints of verified task-owned work unless restricted (inspections create no commits); before major edits, moves, or direction changes, commit verified task-owned work or save unfinished work in a scoped recovery copy without committing unrelated edits.
- Use topic branches when helpful and separate worktrees for concurrent editing; stage explicit paths or reviewed hunks, verify staged contents with configured checks, and commit coherent verified units.
- Use an isolated worktree or scoped commit if unrelated staging exists, or preserve work uncommitted and explain why.
- Record the adapted workflow in README/dev docs and link it briefly from `AGENTS.md`; keep checkpoints local (pushes, releases, and destructive cleanup need separate authorization), and identify executed source including recoverable uncommitted working-tree changes for retained results.

## Reorganize an existing repository

1. **Back up first.** Checkpoint verified work and preserve affected unfinished, untracked, and ignored files in a scoped recovery copy (commits miss ignored data, patches miss untracked files); defer moves affecting active writers.
2. **Move files within declared scope per the map.** Resolve destination collisions without overwriting or deleting data; skip external symlinks, nested `.git`, and archive rewrites; ask only for material ownership, identity, or scope ambiguity.
3. **Update dependent analyses and scripts.**
   - Update affected imports, packaging, script and notebook paths, test discovery, reference test inputs, links, commands, and CI configs using portable explicit-base paths.
   - Leave raw data, saved outputs, notebook formats, model equations and parameters, and expensive generated files unchanged.
4. **Update docs.** Refresh the README tree, setup, navigation, entry points, and result paths; merge path edits into `AGENTS.md` without dropping project rules; keep any move map compact in existing records.
5. **Verify statically and safely.** Confirm files moved intact (only planned path/config edits) and check links, discovery, imports, and authorized tests; inspect entry points before importing modules that trigger computation, as moves never authorize simulations, sweeps, or full notebook reruns.

Stop once deviations within declared scope and dependent analyses and scripts are updated and checked; disclose uninspectable dependent analyses and scripts or unrun checks rather than claiming full template compliance.

## Completion Summary

- Report layout and README edits, experiment-record locations and reproduction gaps, preserved exceptions, checkpoint commits, checks and outcomes, and any unresolved dependent analyses and scripts or uncommitted working-tree changes.
- Keep structural checks, execution, and scientific validation distinct; push, publish, install packages, or run heavy compute only within existing authorization.

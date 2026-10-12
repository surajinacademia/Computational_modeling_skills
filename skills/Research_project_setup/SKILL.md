---
name: Research_project_setup
description: Set up or reorganize a research repository using the owner's template, Good Research Code practices, and a Git workflow for verified checkpoints, concurrent work, and recovery. Use only when the user explicitly requests Research_project_setup or explicitly asks to apply this template. Routine repository opening, coding, debugging, and general maintenance do not activate it.
---

# Research project setup

Apply the owner's organization to the requested project and repair meaningful deviations when reorganization is requested. An explicit audit or plan request remains read-only. Opening a workspace never runs this workflow automatically.

## Template and setup guidance

Read [the README template](assets/template/README.md) for the target layout, directory responsibilities, setup fields, and result records. Read [the AGENTS template](assets/template/AGENTS.md) when creating or updating project instructions. These are usable starter assets; replace their fields with inspected project facts, and merge existing guidance rather than overwriting it.

Read [the Good Research Code setup lessons](references/goodresearch-setup.md) for the rationale and source attribution. The bundled README owns the layout; do not substitute the handbook's original tree. The assets are the maintained template for this skill. Keep any standalone copy synchronized when the user asks to revise the template; applying it to a project does not change the shared assets.

Use [the reusable Git workflow](references/git-workflow.md) for project setup, checkpoints, branching, concurrent edits, staging, and recovery. Read its history-maintenance section only when that work is requested. Adapt the workflow to the project's actual branch names, checks, storage choices, and authorization; do not copy another repository's fixed limits or reference a checker that is absent.

## Inspect and map

- Identify the requested repository, applicable instructions, Git boundaries and current changes, existing environment and dependency files, active entry points, raw inputs, saved results, test conventions, and nested repositories. Start with bounded file discovery and follow relevant references.
- Compare actual contents with the README template. Classify by purpose and provenance, not just extension or current folder name: an implementation notebook belongs with its model, an analysis notebook with analysis, and a verification notebook with tests. Preserve scientific model names and version identities.
- For existing projects, build a compact old-path → new-path map for the affected files and their consumers. Explain it briefly before making moves; an explicit request to reorganize authorizes routine reversible moves and their path repairs without a second approval round.
- Use the requested layout wherever applicable. Keep required package/framework paths and external or nested repository boundaries intact; document concrete exceptions in the README. Missing unused directories are not deviations. Do not impose scientific model folders on an unrelated project, or invent model versions or missing scientific context.

## Create a project

Copy or adapt the two template assets into the chosen project. Fill in purpose, status, actual layout, environment, entry points, commands, and data/output locations from available evidence. If a choice is unresolved, label it as unconfigured rather than inventing a working command. Create only directories needed for the current project; the starter does not include a project-local skills directory. Preserve any existing configured workflows.

Use the project's chosen dependency manager and a reproducible dependency specification. Prefer an installable package for reusable Python code when needed; retain established packaging. Apply ignore rules to identified environments, caches, large data, and disposable outputs without excluding deliberate test fixtures or reference results. For requested setup of a new standalone project, initialize local Git early unless project instructions say otherwise; reuse existing repositories without nesting or replacing their history. A local setup request does not itself authorize creating a remote or publishing.

## Apply the Git workflow

Inspect the branch, working tree, index, and relevant history before edits. Preserve inherited changes and staging. An explicit request to apply this setup or reorganization includes routine local checkpoints of verified task-owned work, subject to existing project restrictions; an audit-only request creates no commit. Before substantial edits or a change of direction, checkpoint completed task-owned work or preserve unfinished work in a scoped recovery copy. Do not commit unrelated inherited work to get a clean checkout.

Use a focused branch when useful and a separate worktree for concurrent editing. Stage explicit paths or reviewed hunks, inspect the exact proposed commit, and run the applicable checks against those staged contents. Commit coherent verified changes at meaningful boundaries and before handoff. Preserve unrelated staging through an isolated worktree or an explicitly scoped commit method. If safe ownership or verification cannot be established, preserve the work and report why it remains uncommitted.

Record the adapted routine in the project's README or existing development guide and link it briefly from `AGENTS.md`. Use the template's Git section as the concise default. Checkpoint commits remain local; pushing, releases, destructive cleanup, and published-history changes need their own authorization. Retained results must identify the executed source, including recoverable dirty changes when applicable, not just a folder label or commit ID.

## Reorganize an existing repository

1. Ensure affected work is recoverable before moving it. Apply the Git workflow above: checkpoint preceding verified task-owned work and preserve affected unfinished, untracked, and ignored files in a scoped recovery copy. A commit cannot back up ignored data, and a patch alone omits ordinary untracked files. Preserve unrelated work and ongoing runs; defer moves that would disrupt a live writer until its dependency is resolved.
2. Move only files in the requested scope according to the map. Inspect destination collisions and preserve both distinct contents; never overwrite, discard, or delete data merely to fit the tree. Do not traverse external symlink targets, relocate nested Git metadata, or rewrite archives. Ask only for a material unresolved ownership, identity, or scope decision, while completing independent moves.
3. Update affected imports, package configuration, script/notebook input and output paths, test discovery and fixtures, relative links, documented commands, and any relevant job/build/CI configurations. Keep paths portable and their base explicit. Preserve raw data and saved-output contents; repair their consumers and maintained records without rewriting historical provenance. Do not convert notebook formats, clear stored outputs, change model equations or parameters, or regenerate expensive results to make a move appear successful.
4. Update the project's actual README tree, setup, navigation, entry points, and result locations. Keep agent constraints in `AGENTS.md` and merge necessary path changes without dropping project-specific rules. Store a compact move map in existing maintenance records when useful; avoid introducing a permanent bookkeeping system for a small move.
5. Verify moved files arrived intact, allowing only intended path/configuration edits; check affected links, source discovery, imports, and test collection as appropriate. Run the smallest relevant authorized checks, including any project-required checks. Importing some model modules starts computation: inspect entry points and use static checks when execution would exceed scope. A directory move alone does not authorize a simulation, sweep, or whole-notebook rerun.

Stop when applicable deviations and their affected references are repaired and checked. If an external consumer cannot be inspected or an important check cannot run, report the specific gap. Do not silently call the repository conformant.

## Handoff

Report the changed layout and README, preserved exceptions, checkpoint commits, checks and their outcomes, and any unresolved path consumers or uncommitted work. Distinguish structural verification from scientific-result validation. Push, publish, install dependencies, or run substantial computation only within the user's existing authorization.

# [Project name]

[Describe the purpose or research question, expected inputs and outputs, and current status in a short paragraph.]

This starter contains `AGENTS.md` and `README.md`. Copy it for a new project, replace the bracketed fields, and create only the directories and configuration files needed. No runtime, data, or tests are configured yet.

An unfamiliar collaborator or your future self should be able to understand what was done and why, follow the evidence behind the conclusions, and repeat the procedure with new inputs or settings. Use this README for navigation and executable procedures, and link the research records that explain the decisions and interpretation.

## Start here

1. Define the intended result and its acceptance criteria. Identify the active code or notebook and the authoritative inputs.
2. Choose the language and project environment; record dependencies and the actual setup commands below.
3. Use the layout below for the parts the project needs, and update the map to match the files you create. Document any required language or framework exceptions.
4. Add ignore rules before staging files. Initialize local Git early for a new standalone project, preserving any existing repository, and follow the Git workflow below. Configure a remote or publish only when authorized.
5. Record a small runnable example and the checks that demonstrate its expected behavior. Replace template fields with verified information.

## Repository layout

Use this research-project layout when creating or explicitly reorganizing a repository. It separates files by purpose as described in [Good Research Code: project setup](https://goodresearch.dev/setup), with the owner's analysis, testing, and model-development directories. The directories shown are a template, not files already included; create each when needed.

```text
project/
├── AGENTS.md                      # Agent behavior and project constraints
├── README.md                      # Purpose, setup, navigation, commands, and status
├── analysis/
│   ├── results/                   # Derived data, plots, tables, videos, and run records
│   └── scripts/                   # Analysis scripts and native exploration notebooks
├── data/                          # Raw inputs and their provenance
├── tests/
│   ├── data/                      # Reference test inputs and benchmark datasets
│   ├── results/                   # Verification outputs, comparisons, and run records
│   └── scripts/                   # Test code and verification notebooks
├── development/
│   └── models_versions/           # Named model implementations and variants, tracked in Git
└── docs/                          # Methods, decisions, and detailed documentation
```

Choose locations by purpose. Preserve original data under `data/`; place derived analysis output files under `analysis/results/`. Keep small reference test inputs and established reference values under `tests/data/`, executable checks under `tests/scripts/`, and newly generated verification outputs under `tests/results/`. A generated output must not silently replace a test's reference data. Retained simulation outputs belong with the analysis or verification they support, with a record linking them to their producing model and settings.

Place named model implementations and scientific variants under `development/models_versions/`, retaining their existing identities and recording the active entry point. Git records source history; the directory does not require a new copied model for each edit, or a new scientific version for a file move. Native notebooks belong with their role: analysis, verification, or model implementation. Preserve established notebook formats and configured pairs.

Use descriptive run folders when multiple configurations produce results, and record how each retained result was made. A date plus purpose, such as `analysis/results/2026-10-30-baseline/`, can make experiment history easier to follow; retain established run identifiers and record start/end dates for work spanning several days. Dates identify experiments, not copied source versions. Keep required root configuration and language/framework conventions, such as an existing installable `src/project_name/` package or test discovery configuration, and document those exceptions here. Add `literature/`, `paper/`, or `archive/` only when needed. Do not force unrelated software, teaching, or job-search repositories into a scientific-model hierarchy.

To apply this template, explicitly ask: `Use $research-project-setup to set up this project` or `Use $research-project-setup to reorganize this repository and update its README`. The skill is manual-only; merely opening a repository or making ordinary edits does not trigger it. An inspection-only request reports deviations without moving files. Reorganization preserves recoverable copies, updates affected imports, paths, links, and commands, and checks the resulting entry points.

## Environment and setup

Record the supported language/runtime versions, operating-system or external-tool requirements, and dependency files:

- Runtime and tools: [versions and prerequisites]
- Environment and dependency files: [paths]
- Setup and activation: [exact commands and working directory]
- Data access: [source, retrieval procedure, access requirements, and expected local paths; or not applicable]

Use a project environment. Choose dependency files appropriate to the stack, such as `pyproject.toml`, `requirements.txt`, `environment.yml`, or Julia's `Project.toml` and `Manifest.toml`; retain only those used.

For reusable Python code, configure an installable package, for example under `src/project_name/`, using the current [Python packaging guidance](https://packaging.python.org/en/latest/guides/writing-pyproject-toml/). Once packaging is configured, `python -m pip install -e .` installs it for development. Avoid repeated `sys.path` edits.

## Run and verify

Replace each field with a real command or notebook procedure. State its working directory, expected result, and whether it launches substantial computation. Use `not applicable` when a category does not belong to the project.

| Task | Command or procedure | Expected result |
| --- | --- | --- |
| Smallest example | [entry point, arguments, working directory or notebook kernel] | [observable result] |
| Focused verification | [relevant test or independent calculation] | [acceptance criteria or justified tolerance] |
| Full workflow, when requested | [ordered steps and configuration] | [output locations and completion criteria] |
| Lint, format, or build, if configured | [commands; identify any that modify files] | [expected checks or generated files] |

Expose run settings through explicit parameters, configuration, or command-line arguments. Record every operation needed to reproduce the experiment in order, including preparation and postprocessing. Keep path choices in the driver or configuration, pass them to helpers, and resolve project paths from a documented portable base. Document each script's inputs, outputs, options, and working directory through usage/help or a linked interface description. See [Good Research Code: project documentation](https://goodresearch.dev/pipelines).

Replace hand edits to intermediate data with recorded transformations. Capture interactive selections, correction tables, or exact patches when a scripted transformation is impractical, and document how to replay them. Identify any remaining manual step; hidden notebook state or an undocumented edit prevents full reproduction. Preserve the original inputs.

Use recorded commands for a simple experiment. Add a small driver script when repetition, complexity, or a requested single-command interface warrants it; extract reusable project functions when several procedures need them. Keep experiment-specific procedures with their analysis or verification code, retaining existing frameworks. Explain the purpose and order of driver steps so a reader can understand the procedure without reverse engineering every helper; avoid building a general workflow system without demonstrated need.

### Failure, completion, and resumption

Run input format and bounds checks for plausible input failures using established readers for standard formats. Check invoked commands' exit status, report errors, and stop dependent steps after a failure. Preserve diagnostics and partial outputs with their failed or incomplete status; a later plot or summary must not conceal an earlier failed stage.

When writing output files, use temporary names in the destination directory and finalize them after successful writing and appropriate checks, using atomic replacement where supported. For a run producing several files, mark it complete only after all required output files pass their completion checks. Preserve previously retained results when rerunning; file existence alone proves neither completion nor scientific validation.

Reuse a completed step only when its recorded inputs, relevant source, settings, and environment match and its required outputs are complete. Resume interrupted work from a verified checkpoint with matching provenance and compatible state; otherwise restart the affected step as a new attempt. Keep resumed work incomplete until final output checks pass, and distinguish step completion from scientific validation. Changed prior steps require reconsidering subsequent outputs. Preserve failed attempts and record the new attempt instead of deleting evidence to force a rerun. For long workflows, provide an inexpensive status or summary procedure that labels partial progress, failures, and completed work without launching more computation. Adapt existing workflow/status facilities rather than creating a second system.

- Failure and completion checks: [commands or conditions, expected output files, and status location; or not configured]
- Resume/reuse and progress inspection: [matching criteria and safe procedure; or not applicable/not configured]

Verification status: **not yet configured or executed**. Replace this with the checks actually performed, their date and scope, and any remaining limitations.

## Data and results

| Item | Location and record |
| --- | --- |
| Original inputs | [`data/` paths; source URL/repository, version/accession, retrieval date and retriever where applicable, content identifier when needed, units and column definitions, and usage restrictions] |
| Active implementation | [`development/models_versions/` paths and model identity, or a documented package-layout exception] |
| Analysis | [`analysis/scripts/` entry points and corresponding `analysis/results/` outputs] |
| Verification | [`tests/scripts/` checks, `tests/data/` inputs, and `tests/results/` outputs] |
| Reproduction instructions | [commands/configuration or notebook, source revision, environment, and relevant parameters/seeds] |
| Retained results | [output paths, producing run, and verification or scientific validation status] |
| Research log | [existing chronological record or chosen file within `docs/` or the relevant results location; or not yet configured/not applicable] |
| Known limitations | [missing inputs, unperformed checks, unresolved assumptions, or not applicable] |

Preserve raw inputs and record transformations. Keep large data and disposable outputs out of ordinary Git history; track the code, configuration, small reference test inputs, provenance, and instructions needed to recover or regenerate them. Document external storage and backup locations. Git ignore rules do not provide a backup.

A URL may later serve different data. Use dataset versions, accessions, checksums, or another suitable content identifier to identify the actual inputs. For changing sources, retain a permitted snapshot or document an immutable retrieval method and its storage location; disclose when the original input cannot be recovered. Preserve access restrictions and do not put credentials or sensitive data into provenance records.

### Experiment records

When experiments begin, maintain dated entries in the existing research log or a lightweight record at the location above. This is a prose research record; use an executable notebook when appropriate to the work, without imposing a notebook format or duplicating an existing record. Each entry connects:

- The question or objective and why the approach, comparison, or parameter choice was made.
- The run identifier and links to exact inputs, source/settings/environment, ordered commands or driver, and resulting output files.
- Observations and the evidence supporting the interpretation, including uncertainty and limitations.
- Unsuccessful attempts, why they were judged unsuccessful, and the next decision or experiment.

Distinguish execution failure, an inconclusive analysis, and a scientifically informative negative result. Preserve earlier entries and date later corrections or reinterpretations. Summarize relevant methodological decisions from discussions with enough context for collaborators, respecting confidentiality. Do not invent missing historical rationale or infer it from a plot alone.

## Working conventions

Use [AGENTS.md](AGENTS.md) for the shared coding, error diagnosis, verification, preservation, and authorization rules. Put project-specific exceptions in its final section; keep command details here.

The scientific workflows use the owner's installed `computational-modeling` and `scientific-notebook` skills when applicable. Verify their availability on a new machine. Detailed notebook layout, maintenance, and execution rules belong to the notebook skill; this template does not impose paired scripts or whole-notebook reruns for every edit.

When configuring version control, add `.gitignore` entries for local environments, caches, credentials, and the generated or large files identified above. Preserve any small reference test inputs or reference outputs deliberately needed for verification. Record licensing and citation requirements before sharing code or data.

## Git workflow

Use local Git throughout authorized project work. Each commit should capture one coherent, verified change. Preserve inherited edits and staging; an inspection or discussion alone needs no branch or commit. Adapt this workflow to existing project restrictions and record the real branch, checks, and storage policy here.

1. Inspect the branch, working files, index, and relevant history before editing. The working tree, staged contents, and current commit can differ. Review affected paths in both `git diff` and `git diff --cached`; do not clear another task's staging or stash the whole repository for convenience.
2. Before substantial edits, moves, or a change of direction, commit completed and verified task-owned work. Preserve unfinished work in a scoped recovery copy containing the source revision, relevant staged and unstaged changes, untracked files, deletions, and restoration instructions. Save important ignored files separately; a patch or Git bundle alone does not preserve uncommitted working-tree changes.
3. Use a focused branch when a change needs separate review. Keep concurrent editing in separate worktrees with separate indexes. Start from a known committed revision and preserve any uncommitted work that must accompany it. Manage application-owned worktrees through that application. Before retirement, inspect unique commits, untracked files, and important ignored data as well as Git status.
4. Run the smallest decisive checks, stage only explicit paths or reviewed hunks, and inspect the exact proposed commit. Run whitespace and configured staged-content checks after staging; a newer working copy must not conceal different staged bytes. When unrelated staging exists, use an isolated worktree or a commit method that preserves it and verifies exactly the intended contents. Commit at meaningful completed boundaries and before handoff, or explain why work remains uncommitted.
5. Track maintained source, tests, documentation, dependency records, and suitable compact inputs. Record the executed source revision, effective settings, and result locations; preserve uncommitted working-tree changes when they produced a retained result. Git records implementation history independently of scientific model-version labels. Choose Git LFS or external storage for necessary large inputs, preserving existing configuration and hooks. Ignore rules do not untrack existing files or erase historical contents.
6. Before an authorized push, inspect the outgoing commits as well as the final diff against the actual remote and base branch. Follow the project's review/integration process and rerun affected checks after integration changes. A local commit is not an off-machine backup. Create release tags only for a verified revision when requested. History rewriting, immediate pruning, reflog expiration, and destructive cleanup need an explicit scope and a verified recoverable backup.

Useful inspection commands, run from the repository root:

```bash
git status --short --branch
git diff --stat
git diff --cached --stat
git diff --cached --check
```

Record project-specific settings rather than copying another repository's limits:

- Main/review branch and branch naming: [existing conventions; use `main` for a new repository unless another convention is chosen]
- Verification and staged-content check: [existing command or not configured; check staged bytes, not just working files]
- File and commit size policy: [chosen limits and storage for larger inputs; no universal size limit is imposed by this template]
- Remote, review process, and independent backup: [locations and authorization, or not configured]

This workflow adapts the maintainer's research Git workflow and [Good Research Code: project setup](https://goodresearch.dev/setup). The skill bundles the fuller procedure for checkpointing, worktree management, and Git maintenance. Official references: [Git diff](https://git-scm.com/docs/git-diff), [worktrees](https://git-scm.com/docs/git-worktree), [ignore rules](https://git-scm.com/docs/gitignore), and [bundles](https://git-scm.com/docs/git-bundle).

## References

This template combines the maintainer's shared research repository rules with selected practices from Patrick Mineault's *Good Research Code Handbook* (CC BY 4.0):

- [Project setup](https://goodresearch.dev/setup): organization and documented environments.
- [Keep things tidy](https://goodresearch.dev/tidy) and [write decoupled code](https://goodresearch.dev/decoupled): consistency, clear functions, explicit inputs, and controlled side effects.
- [Test your code](https://goodresearch.dev/testing) and [document your code](https://goodresearch.dev/docs): meaningful checks, informative failures, and useful comments and docstrings.
- [Document your project](https://goodresearch.dev/pipelines): repeatable procedures and traceable results.

The owner's layout groups analysis and verification code with their respective output locations and adds `development/models_versions/`. It is an adaptation, not the handbook's original tree. Current local skills govern notebook work and verification scope; the handbook's older package setup examples are replaced by the linked Python packaging guidance.

Experiment records, transparent procedures, proportional automation, and failure handling also adapt William Stafford Noble's [*A Quick Guide to Organizing Computational Biology Projects* (2009)](https://doi.org/10.1371/journal.pcbi.1000424), published under a Creative Commons Attribution license. This template retains the owner's layout and storage policy. Content identifiers, matching prior work before resumption, and explicit completion checks strengthen the paper's simpler restart example; they are adaptations rather than claims that file existence establishes success.

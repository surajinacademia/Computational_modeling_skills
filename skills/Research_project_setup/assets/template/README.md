# [Project name]

[Describe the purpose or research question, expected inputs and outputs, and current status in a short paragraph.]

This starter contains `AGENTS.md` and `README.md`. Copy it for a new project, replace the bracketed fields, and create only the directories and configuration files needed. No runtime, data, or tests are configured yet.

## Start here

1. Define the intended result and its acceptance criteria. Identify the active code or notebook and the authoritative inputs.
2. Choose the language and project environment; record dependencies and the actual setup commands below.
3. Use the layout below for the parts the project needs, and update the map to match the files you create. Document any required language or framework exceptions.
4. Add ignore rules before staging files. Initialize local Git early for a new standalone project, preserving any existing repository, and follow the Git workflow below. Configure a remote or publish only when authorized.
5. Record a small runnable example and the checks that demonstrate its expected behavior. Replace template fields with verified information.

## Repository layout

Use this research-project layout when creating or explicitly reorganizing a repository. It applies the separation of responsibilities described in [Good Research Code: project setup](https://goodresearch.dev/setup), with the owner's analysis, testing, and model-development directories. The directories shown are a template, not files already included; create each when needed.

```text
project/
├── AGENTS.md                      # Agent behavior and project constraints
├── README.md                      # Purpose, setup, navigation, commands, and status
├── analysis/
│   ├── results/                   # Derived data, plots, tables, videos, and run records
│   └── scripts/                   # Analysis scripts and native exploration notebooks
├── data/                          # Raw inputs and their provenance
├── tests/
│   ├── data/                      # Test inputs, fixtures, and reference datasets
│   ├── results/                   # Verification outputs, comparisons, and run records
│   └── scripts/                   # Test code and verification notebooks
├── development/
│   └── models_versions/           # Named model implementations and variants, tracked in Git
└── docs/                          # Methods, decisions, and detailed documentation
```

Choose locations by purpose. Preserve original data under `data/`; place derived analysis artifacts under `analysis/results/`. Keep small test inputs and established reference values under `tests/data/`, executable checks under `tests/scripts/`, and newly generated verification artifacts under `tests/results/`. A generated output must not silently replace a test's reference data. Retained simulation outputs belong with the analysis or verification they support, with a record linking them to their producing model and settings.

Place named model implementations and scientific variants under `development/models_versions/`, retaining their existing identities and recording the active entry point. Git records source history; the directory does not require a new copied model for each edit, or a new scientific version for a file move. Native notebooks belong with their role: analysis, verification, or model implementation. Preserve established notebook formats and configured pairs.

Use descriptive run folders when multiple configurations produce results, and record how each retained result was made. Keep required root configuration and language/framework conventions, such as an existing installable `src/project_name/` package or test discovery configuration, and document those exceptions here. Add `literature/`, `paper/`, or `archive/` only when needed. Do not force unrelated software, teaching, or job-search repositories into a scientific-model hierarchy.

To apply this template, explicitly ask: `Use $Research_project_setup to set up this project` or `Use $Research_project_setup to reorganize this repository and update its README`. The skill is manual-only; merely opening a repository or making ordinary edits does not trigger it. An audit-only request reports deviations without moving files. Reorganization preserves recoverable copies, updates affected imports, paths, links, and commands, and checks the resulting entry points.

## Environment and setup

Record the supported language/runtime versions, operating-system or external-tool requirements, and dependency files:

- Runtime and tools: [versions and prerequisites]
- Environment and dependency files: [paths]
- Setup and activation: [exact commands and working directory]
- Data access: [source, retrieval procedure, access requirements, and expected local paths; or not applicable]

Use a project environment. Choose dependency files appropriate to the stack, such as `pyproject.toml`, `requirements.txt`, `environment.yml`, or Julia's `Project.toml` and `Manifest.toml`; retain only those actually used.

For reusable Python code, configure an installable package, for example under `src/project_name/`, using the current [Python packaging guidance](https://packaging.python.org/en/latest/guides/writing-pyproject-toml/). Once packaging is configured, `python -m pip install -e .` installs it for development. Avoid repeated `sys.path` edits.

## Run and verify

Replace each field with a real command or notebook procedure. State its working directory, expected result, and whether it launches substantial computation. Use `not applicable` when a category does not belong to the project.

| Task | Command or procedure | Expected result |
| --- | --- | --- |
| Smallest example | [entry point, arguments, working directory or notebook kernel] | [observable result] |
| Focused verification | [relevant test or independent calculation] | [acceptance criteria or justified tolerance] |
| Full workflow, when requested | [ordered steps and configuration] | [output locations and completion criteria] |
| Lint, format, or build, if configured | [commands; identify any that modify files] | [expected checks or artifact] |

Expose run settings through explicit parameters, configuration, or command-line arguments. Record the ordered procedure instead of relying on edited source lines, hidden notebook state, or an undocumented manual step. Export intermediate decisions from interactive tools when they affect reproducibility. Use a small script or build tool only when it helps manage a repeated workflow. See [Good Research Code: project documentation](https://goodresearch.dev/pipelines).

Verification status: **not yet configured or executed**. Replace this with the checks actually performed, their date and scope, and any remaining limitations.

## Data and results

| Item | Location and record |
| --- | --- |
| Original inputs | [`data/` paths, source, units/schema where relevant, and usage restrictions] |
| Active implementation | [`development/models_versions/` paths and model identity, or a documented package-layout exception] |
| Analysis | [`analysis/scripts/` entry points and corresponding `analysis/results/` outputs] |
| Verification | [`tests/scripts/` checks, `tests/data/` inputs, and `tests/results/` outputs] |
| Reproduction instructions | [commands/configuration or notebook, source revision, environment, and relevant parameters/seeds] |
| Retained results | [output paths, producing run, and validation status] |
| Known limitations | [missing inputs, unperformed checks, unresolved assumptions, or not applicable] |

Preserve raw inputs and record transformations. Keep large data and disposable outputs out of ordinary Git history; track the code, configuration, small suitable fixtures, provenance, and instructions needed to recover or regenerate them. Document external storage and backup locations. Git ignore rules do not provide a backup.

## Working conventions

Use [AGENTS.md](AGENTS.md) for the shared coding, debugging, verification, preservation, and authorization rules. Put project-specific exceptions in its final section; keep command details here.

The scientific workflows use the owner's installed `computational-modeling` and `scientific-notebook` skills when applicable. Verify their availability on a new machine. Detailed notebook layout, maintenance, and execution rules belong to the notebook skill; this template does not impose paired scripts or whole-notebook reruns for every edit.

When configuring version control, add `.gitignore` entries for local environments, caches, credentials, and the generated or large files identified above. Preserve any small fixtures or reference outputs deliberately needed for verification. Record licensing and citation requirements before sharing code or data.

## Git workflow

Use local Git throughout authorized project work. Each commit should capture one coherent, verified change. Preserve inherited edits and staging; an audit or discussion alone needs no branch or commit. Adapt this workflow to existing project restrictions and record the real branch, checks, and storage policy here.

1. Inspect the branch, working files, index, and relevant history before editing. The working tree, staged contents, and current commit can differ. Review affected paths in both `git diff` and `git diff --cached`; do not clear another task's staging or stash the whole repository for convenience.
2. Before substantial edits, moves, or a change of direction, commit completed and verified task-owned work. Preserve unfinished work in a scoped recovery copy containing the source revision, relevant staged and unstaged changes, untracked files, deletions, and restoration instructions. Save important ignored files separately; a patch or Git bundle alone does not preserve a dirty checkout.
3. Use a focused branch when a change needs separate review. Keep concurrent editing in separate worktrees with separate indexes. Start from a known committed revision and preserve any uncommitted work that must accompany it. Manage application-owned worktrees through that application. Before retirement, inspect unique commits, untracked files, and important ignored data as well as Git status.
4. Run the smallest decisive checks, stage only explicit paths or reviewed hunks, and inspect the exact proposed commit. Run whitespace and configured staged-content checks after staging; a newer working copy must not conceal different staged bytes. When unrelated staging exists, use an isolated worktree or a commit method that preserves it and verifies exactly the intended contents. Commit at meaningful completed boundaries and before handoff, or explain why work remains uncommitted.
5. Track maintained source, tests, documentation, dependency records, and suitable compact inputs. Record the executed source revision, effective settings, and result locations; preserve dirty source changes when they produced a retained result. Git records implementation history independently of scientific model-version labels. Choose Git LFS or external storage for necessary large inputs, preserving existing configuration and hooks. Ignore rules do not untrack existing files or erase historical contents.
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

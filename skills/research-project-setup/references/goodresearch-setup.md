# Research setup lessons

## Good Research Code

Adapted from Patrick Mineault's [Project setup](https://goodresearch.dev/setup), in *The Good Research Code Handbook*, licensed under [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/) (reviewed 2026-10-11). This paraphrase applies the owner's layout and current packaging guidance rather than copying the chapter verbatim.

- Give each coherent research project a descriptive folder and Git repository, keeping reusable tools separate and respecting existing repo boundaries.
- Start version control early and commit logical units regularly rather than waiting until completion; preserve recoverable work before reorganizing and follow the [Git workflow](git-workflow.md) for scoped checkpoints, staged reviews, worktrees, and recovery.
- Record a reproducible environment and dependency specification suited to the stack, keeping platform-specific captures distinct from portable specs.
- Separate raw inputs, reusable code, executable scripts, outputs, tests, and documentation per [the template](../assets/template/README.md#repository-layout).
- Keep README helpful for setup and navigation; ignore large or disposable generated files selectively while preserving provenance and recovery notes.
- Package reusable Python code via `pyproject.toml` per the [Python Packaging User Guide](https://packaging.python.org/en/latest/guides/writing-pyproject-toml/) (`python -m pip install -e .`) instead of scattered path edits.

Treat the handbook's old Python versions, package pins, `setup.py` example, blanket data ignore, and publication commands as historical context; preserve working setups unless edits are needed.

## Computational experiment organization

Adapted from William Stafford Noble, [*A Quick Guide to Organizing Computational Biology Projects*](https://doi.org/10.1371/journal.pcbi.1000424), *PLOS Computational Biology* 5(7), e1000424 (2009), under CC BY (full text reviewed 2026-10-30). These paraphrased lessons and adaptations reflect the author's practice rather than a rigid universal standard.

- **Organize for understanding and repetition** (Principles): structure work so a collaborator or future self can reconstruct operations, rationale, inputs, and code to repeat experiments under changed data or settings.
- **Keep the scientific account alongside the executable account** (The Lab Notebook; Carrying Out a Single Experiment): pair dated prose (observations, conclusions, next ideas, failure reasons) with commands or drivers rather than letting plots or shell history replace interpretation; separate execution crashes, inconclusive checks, and informative negative results, dating corrections without overwriting earlier entries.
- **Make every required operation repeatable** (Carrying Out a Single Experiment): log preprocessing and postprocessing alongside core runs, centralize paths in config/drivers, capture interactive choices as replayable selections or patches, and disclose remaining manual steps.
- **Make failures visible through the whole procedure** (Handling and Preventing Errors): run input format and bounds checks with reliable readers, check exit codes, halt dependent steps on failure, write to temporary files before atomic finalization, and keep diagnostics intact.
- **Scale automation to demonstrated needs** (Command Lines versus Scripts versus Programs; Carrying Out a Single Experiment): begin with recorded commands, adding drivers or helpers as complexity and reuse grow; document inputs, outputs, and options and support cheap progress inspection without launching runs.
- **Identify the data used** (Figure 1; Conclusion): record source URL, version, retrieval date, and retriever, plus checksums or permitted immutable snapshots and storage/recovery notes (omitting restricted data and credentials).

The [README template](../assets/template/README.md) defines concrete fields and layouts: keep dated experiment folders inside results directories separate from model identities and Git history, reuse existing logs without inventing missing rationale, and treat a research log as a role rather than forcing Jupyter or web services.

File existence alone cannot verify restart safety: check matching inputs, source, settings, environment, and complete outputs before reusing steps, resume interrupted runs only from verified checkpoints, reassess subsequent results after prior edits, never treat run completion as scientific validation, and keep failed-run diagnostics rather than deleting them to force restarts.

Keep the project's Git policy instead of importing daily commits, blanket generated-file exclusions, or central-repo backup assumptions (reference test inputs can be deliberate, and local commits are not off-machine backups). Neither dated logs nor online-notebook examples authorize publication, duplicate versions, data moves, or unrequested runs.

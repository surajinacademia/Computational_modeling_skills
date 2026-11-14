---
name: scientific-notebook
description: Create, maintain, execute, or review Jupyter notebooks for scientific research, theoretical modeling, simulations, and scientific data analysis. Use for new research notebooks and targeted edits to existing .ipynb files; standalone model documents and business dashboards are outside this skill's scope.
---

# Scientific Notebook

Deliver one editable `.ipynb` with scientific explanation, calculation, and figures, adding prose interpretation only when explicitly requested. Maintain the notebook directly using existing project modules, without paired Python scripts or Jupytext sync unless requested.

## Before Acting: Scope and Scientific Authority

- Apply [computational-modeling](../computational-modeling/SKILL.md) (with or without code edits) whenever model formulation, hypotheses, implementation, verification, validation, or model evidence is in play; it owns the scientific formulation, provenance, and model version identity, while this skill owns notebook layout and maintenance.
- Skip `computational-modeling` for standalone non-model data analysis, plotting, or isolated explanations; instead check data provenance, units, exclusions, missingness, normalization, uncertainty, and the data-to-output transformation directly.
- Never start a formal model-document workflow solely because a notebook displays equations.
- Consult [references/data-guidance.md](references/data-guidance.md) for MIT-licensed workflow practices already adapted from OpenAI's Data Analytics plugin; if an external `data-analytics:jupyter-notebooks` skill is installed separately, consulting it is optional, and never copy proprietary cached plugin files or adopt business-report layouts.
- State the question, assumptions, equations or transformations, units, and initial or boundary conditions clearly, resolve ambiguities that alter results, and scale checks (limiting cases, conservation invariants, convergence, or statistical checks) to the claim rather than relying on kernel completion alone.

## Notebook Structure and Plotting

New starter notebooks initialize via `scripts/notebook.py` from [notebook-template.ipynb](assets/notebook-template.ipynb) and organize focused cells across six ordered roles:

1. **Opening Markdown:** descriptive title, brief question, and approach; add bullets only when helpful and preserve user-shortened openings.
2. **Setup and computational functions:** imports, paths, plotting setup, and calculation or analysis functions; precede substantive methods with Markdown equations or pseudocode, omit formal "Inputs"/"Outputs" headers, group trivial setup, and split complex methods.
3. **Technical comments in code:** explain numerical methods, approximations, implementation choices, and non-obvious programming decisions without narrating syntax.
4. **Plotting functions:** editable plotting code without prose explaining Matplotlib calls; explain plotted observables in methods or explicitly requested interpretation.
5. **Parameters:** one plain `PARAMETERS` dictionary immediately before final execution and plotting calls using physical names (`length`, `gravity`, `mass`) and unit comments; pass parameters explicitly, avoid duplicate definitions or mutable-global defaults, never run simulations inside definitions, and split numerical controls only when warranted.
6. **Results:** run calculations, checks, and plots with figures primary, tables only when needed, passing checks quiet, and no verbose version dumps, hashes, or raw arrays.

- Omit interpretation sections unless explicitly requested; when requested, write them only after inspecting outputs, separating supported findings, uncertainty, and limits without restoring removed sections or treating metadata flags as permission to add prose.
- Apply [data-visualization](../data-visualization/SKILL.md) for ordinary quantitative plots of completed values (passing question, plot-ready data or load path, observables, units, selections, uncertainty, target cells, and formats) while keeping plotting code editable in place; this handoff excludes model fitting, inference, simulation runs, full reruns, and package installs.
- Let existing project or notebook styles override `data-visualization`'s adapter (use that adapter only to establish a new shared style), and apply `data-visualization`'s exported-figure checks only when separate file exports are requested.
- Preserve calls to a pre-installed local `minimalist` plotting theme (`use_style('white')`, `figsize()` with `aspect_ratio` = height / width) when available in the environment, never installing an unrelated public PyPI package of the same name; otherwise fall back to Matplotlib defaults (DejaVu Sans, default cycle).
- Use `plt.subplots()` for single panels and explicit `(width, height)` inches for multi-panel layouts; see [nonlinear-pendulum.ipynb](examples/nonlinear-pendulum.ipynb) for a problem-specific worked example (black `minimalist` styling with dark-background Matplotlib fallback affecting appearance only).
- Keep notebooks runnable top-to-bottom in a fresh kernel without hidden state: install `requirements.txt` outside cells, resolve paths from an explicit project or notebook base, create output directories at runtime, keep parameters, seeds, and tolerances traceable, and label axes, units, colorbars, and uncertainty on comparable scales.

## Editing and Maintaining Cells

- **REQUIRED BEFORE notebook edits:** read [references/helper.md](references/helper.md) for `scripts/notebook.py` CLI rules, JSON patch format, `invalidate` arrays, `output_changes` fields, and `metadata.scientific_notebook` state transitions.
- Inspect the project and target `.ipynb` before mutating anything (`nbformat` required; `nbclient` required for `execute`):
  - `scripts/notebook.py create <path> --title <title> --point <text>` (repeatable `--point`): initializes starter notebooks from `notebook-template.ipynb`.
  - `scripts/notebook.py inspect <path>` and `scripts/notebook.py validate <path>`: check `.ipynb` structure and report `sha256`, metadata, cell IDs, sources, attachments, execution counts, and output types.
  - `scripts/notebook.py edit <path> --patch <patch.json>`: applies ordered `replace`, `insert`, and `delete` operations by cell ID while preserving unaffected cells and Markdown-only outputs.
  - `scripts/notebook.py execute <path> [--kernel <name>] [--timeout 600]`: clears outputs and runs all code cells sequentially in a fresh kernel from the notebook's directory.
- For targeted edits, modify only requested cells without imposing the template wholesale or rerunning the entire notebook for prose or single-cell changes, and reinspect if the file `sha256` changes concurrently.
- **Mandatory `output_changes` inspection check:** inspect `output_changes` (`invalidation`, `invalidated_cell_ids`, `retained_output_cell_ids`, `dependency_review_cell_ids`) after every `edit`, pass `invalidate` only when code dependencies are certain, and review every cell in `dependency_review_cell_ids` because retained outputs are never certified automatically.
- Omit `invalidate` whenever dependencies are uncertain so all code outputs and widget state clear; if post-save uncertainty arises or edits fall outside this patch format, update via `nbformat` (never hand-editing raw `.ipynb` JSON) and review any requested interpretation marked `review_required`.

## Execution, Verification, and Completion Criteria

- Review code and dependencies before running (`scripts/notebook.py` is not a sandbox), use the prepared project environment with an adequate timeout, and never install packages in cells, launch remote jobs to finish layout, or substitute a toy problem for the requested calculation.
- Before an expensive new or modified calculation, verify one small known case within scope without replacing the full run (skip for prose-only or plotting-only edits).
- For a new notebook or full revision:
  1. Run `scripts/notebook.py execute` with explicit `--kernel` and `--timeout`, saving outputs in place (errors or timeouts leave execution incomplete).
  2. Check acceptance criteria and inspect rendered figures and text at reading size for clipped labels, missing outputs, misleading scales, or claim mismatches.
  3. Write or update explicitly requested interpretation after inspecting outputs (then mark `metadata.scientific_notebook.interpretation` as `'reviewed'` via `nbformat`), rechecking affected runs after code or plot edits.
  4. Remove remaining starter prompts, unsupported claims, and stale outputs, then link the notebook and state findings and limits.
- For targeted edits, run `scripts/notebook.py validate`, execute affected cells with their prerequisites in the project kernel or an isolated check while preserving valid unrelated outputs, inspect changed plots, and report any execution, dependency, or visual-inspection gap with the exact resolution command rather than claiming full verification.

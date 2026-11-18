---
name: jupyter-notebook
description: Create, maintain, execute, or review Jupyter notebooks for scientific research, theoretical modeling, simulations, and scientific data analysis. Use for new research notebooks and targeted edits to existing .ipynb files; standalone model documents and business dashboards are outside this skill's scope.
---

# Jupyter Notebook

- Deliver one editable `.ipynb` combining clear scientific explanation, reproducible calculation, and figures with established project modules.
- Omit prose interpretation unless explicitly requested; never restore user-deleted sections or treat `metadata.jupyter_notebook` flags as permission to add prose.
- Exclude standalone model documents, business dashboards, unrequested paired Python sync scripts or Jupytext files, and standalone `model-documentation` workflows triggered merely by notebook equations.

## 1. Establish scientific scope and verification criteria

- State the scientific question, assumptions, governing equations or transformations, units, and initial or boundary conditions clearly.
- Match verification checks—limiting cases, conservation laws, grid or timestep convergence, or statistical sampling checks—to the scientific claim rather than trusting a clean kernel run alone.
- **When choices are unsettled:** resolve result-altering ambiguities via [lets-be-clear](../lets-be-clear/SKILL.md) before computing.
- **When formulating, implementing, verifying, or physically validating a model:** apply [computational-modeling](../computational-modeling/SKILL.md) for equations, competing-hypothesis checks, provenance, and model version identity while keeping notebook structure and cell maintenance here.
- **When the notebook tests a hypothesis:** name the entry it tests in the `computational-modeling` hypothesis record and keep that entry's prediction and falsifying outcome fixed before execution; write the outcome (support, falsification, or inconclusive) into the entry only when interpretation is requested.
- **For non-model work:** skip `computational-modeling` for standalone data analysis, plotting, and isolated explanations; for data analysis, check data provenance, units, exclusions, missing values, normalization, uncertainty, and raw-to-reported transformations directly.
- **For data-analysis practice (optional):** see [data-guidance.md](references/data-guidance.md) for adapted OpenAI MIT-licensed Data Analytics practices (consulting `data-analytics:jupyter-notebooks` is optional; never copy proprietary cached plugin files or adopt business-dashboard layouts).

## 2. Structure cells and computational code

- Initialize new starter notebooks from [notebook-template.ipynb](assets/notebook-template.ipynb) across six ordered roles (using as many cells as clarity requires, not a fixed count):
  1. **Opening Markdown:** descriptive title and concise scientific question and approach; use bullets only when helpful and preserve user-shortened openings rather than padding a template.
  2. **Setup and computational functions:** imports, explicit project or notebook base paths, shared plotting setup, and scientific calculation or analysis functions.
  3. **Technical comments in code:** inline comments beside numerical methods, approximations, discretization choices, and non-obvious decisions without narrating routine syntax.
  4. **Plotting function definitions:** editable Matplotlib functions without prose explaining Matplotlib calls; explain plotted physical quantities in methods Markdown or requested interpretation.
  5. **Parameters:** one plain `PARAMETERS` dictionary immediately before final execution using readable physical names (`length`, `gravity`, `mass`) with units in comments; split numerical controls into their own dictionary only when warranted.
  6. **Results:** calculation, scientific check, and plotting calls with figures primary, tables only when needed, no output from checks that pass, and no verbose package dumps, hashes, or raw array printouts.
- Precede substantive methods with short Markdown explaining physical or mathematical reasoning, equations, or pseudocode; omit prose before simple imports and avoid formal "Inputs" and "Outputs" subheadings.
- Pass parameters explicitly into functions, avoid duplicate definitions or mutable global defaults, and never trigger simulations inside function definitions.
- Keep the notebook runnable top-to-bottom in a fresh kernel: install [requirements.txt](requirements.txt) and project packages outside cells, create output directories at runtime, and keep parameters, random seeds, and solver tolerances explicit.
- **For targeted edits:** modify only the requested cells in an existing notebook without imposing the starter template wholesale.

## 3. Style figures inside the notebook

- Keep plotting code editable in place inside the notebook.
- Use `plt.subplots()` for single panels and explicit `(width, height)` inches for multi-panel layouts, with comparable axis scales, units, colorbars, and labeled error bars.
- **When a local `minimalist` plotting theme is installed in the Python environment:** preserve its calls (`use_style('white')`, `figsize()` with `aspect_ratio` = height / width) and never install an unrelated public PyPI package of the same name; otherwise fall back to Matplotlib defaults (DejaVu Sans and default color cycle).
- **For ordinary plots of completed scientific data:** apply [data-visualization](../data-visualization/SKILL.md) with the question, plot-ready data or load path, observables, units, selections, uncertainty, target cells, and output scope:
  - Preserve any existing project or notebook style rather than overriding it with `data-visualization`'s style adapter.
  - Apply `data-visualization`'s separate-file export checks only when standalone figure files are requested.
  - Never treat this plotting request as authorization for model fitting, simulation runs, full notebook reruns, or package installs.

## 4. Inspect and patch cells safely

- Read [helper.md](references/helper.md) before inspecting, editing, structurally checking, or executing `.ipynb` files to keep cell IDs, JSON patches, stale-output invalidation, and `metadata.jupyter_notebook` states consistent (`nbformat` required; `nbclient` required for `execute`).
- Use [scripts/notebook.py](scripts/notebook.py) for notebook operations:
  - `scripts/notebook.py create <path> --title <title> --point <text>` (repeatable `--point`): create a starter notebook from `notebook-template.ipynb`.
  - `scripts/notebook.py inspect <path>` and `scripts/notebook.py validate <path>`: check structure and report `sha256`, metadata, cell IDs, sources, attachments, execution counts, and output types.
  - `scripts/notebook.py edit <path> --patch <patch.json>`: apply ordered `replace`, `insert`, and `delete` operations by cell ID while preserving unaffected cells and Markdown-only outputs.
  - `scripts/notebook.py execute <path> [--kernel <name>] [--timeout 600]`: clear outputs and run all code cells sequentially in a fresh kernel from the notebook's directory.
- Reinspect before saving if the file `sha256` changed concurrently.
- **When using `invalidate`:** list surviving code cell IDs in `invalidate` only when downstream dependencies are certain; omit `invalidate` whenever uncertain so code outputs and widget state clear conservatively.
- Inspect `output_changes` (`invalidation`, `invalidated_cell_ids`, `retained_output_cell_ids`, `dependency_review_cell_ids`) after every edit and check every cell in `dependency_review_cell_ids`.
- **For changes outside the patch operations:** use `nbformat` directly—never raw JSON string edits—for post-save output clearing or metadata, attachment, or cell-type changes.

## 5. Execute and verify proportionally

- Review code and imported dependencies before running (`scripts/notebook.py` is not a sandbox).
- Use the prepared project environment with an appropriate timeout; never run `pip install` inside cells, launch unrequested remote jobs, or substitute a toy calculation for the requested problem.
- **Before an expensive run of a new or modified model calculation:** check one small limiting case with a known expected answer when within scope; skip for prose-only or plotting-only edits.
- Match structural checks and execution to the scope of the edit:

| Edit scope | Structural check and execution |
| --- | --- |
| New notebook or whole-notebook revision | Run `scripts/notebook.py validate`, then execute top-to-bottom in a fresh kernel via `scripts/notebook.py execute` with explicit `--kernel` and `--timeout`, saving outputs in place (errors or timeouts leave execution incomplete). |
| Targeted code or plotting edit | Run `scripts/notebook.py validate` and test modified cells with their prerequisites in the project kernel or an isolated check while preserving valid unrelated outputs. |
| Prose-only edit | Run `scripts/notebook.py validate` without rerunning code cells, preserving existing outputs and execution counts. |

- Check task-specific scientific verification criteria against computed results.
- Inspect saved or changed figures and Markdown at reading size for clipped labels, missing outputs, misleading scales, or mismatches between prose and computed results.
- **When interpretation was explicitly requested:**
  - Write or revise interpretation cells only after inspecting fresh outputs, separating supported findings, uncertainty, and regime limits.
  - Set `metadata.jupyter_notebook.interpretation` to `'reviewed'` via `nbformat` and recheck affected plots or calculations after subsequent code edits.

## References

- Notebook helper and dependencies: [helper.md](references/helper.md), [scripts/notebook.py](scripts/notebook.py), and [requirements.txt](requirements.txt).
- Starter template, example, and data guidance: [notebook-template.ipynb](assets/notebook-template.ipynb), [nonlinear-pendulum.ipynb](examples/nonlinear-pendulum.ipynb), and [data-guidance.md](references/data-guidance.md).
- Sibling skills: [computational-modeling](../computational-modeling/SKILL.md), [data-visualization](../data-visualization/SKILL.md), and [lets-be-clear](../lets-be-clear/SKILL.md).

## Deliverables and stopping condition

- Confirm no template placeholder prompts, unsupported claims, or stale outputs remain.
- Link the single editable `.ipynb` and state what was established alongside any regime or uncertainty limits, then stop.
- **If targeted edits, missing dependencies, or runtime limits leave full-notebook execution, dependency checks, or visual inspection incomplete:** state the exact gap and command needed to resolve it rather than claiming full-notebook execution.

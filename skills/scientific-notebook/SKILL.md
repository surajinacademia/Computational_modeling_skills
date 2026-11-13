---
name: scientific-notebook
description: Create, maintain, execute, or review Jupyter notebooks for scientific research, theoretical modeling, simulations, and scientific data analysis. Use for new research notebooks and targeted edits to existing .ipynb files; standalone model documents and business dashboards are outside this skill's scope.
---

# Scientific Notebook

Deliver one editable `.ipynb` with scientific explanation, calculation, and figures; add interpretation only when explicitly requested. Maintain the notebook directly using existing project modules, without paired Python scripts or Jupytext sync unless requested.

## Scientific authority and scope

For model formulation, hypotheses, implementation, verification, validation, or supporting evidence, apply [computational-modeling](../computational-modeling/SKILL.md) (with or without code edits); it owns the scientific contract, evidence, provenance, and model version identity, while this skill owns notebook layout and maintenance. Standalone non-model data analysis, plotting, and isolated explanations do not trigger it. For data analysis, check provenance, units, exclusions, missingness, normalization, uncertainty, and the data-to-output path directly.

[data-guidance.md](references/data-guidance.md) records optional adaptations from OpenAI's MIT Data guidance. Consulting `data-analytics:jupyter-notebooks` is optional; keep this structure and the user's question, never copy proprietary cached files or adopt business-report layouts, and never start a formal model-document workflow solely for displayed equations.

State the question, assumptions, equations or transformations, units, and initial or boundary conditions. Resolve ambiguities that alter results, and scale checks to the claim (limiting cases, invariants, convergence, or statistical checks); kernel success alone is insufficient.

## Notebook structure

New notebooks start via the helper from [notebook-template.ipynb](assets/notebook-template.ipynb) and use focused cells across six roles:

1. **Opening Markdown:** descriptive title, brief question, and approach; add bullets only when helpful and keep shortened openings.
2. **Setup and computational functions:** imports, paths, plotting setup, and calculation or analysis functions. Preceding Markdown explains substantive methods (equations or pseudocode when useful); simple imports need none. Avoid formal "Inputs" and "Outputs" sections; group trivial setup and split complex methods.
3. **Technical comments in code:** explain numerical methods, approximations, implementation choices, and non-obvious programming decisions; never narrate syntax.
4. **Plotting functions:** editable plotting code without prose on how plotting calls work; explain plotted quantities in methods or requested interpretation.
5. **Parameters:** one plain `PARAMETERS` dictionary right before final execution and plotting calls, with physical names (`length`, `gravity`, `mass`) and units in comments. Pass parameters explicitly; avoid duplicates, default arguments capturing later globals, or running simulations in definitions; split numerical controls only when warranted.
6. **Results:** run calculations, checks, and plots. Show plots primarily, adding tables only when needed. Keep passing checks quiet; omit verbose diagnostics, version dumps, hashes, or raw arrays.

Interpretation is absent from the template and written only on explicit request after inspecting results, separating supported findings, uncertainty, and limits. Never restore removed sections or treat interpretation metadata as permission to add prose.

## Plotting style

For ordinary quantitative plots of completed values, apply [data-visualization](../data-visualization/SKILL.md), passing the question, plot-ready data or load path, observables, units, selections, uncertainty, target cells, and formats. Keep plotting code editable in the same notebook or an existing module without creating another notebook or app. Model fitting and inferential analysis stay outside `data-visualization`, and the handoff authorizes no simulation runs, full reruns, or package installs.

Configured project or notebook styles override `data-visualization`'s adapter (use that adapter only to establish a new shared style). Preserve installed `minimalist` calls (`use_style('white')`, `figsize()` with `aspect_ratio` = height / width) without copying defaults or installing a PyPI namesake; fallback uses Matplotlib defaults (DejaVu Sans, default cycle). Inline-only requests inspect inline notebook figures without creating an unrequested PDF; apply `data-visualization`'s artifact checks to separate exports.

Use `plt.subplots()` for single panels and explicit `(width, height)` inches for multi-panel layouts. Install `requirements.txt` (and `examples/requirements.txt`) in a prepared environment, never inside cells. Saved figures in [nonlinear-pendulum.ipynb](examples/nonlinear-pendulum.ipynb) use black `minimalist` styling; Matplotlib's dark-background fallback alters styling only, not calculations.

Keep notebooks runnable top-to-bottom from a fresh kernel without hidden state. Use project- or notebook-relative paths with an explicit base, create output directories at runtime, keep sources, parameters, seeds, and tolerances traceable without noisy prints, preserve inline figures and editable code, and label axes, units, colorbars, and uncertainty on comparable scales.

## Create or maintain

Inspect the project and target notebook first. Use `scripts/notebook.py` ([helper.md](references/helper.md); requires `nbformat`, plus `nbclient` for `execute`):

- `create <path> --title <title> --point <text>` (repeatable `--point`): scaffolds from `notebook-template.ipynb`.
- `inspect <path>` and `validate <path>`: check format and report `sha256`, metadata, cell IDs, sources, attachments, execution counts, and output types.
- `edit <path> --patch <patch.json>`: runs ordered `replace`, `insert`, and `delete` operations by cell ID while preserving unaffected cells and Markdown-only outputs.
- `execute <path> [--kernel <name>] [--timeout 600]`: clears outputs and runs all code cells in a fresh kernel inside the notebook's directory.

For targeted edits, inspect cell IDs, sources, metadata, attachments, and outputs, then change only requested cells without imposing the template wholesale or running the whole notebook for prose or single-cell edits; reinspect on concurrent change.

**Mandatory `output_changes` inspection gate:** inspect `output_changes` in command output after every `edit`. Pass `invalidate` for code edits only when dependencies are certain, and inspect every cell in `dependency_review_cell_ids` (`retained_output_cell_ids`) against the change, as the report never certifies retained outputs. Omit `invalidate` when dependencies are uncertain so all code outputs and widget state clear; if post-save uncertainty arises, clear outputs, execution counts, and widget state via `nbformat` (replaying an unchanged edit clears nothing). Code edits mark requested interpretation `review_required`; review claims without adding unrequested sections. Use `nbformat` outside this patch schema, treat JSON patches as intermediates, and never hand-edit notebook JSON.

## Execute, inspect, and finish

Review code and dependencies before running (`scripts/notebook.py` is not a sandbox), using the project environment and adequate timeout. Never install packages in cells, launch remote or scheduled runs to finish layout, or swap in a cheaper problem. Before an expensive new or changed calculation, test one small known case within scope (skip for prose or plotting edits; never replace the full run with it).

For a new notebook or full revision:

1. Run `scripts/notebook.py execute` with explicit `--kernel` and `--timeout`, saving outputs to the same file (errors or timeouts mean incomplete execution).
2. Check acceptance criteria and inspect saved figures and text at reading size for clipped labels, missing outputs, misleading scales, and claim mismatches.
3. Update requested interpretation after inspecting results while keeping outputs; recheck affected runs after code or plot edits (prose edits need no rerun).
4. Remove remaining scaffold prompts, unsupported claims, and stale outputs; link the notebook and state findings and limits.

For targeted edits, validate format, run affected code with prerequisites, and inspect changed plots in the project kernel or an isolated check (`execute` always runs the whole notebook). Broaden runs only when dependencies require it, keeping valid unrelated results. Completion requires the requested scope, relevant scientific checks, and inspected affected outputs; report any execution, dependency, or visual-inspection gap and the exact resolution command without calling partial checks full verification.

See [nonlinear-pendulum.ipynb](examples/nonlinear-pendulum.ipynb) for a complete worked example; its equations, parameters, and checks are specific to that problem.

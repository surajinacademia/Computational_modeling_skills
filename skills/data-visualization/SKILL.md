---
name: data-visualization
description: Create, style, review, or simplify quantitative plots from completed scientific data, including notebook figures and ordinary paper-ready PDFs. Use the visual gallery, a portable style adapter, and direct plotting templates while preserving scientific identity, weighting, and observable definitions. Do not use for simulation execution, generic data cleaning, inferential modeling, vasculogenesis media, or composite schematic design.
---

# Data Visualization

Create quantitative figures from completed scientific data with a direct path from load to plot. Use the bundled style adapter for shared appearance and the worked examples to select an appropriate plot form.

## Scope and Workflow Boundaries

- Use this skill for exploratory, diagnostic, comparative, or ordinary paper-ready quantitative plots of completed values, including small related-axis grids.
- Exclude simulation execution or monitoring, generic dataframe cleaning without a defined plot, inferential statistics, model fitting, and complex experimental group selection.
- Route repository-specific spatial simulation media workflows (such as `vasculogenesis` Arrow-to-frame/MP4 media handled by a local `graph` skill) and composite publication schematics (`schematic-designer` and its outlined-vector export invariants) to their dedicated workflows.
- When `code-simplifier` applies alongside this skill, keep scientific selections, experimental units, and data identity governed here while `code-simplifier` governs code structure.
- When invoked by `scientific-notebook`, edit inside the existing notebook and target cells using the supplied question, data path, observables, units, selections, uncertainty, and output scope without inventing values or creating parallel files.
- Leave notebook layout, execution authorization, output preservation, and configured notebook styles to `scientific-notebook`; inspect inline figures at reading size for inline-only requests and export separate files only when requested.

## Reference Selection Table

- **REQUIRED BEFORE editing any analysis-to-plot data path:** read [analysis-workflow.md](references/analysis-workflow.md), then load only the reference needed for the task:

| Task | Resource and action |
| --- | --- |
| Edit an analysis-to-plot path | **Read [analysis-workflow.md](references/analysis-workflow.md) first** (selections, identity, weighting, display separation). |
| Handle Pandas or tables | **REQUIRED BEFORE dataframe edits:** read [pandas-data-handling.md](references/pandas-data-handling.md) (row representation, row key unit vs. experimental unit $n$, joins, missingness, aggregation). |
| Pick quantitative encoding | Read [plot-patterns.md](references/plot-patterns.md). |
| Set or review appearance | Read [design-style.md](references/design-style.md). |
| Run adapter, templates, or gallery | Check [api.md](references/api.md) for interfaces and layout. |
| Adapt a template workflow | Follow [tutorials.md](references/tutorials.md) (time course, replicates, parameter map). |
| Inspect finished examples | Browse [gallery.md](references/gallery.md) PDFs, sources, and teaching CSVs. |
| Resolve competing structures | Check [repository-patterns.md](references/repository-patterns.md) when current code leaves a choice open. |
| Review provenance and license | See [design-provenance.md](references/design-provenance.md) (optional). |

- Treat gallery CSVs strictly as synthetic teaching data rather than scientific evidence; adapt their direct plotting code without inventing a plotting framework or rewriting valid analysis logic.

## Shared Visual Defaults

- Create, render, and save figures inside `paper_style()` from [publication.py](assets/styles/publication.py) ([api.md](references/api.md)), which uses a pre-installed local `minimalist` plotting theme when present or falls back to Matplotlib DejaVu Sans, `tab10`, `inferno`, and `coolwarm` with through-going error bars (`marker_gap` ignored); never install an unrelated public PyPI package of the same name.
- Keep 8 pt text and 9 pt bold panel tags at final physical size (widening crowded plots instead of shrinking text), with 5 pt hollow markers (`0.8` pt outline, `markerfacecolor="none"`, `marker_gap=True` when supported).
- Match error bars and legend text to each group's color, preserve one named group-to-style mapping across related figures, use labeled error bars rather than curve ribbons, and draw histograms as group-colored filled bars with shared bins, gaps, and a zero baseline.
- Keep discrete parameter maps and missing cells distinct from smooth dense-function heatmaps, never smoothing sparse parameter sweeps.
- Consult [design-style.md](references/design-style.md) for full visual roles; vector PDF is the default and only bundled export, while other requested ordinary plot formats do not inherit `schematic-designer` vector rules.

## Completion and Verification Criteria

- Run proportional numerical checks per [analysis-workflow.md](references/analysis-workflow.md#verify-proportionally) whenever data handling changes, verifying representative values, row key units, independent experimental-unit counts ($n$), and weighting before claiming preserved results.
- Save and visually inspect every changed figure at physical size against plot-ready data for labels, units, group encodings, uncertainty definitions, sample counts ($n$), missingness, clipping, and overlap (inspecting related panels together in assembled PDFs and reporting any unavailable check).
- For code-only simplifications, run numerical verification rather than rebuilding the example gallery, confirming a traceable load-to-plot path with display-only thinning or formatting kept outside the analysis calculations.

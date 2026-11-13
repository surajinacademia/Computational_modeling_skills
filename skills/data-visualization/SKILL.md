---
name: data-visualization
description: Create, style, review, or simplify quantitative plots from completed scientific data, including notebook figures and ordinary paper-ready PDFs. Use the visual gallery, a portable style adapter, and direct plotting templates while preserving scientific identity, weighting, and observable definitions. Do not use for simulation execution, generic data cleaning, inferential modeling, vasculogenesis media, or composite schematic design.
---

# Data Visualization Skill

Create quantitative figures from completed data with a direct path from load to plot. Use the bundled style adapter for shared appearance and the examples to select a plot form.

## Scope

Use this skill for exploratory, diagnostic, comparative, or ordinary paper-ready quantitative plots (including small related-axis grids). Exclude simulation runs or monitoring, generic dataframe cleaning without a defined plot, inferential statistics, model fitting, and complex cohort construction; `graph` owns vasculogenesis media, and `schematic-designer` owns composite layouts, bespoke vector graphics, and its outlined-vector delivery contract. Apply this skill only to a separately defined descriptive plot of completed values.

When `code-simplifier` applies, this skill owns scientific selections and data identity while `code-simplifier` owns code shape and wider preservation.

When called by `scientific-notebook`, edit inside its existing notebook and target cells using the supplied question, data path, observables, units, selections, uncertainty, and output scope without inventing values, re-invoking that skill, or creating parallel files. Leave notebook layout, execution authorization, output preservation, and configured notebook styles to `scientific-notebook`; inline figures satisfy inline-only requests when inspected at reading size, and separate exports are made only when requested.

## Route to the Needed Resource

Load [analysis-workflow.md](references/analysis-workflow.md) whenever the data path changes, then open only the needed reference:

| Task | Resource and action |
| --- | --- |
| Edit an analysis-to-plot path | **Read [analysis-workflow.md](references/analysis-workflow.md) first** (selections, identity, weighting, display separation). |
| Handle Pandas or tables | Also read [pandas-data-handling.md](references/pandas-data-handling.md) (grain, keys, joins, missingness, aggregation). |
| Pick quantitative encoding | Read [plot-patterns.md](references/plot-patterns.md). |
| Set or review appearance | Read [design-style.md](references/design-style.md). |
| Run adapter, templates, or gallery | Check [api.md](references/api.md) for interfaces and layout. |
| Adapt a template workflow | Follow [tutorials.md](references/tutorials.md) (time course, replicates, parameter map). |
| Inspect finished examples | Browse [gallery.md](references/gallery.md) PDFs, sources, and teaching CSVs. |
| Resolve competing structures | Check [repository-patterns.md](references/repository-patterns.md) when current code leaves a choice open. |
| Review provenance and license | See [design-provenance.md](references/design-provenance.md) (optional). |

Gallery CSVs contain synthetic teaching data, not scientific evidence; adapt their direct code for real data without inventing a plotting framework or rewriting valid analysis code.

## Shared Visual Defaults

Create, render, and save inside `paper_style()` from [publication.py](assets/styles/publication.py) ([api.md](references/api.md)). It applies an installed owner `minimalist` package or warns and uses Matplotlib DejaVu Sans, `tab10`, `inferno`, and `coolwarm` with through-going error bars (`marker_gap` ignored). No owner theme or fonts are bundled; never install a PyPI namesake.

- Keep 8 pt text and 9 pt bold panel tags at final physical size (widen crowded plots instead of shrinking text), with 5 pt hollow markers (`0.8` pt outline, `markerfacecolor="none"`, `marker_gap=True` when supported).
- Match error bars and legend text to each group's color, keep one named group-to-style mapping across figures, use labeled error bars rather than curve ribbons, and draw histograms as group-colored filled bars with shared bins, gaps, and a zero baseline.
- Keep discrete parameter maps and missing cells distinct from smooth dense-function heatmaps; never smooth sparse sweeps.

See [design-style.md](references/design-style.md) for full visual roles. Vector PDF is the default and the only bundled export; honor other requested ordinary plot formats without inheriting schematic vector rules.

## Completion Gate

Run proportional checks per [analysis-workflow.md](references/analysis-workflow.md#verify-proportionally) whenever data handling changes; verify representative values, keys, counts, and weighting before claiming preserved results.

Save and visually inspect every changed figure at physical size for labels, units, group encodings, uncertainty definitions, counts, missingness, clipping, and overlap against plot-ready data (inspect related figures together in the assembled PDF; treat raster previews only as inspection aids, and report unavailable checks). Code-only simplifications require numerical verification rather than gallery rebuilds, confirming a traceable load-to-plot path with display-only steps outside the analysis.

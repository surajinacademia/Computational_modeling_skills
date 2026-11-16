---
name: data-visualization
description: Create, style, review, or simplify quantitative plots from completed scientific data, including notebook figures and ordinary paper-ready PDFs. Use the visual gallery, a portable style adapter, and direct plotting templates while preserving scientific identity, weighting, and observable definitions. Do not use for simulation execution, generic data cleaning, inferential modeling, spatial simulation frame or video rendering, or composite schematic design.
---

# Data Visualization

Create clear quantitative figures from completed scientific data with a direct, traceable path from data loading to plotting. Use the bundled style adapter for shared visual defaults and the worked examples to match the plot form to the scientific question.

## Scope

Use this skill to create, style, review, or simplify exploratory, diagnostic, comparative, or ordinary paper-ready quantitative plots of completed values, including small grids of related quantitative axes.

Do not use it for simulation execution or monitoring, generic dataframe cleaning without a defined plot, inferential statistics, model fitting, or complex experimental group construction. Dedicated workflows handle spatial simulation frame or video rendering and composite publication schematics (`schematic-designer` owns bespoke vector diagrams, reconstructions, and outlined-SVG figure exports). If a refactoring pass runs alongside this skill, this skill governs scientific selections, experimental units, and data identity while the refactoring workflow governs surrounding code structure.

When invoked by `jupyter-notebook`, work inside its existing notebook and target cells using the supplied scientific question, data path, observable definitions, units, selections, uncertainty, and output scope, resolving missing scientific details without inventing values or creating parallel files. Leave notebook layout, execution authorization, output preservation, and configured notebook styles to `jupyter-notebook`; inspect saved inline figures at reading size for inline-only requests and export standalone figure files only when requested.

## Route to the Needed Resource

Read [analysis-workflow.md](references/analysis-workflow.md) whenever the data-to-plot path changes, then load only the specific reference needed for the task rather than reading every file for a simple plot.

| Task | Resource and action |
| --- | --- |
| Create or change an analysis-to-plot path | Read [analysis-workflow.md](references/analysis-workflow.md) before editing to preserve scientific selection, identity, weighting, and analysis-versus-display separation. |
| Change Pandas or tabular data handling | Read [pandas-data-handling.md](references/pandas-data-handling.md) for row representation, row key unit versus independent experimental unit ($n$), joins, missingness, and aggregation. |
| Choose the quantitative encoding | Read [plot-patterns.md](references/plot-patterns.md). |
| Establish or review visual appearance | Read [design-style.md](references/design-style.md). |
| Use the style adapter, template CLI, or gallery scripts | Consult [api.md](references/api.md) for interfaces and the resource layout. |
| Start a time course, replicate comparison, or parameter map | Follow [tutorials.md](references/tutorials.md) and adapt the matching template. |
| Inspect a finished example figure | Open the relevant PDF in [gallery.md](references/gallery.md) alongside its plotting source and teaching CSV. |
| Resolve competing analysis structures | Consult [repository-patterns.md](references/repository-patterns.md) when current code leaves a choice open. |
| Review architectural provenance and reuse terms | Consult [design-provenance.md](references/design-provenance.md) (optional). |

Treat the bundled gallery CSVs strictly as synthetic teaching values rather than scientific evidence; reuse their visual decisions and direct code structure on your completed data without rewriting valid analysis code or introducing a general plotting framework.

## Shared Visual Defaults

Create, render, and save figures inside `paper_style()` from [publication.py](assets/styles/publication.py) ([api.md](references/api.md)). It uses a locally pre-installed `minimalist` plotting theme when available, or warns and falls back to Matplotlib's native DejaVu Sans, `tab10`, `inferno`, and `coolwarm` defaults with through-going error bars (`marker_gap` ignored); never install an unrelated public PyPI package of the same name.

- Match final physical font sizes across related figures: 8 pt text and 9 pt bold panel tags by default, widening crowded panels rather than shrinking text.
- Use 5 pt hollow markers with 0.8 pt outlines, `markerfacecolor="none"`, and `marker_gap=True` when the optional theme is present (`marker_gap=False` permits through-going error bars explicitly).
- Match error bars and legend text to each group's plot color, keeping one consistent group-to-style mapping across figures with bold black overview headings.
- Use labeled error bars rather than filled curve ribbons, and draw histograms as group-colored filled bars with shared bins, clear gaps, and a zero baseline.
- Keep discrete parameter sweeps and missing grid cells distinct from smooth heatmaps of densely evaluated functions, never smoothing sparse parameter maps for appearance.

See [design-style.md](references/design-style.md) for remaining visual roles; vector PDF is the default and only bundled export format, while other requested ordinary plot formats do not inherit `schematic-designer` vector export rules.

## Completion and Verification Criteria

Apply the proportional numerical checks in [analysis-workflow.md](references/analysis-workflow.md#verify-proportionally) whenever data handling changes, checking representative values, row key units, independent experimental-unit counts ($n$), and weighting before claiming preserved results.

Save and visually inspect every changed figure at its intended physical size against the plot-ready data for axis labels and units, group encodings, uncertainty definitions, sample counts ($n$), missingness, clipping, and overlap, inspecting related figures together in assembled PDFs and stating any unavailable visual check explicitly. For code-only simplifications, run numerical verification checks rather than redesigning figures or rebuilding unrelated gallery examples, confirming that a reader can trace load to plot in one pass with display-only thinning or formatting kept outside the scientific calculations.

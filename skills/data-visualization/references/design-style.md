# Quantitative Design Style

Use this reference for visual appearance, [plot-patterns.md](plot-patterns.md) for quantitative encoding, and the [gallery](gallery.md) for finished examples.

## Optional Minimalist Identity

When installed, the owner's `minimalist` package provides CMU Sans Serif, Computer Modern mathtext, thin boxed axes, inward ticks, frameless legends, and its warm-to-cool qualitative palette; keep its palette intact without copying or substituting fonts. [publication.py](../assets/styles/publication.py) applies it via `paper_style()` and [paper.mplstyle](../assets/styles/paper.mplstyle) without needing TeX ([api.md](api.md#runtime-and-scoped-style) covers runtime mechanics and the native DejaVu Sans fallback with through-going error bars).

## Shared Roles in the Executable Examples

Set physical output dimensions first (`85 × 70 mm` is a starting default, not a hard limit), keeping each font role at the same final point size across related panels by widening or splitting figures instead of shrinking crowded text.

| Role | Default at final placement |
| --- | --- |
| Body, axes, ticks, legends, notes | 8 pt CMU Sans Serif (DejaVu Sans in fallback) |
| Panel tag | 9 pt actual bold face |
| Point / outline | 5 pt diameter / 0.8 pt; scatter area is 25 pt² |
| Mean mark / error cap | 11 pt / 3 pt |
| Pairing connector | 0.65 pt black at 0.5 opacity; measured points stay opaque |
| Dashed / dotted pattern | (3, 2) pt / (0.7, 1.5) pt, independent of stroke width |
| Layout padding / panel gap | 0.8 / 2 base-font units in `tight_layout` |

These defaults correspond to `FONT_PT`, `LINE_PT`, `MARK_PT`, `OPACITY`, `LAYOUT`, `MARKERS`, `LINESTYLES`, and `DASH_PT`, with notes occupying the lower 12% of the canvas. The CMU bold face requires `FontProperties(..., weight="bold", stretch="expanded")`, as plain bold weights can fall back to regular.

Draw uniform hollow markers (`markerfacecolor="none"`, `marker_gap=True` to clear error-bar segments inside markers, or `marker_gap=False` for through-going whiskers) and place summary intervals beside raw points to avoid overlap; use faint grids or reference lines only when they aid reading.

## Color and Quantitative Encodings

Reuse one named group-to-style mapping via the full `--group-order` list across related figures (preserving palette, marker, and dash indices even when a group is absent; omitting `--group-order` sorts observed names). Match mean marks, error bars, and legend text to the group color while keeping explanatory notes dark and gallery headings bold black; verify pale legend entries keep distinct marker or dash cues and never rely on color alone.

Use labeled error bars instead of filled ribbons or curve shading, and draw histograms with group-colored filled bars, shared bins, visible gaps, and a zero baseline. Choose colormaps by variable role:

- Sequential values: `minimalist.get_cmap('sequential')` supplies `inferno`.
- Signed departures around a meaningful reference: center normalization explicitly (`minimalist.get_cmap('diverging')` calls `pride` via `scicomap`, failing back silently if `scicomap` breaks, so verify `scicomap` when reproducing the gallery).
- Distinct states: use categorical colors instead of a numeric gradient.

Hold color limits fixed across directly compared maps or disclose separate scales, label colorbars with observable and units, render missing cells distinctly without mapping them to zero, and preserve discrete parameter grids without smoothing sparse data into continuous heatmaps.

## Axes and Statistical Meaning

Label each axis with observable and units (stating dimensionless status when ambiguous) and keep scientific-notation scale factors visible. Give bar charts a zero baseline; points and lines may crop ranges when disclosed if zoom could overstate differences, and log axes require strictly positive valid data.

State the unit counted by `n` and show varying sample sizes; mean ± SD shows spread across included units, not uncertainty in the mean or a confidence interval ([pandas-data-handling.md](pandas-data-handling.md)). Per the [completion gate](../SKILL.md#completion-gate), inspect saved PDFs and assembled pages at intended size against source tables and grayscale views; dense scatter or image artists may be rasterized inside vector PDFs while keeping axes and text vector.

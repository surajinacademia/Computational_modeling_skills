# Choose the Plot from the Scientific Question

## Contents

- [Time Courses](#time-courses)
- [Replicate Comparisons and Distributions](#replicate-comparisons-and-distributions)
- [Scatter Plots](#scatter-plots)
- [Parameter Maps](#parameter-maps)
- [Continuous Functions](#continuous-functions)
- [Vector Fields](#vector-fields)

Choose the simplest plot that makes the comparison readable from completed observables (never to introduce new simulations, filters, or inference). Pair this choice with [pandas-data-handling.md](pandas-data-handling.md) for grain and weighting, [design-style.md](design-style.md) for styling, and the [PDF gallery](gallery.md) for worked layouts.

| Question | Useful starting form | What the reader must see |
| --- | --- | --- |
| How does a quantity change over time? | Per-run trajectories and a condition summary | Time coordinates, run spread, summary rule, and contributing run counts |
| How do conditions compare across runs? | Individual run points with descriptive summary | Each run, group size, and interval meaning |
| How broad or structured is a distribution? | Group-colored filled histogram bars (plus points for small samples) | Common bins, counts or stated normalization, and scientific unit |
| How do two observables relate? | Scatter plot | Which two values belong to the same scientific unit |
| How does a scalar vary across two parameters? | Parameter map | Actual coordinates, units, and unsampled or missing pairs |
| How does a known continuous function vary over a domain? | Smooth heatmap from dense evaluation | Formula, domain, normalization, and grid resolution |
| What direction does a vector field take? | Quiver plot (over scalar field if helpful) | Direction, magnitude scale, coordinates, and any display thinning |

## Time Courses

[timecourse.py](../assets/templates/timecourse.py) expects one completed value per `(condition, run, time)` and plots equal-run mean ± SD (`ddof=1`, showing between-run spread rather than confidence intervals) using the shared [visual defaults](design-style.md). Include individual trajectories when run variability matters, preserve counts if showing summaries only, break lines across undefined gaps, and align unequal time grids explicitly before aggregating.

## Replicate Comparisons and Distributions

[replicate_comparison.py](../assets/templates/replicate_comparison.py) plots one completed scalar per `(condition, run)` beside its mean and SD (deterministic x-offsets carry no data). Connect observations across conditions only by genuine shared keys (never row order or recycled `run 1` labels across independent ensembles).

When shape matters, plot a histogram with group-colored filled bars, shared bin edges, visible gaps, and a zero baseline (grouping bars side by side per bin without altering bin membership; state bin edges or keep them in source, and name the unit counted). Use ECDFs or density curves only when requested or required by the scientific question.

## Scatter Plots

Pair two measurements from the same scientific unit via their shared key. Add a diagonal identity line with equal limits and aspect only when both axes share units and compare distance from identity; label each axis independently otherwise, without implying a fitted or causal trend from scatter alone.

## Parameter Maps

[parameter_map.py](../assets/templates/parameter_map.py) takes one precomputed scalar per `(x, y)` without pooling or reducing duplicates (finish run aggregation beforehand). Keep nonuniform numeric coordinates with halfway interior cell borders and half-nearest-spacing outer borders, or use coordinate scatter if rectangular cells misrepresent sparse sampling; keep absent combinations visibly missing instead of interpolating a continuous parameter space.

## Continuous Functions

Keep analytic heatmaps distinct from discrete sweeps. The gallery evaluates `f(x, y) = tanh(2x) · [0.5 + 0.5 cos(πy)]` on a 201 × 101 grid over `x ∈ [−1, 1]`, `y ∈ [0, 1]` with zero-centered scale `[−1, 1]` and bilinear display interpolation (which never alters underlying values). State the formula, domain, evaluation grid, and interpolation, and never use smooth rendering to mask missing sweep points.

## Vector Fields

State whether arrow length encodes magnitude (with a scale key and units) or normalized direction, use physical aspect when geometry matters, and apply regular display thinning only after computing any reported field summary, disclosing the rule near the plot.

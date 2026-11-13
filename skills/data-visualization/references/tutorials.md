# Three Direct Plotting Tutorials

## Contents

- [Change over time](#1-compare-change-over-time)
- [Completed run values](#2-compare-completed-run-values)
- [Two-parameter map](#3-show-a-scalar-across-two-parameters)

These templates turn completed per-run or per-coordinate tables into PDFs using synthetic teaching CSVs. Pick a form from the [gallery](gallery.md), check runtime and CLI rules in [api.md](api.md), and run commands from `skills/data-visualization/` with an existing output directory.

## 1. Compare Change over Time

**Question:** how does the observable evolve per condition, and how much do runs vary at each time?

[timecourse.py](../assets/templates/timecourse.py) expects one completed scalar per `(condition, run, time)` (no raw cell or particle pooling):

```sh
python assets/templates/timecourse.py assets/examples/timecourse/data.csv /private/tmp/data-vis-timecourse.pdf --group-order Control Perturbed --xlabel 'Time (h)' --ylabel 'Front position (µm)'
```

Summary curves show equal-run mean and sample SD (`ddof=1`) per time, with measured run counts (or range) in the legend. Blank values contribute to neither mean nor count, singleton times have a mean without SD, and missing means break the line. It uses the union of supplied times per condition (insert a blank `value` row for an expected time absent from all runs, or align unequal grids explicitly beforehand).

**Check the teaching CSV:** six runs per condition at seven times; at `time=0`, both means are 10 µm (SD ≈ 1.12250 µm); at `time=12`, Control averages 36.4 µm and Perturbed 39.097025 µm (both SDs ≈ 2.02049 µm).

**Adapt and inspect:** supply real completed runs and units, keep one full `--group-order` across related plots, and overlay individual runs when trajectory shapes matter. Check endpoints, missing-mean breaks, zero counts if relevant, and fail visibly on duplicate `(condition, run, time)` keys instead of dropping rows.

## 2. Compare Completed Run Values

**Question:** how do conditions compare while keeping every measured run visible?

[replicate_comparison.py](../assets/templates/replicate_comparison.py) expects one completed scalar per `(condition, run)`:

```sh
python assets/templates/replicate_comparison.py assets/examples/replicate-comparison/data.csv /private/tmp/data-vis-replicates.pdf --group-order Control Perturbed --xlabel 'Condition' --ylabel 'Speed (µm/min)'
```

Each run appears beside its group-colored mean and sample SD (deterministic horizontal jitter has no measurement meaning); labels show measured `n` (or `n=measured/supplied` when values are blank; measured zero stays data).

**Check the teaching CSV:** both groups have `n=6`, Control mean 2.0 µm/min (SD ≈ 0.374166 µm/min) and Perturbed mean 2.5 µm/min (SD ≈ 0.447214 µm/min), with all twelve points plotted.

**Adapt and inspect:** compute the per-run scalar before plotting (never treat pooled cells as independent runs), verify every point, count, and interval (`n=1` plots no SD), and fail on repeated `(condition, run)` keys. Use the keyed [gallery](gallery.md) paired-change pattern when conditions share genuine paired IDs.

## 3. Show a Scalar across Two Parameters

**Question:** how does a completed scalar vary across two numeric parameters, including missing pairs?

[parameter_map.py](../assets/templates/parameter_map.py) expects one completed `value` per `(x, y)` without pooling repeated pairs:

```sh
python assets/templates/parameter_map.py assets/examples/parameter-map/data.csv /private/tmp/data-vis-parameter-map.pdf --xlabel 'Adhesion (dimensionless)' --ylabel 'Noise (dimensionless)' --colorbar-label 'Order (dimensionless)'
```

Coordinates mark cell centers with halfway interior borders and half-nearest-neighbor outer borders, keeping nonuniform grids uninterpolated and shading missing pairs or blank values gray with a missing-data key (requires at least two distinct coordinates per axis and one measured value).

**Check the teaching CSV:** five `x` and four `y` values form twenty pairs, nineteen measured and `(0.5, 2)` missing; `(0.1, 0.5)` is 0.14345709 and `(1.4, 0.5)` is 0.74327807. Missing cells must never become zero-colored or shift color limits.

**Adapt and inspect:** aggregate replicates beforehand, label axes, scalar, and units, share color limits across compared maps, center signed palettes explicitly (dense analytic maps belong to the continuous-function [gallery](gallery.md) case), and verify missingness, unequal cell sizes, and colorbar legibility. Duplicate `(x, y)` pairs and singleton axes fail visibly (use points or lines for 1D sweeps).

All tutorials enforce [pandas-data-handling.md](pandas-data-handling.md), [design-style.md](design-style.md), and the [completion gate](../SKILL.md#completion-gate).

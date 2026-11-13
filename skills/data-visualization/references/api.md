# Implemented Interfaces and Resource Layout

## Contents

- [Resource layout](#find-the-right-file)
- [Runtime and style context](#runtime-and-scoped-style)
- [CSV templates](#three-csv-to-pdf-templates)
- [Runnable examples](#eight-runnable-examples)
- [Gallery and data commands](#gallery-and-teaching-data-commands)

Use these interfaces with the [scientific workflow](analysis-workflow.md) and [design rules](design-style.md).

## Find the Right File

```text
data-visualization/
├── SKILL.md                         # scope, resource router, completion gate
├── agents/openai.yaml               # discovery prompt
├── references/                      # analysis, design, tutorials, API, gallery index
├── assets/
│   ├── styles/                      # publication.py, pdf_output.py, paper.mplstyle
│   ├── templates/                   # three reusable CSV-to-PDF programs
│   ├── gallery.pdf                  # overview and eight teaching pages
│   └── examples/
│       ├── timecourse/              # source.py, data.csv, figure.pdf in each case
│       ├── replicate-comparison/
│       ├── paired-change/
│       ├── distribution/
│       ├── scatter/
│       ├── parameter-map/
│       ├── continuous-field/
│       └── metric-comparison/
└── scripts/
    ├── build_gallery.py             # run specimens and assemble the review PDF
    └── create_demo_data.py          # regenerate deterministic synthetic tables
```

## Runtime and Scoped Style

Individual figures require NumPy, Pandas, and Matplotlib (`requirements.txt`); ReportLab and pypdf are needed only for gallery assembly, and no LaTeX engine is required. Commands never install packages or touch the network.

`paper_style()` loads an installed owner `minimalist` package when present (using its palette, style sheet, strict CMU Sans Serif lookup, and draw-time marker gaps; broken installs fail visibly) and warns on fallback to Matplotlib DejaVu Sans, `tab10`, `inferno`, and `coolwarm` with through-going error bars (`marker_gap` ignored). `get_cmap(role)` returns the active sequential or diverging colormap.

Both modes apply `paper.mplstyle` and restore caller `rcParams` and `Axes.errorbar`/`Axes.draw` on exit (avoid concurrent plotting threads while patched). Create, render, and save inside `paper_style()`; it never calls `minimalist.use_style()`. Keep `publication.py`, `pdf_output.py`, and `paper.mplstyle` together when relocating templates.

## Three CSV-to-PDF Templates

From `skills/data-visualization/`, run:

```sh
python assets/templates/timecourse.py INPUT.csv OUTPUT.pdf --xlabel 'Time (h)' --ylabel 'Value (units)' --group-order Control Perturbed
python assets/templates/replicate_comparison.py INPUT.csv OUTPUT.pdf --xlabel 'Condition' --ylabel 'Value (units)' --group-order Control Perturbed
python assets/templates/parameter_map.py INPUT.csv OUTPUT.pdf --xlabel 'Parameter x (units)' --ylabel 'Parameter y (units)' --colorbar-label 'Value (units)'
```

| Template | Required columns and grain | Summary or display |
| --- | --- | --- |
| `timecourse.py` | `condition, run, time, value`; one completed value per condition/run/time | Equal-run mean and sample SD at each time; missing means break lines. |
| `replicate_comparison.py` | `condition, run, value`; one completed scalar per condition/run | All measured run points, equal-run mean, and sample SD; deterministic x-offsets carry no value. |
| `parameter_map.py` | `x, y, value`; one completed scalar per coordinate pair | Discrete cells keep numeric coordinates and missingness; no pooling or interpolation. |

All three accept `--xlabel` and `--ylabel`; only `parameter_map.py` accepts `--colorbar-label`. Categorical templates accept `--group-order GROUP [GROUP ...]`; pass the full shared group universe across related plots (including absent groups) to preserve color, marker, and dash order, or observed names sort alphabetically (duplicate or incomplete lists fail). Outputs must end in `.pdf`, differ from inputs, sit in existing directories without symlinks, and pass key uniqueness without turning blank values into zero; see [tutorials](tutorials.md) for worked inputs and checks.

## Eight Runnable Examples

Each `assets/examples/<case>/` holds `source.py`, `data.csv`, and `figure.pdf`. From the skill directory:

```sh
python assets/examples/distribution/source.py
python assets/examples/distribution/source.py --output /private/tmp/distribution-review.pdf
```

Without `--output`, `source.py` overwrites that case's `figure.pdf`. `timecourse`, `replicate-comparison`, and `parameter-map` call their canonical templates; the other five define `paired_change()`, `distribution()`, `scatter()`, `signed_map()` (in `continuous-field`), and `metric_comparison()`, returning a Matplotlib figure from their teaching CSV. Adapt cases directly rather than building a general plotting library.

## Gallery and Teaching-Data Commands

From the skill directory with gallery dependencies installed:

```sh
python scripts/build_gallery.py
python scripts/build_gallery.py --output-dir /private/tmp/data-vis-gallery-review
```

Default paths overwrite `assets/gallery.pdf` and every example `figure.pdf`; `--output-dir` isolates copies for comparison. Only run `python scripts/create_demo_data.py` when intentionally regenerating deterministic `data.csv` tables (it runs no simulations). Inspect changed figures and the assembled gallery before finishing.

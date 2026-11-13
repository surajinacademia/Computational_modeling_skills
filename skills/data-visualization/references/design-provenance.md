# Design Provenance

Reviewed 2026-09-21 against Chen Liu's `figures4papers` commit `3c181f85e82c6f24948fcaaf3be6696102b41d8d`. This record documents provenance only and is not needed for plotting.

## Architecture Adapted

`figures4papers` links visual goals to design theory, tutorials, and runnable demos via a compact router; this skill pairs that routing with strict rules on scientific grain, identity, weighting, missingness, and analysis/display separation:

- The entrypoint routes design, tutorials, API docs, and gallery assets while requiring [analysis-workflow.md](analysis-workflow.md) whenever data paths change.
- Each of the eight local cases bundles `source.py`, teaching `data.csv`, and PDF alongside three standalone templates and a scoped style adapter (keeping executable interfaces inside the skill).
- Completion requires visually inspecting the saved PDF at intended physical size.

Unlike upstream large canvases, heavy spines, preferred-method colors, legend-only panels, truncated bar baselines, or uncalculated shadow ribbons, this skill defaults to the owner's Minimalist layout and explicitly labels between-run sample SD and valid counts. Composite publication diagrams and outlined-SVG delivery remain separate under `schematic-designer`.

## Reuse Boundary

Upstream material is licensed under **CC BY-NC 4.0**, not this plugin's MIT license. Only structural ideas were adapted; all local prose, templates, style adapter, overlay, synthetic tables, and PDFs are original work with no upstream code, images, datasets, or manuals copied. Future copying of upstream content requires explicit license, attribution, and reuse review; gallery PDFs are synthetic examples, not scientific findings.

## Owner Dependency

The optional owner theme is Suraj Sahu's `minimalist` **3.0.0** (`STYLE.md` and `src/minimalist/__init__.py`) on Python 3.13; no owner package source is copied or bundled, and machine-specific paths stay in private maintenance records. The adapter calls installed public APIs without installing packages or touching the network (see [api.md](api.md#runtime-and-scoped-style) and [design-style.md](design-style.md) for the native Matplotlib fallback). The continuous-function example follows the owner's dense analytic evaluation and bilinear display pattern with an independent formula and table. Only the reviewed skill export is distributed publicly.

## Reviewed Upstream Sources

- [entrypoint](https://github.com/ChenLiu-1996/figures4papers/blob/3c181f85e82c6f24948fcaaf3be6696102b41d8d/scientific-figure-making/SKILL.md)
- [design theory](https://github.com/ChenLiu-1996/figures4papers/blob/3c181f85e82c6f24948fcaaf3be6696102b41d8d/scientific-figure-making/references/design-theory.md)
- [tutorials](https://github.com/ChenLiu-1996/figures4papers/blob/3c181f85e82c6f24948fcaaf3be6696102b41d8d/scientific-figure-making/references/tutorials.md)
- [demo index](https://github.com/ChenLiu-1996/figures4papers/blob/3c181f85e82c6f24948fcaaf3be6696102b41d8d/scientific-figure-making/references/demos.md)
- [repository gallery and packaging](https://github.com/ChenLiu-1996/figures4papers/blob/3c181f85e82c6f24948fcaaf3be6696102b41d8d/README.md)
- [API specification](https://github.com/ChenLiu-1996/figures4papers/blob/3c181f85e82c6f24948fcaaf3be6696102b41d8d/scientific-figure-making/references/api.md)
- [common patterns](https://github.com/ChenLiu-1996/figures4papers/blob/3c181f85e82c6f24948fcaaf3be6696102b41d8d/scientific-figure-making/references/common-patterns.md)
- [license](https://github.com/ChenLiu-1996/figures4papers/blob/3c181f85e82c6f24948fcaaf3be6696102b41d8d/LICENSE)

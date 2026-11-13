# Renderer Workflows

Use this reference after the scientific inventory and before authoring source. Keep the user-requested renderer or existing maintained source (`.tex` stays TeX/TikZ, `.py` stays Matplotlib); for new figures without one, choose by content and editability per [source-editing rules](../SKILL.md#source-editing-and-tool-calls).

## Contents

- [Choose a renderer](#choose)
- [Arrowheads](#arrowheads)
- [Matplotlib](#matplotlib)
- [TikZ](#tikz)
- [Hybrid](#hybrid)
- [Reconstruction and layout](#reconstruction-and-layout)

## Choose

| Renderer | Best fit | Avoid when |
|---|---|---|
| Matplotlib | Computed plots, trajectories, fields, data-heavy panels, rapid iteration | Final composition needs dense native-TeX annotation |
| TikZ | Equations, node-and-arrow schematics, braces, relative layout, document-matched type | The figure is dominated by computed fields or plot panels |
| Hybrid | Current computed panels with TikZ labels, callouts, and composition | Either renderer alone can express the figure clearly |

An input PNG or JPEG never justifies raster delivery: rebuild meaning with editable primitives and keep a raster layer only for real photos or dense scientific fields.

Reuse the project's working Python environment, TeX engine, fonts, and PDF/SVG commands; when setting them up, verify one small test export before a full render and record the working commands. After any failure, diagnose and retry the affected stage, and inspect both final PDF and SVG after edits.

## Arrowheads

Use native TikZ `arrows.meta` heads for schematic arrows across all profiles (`>={Latex}` with `->`, `<-`, or `<->`; the minimalist helper sets this and `ms arrow` adds structural weight). Other `arrows.meta` terminals (bars, circles, diamonds) remain available when their shape carries scientific meaning.

Keep head geometry, stroke, color, and opacity consistent per relation role at final size (pick overrides once per role). Leave clear space around tips and labels, and keep direction, attachment points, and magnitude-bearing vector lengths exact.

Matplotlib's PGF backend typesets text with LaTeX but leaves arrow patches as Matplotlib paths rather than TikZ heads. For schematic arrows on a computed panel, either omit them in Python and draw them in a TikZ hybrid compositor using the panel's actual transform and fixed placement, or use [native_tikz.py](../scripts/native_tikz.py) to draw genuine TikZ heads through PGF at artist layer order without `FancyArrowPatch`, Unicode glyphs, or hand-drawn triangles.

## Matplotlib

- Edit the maintained `.py` source directly with `apply_patch` or a file editor (never patch generated PGF or TeX backend artifacts).
- For Minimalist, call `apply_style()` from [minimalist_profile.py](../assets/styles/minimalist_profile.py) before importing `pyplot` or `minimalist` (historical `assets/styles/matplotlib/` assets also require PGF before `pyplot`), and read `palette()` for shared colors per [minimalist.md](styles/minimalist.md).
- Separate data/computation from drawing functions that accept an `ax`.
- Apply the [default equation style](typography.md#default-equation-style) with LaTeX terms, matched callouts, and braces or native TikZ leaders attached via measured term bounds and actual axes transforms (or a hybrid compositor if already hybrid).
- Apply profile type, stroke, marker, opacity, pattern, and spacing roles, and export via [vector-export.md](vector-export.md) (keep text, curves, markers, axes, and overlays vector; rasterize only dense scientific image layers). See `assets/examples/matplotlib/learning-dynamics/` and `assets/examples/matplotlib/collective-cell-model-classes/`.

## TikZ

- Edit maintained `.tex` and project-owned `.sty` directly with `apply_patch` or a file editor (never generate or rewrite figure source via Python one-liners), using named nodes, relative positioning, semantic styles, and native math.
- Apply [annotated equations](typography.md#default-equation-style) with term definitions and matching colors, adapting global nodes for term callouts and linked equations for derivations while keeping operators and groupings exact.
- For Minimalist, generate `minimalist-profile.sty` inside the approved work directory via the helper's `--tikz` CLI (keeping figure overrides in authored TeX after loading it, and generating from the same Python config for hybrids). Compatibility packages in `assets/styles/tikz/` also require `minimalist-profile.sty`; declare all inputs to `scripts/render_tikz.py`.
- Compile trusted/generated TeX through `scripts/render_tikz.py` using LuaLaTeX, native LaTeX math, and explicit CMU fonts per [typography.md](typography.md), and pick patterns from the [TikZ library](library.md#tikz-examples).

## Hybrid

1. Pick one profile and role mapping, then regenerate each Matplotlib panel from current data at its intended final physical size.
2. Save declared intermediate panels as vector PDFs, never PNGs.
3. Edit the maintained `.tex` compositor directly to place panels in named TikZ nodes and attach equations, arrows, and labels in the same [annotated-equation style](typography.md#default-equation-style), term colors, and physical type sizes (keep `.py` edits limited to panel data/drawing).
4. Declare every imported PDF and local style package to `render_tikz.py`, and build the final pair via TikZ.

Generate the support `.sty` and computed panels from the same configuration per [minimalist.md](styles/minimalist.md). Never rescale imported panels in TeX (regenerate at the target size instead so type and strokes match), keep scientific aspect ratios intact, and record panel hashes or freshness checks as in `assets/examples/tikz/chemoattraction/`.

## Reconstruction and layout

- Inspect image references at native resolution and build a content ledger of panels, entities, labels, equations, units, relations, scales, and ambiguities.
- Rebuild entities and relations first, deriving repeated sizes and gaps from anchors or constants rather than tracing antialiased pixels; compute quantitative curves or mark them illustrative.
- Use whitespace, ribbons, rails, or frames only for real hierarchy, route connectors through open lanes, clip fields to their semantic zone, and align repeated objects and panel tags.
- Apply visual size and opacity tokens only to styling; keep radii, vector lengths, colors, and opacities that encode scientific quantities, and define pattern meanings across marks, labels, and legends.

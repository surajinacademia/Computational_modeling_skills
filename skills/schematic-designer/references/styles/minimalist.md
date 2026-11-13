# Aesthetic Profile: minimalist

Use this default profile for scientific schematics and eligible composite figures unless the user, journal, or project specifies another. When installed, `minimalist` supplies colors through the shared helper; otherwise the helper warns and uses Matplotlib's default cycle (changing appearance, not science, without reproducing stored specimen colors).

## Contents

- [Shared source and runtime](#one-source-for-all-renderers)
- [Physical style tokens](#roles-at-the-intended-publication-size)
- [Color and pattern meaning](#color-text-and-pattern-meaning)
- [Typography and spacing](#typography-and-negative-space)
- [Matplotlib setup](#apply-in-matplotlib)
- [TikZ and hybrid setup](#apply-in-tikz-and-hybrid-figures)

## One source for all renderers

[minimalist_profile.py](../../assets/styles/minimalist_profile.py) drives both Matplotlib and TikZ. `palette()` reads `minimalist.get_cmap("qualitative")` when installed or Matplotlib's default cycle otherwise; `apply_style()` sets PGF with LuaLaTeX/CMU typography; `tikz_style()` emits a matching support style.

Run with project Python (NumPy, Matplotlib), LuaLaTeX, TikZ, CMU fonts, and a PDF-to-SVG converter (`minimalist` is optional and never bundled or auto-installed; never alter global discovery or install packages just to apply this profile, and report missing required tools instead of substituting fonts).

## Roles at the intended publication size

Fix final physical width before drawing. These defaults are whole-figure starting points at publication size, preserving exact font and graphic units across renderers:

| Shared constant | Roles and defaults | Use |
|---|---|---|
| `FONT_PT` | panel 10; title 9; body 8; equation 8; small 7 | Repeated typographic hierarchy |
| `LINE_PT` | context 0.5; structure 0.75; emphasis 1.1 | Supporting geometry, ordinary relations, selected emphasis |
| `MARKER_PT` | point 3; emphasis 4.5 | Nominal marker diameters; Matplotlib scatter uses squared values for `s` |
| `ARROW_PT` | length 4; width 2.8 | Native `Latex` tip dimensions shared by PGF artists and TikZ |
| `OPACITY` | context 0.25; fill 0.12; foreground 1 | Supporting strokes, pale fills, opaque foreground |
| `DASH_PT` | dashed (3, 2); dotted (0.7, 1.5) | On/off lengths for consistent line patterns; solid remains default |
| `SPACE_PT` | unit 4; label 4; group 8; panel 12 | Starting distances for repeated gaps and padding |

Override roles once in the maintained source (TeX macros/styles in `.tex` or project `.sty` for TikZ, role dicts before `apply_style()` in `.py` for Matplotlib, or shared Python config for hybrids). Set artist opacity and spacing explicitly in Matplotlib, keeping label text opaque even when foreground geometry opacity changes. Both renderers share flat caps, rounded joins, and a white canvas (TikZ adds an opaque white background behind the picture, not a visible panel border).

Visual defaults never override physical radii, magnitude-scaled vectors, or quantitative color/opacity encodings; keep qualitative palette colors for distinct entities or categories rather than scalar fields, and inspect at final size before tuning tokens.

## Color, text, and pattern meaning

Map palette entries to named entities or conditions before drawing, and keep that mapping across marks, arrows, nearby labels, equations, and legends using the fewest colors needed. Match readable entity colors in direct labels (or dark ink with a colored key), keep text opaque, and prefer pale opaque white-preblended tints or unfilled outlines over transparent fills that muddle overlapping category hues.

Pair every critical distinction with a non-color cue (label, shape, terminal, dash pattern, or legible hatch), defining pattern meanings explicitly per figure across renderers. On palette-only recolors, keep existing layouts, glyph sizes, shadows, 3D shading gradients, and translucent depth cues rather than flattening them.

## Typography and negative space

Follow [typography.md](../typography.md) for mandatory CMU text, Computer Modern math, and [default annotated equations](../typography.md#default-equation-style), aligning panel tags, repeated motifs, and baselines for effortless comparison. Reserve whitespace for connector lanes and nearby labels, group related items tightly, enlarge panel room or rearrange labels before shrinking text, and use frames, rails, or ribbons only for real compartments (marking illustrative geometry when it could imply scale).

## Apply in Matplotlib

Import from `assets/styles/` and call `apply_style()` before importing `pyplot` or `minimalist` (since `minimalist` imports `pyplot`):

```python
from minimalist_profile import apply_style, palette, FONT_PT, LINE_PT

apply_style()
import matplotlib.pyplot as plt

colors = palette()  # Assign entries to named entities in the figure source.
```

Never call `minimalist.use_style()` afterward. Render via [renderer-workflows.md](../renderer-workflows.md) and [vector-export.md](../vector-export.md).

## Apply in TikZ and hybrid figures

Redirect `--tikz` stdout to `minimalist-profile.sty` inside the approved project work directory (or generate it via `tikz_style()` from a hybrid's shared config), declare it to `scripts/render_tikz.py`, and load `\usepackage{minimalist-profile}`. Keep overrides in authored `.tex`/`.sty` afterward without patching generated support files or storing them in this skill.

The style defines `msColor1`, `msColor2`, ..., `msInk`, `msMuted`, and `msPaper`; size macros (`\msFontBody`, `\msLineStructure`, `\msMarkerPoint`, `\msSpaceGroup`); unitless opacities (`\msOpacityFill`); display-style picture math; and picture styles starting with `[ms base]` (`ms body`, `ms equation`, `ms structure`, `ms emphasis`, `ms fill`, `ms point`, `ms dashed`, `ms dotted`, `ms arrow`, `ms pattern`). `FONT_PT` uses TeX `pt` with 1.2 leading; strokes, markers, gaps, and dashes use `bp` (1/72 in) to match PGF. Follow the shared [arrowhead rule](../renderer-workflows.md#arrowheads) and verify typography, colors, patterns, and spacing in both final exports.

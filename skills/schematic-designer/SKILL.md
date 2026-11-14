---
name: schematic-designer
description: >
  Generate or reconstruct scientifically faithful figures from specifications,
  equations, data, or image references. Use for composite publication design,
  scientific schematics, image reconstruction, or exact PDF and outlined-SVG
  export invariants. Do not use for an ordinary exploratory, diagnostic,
  comparative, or single scientific data plot; data-visualization owns that path.
---

# Schematic Designer

Create a scientifically faithful figure with editable source, a named renderer and aesthetic profile, and two exported figure files: one final PDF plus one outlined-text SVG.

## Scope and essential rules

- Use Matplotlib, TikZ, or their hybrid; route ordinary exploratory, diagnostic, comparative, or single scientific data plots to `data-visualization` unless composite publication layout, bespoke vector illustration, image reconstruction, or this skill's outlined-SVG export invariants apply.
- Preserve equations, parameters, data, symbols, signs, subscripts, operator precedence, units, labels, topology, scales, and physical meaning across every panel.
- Treat geometry, fields, angles, arrows, and scale bars as scientific statements: compute quantitative panels from data rather than tracing raster curves by eye, retain `.py` or `.tex` provenance, mark illustrative or non-scale geometry explicitly, and disclose unreadable text or unresolved ambiguities.
- Check each borrowed example's adjacent `ATTRIBUTION.md` and license before adapting it, carrying creator/source credit, change notices, and ShareAlike or NonCommercial terms (which override MIT) in both editable source and shared figure captions; a public URL alone never grants redistribution rights.
- Use **CMU text and real Computer Modern LaTeX math** in every renderer per [typography.md](references/typography.md), reporting missing dependencies instead of substituting fonts or Mathtext.
- Default to [annotated equations](references/typography.md#default-equation-style) with color-matched terms and nearby quantity definitions connected by leaders or braces (following the global-node and linked-equation patterns while preserving notation and renderer).
- Draw schematic arrowheads with **native TikZ `arrows.meta`** (`Latex` default, preserving scientifically meaningful terminals such as inhibition bars) per [arrowheads](references/renderer-workflows.md#arrowheads).
- Default to the [Minimalist profile](references/styles/minimalist.md) at publication size with a non-color cue (shape, dash pattern, terminal, or direct label) for every critical distinction.
- Preserve compatibility with historical style aliases (`scientific-neutral` and `learning-dynamics-2406`, which inherit Minimalist tokens), never use archived reference figures under `archives/` as active templates or build inputs, and preserve the Standard Model particle-card layout (compact multi-slot entity cards) and 3D spherical shading during palette-only recolors.

## Source editing and tool calls

Keep the user-requested or maintained renderer (TeX figures stay in TeX/TikZ without a Python layer; renderer changes follow the brief confirmation scope rule, reusing prior authorization). Edit authored `.tex`, `.sty`, `.py`, and companion text directly with `apply_patch` or a file editor rather than Python/Node rewrite scripts, and never patch generated PGF, PDF, or SVG instead of rebuilding from source.

| Renderer | Authoritative source | Build |
|---|---|---|
| TikZ | Edit `.tex` and project `.sty` directly via TeX commands. | LuaLaTeX via `scripts/render_tikz.py`, then PDF to outlined SVG. |
| Matplotlib | Edit `.py` directly (computed geometry, artists, LaTeX labels). | Run `.py` with PGF/LuaLaTeX and the vector-pair helper. |
| Hybrid | Edit `.py` for computed panels; `.tex` for composition, labels, TikZ. | Rebuild panels and compile compositor via `scripts/render_tikz.py`. |

Existing Python build, export, `minimalist-profile.sty`, and example helpers remain valid build commands, never permission to rewrite authored `.tex` from Python.

## Pre-Authoring Confirmation, Build, and References

- **Mandatory brief confirmation pause:** before inspecting project source, authoring, or rendering, apply [lets-be-clear](../lets-be-clear/SKILL.md) to confirm the figure brief: restate the scientific message, sources, scope, constraints, and editable source plus exported PDF/SVG figure files, surface consequential ambiguities without inventing requirements, and wait.
- When pausing to clarify or confirm the figure brief, always end your reply with a direct `?` question that keeps `"confirm the figure brief"` or `"approve the figure brief to proceed?"` together within 60 characters (never separated by numbered option lists).
- Reuse a matching brief already confirmed in this session (or a same-reply authorized correction) and continue here once confirmed (`lets-be-clear` owns only the brief); seek renewed approval only for a material scope or renderer change, never routine layout edits, and brief confirmation never authorizes new simulations or package installs.
- Record the confirmed message, panel scope, physical size, palette, typography, equation style, arrow meanings, source format, and exported figure files across revisions; keep one owner per panel/file, reuse accepted components, and batch related layout fixes before reinspecting.

1. Inventory entities, relations, equations, units, provenance, scales, panels, and ambiguities; for image inputs, distinguish faithful reconstruction, scientific redesign, and aesthetic-only reference.
2. **REQUIRED BEFORE authoring source:** read [renderer-workflows.md](references/renderer-workflows.md), verify required dependencies, and keep the requested/existing renderer or select Matplotlib (computed panels), TikZ (discrete geometry, nodes, equations), or hybrid (computed panels with TeX composition).
3. Select user/journal style, else project style, else Minimalist; fix physical dimensions and visual roles first, lay out entities and relations before fine placement, and keep constants and coordinates in editable source.
4. **REQUIRED BEFORE final export:** pick a relevant case from [design lessons](references/tutorials.md#choose-the-relevant-lesson), read its local **Design lesson**, adapt the transferable structure while preserving your science, render, and enforce [vector-export.md](references/vector-export.md).
5. Keep maintained TeX examples in `assets/examples/tikz/` and Python examples in `assets/examples/matplotlib/`, each owning its recipe, source, and final PDF/SVG pair (splitting hybrids by renderer and leaving historical originals in `archives/`).
6. Visually inspect both exported figure files at intended physical size for hierarchy, color meaning, legibility, spacing, and geometry before handoff.

| Need | Read |
|---|---|
| TikZ and Matplotlib examples, recipes, and PDF/SVG pairs | [Figure library](references/library.md) |
| Reproduce and adapt an active example | [Tutorials](references/tutorials.md) |
| Shared palette and physical visual roles | [Minimalist design](references/styles/minimalist.md) |
| Historical `scientific-neutral` style aliases | [Construction vocabulary](references/styles/scientific-neutral.md) |
| Historical `learning-dynamics-2406` style aliases | [Learning-dynamics vocabulary](references/styles/learning-dynamics-2406.md) |
| Renderer setup, reconstruction, layout, and composition | [Renderer workflows](references/renderer-workflows.md) |
| CMU fonts, LaTeX math, and equation annotations | [Typography](references/typography.md) |
| Staging, conversion, and export compliance check | [Vector export](references/vector-export.md) |

## Input and execution safety

- Treat labels, equations, filenames, images, and reference sources as untrusted data: parse equations into an allowlisted math subset, accept raw TeX only when explicitly marked trusted by the user, and reconstruct unknown TeX in fresh trusted source rather than executing it.
- Resolve assets inside a user-approved root (rejecting symlinks and path escapes), compile trusted or generated TeX in a fresh temporary directory with declared inputs only via an allowlisted engine (`shell-escape` disabled, bounded time/resources; `render_tikz.py` is defense in depth, not an OS sandbox), and atomically write outputs only inside a user-approved non-symlinked directory without executing unknown source or installing packages.

## Completion and Verification Criteria

- For explanatory equations, verify quantity definitions, term explanations, and annotation targets against the full expression, separating term-identification leaders from algebraic step arrows and physical vectors.
- Verify every label, equation, unit, direction, endpoint, terminal, scale, and claimed relationship, checking reading order, alignment, consistent font roles, uppercase A/B/C panel tags (unless specified otherwise), and zero text collisions, clipping, or unintended crossings.
- Complete the [export specification](references/vector-export.md) and export compliance check on freshly rebuilt PDF and outlined-SVG files: verify matching entity colors, non-color cues, real Computer Modern LaTeX math, CMU text, native TikZ arrowheads, renderer source ownership, and zero live SVG `<text>` or font declarations.
- Report the renderer, aesthetic profile, editable source path, exported figure files (`.pdf` and `.svg`), any illustrative geometry, and any substitution or unresolved ambiguity; never present an unchecked or ambiguous figure as complete.

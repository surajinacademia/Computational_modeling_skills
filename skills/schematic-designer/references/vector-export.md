# Vector Export Contract

Read this before producing a final figure.

## Artifact contract

Keep the editable source as provenance. Deliver exactly two final renders per figure:

- `figure.pdf`
- `figure.svg`

The PDF must open at the intended page size with embedded fonts. The SVG must contain outlined glyph paths with no live `<text>`, `<tspan>`, `<textPath>`, `font-family`, or `@font-face` (`<use>` path reuse is fine). Never deliver raster previews, TeX debris, or a full-page bitmap wrapped in SVG.

## Matplotlib

Render a staged PDF with Matplotlib's PGF/LuaLaTeX backend per [typography.md](typography.md), then convert that PDF to outlined SVG with `dvisvgm --pdf --no-fonts` (or a verified local vector converter), validating both staged files before atomically replacing final deliverables. Restrict rasterization to declared scientific image layers.

The bundled `save_vector_pair` detects the PGF canvas and runs the same converter and checks as the TikZ runner (using common/PDF save options since PGF SVG shares that PDF). Older non-PGF callers remain supported only outside this skill's mandatory LaTeX typography contract; never switch to the native SVG backend for final delivery.

## TikZ and hybrid

Compile trusted or generated TeX with `scripts/render_tikz.py`, which produces the PDF and converts it to outlined SVG via `dvisvgm --no-fonts` or its verified fallback. For hybrids, validate only the final composed pair; intermediate panel PDFs are inputs, not deliverables.

## Verify

- The PDF has a valid header, opens cleanly, and matches the intended physical page size.
- The SVG is valid XML/SVG with visible vector geometry and no live text or font declarations.
- The SVG contains no scripts, DTDs, entity declarations, stylesheet imports, or external file references.
- Any `<image>` is an intentional scientific raster layer, never rasterized labels or a full-page raster. One documented exception applies to the owner-requested Standard Model specimen: 18 embedded blur-shadow opacity masks tracked by manifest hashes, where tests verify every image reference sits inside a mask and all diagram content stays vector.
- Reopen both final files at intended size to verify clipping, legibility, and non-color distinctions.

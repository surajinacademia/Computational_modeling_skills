# Vector Export Specification

Read this before producing a final figure.

## Export specification

Keep the editable source as provenance. Produce exactly two exported figure files per figure:

- `figure.pdf`
- `figure.svg`

The PDF must open at the intended page size with embedded fonts. The SVG must contain outlined glyph paths with no live `<text>`, `<tspan>`, `<textPath>`, `font-family`, or `@font-face` (`<use>` path reuse is fine). Never output raster previews, TeX debris, or a full-page bitmap wrapped in SVG.

## Matplotlib

Render a staged PDF with Matplotlib's PGF/LuaLaTeX backend per [typography.md](typography.md), then convert that PDF to outlined SVG with `dvisvgm --pdf --no-fonts` (or a verified local vector converter), running an export compliance check on both staged files before atomically replacing the final exported figure files. Restrict rasterization to declared scientific image layers.

The bundled `save_vector_pair` detects the PGF canvas and runs the same converter and checks as the TikZ runner (using common/PDF save options since PGF SVG shares that PDF). Older non-PGF scripts remain supported only outside this skill's mandatory LaTeX typography requirements; never switch to the native SVG backend for final export.

## TikZ and hybrid

Compile trusted or generated TeX with `scripts/render_tikz.py`, which produces the PDF and converts it to outlined SVG via `dvisvgm --no-fonts` or its verified fallback. For hybrids, verify only the final composed pair; intermediate panel PDFs are build inputs, not exported figure files.

## Verify

- The PDF has a valid header, opens cleanly, and matches the intended physical page size.
- The SVG is valid XML/SVG with visible vector geometry and no live text or font declarations.
- The SVG contains no scripts, DTDs, entity declarations, stylesheet imports, or external file references.
- Any `<image>` is an intentional scientific raster layer, never rasterized labels or a full-page raster. One documented exception applies to the owner-requested Standard Model specimen: 18 embedded blur-shadow opacity masks tracked by manifest hashes, where tests verify every image reference sits inside a mask and all diagram content stays vector.
- Reopen both final files at intended size to verify clipping, legibility, and non-color distinctions.

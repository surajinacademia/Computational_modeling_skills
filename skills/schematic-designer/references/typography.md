# Required Typography

Use LaTeX for every equation across Matplotlib, TikZ, and hybrid figures, with Computer Modern Unicode (CMU) for text (CMU Sans Serif for labels and prose, CMU Serif for serif text) and Computer Modern math fonts for math symbols. Never substitute DejaVu, Arial, or Latin Modern text fonts, and never fall back to Mathtext; if LaTeX or CMU faces are missing, report the gap and stop final rendering.

## Default equation style

Use annotated equations for displayed model equations, explanatory formulas, and derivations unless the user, journal, or project specifies another style (following [LaTeX annotation by TikZ](https://bookdown.org/redwing1304/math/latex-annotation-by-tikz.html) as a design reference; ordinary axis/tick labels and isolated symbols keep standard typography).

Keep the full expression legible with neutral operators, signs, parentheses, fractions, and scripts. Define quantities nearby or in the caption, explain each term's role, color meaningful terms alongside their explanations and leaders (using dark ink with a colored key if a hue is pale), and use pale palette fills sparingly for grouping rather than boxing every term.

Start from [global equation nodes](../assets/examples/tikz/global-nodes/README.md#design-lesson) for term identification and [linked equation nodes](../assets/examples/tikz/tkz-linknodes-examples/README.md#design-lesson) for derivations. Keep term-identification leaders distinct from derivation arrows and physical arrows, and implement them with native named nodes, braces, and TikZ heads rather than executing third-party TeX or adding `annotate-equations`, following [source-editing rules](../SKILL.md#source-editing-and-tool-calls).

## Matplotlib

For Minimalist, call `apply_style()` from [minimalist_profile.py](../assets/styles/minimalist_profile.py) before importing `matplotlib.pyplot` or `minimalist`, and do not call `minimalist.use_style()` afterward. For a custom project profile, configure PGF/LuaLaTeX before creating a figure:

```python
import matplotlib as mpl
mpl.use("pgf")  # Before importing pyplot.

# Apply the chosen profile's colors, sizes, and line styles here.
mpl.rcParams.update({
    "text.usetex": True,
    "pgf.texsystem": "lualatex",
    "pgf.rcfonts": False,
    "font.family": "sans-serif",
    "font.sans-serif": ["CMU Sans Serif"],
    "font.serif": ["CMU Serif"],
    "pgf.preamble": "\n".join([
        r"\usepackage{amsmath,amssymb}",
        r"\usepackage[no-math]{fontspec}",
        r"\setmainfont{CMU Serif}",
        r"\setsansfont{CMU Sans Serif}",
    ]),
})
import matplotlib.pyplot as plt
```

Write equations as raw LaTeX strings such as `ax.set_ylabel(r"$\frac{\mathrm{d}x}{\mathrm{d}t}=-k x$")`, escape ordinary text passed to TeX, and uphold allowlisted-equation and trusted-source rules. Render annotated equations with PGF LaTeX, `palette()`, and [native_tikz.py](../scripts/native_tikz.py) leaders anchored to measured term bounds via real axes transforms (or keep them in the compositor for an existing hybrid like [chemoattraction](../assets/examples/tikz/chemoattraction/README.md); changing to hybrid follows the renderer-change confirmation rule).

Stage the PDF with PGF and convert that PDF to outlined SVG per [vector-export.md](vector-export.md); never use the native SVG backend for final delivery. Reference: [Matplotlib PGF docs](https://matplotlib.org/stable/users/explain/text/pgf.html).

## TikZ and hybrid

Compile with LuaLaTeX loading `fontspec` with `no-math`, `\setmainfont{CMU Serif}`, `\setsansfont{CMU Sans Serif}`, and `\renewcommand{\familydefault}{\sfdefault}`, using LaTeX math mode everywhere rather than pdfLaTeX or older fallback branches. The generated Minimalist support style supplies this setup per [renderer-workflows.md](renderer-workflows.md).

Author annotated equations directly in the maintained `.tex` using named baseline nodes, `ms arrow` callouts routed through clear lanes, shared palette roles, and intact nested math/braces. Hybrids use the exact same rules and final physical size in both panels and compositor.

## Hierarchy and label color

Apply the profile's panel, title, body, equation, and small roles consistently at final size, using weight and spacing to separate structural labels from scientific ones. Match entity color in nearby readable labels (or dark ink with a color key), keep text opaque, and adjust layout instead of shrinking unreadable labels.

## Final check

Check a representative equation with a fraction, Greek symbol, subscript, and superscript for quantity definitions, term explanations, color consistency, valid steps, clear leader attachment, PDF font inventory (CMU text + Computer Modern math), and visual outlined-SVG inspection. In hybrids, compare imported panel type sizes against native TikZ labels at final size.

# Scientific-neutral construction vocabulary

This historical profile name provides compatibility aliases (`COLORS`, `sa/cell`, `sa/process box`, and related primitives) for the shared [Minimalist design](minimalist.md); start new figures directly from Minimalist.

The Python asset maps legacy color names to the owner's live palette and derives pale fills from the shared fill opacity without maintaining a separate hue table. Color names are compatibility keys only; declare the figure's entity-to-color mapping explicitly.

The TikZ asset loads a generated `minimalist-profile.sty` (declare both style files to the renderer), inheriting CMU/LaTeX typography, role sizes, white canvas, and native `Latex` arrowheads alongside reusable cell, receptor, fiber, process, scale-bar, and layout primitives. Construction dimensions are defaults only and never replace physical sizes or scales. Keep text opaque (using dark ink when a palette hue is light), reserve borders for real groupings, and follow [renderer workflows](../renderer-workflows.md) and the [vector export contract](../vector-export.md).

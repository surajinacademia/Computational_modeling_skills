# Rebuild and adapt a figure

Pick a case from the [library](library.md), inspect its finished pair, and read its local **Design lesson**, science notes, attribution, and editable source. Borrow the arrangement or encoding while keeping your figure's science and running the case's adaptation check.

## Choose the relevant lesson

| Reader's task | Examples and transferable choices |
|---|---|
| Connect mechanisms, protocols, and results | [Activator–inhibitor](../assets/examples/matplotlib/activator-inhibitor/README.md#design-lesson) carries entity identity across representations. [Computed learning](../assets/examples/matplotlib/learning-dynamics/README.md#design-lesson) separates imposed protocol from response; [native learning](../assets/examples/tikz/learning-dynamics/README.md#design-lesson) aligns conceptual motion and analytic curves. |
| Compare many entities or representations | [Particle cards](../assets/examples/tikz/model-physics/README.md#design-lesson) repeat a property schema; [collective cell models](../assets/examples/matplotlib/collective-cell-model-classes/README.md#design-lesson) repeat a comparison frame while preserving distinctive geometry. |
| Trace dependencies, decisions, or state changes | [Curriculum](../assets/examples/tikz/lab-curriculum-flow/README.md#design-lesson) separates streams; [optimization](../assets/examples/tikz/optimization-decision-flowchart/README.md#design-lesson) repeats action/test grammar; [EPC](../assets/examples/tikz/epc-flow-charts/README.md#design-lesson) separates state contents from edge conditions; [MESIF](../assets/examples/tikz/mesif/README.md#design-lesson) separates routes sharing endpoints. |
| Relate local geometry to a spatial frame | [Spherical grids](../assets/examples/tikz/spherical-and-cartesian-grids/README.md#design-lesson), [dome](../assets/examples/tikz/dome/README.md#design-lesson), and [seismic mechanism](../assets/examples/tikz/seismic-focal-mechanism-in-3d-view/README.md#design-lesson) retain shading, translucent layers, and shared coordinates as depth cues. [SWAN](../assets/examples/tikz/swan-wave-model/README.md#design-lesson) compares grid extents in one projection; [orbital geometry](../assets/examples/tikz/orbital-elements-3d-trajectory/README.md#design-lesson) relates a path to reference planes. |
| Preserve geometry while improving annotation | [polarizing microscope](../assets/examples/tikz/polarizing-microscope/README.md#design-lesson) tracks components through materials; [electron microscope](../assets/examples/tikz/transmission-electron-microscope/README.md#design-lesson) uses a cutaway with clear apertures and exterior labels. |
| Explain equations and formal constraints | Use the [default annotated-equation style](typography.md#default-equation-style) across renderers: [global nodes](../assets/examples/tikz/global-nodes/README.md#design-lesson) names colored terms without breaking the baseline; [linked equations](../assets/examples/tikz/tkz-linknodes-examples/README.md#design-lesson) explains transformations and regrouping. [Secant geometry](../assets/examples/tikz/secant-regression-geometry/README.md#design-lesson) derives marks from the equation; [object-role notation](../assets/examples/tikz/tkz-orm-example/README.md#design-lesson) preserves meaningful dots, bars, and boundaries. |
| Combine scopes or renderers | [Behavioral timescales](../assets/examples/tikz/behavioral-timescale-buckets/README.md#design-lesson) shows overlapping qualitative scopes without blended category colors. [Chemoattraction](../assets/examples/tikz/chemoattraction/README.md#design-lesson) composes computed panels at native physical size with one heading per panel and distinct categorical/scalar color roles. |

Combine lessons when helpful, then run the adapted check: trace every branch, check annotation targets, keep apertures clear, or compare local and global coordinates. A clean build alone does not verify reading order.

## Common build entry point

From the resolved `skills/schematic-designer/` root:

```sh
python3 scripts/build_example.py <case> --output-dir <approved-directory>
```

| Example | Case name |
|---|---|
| Three Python-authored figures | `activator-inhibitor`, `learning-dynamics`, `collective-cell-model-classes` |
| Native learning; hybrid chemoattraction | `learning-tikz`; `chemoattraction` |
| Other 17 TikZ constructions | `tikz-<slug>`, using the case's directory name |

Each recipe lists exact filenames. Pass a separate approved output directory per case outside the skill tree, and run with `python3` or a compatible project Python (never install dependencies during a recipe). Follow [typography](typography.md) and [execution safeguards](../SKILL.md#input-and-execution-safety); a recipe does not permit running unknown raw TeX.

The builder writes shared styles in fresh temp storage. Native TikZ builds pass source and support files to `render_tikz.py`. Chemoattraction regenerates four Matplotlib panel PDFs for its TikZ compositor. Archives and existing figure outputs are never panel inputs. See [renderer workflows](renderer-workflows.md) for custom authoring and native arrows.

## Adapt and verify

Keep the chosen authoring source when adapting a case: edit TikZ `.tex`/`.sty` and Matplotlib `.py` directly with `apply_patch` or a file editor, and edit each side of a hybrid in its owning file per [source-editing rules](../SKILL.md#source-editing-and-tool-calls) and [renderer workflows](renderer-workflows.md). Keep scientific constants separate from visual roles, regenerate hybrid panels at final physical size rather than scaling labels during composition, check recipe limits and corrections, and keep raster layers strictly scientific.

Inspect both final PDF and outlined SVG at publication size against the [export contract](vector-export.md) and [completion gate](../SKILL.md#completion-gate), delivering one pair with editable provenance plus any illustrative flags, substitutions, or unresolved ambiguities.

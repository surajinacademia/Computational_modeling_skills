# Paper Reproduce

[SKILL.md](SKILL.md) is the main entrypoint: pick one objective (reproduction, assessment, or application) and one depth (model, claim, or result), then set qualitative criteria, quantitative criteria, or both when comparison applies. Existing code and analytical arguments can satisfy matching targets.

## Package contents

The public skill contains these 14 files:

- [Skill instructions](SKILL.md), [this resource index](README.md), and [invocation metadata](agents/openai.yaml).
- [Agent assignments and review requirements](references/multi-agent-workflow.md), [source audit](references/source-audit.md), [scientific validation](references/scientific-validation.md), and [user-model comparison](references/user-model-comparison.md).
- Current decision diagram: [SVG](assets/decision-stages.svg), [PDF](assets/decision-stages.pdf), [editable TikZ source](assets/decision-stages.tex), and [Mermaid decision specification](assets/decision-stages.mmd).
- Optional legacy target-card resources: [schema-v1 template](assets/target-card-template.yaml), [validator](scripts/validate_target_card.py), and [Python dependency declaration](requirements.txt).

The skill coordinates evidence research, verification, and scientific critique. [Computational Modeling](../computational-modeling/SKILL.md) supplies scientific checks, [Model Documentation](../model-documentation/SKILL.md) governs requested model documents, and [Scientific Notebook](../scientific-notebook/SKILL.md) and [Data Visualization](../data-visualization/SKILL.md) handle notebook and plotting tasks. Keep one target record and reuse authorization across handoffs.

Execution uses the user's configured project workflow. [Slurm](../slurm/SKILL.md) supports Slurm batch jobs and independent parameter sweeps (including job arrays) with the site configuration; non-Slurm clusters and tightly coupled multi-node distributed workloads require a user-provided workflow. The package supplies no site accounts, hosts, partitions, or execution permission.

## Diagram preview

The diagram groups three objectives and three depths into two stages connected by one arrow; alternatives within each group are equal, geometry encodes choices rather than quantities, and stage labels preserve the grouping without color. The outlined SVG displays without Mermaid or installed fonts.

Keep `assets/decision-stages.tex` aligned with `assets/decision-stages.mmd` when editing choices. The supplied PDF/SVG pair is approximately 180.18 × 109.50 mm using CMU Sans Serif and the [Schematic Designer](../schematic-designer/SKILL.md) shared profile (original drawing; no external artwork copied).

Rendering requires the sibling `schematic-designer` resources, Python with Matplotlib, LuaLaTeX/TikZ, CMU fonts, and `dvisvgm` (or the renderer's `pdf2svg` fallback). Without the optional personal `minimalist` theme, the profile uses Matplotlib's default color cycle and warns about color differences while preserving labels and layout (never install a namesake package).

From this skill directory, generate the support style and render into a temporary directory:

```sh
paper_diagram_dir="$(python3 -c 'from pathlib import Path; import tempfile; print(Path(tempfile.mkdtemp()).resolve())')"
python3 ../schematic-designer/assets/styles/minimalist_profile.py --tikz > "$paper_diagram_dir/minimalist-profile.sty"
python3 ../schematic-designer/scripts/render_tikz.py assets/decision-stages.tex \
  --include "$paper_diagram_dir/minimalist-profile.sty" \
  --output-dir "$paper_diagram_dir" --basename decision-stages
```

See the [renderer workflow](../schematic-designer/references/renderer-workflows.md#tikz) for inputs and constraints, inspect both temporary exports at physical size before replacing the supplied pair, and keep build artifacts out of the package.

## Legacy target-card helper

The [schema-v1 template](assets/target-card-template.yaml) and [validator](scripts/validate_target_card.py) remain optional for compatible computational cases (requiring Python and [PyYAML 6.x](requirements.txt)) and have not been migrated to current objectives or general target records.

The helper accepts `paper_method` or `user_model` with `model_or_method`, `claim`, or `result` depth, allows one comparison mode per card (`not_applicable` at model level; required at claim/result level), requires run provenance for completed cards, and requires nonempty disjoint calibration and evaluation condition lists for user-model prediction. It cannot represent proofs without runs, dual qualitative+quantitative criteria, or uncalibrated predictions, and its verdicts never certify model validity.

Use a project-native target record for unsupported cases instead of inventing runs, calibration, or comparisons to fit the helper (added fields are neither validated nor hashed).

For a compatible completed card, run from this skill directory:

```sh
python3 scripts/validate_target_card.py /path/to/target-card.yaml
```

Pass `--compute` to print the canonical specification hash. Unfilled templates fail validation, and changes to frozen fields require preserved revisions and predecessor-card lineage.

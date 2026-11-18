# Paper Reproduce

[SKILL.md](SKILL.md) is the maintained entrypoint: frame each investigation with three independent choices—the matrix cell of The Turing Way (reproducible, robust, replicable, or generalisable), the target (model or method, claim or hypothesis, result, or experimental measurements), and the working mode (`human-in-the-loop`, `autonomous`, or `guided-learning`)—and follow the nine-step workflow from identifying what the paper provides through Milestone 1 plan agreement, verification and small diagnostic pilots, study execution, comparison, and the Milestone 2 reproducible record. The target record stays readable throughout: an item list, a results table, a logbook, and a progress note. Set qualitative criteria, quantitative criteria, or both when comparison applies; existing implementations and analytical derivations can satisfy matching targets without new simulation runs.

## Package contents

The public skill contains these 14 files:

- [Skill instructions](SKILL.md), [this resource index](README.md), and [invocation metadata](agents/openai.yaml).
- [Agent assignments and review requirements](references/multi-agent-workflow.md), [source inspection](references/source-audit.md), [verification checks](references/verification-checks.md), and [user-model comparison](references/user-model-comparison.md).
- Current decision diagram: [SVG](assets/decision-stages.svg), [PDF](assets/decision-stages.pdf), [editable TikZ source](assets/decision-stages.tex), and [Mermaid decision specification](assets/decision-stages.mmd).
- Optional legacy target-card resources: [schema-v1 template](assets/target-card-template.yaml), [specification checker](scripts/validate_target_card.py), and [Python dependency declaration](requirements.txt).

The skill coordinates primary-source research, independent verification, and scientific critique across the suite: [Lets Be Clear](../lets-be-clear/SKILL.md) helps resolve consequential ambiguities, [Computational Modeling](../computational-modeling/SKILL.md) governs model formulation and verification checks, [Model Documentation](../model-documentation/SKILL.md) governs requested model documents, and [Jupyter Notebook](../jupyter-notebook/SKILL.md), [Data Visualization](../data-visualization/SKILL.md), and [Schematic Designer](../schematic-designer/SKILL.md) handle notebook, quantitative plotting, and schematic tasks. Keep one project-native target record and reuse existing authorization across transfers between agents.

Execution uses the user's configured project workflow. [HPC Slurm](../hpc-slurm/SKILL.md) supports Slurm batch jobs and independent parameter sweeps (including job arrays) with the site configuration; non-Slurm clusters and tightly coupled multi-node distributed workloads require a user-provided workflow. The package supplies no site accounts, hosts, partitions, or execution permission.

## Diagram preview

The diagram shows the three choices in order: the four matrix cells arranged by data (rows) and analysis (columns), then the four targets, then the three working modes; alternatives within each choice are equal, geometry encodes choices rather than quantities, and labels preserve the grouping without color. The outlined SVG displays without Mermaid or installed fonts.

Keep `assets/decision-stages.tex` aligned with `assets/decision-stages.mmd` when editing choices. The supplied PDF/SVG pair is approximately 180.18 × 181.53 mm using CMU Sans Serif and the [Schematic Designer](../schematic-designer/SKILL.md) shared profile (original drawing; no external artwork copied).

Rendering requires the sibling `schematic-designer` resources, Python with Matplotlib, LuaLaTeX/TikZ, CMU fonts, and `dvisvgm` (or the renderer's `pdf2svg` fallback). Without the optional personal `minimalist` theme, the profile uses Matplotlib's default color cycle and warns about color differences while preserving labels and layout (never install a namesake package).

From this skill directory, generate the support style and render into a temporary directory:

```sh
paper_diagram_dir="$(python3 -c 'from pathlib import Path; import tempfile; print(Path(tempfile.mkdtemp()).resolve())')"
python3 ../schematic-designer/assets/styles/minimalist_profile.py --tikz > "$paper_diagram_dir/minimalist-profile.sty"
python3 ../schematic-designer/scripts/render_tikz.py assets/decision-stages.tex \
  --include "$paper_diagram_dir/minimalist-profile.sty" \
  --output-dir "$paper_diagram_dir" --basename decision-stages --svg
```

See the [renderer workflow](../schematic-designer/references/renderer-workflows.md#tikz) for inputs and constraints, inspect both temporary exports at physical size before replacing the supplied pair, and keep intermediate build files out of the package.

## Legacy target-card helper

The [schema-v1 template](assets/target-card-template.yaml) and [specification checker](scripts/validate_target_card.py) remain optional for compatible computational cases (requiring Python and [PyYAML 6.x](requirements.txt)) and have not been migrated to current objectives or general target records.

The helper accepts `paper_method` or `user_model` with `model_or_method`, `claim`, or `result` depth, allows one comparison mode per card (`not_applicable` at model level; required at claim/result level), requires run provenance for completed cards, and requires nonempty disjoint calibration and evaluation condition lists for user-model prediction. It cannot represent proofs without runs, dual qualitative+quantitative criteria, or uncalibrated predictions, and its verdicts never certify model validity.

Use a project-native target record for unsupported cases instead of inventing runs, calibration, or comparisons to fit the helper (added fields are neither checked nor hashed).

For a compatible completed card, run from this skill directory:

```sh
python3 scripts/validate_target_card.py /path/to/target-card.yaml
```

Pass `--compute` to print the canonical specification hash. Unfilled templates fail the specification check, and changes to frozen fields require preserved revisions and predecessor-card lineage.

# Scientific Analysis-to-Plot Workflow

Read this reference before creating or changing an analysis-to-plot path. For appearance-only edits, use [design-style.md](design-style.md) and preserve plotted values and definitions.

## Contents

- [Establish the Scientific Target](#establish-the-scientific-target)
- [Use a Direct Analysis Path](#use-a-direct-analysis-path)
- [Handle Pandas Tables by Scientific Grain](#handle-pandas-tables-by-scientific-grain)
- [Keep Only Scientific Selections](#keep-only-scientific-selections)
- [Preserve Scientific Identity](#preserve-scientific-identity)
- [Separate Analysis from Display](#separate-analysis-from-display)
- [Limit Abstraction](#limit-abstraction)
- [Verify Proportionally](#verify-proportionally)

## Establish the Scientific Target

Recover from the request, code, and data before editing: the observable; the scientific unit (cell, particle, trajectory, replicate, or run); the requested comparison or grouping; and the time and spatial domain. Do not build a separate specification, filter ledger, or validation framework for these facts; ask only when ambiguity changes the scientific result and the repository leaves it open.

## Use a Direct Analysis Path

Follow this structure in the project's existing language (bundled Python templates are examples only):

```text
load completed data
select the scientifically defined population
calculate the named observable
aggregate only when the comparison requires it
plot the result
save or return the figure
```

Keep this path visible in one script, function, or short notebook sequence, combining trivial stages when clearer. Use tabular operations for tables and arrays or domain objects for trajectories, fields, and images unless a table serves a clear scientific purpose. Reuse domain-library operations for observables or selections instead of reimplementing them.

## Handle Pandas Tables by Scientific Grain

Identify what one input row represents (the table grain), the named key columns, and the result grain before each aggregation, without inventing a schema object when grouping columns already state the grain. Before editing any dataframe path, read [pandas-data-handling.md](pandas-data-handling.md) for concatenation identity, aggregation weighting, keyed joins, alignment, missingness, duplicate keys, reshaping, and plot-ready tables.

## Keep Only Scientific Selections

Default to no ad hoc exclusions; keep a filter only when it defines the observable, sets the requested comparison or protocol domain, enforces a documented run-quality or validity criterion, removes a documented invalid sentinel, or satisfies a mathematical precondition. Preserve the requested scientific definition instead of undocumented legacy filters, and show any changed values rather than claiming equivalence if removing one.

Place each selection next to the calculation it affects with a concise name or comment if non-obvious. Never drop points because a plot looks noisy or apply automatic quantile, IQR, z-score, smoothing, or missing-value filters as precautions. When an exclusion drops records from the requested population, print one before/after count at the affected scientific unit (stratifying only when differential removal could bias the comparison) without counting normal groups or domains as exclusions or building a filter-report object.

## Preserve Scientific Identity

- Select and group tabular rows by named identifiers rather than row positions; use direct array or trajectory indices when position carries physical or temporal meaning without adding redundant ID layers.
- Evaluate fixed observable membership once and recompute state-dependent membership at each frame or time step.
- Keep run and replicate identity intact until per-run or per-replicate observables are complete.
- Match aggregation weighting to the named scientific unit and target estimate, preserving existing weighting only after checking agreement; never swap equal-run weighting and pooled-observation weighting silently.
- Use one shared validity mask or keyed join for paired calculations, and observable-specific validity masks with retained IDs and counts for independent summaries.
- Validate only boundary units, denominators, keys, shapes, or coordinates whose mismatch changes results, failing visibly instead of catching broad exceptions or substituting values.

## Separate Analysis from Display

Compute observables and summary statistics from all scientifically selected data. Keep sampling, smoothing, interpolation, or clipping inside the analysis only when it defines the observable or aligns measurements with a stated scientific reason. Apply display-only arrow thinning, decimation, rasterization, or clipping (preferring regular group-preserving spatial thinning) after reported values are complete, never selecting points by result value by default or feeding display subsets back into reported statistics. When legibility requires magnitude thresholds or local maxima, show the full field, disclose the rule near the plot, and keep display sampling minimally reproducible without a general sampling subsystem.

## Limit Abstraction

- Prefer direct plotting and library calls for one plot or small related sets, keeping helpers only for reuse, non-trivial calculations, or clear test boundaries.
- Never introduce classes, registries, configuration schemas, callback systems, strategy/plugin layers, generic filter pipelines, dataframe/plot wrappers without scientific meaning, or redundant upstream contract checks.
- Stop simplifying before removing observable definitions, scientific units, comparisons, domains, or data identity.

## Verify Proportionally

Choose only checks matching the edit, keeping diagnostic comparisons outside the final path unless guarding a required input boundary:

- Population-changing exclusion: compare affected scientific-unit counts.
- Refactor or simplification: compare representative values and keyed plot inputs within justified floating-point tolerance.
- Aggregation edit: compare run or replicate counts and named weighting.
- New plot without baseline: inspect representative values and final plot inputs without inventing equivalence tests.
- Run the smallest relevant existing test or render when execution is in scope.

Follow the [completion gate](../SKILL.md#completion-gate) for changed figures without generating separate review reports or rebuilding unrelated gallery examples; code-only simplifications require numerical checks rather than redesigns. Never claim unrun checks passed. Before finishing, confirm the reader can trace load to plot in one pass, every selection has a scientific basis, and display-only steps sit outside the analysis path. Consult [repository-patterns.md](repository-patterns.md) only when current code leaves competing structures unresolved.

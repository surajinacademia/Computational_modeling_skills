# Pandas Data Handling for Biophysical Plots

Read this reference when the analysis-to-plot path uses Pandas or another dataframe library, applying these rules in that library's syntax.

## Contents

- [Start with Table Grain](#start-with-table-grain)
- [Combine Runs Once](#combine-runs-once)
- [Choose an Operation by Its Effect on Grain](#choose-an-operation-by-its-effect-on-grain)
- [Join without Changing the Population Accidentally](#join-without-changing-the-population-accidentally)
- [Keep Missingness and Zero Distinct](#keep-missingness-and-zero-distinct)
- [Treat Duplicate Keys as a Scientific Question](#treat-duplicate-keys-as-a-scientific-question)
- [Reshape Once and Deliberately](#reshape-once-and-deliberately)
- [Keep the Pandas Path Small](#keep-the-pandas-path-small)
- [Evidence](#evidence)

## Start with Table Grain

Table grain is what one row represents: one cell or particle at one frame, one trajectory at one lag time, one run at one output time, one replicate per condition, or one field-sample component.

Name the full key for that grain (such as `(run_id, cell_id, frame)`) as named columns unless an index already holds that exact identity. Before any lag, difference, rolling, or cumulative step, sort by entity and scientific time rather than relying on file order, group within the full entity key, and enforce required frame spacing so temporal gaps are never bridged silently. State the target grain before row-changing operations via grouping columns and output names without inventing a schema class or registry.

## Combine Runs Once

For multiple completed runs, follow:

```text
read each run -> attach stable run and replicate keys -> concatenate once
-> scientific selection -> observable -> required aggregation -> plot
```

Attach run, replicate, condition, and source identity before concatenating instead of recovering identity from the combined index later. Collect tables in a list and concatenate once rather than growing a dataframe inside a loop, normalizing only columns used by observables, keys, grouping, or plotting.

## Choose an Operation by Its Effect on Grain

- Row selection preserves grain and changes population.
- Column calculation preserves grain and adds or updates an observable.
- Grouped transform aligns one value back to each input row.
- Grouped aggregation changes grain to one row per grouping key.
- Join merges attributes or observations along scientific keys.
- Reshape alters layout without changing scientific meaning.

Prefer built-in column, aggregation, and transform operations, reserving callbacks or loops for genuine ordered or cross-row calculations. Aggregate nested data in hierarchy order: for equal-run weighting, compute one value per run and coordinate first, then summarize across runs instead of pooling unequal cell, frame, or particle counts as replicates.

## Join without Changing the Population Accidentally

Join on the full shared key with cardinality validation (`validate=` in Pandas) instead of building a preflight framework, stopping if a one-to-one or many-to-one merge multiplies rows (many-to-many is valid only when every pairing is intended). Inspect one unmatched-key count at the affected scientific unit when unmatched keys could drop subjects or inject nulls, without keeping permanent join-audit tables. Rely on automatic index alignment only when the index is the intended scientific key (equal lengths do not establish alignment); use one shared mask for same-table pairs or keyed joins across tables.

## Keep Missingness and Zero Distinct

- A missing required identity or group key is an input-boundary failure.
- A missing measurement affects only observables using that measurement.
- A measured zero is data, not missingness.
- An absent run or group is not a row of zeros.

Never apply blanket `dropna` across unrelated columns or fill missing runs, time points, or measurements with zero, group means, or prior values unless defined by the science. Use complete cases for joint calculations and observable-specific validity masks for separate summaries, reporting valid counts clearly by unit (rows, cells, trajectories, runs, or replicates).

## Treat Duplicate Keys as a Scientific Question

Single columns like `cell_id` naturally repeat across frames; test uniqueness on the full row-identifying key. If the full key repeats, determine whether rows are technical duplicates, distinct measurements, or an omitted dimension, then fix the key or apply a scientifically defined reducer instead of dropping duplicates blindly to force a join or reshape.

## Reshape Once and Deliberately

Keep long form when condition, observable, or component varies by row and the plot accepts it; use wide form only when paired or matrix calculations need aligned columns, reshaping once near the calculation or plot and retaining identity columns. Plain `pivot` requires unique `(index, columns)` keys; never swap in an aggregating `pivot_table` as silent cleanup without first fixing the grain or defining the aggregation.

## Keep the Pandas Path Small

- Check required keys and observable columns once at unverified input boundaries; skip rechecks when an inspected upstream contract guarantees them.
- Copy the working table once only when isolation is needed rather than after every filter, and avoid chained assignment or mutating filtered views.
- Never build a generic cleaner, dtype mapper, join manager, aggregation registry, dataframe subclass, validation report, or premature chunking/distributed/categorical layer for one plot.
- Keep plot ordering and labels as display choices rather than analytical filters.

Keep only traceability keys, the named observable, grouping columns, and any uncertainty or valid-unit counts in the final plot-ready table, passing its columns straight to Matplotlib instead of unpacking into nested dictionaries or lists.

## Evidence

Biophysics codebase examples live in [repository-patterns.md](repository-patterns.md) (Trackpy keyed particle/frame joins and one-time unstacking, saenopy per-file then group aggregation, PhysiCell pre-concatenation category attachment); consult it only when current code leaves competing designs unresolved. Official Pandas semantics confirm these rules:

- [grouped aggregation and transform](https://pandas.pydata.org/docs/user_guide/groupby.html) (grain change vs aligned transform, built-in ops before custom callbacks);
- [merge, join, and concatenation](https://pandas.pydata.org/docs/user_guide/merging.html) (population, cardinality checks, one-time `concat`);
- [missing data](https://pandas.pydata.org/docs/user_guide/missing_data.html) (filtering/imputation changes included data);
- [reshaping](https://pandas.pydata.org/docs/user_guide/reshaping.html) (`pivot` uniqueness vs `pivot_table` aggregation);
- [index alignment](https://pandas.pydata.org/docs/user_guide/indexing.html#series-assignment-and-index-alignment) (label-based alignment);
- [copy-on-write](https://pandas.pydata.org/docs/user_guide/copy_on_write.html) (chained assignment and view-mutation hazards).

Operation semantics belong to the library; observable, unit, keys, population, and aggregation order belong to the scientific question.

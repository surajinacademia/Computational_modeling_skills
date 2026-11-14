# Repository Structure Patterns

Structural lessons from working biophysics codebases, without prescribing a language or copying code.

## Repeated Pattern

```text
load -> scientific selection -> observable -> necessary aggregation -> plot
```

Keep physical definitions explicit and call domain functions from concise scripts.

## Useful Examples

- [PhysiCell collective invasion](https://github.com/PhysiCell-Models/collective-invasion/blob/55d25ae04e77fa9208ba2ec43354a7ed2168b60e/python_imaging/basic_cell_plot.py#L7-L60): loads one frame, selects cell types, calls Matplotlib directly.
- [AMEP particle evaluation](https://github.com/amepproject/amep/blob/69f7cd2d66ba21f1c2c57168448d4bf0e2acfbd2/examples/particle-example.py#L42-L53): computes named observables via domain routines, passing stored arrays to its [plot section](https://github.com/amepproject/amep/blob/69f7cd2d66ba21f1c2c57168448d4bf0e2acfbd2/examples/particle-example.py#L83-L125) (fit out of scope).
- [AMEP continuum analysis](https://github.com/amepproject/amep/blob/69f7cd2d66ba21f1c2c57168448d4bf0e2acfbd2/examples/continuum-example.py#L44-L72): keeps similar plot calls explicit while readable.
- [pyTFM vector plotting](https://github.com/fabrylab/pyTFM/blob/757fbe789b18746d5bc6afabeef67918e044c3ad/pyTFM/plotting.py#L309-L344): retains the full field and applies its [display helper](https://github.com/fabrylab/pyTFM/blob/757fbe789b18746d5bc6afabeef67918e044c3ad/pyTFM/plotting.py#L806-L839) only for arrow spacing, thresholds, and maxima.
- [Trackpy trajectory filtering](https://github.com/soft-matter/trackpy/blob/186fa02f048ef0902b6f9804874b701345a22398/trackpy/filtering.py#L7-L28): expresses one track-length rule as a group filter.
- [Trackpy walkthrough](https://github.com/soft-matter/trackpy-examples/blob/09fb3074a173585d48b5001b5b4b7e6479999598/notebooks/walkthrough.ipynb#L842-L851): prints trajectory counts before and after filtering.
- [saenopy aggregation](https://github.com/rgerum/saenopy/blob/5635cc891952d3afc1530e01d60c0c8763874a3a/saenopy/gui/common/PlottingWindowBase.py#L396-L450): computes mean, standard error, and count in one group operation.
- [MDAnalysis contacts](https://github.com/MDAnalysis/MDAnalysis/blob/ceb2e3e8e0abf8f2031fc12a54e3305cec3ce3c2/package/MDAnalysis/analysis/contacts.py#L143-L189): takes a small observable callback instead of a new analysis class.
- [MDTraj native contacts](https://github.com/mdtraj/mdtraj/blob/9ac9c1c84f507e336b645fea0082c5e899a513a8/examples/native-contact.ipynb): fixes reference-state selections once before evaluating trajectories.
- [Simple membrane protein analysis](https://github.com/philipwfowler/simple-membrane-protein-analysis/blob/eba1512d80acab4983a9496fcb9219e5b865a43f/examples/1-count-lipids-mda.py#L12-L28): recomputes a proximity selection per frame as coordinates change.

## Pandas and Tabular Structure

- [Trackpy linking](https://github.com/soft-matter/trackpy/blob/186fa02f048ef0902b6f9804874b701345a22398/trackpy/linking/utils.py#L73-L89): enforces unique particle labels per frame so the observation key stays explicit.
- [Trackpy drift calculation](https://github.com/soft-matter/trackpy/blob/186fa02f048ef0902b6f9804874b701345a22398/trackpy/motion.py#L297-L315): sorts by particle and frame, diffs within particle, then aggregates per frame.
- [Trackpy paired displacement](https://github.com/soft-matter/trackpy/blob/186fa02f048ef0902b6f9804874b701345a22398/trackpy/motion.py#L468-L501): joins frames on particle ID before computing displacement; its [paired plot path](https://github.com/soft-matter/trackpy/blob/186fa02f048ef0902b6f9804874b701345a22398/trackpy/plots.py#L813-L825) enforces shared completeness.
- [Trackpy individual MSD](https://github.com/soft-matter/trackpy/blob/186fa02f048ef0902b6f9804874b701345a22398/trackpy/motion.py#L211-L224): concatenates curves with named levels and unstacks once to lag time by particle.
- [saenopy file-level aggregation](https://github.com/rgerum/saenopy/blob/5635cc891952d3afc1530e01d60c0c8763874a3a/saenopy/gui/common/PlottingWindowBase.py#L329-L362): reduces duplicate timestamps within files first; its [time-curve path](https://github.com/rgerum/saenopy/blob/5635cc891952d3afc1530e01d60c0c8763874a3a/saenopy/gui/common/PlottingWindowBase.py#L405-L434) passes mean, SE, and count directly.
- [PhysiCell comparative analysis](https://github.com/PhysiCell-Models/collective-invasion/blob/55d25ae04e77fa9208ba2ec43354a7ed2168b60e/scripts/invasive_front_vizualization_of_variance.py#L6-L18): attaches condition labels before concatenating and passes the [long-form table to Seaborn](https://github.com/PhysiCell-Models/collective-invasion/blob/55d25ae04e77fa9208ba2ec43354a7ed2168b60e/scripts/invasive_front_vizualization_of_variance.py#L44-L52).

## Patterns Not to Generalize

- Specialist library quantile filters do not belong in project scripts.
- GUI plotting base classes do not belong in one-off analysis code.
- Positional array indices with physical or temporal meaning need no synthetic ID column or thin helper function; avoid row-position grouping only when table order lacks identity.
- Result-based display thinning (alongside the full field) never justifies filtering reported analysis values.
- Never drop missing values independently in paired calculations; keep each unlinked summary's valid entries, keys, and sample count.
- Never insert dummy zeros for absent runs; keep run identity and explicit missingness.
- Never turn Trackpy's zero fill for unmeasurable MSDs (paired with zero effective weight) into general imputation.
- Never recover group identity from an aggregate such as an `argmax` label; retain metadata in the key or verify once.

Use repository examples as evidence within their scientific context, not as boilerplate.

# Model Versioning

Use [Semantic Versioning](https://semver.org/) for model releases: `MAJOR.MINOR.PATCH` (nonnegative integers, no leading zeroes). Define compatibility by the model formulation: governing equations, physical assumptions, parameter meanings and units, default formulation, input/output observable definitions, and numerical accuracy guarantees.

- **MAJOR:** incompatible scientific change (reset MINOR and PATCH to zero). Changed hypotheses, constitutive laws, or governing equations are scientific model revisions, never code corrections.
- **MINOR:** backward-compatible optional capabilities preserving the existing model formulation (reset PATCH to zero).
- **PATCH:** code corrections implementing the same mathematical model and preserving its model formulation; if computed values shift, record affected results and whether regeneration or scientific reassessment is needed.

Use `0.y.z` for initial development (`0.1.0` typical first release) and `1.0.0` for the first stable model formulation. Describe scientific changes explicitly before stability is guaranteed; prereleases may append `-rc.1`.

Inspect existing version metadata and release records first, keeping model name, release number, `Model version control name:`, and Git source revision distinct. Preserve recorded naming conventions; otherwise, for an authorized release, use `<model-slug>-v<MAJOR.MINOR.PATCH>` (`active-gel-v1.2.0`, `active-gel-v1.2.0-rc.1`), where `v` belongs to the release name.

Run-specific parameter sweeps, initial conditions, and random seeds do not create new model releases, whereas changes to versioned defaults, parameter meanings, or governing formulation can break compatibility. Record run settings separately from model version and source identity, logging the source revision and any uncommitted working-tree changes in either case.

Only for an authorized release, record its `Model version control name:`, physical rationale, source revision, verification and physical validation evidence, and impact on prior results in the release record. Released contents and tags are immutable; subsequent code corrections or model revisions require a new version, and release bookkeeping never authorizes remote pushing or external publication.

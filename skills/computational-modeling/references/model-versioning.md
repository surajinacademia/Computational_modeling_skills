# Model Versioning

Use [Semantic Versioning](https://semver.org/) for model releases: `MAJOR.MINOR.PATCH` (nonnegative integers, no leading zeroes). Define compatibility by the scientific contract: equations, assumptions, parameter meanings and units, default formulation, I/O interpretation, and numerical guarantees.

- **MAJOR:** incompatible scientific change (reset MINOR and PATCH to zero). Changed hypotheses or governing equations are model revisions, never bug fixes.
- **MINOR:** optional capabilities preserving the contract (reset PATCH to zero).
- **PATCH:** fixes implementing the same model and preserving its contract; if computed values shift, record affected results and whether regeneration or reassessment is needed.

Use `0.y.z` for initial development (`0.1.0` typical first release) and `1.0.0` for the first stable contract. Describe scientific changes explicitly before stability is guaranteed; prereleases may append `-rc.1`.

Inspect existing version metadata and release records first, keeping model name, release number, version control name, and source revision distinct. Keep recorded naming conventions; otherwise, for an authorized release, use `<model-slug>-v<MAJOR.MINOR.PATCH>` (`active-gel-v1.2.0`, `active-gel-v1.2.0-rc.1`), where `v` belongs to the name.

Run-specific parameters, initial conditions, and seeds do not create releases; changes to versioned defaults, parameter meanings, or formulation can break compatibility. Record run settings separately from model version and source identity, keeping revision and dirty state either way.

Only for an authorized release, record its version control name, rationale, source revision, verification and validation evidence, and impact on existing results in the release record. Released contents and tags are immutable; fixes require a new version. Use the existing release workflow without tagging every edit; release work never authorizes pushing or publication.

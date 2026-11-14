# Quantitative Figure Gallery

Open the [nine-page PDF gallery](../assets/gallery.pdf) (overview plus eight worked pages). Each case pairs `source.py`, synthetic teaching `data.csv`, and a physical-size PDF (examples only, not scientific evidence); the overview uses native placement scale and two columns for case 08.

| Example PDF | Use and principal pitfall | Plotting source | Teaching CSV |
| --- | --- | --- | --- |
| [01 · Time courses](../assets/examples/timecourse/figure.pdf) | Equal-run mean and SD over time (spread, not a CI). | [source.py](../assets/examples/timecourse/source.py) -> [timecourse.py](../assets/templates/timecourse.py) | [timecourse/data.csv](../assets/examples/timecourse/data.csv) |
| [02 · Replicate comparisons](../assets/examples/replicate-comparison/figure.pdf) | Run points beside summary; x-offsets carry no value. | [source.py](../assets/examples/replicate-comparison/source.py) -> [replicate_comparison.py](../assets/templates/replicate_comparison.py) | [replicate-comparison/data.csv](../assets/examples/replicate-comparison/data.csv) |
| [03 · Paired changes](../assets/examples/paired-change/figure.pdf) | Pair matching runs by key, never by row order. | [source.py: paired_change](../assets/examples/paired-change/source.py) | [paired-change/data.csv](../assets/examples/paired-change/data.csv) |
| [04 · Distributions](../assets/examples/distribution/figure.pdf) | Group-colored histogram bars, shared bins, zero baseline, all selected observations. | [source.py: distribution](../assets/examples/distribution/source.py) | [distribution/data.csv](../assets/examples/distribution/data.csv) |
| [05 · Relationships](../assets/examples/scatter/figure.pdf) | Pair two observables per run with separate units; scatter implies no fit. | [source.py: scatter](../assets/examples/scatter/source.py) | [scatter/data.csv](../assets/examples/scatter/data.csv) |
| [06 · Parameter maps](../assets/examples/parameter-map/figure.pdf) | Nonuniform coordinates and visible missingness; not a continuous phase diagram. | [source.py](../assets/examples/parameter-map/source.py) -> [parameter_map.py](../assets/templates/parameter_map.py) | [parameter-map/data.csv](../assets/examples/parameter-map/data.csv) |
| [07 · Continuous functions](../assets/examples/continuous-field/figure.pdf) | Dense evaluation of a stated formula; never smooth sparse sweeps. | [source.py: signed_map](../assets/examples/continuous-field/source.py) | [continuous-field/data.csv](../assets/examples/continuous-field/data.csv) |
| [08 · Related metrics](../assets/examples/metric-comparison/figure.pdf) | Shared group styles across two quantitative axes with preserved units. | [source.py: metric_comparison](../assets/examples/metric-comparison/source.py) | [metric-comparison/data.csv](../assets/examples/metric-comparison/data.csv) |

Cases 01, 02, and 06 call the CSV templates ([tutorials](tutorials.md)); the rest define direct example functions. From `skills/data-visualization/` (omitting `--output` or `--output-dir` overwrites bundled PDFs; see [api.md](api.md) for dependencies and data regeneration):

```sh
python assets/examples/distribution/source.py --output /private/tmp/distribution-review.pdf
python scripts/build_gallery.py --output-dir /private/tmp/data-vis-gallery-review
```

Inspect standalone PDFs and the overview per the [completion and verification criteria](../SKILL.md#completion-and-verification-criteria).

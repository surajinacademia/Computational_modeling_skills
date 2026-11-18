# The handbook behind these rules

Adapted from Patrick Mineault, [*The Good Research Code Handbook*](https://goodresearch.dev), licensed under [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/). Sentences in quotation marks in this skill are the handbook's own. Changes: a selection of its rules, with additions for this maintainer's projects marked *Project*.

Three *Project* rules follow William Stafford Noble, [*A Quick Guide to Organizing Computational Biology Projects*](https://doi.org/10.1371/journal.pcbi.1000424), *PLOS Computational Biology* 5(7), e1000424 (2009), CC BY: record where raw data came from, keep a failed run marked as failed, and tell a run that crashed from a result that says no.

## The six lessons

All pages were read and the quotes checked against the page text on 2026-11-17. Check them again when a rule is changed.

| Lesson | Page | Rules taken from it |
| --- | --- | --- |
| 1. Set up your project | https://goodresearch.dev/setup | Name, project skeleton, environment, package, git repository, commits |
| 2. Keep things tidy | https://goodresearch.dev/tidy | Style guide, dead code, notebooks |
| 3. Write decoupled code | https://goodresearch.dev/decoupled | Small functions, pure functions, side effects, IO, code smells |
| 4. Test your code | https://goodresearch.dev/testing | `assert`, tests in `tests/`, numeric code, regression tests |
| 5. Document your code | https://goodresearch.dev/docs | Errors, docstrings, in-line comments |
| 6. Document your project | https://goodresearch.dev/pipelines | README, console programs, shell files, git hash, re-running the pipeline |

The seventh lesson, Make it social, is not used.

## The handbook's examples

- **Project skeleton** (lesson 1): the folders `data`, `docs`, `results`, `scripts`, `src`, `tests`, and the files `.gitignore`, `environment.yml`, `README.md`.
- **One project:** "one project = one paper = one folder = one git repository".
- **Commits:** "you should aim to commit your code from a few times a day to a few times per week."
- **Test file** (lesson 4): `tests/test_fib.py`, with functions which start with `test_`, run with `pytest`.
- **Shell file** (lesson 6): `pipeline.sh`, which starts with `set -e` so that it stops at the first error, and is checked in to git.
- **Git hash in a file name** (lesson 6): `figure.3b0c066546.png` instead of `figure.png`.
- **README** (lesson 6): a one-sentence description of the project, a longer description, installation instructions, general orientation, links to papers, links to extended docs, and the license.

## Where this skill differs from the handbook

| Topic | Handbook | This skill |
| --- | --- | --- |
| One repository | One project, one paper, one git repository | One repository can hold several models and several papers |
| Folders | One set of folders in the root | The same set in the root, and again inside each model folder |
| A new model | Not covered; duplicated code is a code smell | A new folder under `model/`; code used twice moves to `src/` |
| Tests | Code that checks code, kept in `tests/` | The same, and a written record of each test of a hypothesis in `tests/RECORD.md` |
| Figures | In `results/` with tables | A separate `plots/` folder |
| README | One for the project | One for the project and one in `model/` |
| Putting files in the right folder at each commit | Not covered | Done by each run, for files added or changed since the last commit |
| Package | `setup.py` | `pyproject.toml` |

# Project instructions

[One paragraph: the research question, the models, and the papers of this project.]

These rules follow the six lessons of Patrick Mineault's [Good Research Code Handbook](https://goodresearch.dev) (CC BY 4.0), in its order. Words in quotation marks are the handbook's own. Rules marked *Project* are additions for this project.

## 1. Set up your project

- **"Pick a short and descriptive name for your project."** Do the same for every folder and file: lowercase with hyphens for folders, snake case for Python files.
- **"Create a project skeleton."** The handbook's skeleton is `data`, `docs`, `results`, `scripts`, `src`, `tests`, with `.gitignore`, `environment.yml`, and `README.md`. Use it, with the additions below, and put nothing else in the root. Create a folder only when a file needs it.
- *Project:* Everything for one model lives in `model/<model-name>/`. Files used by more than one model live in the root folder of the same name. Each paper lives in `paper/<paper-name>/`.

| File | Folder |
| --- | --- |
| Code and notebooks of one model | `model/<model-name>/src/` |
| Raw data of one model | `model/<model-name>/data/` |
| Results of one model | `model/<model-name>/results/` |
| Figures of one model | `model/<model-name>/plots/` |
| Equations and notes of one model | `model/<model-name>/docs/` |
| Reusable modules for several models | `src/` |
| Scripts and notebooks for several models | `scripts/` |
| Raw data for several models | `data/` |
| Results and figures that compare models | `results/`, `plots/` |
| Tests for the code, and the record of tests | `tests/` |
| Text, figures, and tables of a paper | `paper/<paper-name>/` |
| Documentation and notes for the project | `docs/` |
| Files to throw away | `tmp/` |

- *Project:* Choose the folder by what the file is for, not by its extension: a notebook that is the model goes with the model, a notebook that analyses results goes with the scripts.
- *Project:* Never overwrite or delete a file to make it fit the skeleton. If the right folder already has a file of that name, keep both and ask.
- *Project:* Never move a file or a folder that a running simulation or other running program is using.
- **"Where you put raw data for your project."** Never change raw data. Save changed data as results, with the script that made it. *Project:* record in `README.md` where raw data came from: the link, the version, and the date it was downloaded.
- **"Set up a virtual environment."** Use one environment for the project, described in `environment.yml`; install conda packages first and pip packages second. When a package is added, change the file in the same commit.
- **"Create a pip-installable package."** Put reusable modules in `src/` and install them with `python -m pip install -e .`. Do not change the Python path.
- **"Initialize a git repository and sync to Github."** Put code, notebooks, documentation, and the environment file in source control. Data goes in only as "very small, text-based datasets (< 10 MBs)". Keep other data, results, figures, and videos out with `.gitignore`.
- *Project:* A file that git ignores is not saved by a commit, and a commit that is not pushed is not on GitHub. Say in `tests/RECORD.md` which results are kept on this computer only.
- **"Don't wait until the project is almost finished before you start to commit."** Commit each piece of work when it is done.
- **"The general rule of thumb is that one commit should represent a unit of related work."** One commit covers one paper, one model, or one analysis. Add files to a commit by name; never add every changed file at once. A file git already holds that is moved to its right folder is its own commit, together with the paths that point to it.
- **"Try to make your git commit messages meaningful."** Write the message so that a reader needs nothing else:
  - First line: what was done and to what, under 72 characters.
  - Then: what changed, part by part.
  - Then: why it changed. Write `Why: not given` when the reason is not known.
  - Last line: `Tests:` and the tests that ran with what they showed, or `Tests: none run`.
  - `Deleted:` and the paths, when files were deleted.
- *Project:* Write only reasons found in the conversation, `tests/RECORD.md`, or the notes. If the reason is not known, ask. Never make one up.
- *Project:* Read the changes before any commit and leave alone the changes another task made. Push to GitHub only when asked.
- *Project:* Never run `git push --force`, `git commit --amend`, `git rebase`, `git reset --hard`, or `git clean`, and never delete a branch, unless asked for that exact action.
- *Project:* A request to look at the project changes nothing and commits nothing.

## 2. Keep things tidy

- **"Use the style guide."** Run the project's linter and formatter on changed code before a commit.
- **"Delete dead code from the main branch."** *Project:* delete code, tests, results, or logs only when asked, and only what was named. Do not copy a file to keep an old state of it (`_old`, `_final`, `copy`); git keeps every state.
- **"Keep jupyter notebooks tidy."** Put IO, long-running pipelines, functions, and classes in modules and scripts: "keep IO, long-running pipelines, and functions and classes out of jupyter notebooks".
- **"Make sure your notebooks run top to bottom."** Restart the kernel and run all before a notebook is committed.

## 3. Write decoupled code

- **"Separate concerns."** "Make small functions": one function does one thing.
- **"Learn to identify and use pure functions."** "If something that you write makes sense as a pure function, write it that way."
- **"Avoid side effects."** "Write functions which modify their arguments, or return values, but not both."
- **"Split IO and computation."** "Concentrate your IO in their own functions."
- Fix the handbook's code smells when they appear in changed code: duplicated code, magic numbers, globals, large functions, and hardcoded paths and filenames. Move code used twice into `src/`.

## 4. Test your code

- **"If something caused a bug, write a test for it."** Tests for the code live in `tests/`, as in the handbook's `tests/test_fib.py`, in functions which start with `test_`. They stay in source control.
- **"Lightweight formal tests with `assert`."** Turn a check done by eye into an `assert`.
- **"Write tests for the numeric code"** and **"Write tests for the critical IO code."**
- **"Lock in the current behavior of your code with regression tests"** before rewriting it.
- *Project:* Record every test of a hypothesis in `tests/RECORD.md` with four parts: Hypothesis, Model, Results, Conclusion.
  - Write the hypothesis as the scientific question and the reason for asking it.
  - Write the model folder and the git hash under Model.
  - Under Results, say whether each result is in source control or kept on this computer only, with its folder and size.
  - Write a conclusion every time, even when the test is not finished; mark it `(in progress)` and update it later.
- *Project:* Say which of three things a result shows: the code ran, the test passed, or the result agrees with the physics. One does not show the next.
- *Project:* Keep a failed run marked as failed. A later figure must not hide a step that failed.

## 5. Document your code

- **"Raise errors."** Stop with a clear error message when an input is wrong.
- **"Write docstrings."** Each function that others call says what it takes and what it returns.
- **"Write in-line comments"** only where the code cannot say it: "Don't comment bad code - rewrite it."

## 6. Document your project

- **"Write a `README.md` file."** It holds what the handbook lists: a one-sentence description of the project, a longer description, installation instructions, general orientation, links to papers, links to docs, and the license. Keep it up-to-date.
- *Project:* Keep two README files only in a new project: `README.md` for the project and `model/README.md` for the models. The project README also holds the folder tree, the command that runs the smallest example, and the command that runs the tests. Update both when a folder is added, moved, or removed.
- *Project:* Write in a README only what was read in the project. Where a command is not set up yet, write "not set up yet"; never make one up.
- *Project:* Keep each kind of text in one place: rules in `AGENTS.md`, description and commands in `README.md`, notes in `docs/`.
- **"Write console programs."** Run each result from a script or a command line with flags, and "record the flags that you used". Do not edit code to change a run.
- **"Commit shell files."** Keep the commands that make the results in a shell file such as `pipeline.sh`, starting with `set -e` so that it stops at the first error, or in a `Makefile`. "Don't forget to check in this shell file to git".
- **Git hash.** "A lightweight workaround is to record the git hash with each result." Put it in the file name, as in the handbook's `figure.3b0c066546.png`, or in the entry of `tests/RECORD.md`. Say so when the code had changes that were not committed.
- **Before a paper is submitted,** "re-run the pipeline from scratch", so that its figures and tables come from the committed code.
- **"Write Markdown docs."** Notes and documentation are Markdown files in `docs/`.

## Rules for this project

[Scientific limits, folders that must not change, and exceptions. These win over the rules above.]

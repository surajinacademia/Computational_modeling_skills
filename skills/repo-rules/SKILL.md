---
name: repo-rules
description: Commit research work in a git repository by the rules of the Good Research Code Handbook. Each run reads the changes, puts new files in the right folder, makes one commit per piece of related work that says what changed and why, and records the tests in tests/RECORD.md. In an empty folder it creates the project skeleton. Runs only when the user asks for it by name.
disable-model-invocation: true
---

# Repo Rules

- Run as `/repo-rules` in Claude or `$repo-rules` in Codex.
- The rules are those of Patrick Mineault's [Good Research Code Handbook](https://goodresearch.dev) (CC BY 4.0). Words in quotation marks are the handbook's own; rules marked *Project* are the maintainer's additions. [handbook.md](references/handbook.md) lists the lessons, the checked quotes, the handbook's examples, and where this skill differs.
- This skill puts files in folders, makes commits, and keeps the record of tests. It does not write or rewrite code, run a simulation, or re-run a notebook.

## Each run

Do these steps in this order, and only these:

1. Read the project.
2. Set up the project, if the folder is empty.
3. Put new files in the right folder.
4. Commit the work.
5. Record the tests.
6. Ask about the push.
7. Report.

- A request only to look at the project stops after step 1 and the report: it changes nothing and commits nothing.
- Delete nothing in any step unless the maintainer asked for it in this conversation (see [Delete only when asked](#delete-only-when-asked)).

## 1. Read the project

- Read `README.md` and `AGENTS.md` if they exist, then the changes: `git status --short --branch`, `git diff --stat`, `git log -5 --oneline`, and the new files.
- **The project's own rules win.** When `AGENTS.md` or `README.md` of the project disagrees with this skill or its templates, follow the project, list each disagreement in the report, and remove nothing. Extra README files are listed, not deleted.
- Check that the paths named in `README.md` still exist; list the ones that do not.
- Leave alone the changes another task made. If it is not clear whose a change is, ask before it goes in a commit.

## 2. Set up the project

Only when the folder is empty, or has files but no git repository.

- **"Initialize a git repository and sync to Github."** First check that no parent folder is already a git repository (`git rev-parse --show-toplevel`); if one is, ask. Then `git init -b main`.
- **"Create a project skeleton."** Copy from `assets/template/`: [AGENTS.md](assets/template/AGENTS.md), [README.md](assets/template/README.md) with its picture [docs/project-folders.svg](assets/template/docs/project-folders.svg), `gitignore` as `.gitignore`, and `environment.yml`. Copy `model-README.md` as `model/README.md` when there is a model, and `RECORD.md` as `tests/RECORD.md` when there is a test.
- Create a folder only when a file needs it. Do not add `model/` to a project without a model.
- Fill the templates only with what the maintainer said or what was read in the project. Where a command or a fact is not known, write "not set up yet"; never make one up.
- When `AGENTS.md` or `README.md` already exists, add to it. Never replace the rules a project wrote for itself, and never overwrite a file.
- Make the first commit.

```text
project/
├── AGENTS.md           # Rules for agents
├── README.md           # Description, installation instructions, and where things are
├── environment.yml
├── .gitignore
├── model/
│   ├── README.md       # Every model folder: what it is, what changed, which paper uses it
│   └── <model-name>/   # Everything for one model
│       ├── src/  data/  results/  plots/  docs/
├── tests/
│   ├── RECORD.md       # The one record of every test done
│   └── test_*.py       # Tests for the code
├── src/  scripts/  data/  results/  plots/   # Files used by more than one model
├── docs/
└── paper/<paper-name>/
```

## 3. Put new files in the right folder

**"Create a project skeleton."** The handbook's folders are `data`, `docs`, `results`, `scripts`, `src`, and `tests`; this project adds `model/`, `plots/`, and `paper/`.

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

- **Choose the folder by what the file is for,** not by its extension: a notebook that is the model goes with the model, a notebook that analyses results goes with the scripts.
- **Move only files added or changed since the last commit.** For every older file in the wrong folder, and every file git ignores, write old path → new path in the report and move it only when asked. A first run on an old project must not move the project.
- **A file that is not in git is new only when this work made it.** `git status` shows an old file that was never committed the same way as a file made today. Compare its time of last change with the time of the last commit (`git log -1 --format=%cI`): a file last changed before that commit is an older file. List it and ask; do not move it and do not put it in a commit. When it is not clear that this work made a file, ask.
- **Never move what is running.** Before a move, check that no running simulation or other running program is using the file or its folder:
  - `lsof <file>` or `lsof +D <folder>` shows no program that has it open;
  - its size and time of last change are the same when read twice, a few seconds apart;
  - where Slurm exists, `squeue -u "$USER" -o "%i %Z"` shows no job whose folder is inside the project.
  - If any of these shows use, or it cannot be told, do not move it and list it with the reason.
- **Never overwrite.** If the right folder already has a file of that name, keep both and ask. Git cannot bring back a file it ignores.
- **Show the list first:** old path → new path for every file about to be moved.
- **A file git already holds** is moved with `git mv`, in a commit of its own that comes first. **A new file** is moved with `mv` and goes into the commit of its work; `git mv` does not move a file git does not hold.
- **Fix what points to a moved file** in the same commit: imports, paths in scripts and notebooks, links, and the commands and the folder tree in `README.md` and `model/README.md`.
- **Check the move:** each moved file is unchanged apart from its paths, and the links, the imports, and the tests still find their files.
- **Moving is not running.** A move never runs a simulation or a notebook and never changes equations, parameters, raw data, or saved results.
- **Leave what must stay:** a git repository inside the project, and a folder a package needs where it is. Name each one in the report.
- Whether a file is used by more than one model is a judgement: write the move to the root folder in the report and make it only when asked.

## 4. Commit the work

- **"Don't wait until the project is almost finished before you start to commit."** Every run ends with the finished work in commits.
- **"The general rule of thumb is that one commit should represent a unit of related work."** One commit covers one paper, one model, or one analysis. A move of a file git already holds is its own commit and comes first.
- **Add files to a commit by name.** Never `git add -A`, `git add .`, or `git commit -a`. Read `git diff --cached` before the commit.
- When one file holds two pieces of work, put it in the commit of the larger piece and say so in the message.
- **"Try to make your git commit messages meaningful."** Write the message so that a reader needs nothing else:
  - First line: what was done and to what, under 72 characters.
  - Then: what changed, part by part.
  - Then: why it changed. Write `Why: not given` when the reason is not known.
  - Last line: `Tests:` and the tests that ran with what they showed, or `Tests: none run`.
  - `Deleted:` and the paths, when files were deleted.
- **Write only reasons that were read** in the conversation, `tests/RECORD.md`, or the notes. Ask once, in one question, for every reason that could not be read. Never make a reason up.
- Never run `git push --force`, `git commit --amend`, `git rebase`, `git reset --hard`, or `git clean`, and never delete a branch, unless asked for that exact action.

```text
Add turnover to the contact-expansion model

Added first-order cadherin turnover to the transport equation in
model/contact-expansion/src/transport.py and to its equations in
model/contact-expansion/docs/. Added a mass-balance test to
tests/test_transport.py.

Without turnover the contact kept growing and never reached the
steady radius seen in the experiments. Turnover gives a steady radius.

Tests: mass balance holds to 1e-10; steady radius within 3% of the
analytical value.
```

## 5. Record the tests

*Project:* `tests/RECORD.md` is the one record of every test of a hypothesis. It is always in source control.

- Write or update one entry for each test that can be read in the conversation, the notes, or a results folder; newest first. A results folder with no entry is listed in the report as "not recorded" and asked about. Never write an entry for a test that was not read.
- An entry has four parts: Hypothesis, Model, Results, Conclusion.
  - **Hypothesis:** the scientific question and the reason for asking it; what should be seen if it holds, and what if it does not.
  - **Model:** the model folder, the git hash, and the parameters or flags changed for the test.
  - **Results:** what was run and what was found, with numbers. For each result: in source control or kept on this computer only, its folder, its size, and whether it can be made again.
  - **Conclusion:** what the results mean for the hypothesis. Write one every time; when the test is not finished, mark the entry `(in progress)` and write the conclusion so far and what remains.
- A test that did not work keeps its entry. Say which of three things a result shows: the code ran, the test passed, or the result agrees with the physics.
- **Git hash.** "A lightweight workaround is to record the git hash with each result." A commit cannot hold its own hash, so: commit the work first (step 4), write the hash of that commit in the entry, then commit `tests/RECORD.md` by itself with the first line `Record test: <title>`. Say so when a result came from code that was not committed.
- When a file git ignores was moved, write old path → new path in the entry.

```markdown
## 2026-11-17 — Turnover sets the steady contact radius (finished)

1. **Hypothesis:** Does cadherin turnover set the steady contact radius? Without turnover the model has no loss term, so the contact should grow without limit; with turnover it should stop at a radius set by the turnover rate.
2. **Model:** `model/contact-expansion/`, git hash `3b0c066`, turnover rate 0.1 per minute, other parameters unchanged.
3. **Results:** Ran 0 to 600 minutes with and without turnover. Without: radius still growing at 600 minutes. With: steady radius 4.1 µm from 180 minutes, within 3% of the analytical value. Results in `model/contact-expansion/results/2026-11-17-turnover/`, on this computer only, 1.2 GB, can be made again with `scripts/run_turnover.sh`.
4. **Conclusion:** Turnover is enough to give a steady radius in this model. This shows the test passed; agreement with the experiments is not tested yet.
```

## 6. Ask about the push

- When this run made commits, ask at the end: "Push these commits to GitHub?" Push only on a yes.
- When this run made no commits, do not ask.

## Delete only when asked

- **"Delete dead code from the main branch."** *Project:* this skill deletes nothing on its own. It deletes code, tests, results, or logs only when the maintainer asks, and only what was named.
- Before a test's results or logs are deleted, its entry is in `tests/RECORD.md`. Never delete results a paper uses.
- List every deleted path after `Deleted:` in the commit message.
- Dead code and files named `_old`, `_final`, or `copy` are listed in the report, not deleted.

## 7. Report

End every run with:

- files moved, and files listed but not moved, each as old path → new path with the reason;
- commits made, each with its hash and first line, and how many are not pushed;
- tests recorded, tests run and what they showed, and results folders with no entry;
- files deleted, and files kept on this computer only;
- each place where the project's own rules disagree with this skill;
- what was seen in the changes and left as it is: duplicated code, magic numbers, hardcoded paths, functions without docstrings, notebooks not run top to bottom;
- what is left undone, and what could not be checked.

Do not say a rule holds when it was not checked.

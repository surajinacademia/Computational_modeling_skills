# Good Research Code setup lessons

Adapted from Patrick Mineault's [Project setup](https://goodresearch.dev/setup), in *The Good Research Code Handbook*, licensed under [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/). Reviewed on 2026-10-11. This is a concise paraphrase with the owner's layout and current packaging guidance, not a copy of the chapter.

- Give each coherent research project a descriptive folder and Git repository. Reusable tools may warrant separate projects; preserve existing repository boundaries.
- Establish version control early. Commit related work together with meaningful messages throughout the project, rather than waiting until it is finished. Preserve recoverable work before reorganization. The [Git workflow](git-workflow.md) turns this principle into scoped checkpoints, staged-content review, concurrent worktrees, and recovery procedures adapted from the owner's guide.
- Use a documented environment and dependency specification. Distinguish platform-specific environment captures from portable specifications; choose the manager that fits the project.
- Separate raw inputs, reusable code, executable procedures, generated outputs, tests, and documentation. The owner's concrete paths and exceptions are defined in [the template](../assets/template/README.md#repository-layout).
- Keep the README useful for setup and navigation. Ignore large or disposable artifacts selectively, retaining provenance and recovery instructions.
- Make reusable Python code importable through an installable package rather than repeated machine-specific path edits. For new packaging, consult the current [Python Packaging User Guide](https://packaging.python.org/en/latest/guides/writing-pyproject-toml/); after configuration, development installation can use `python -m pip install -e .` in the selected environment.

The chapter's old Python versions, package pins, `setup.py` example, blanket data ignore, and remote-publication commands are historical examples, not instructions to apply automatically. Preserve working environments and packaging unless the requested task needs a change.

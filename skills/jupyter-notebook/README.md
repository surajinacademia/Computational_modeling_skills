# Jupyter Notebook

Start with [SKILL.md](SKILL.md) for the workflow governing editable research `.ipynb` notebooks, plotting style, cell-preserving edits, and execution verification.

- [scripts/notebook.py](scripts/notebook.py): helper CLI (`create`, `inspect`, `validate`, `edit`, `execute`) backed by `nbformat` and `nbclient`.
- [references/helper.md](references/helper.md): CLI reference, JSON patch operations, `invalidate` and `output_changes` rules, and fresh-kernel execution behavior.
- [assets/notebook-template.ipynb](assets/notebook-template.ipynb) and [examples/nonlinear-pendulum.ipynb](examples/nonlinear-pendulum.ipynb): starter layout and executed pendulum example, with runtime dependencies in [requirements.txt](requirements.txt) and [examples/requirements.txt](examples/requirements.txt).
- [references/data-guidance.md](references/data-guidance.md): optional data-analysis adaptations from OpenAI's MIT-licensed Data Analytics notebook skill, retaining the upstream MIT record and [license notice](licenses/openai-role-specific-plugins-MIT.txt).

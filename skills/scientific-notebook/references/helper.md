# Notebook helper

## Contents

- [Create and inspect](#create-and-inspect)
- [Patch only the intended cells](#patch-only-the-intended-cells)
- [Execution and verification](#execution-and-verification)

Run `scripts/notebook.py` from this skill directory or by absolute path. Creation, inspection, structural format check, and editing require `nbformat`; only `execute` imports `nbclient` (plus the selected kernel and notebook packages). Use the project's environment (`requirements.txt` lists helper dependencies); missing execution packages fail before modifying the notebook.

The helper maintains one `.ipynb` file, treating JSON patches as temporary inputs. It rejects symlink notebook or patch paths, requires existing parent directories, checks structure, and checks the file `sha256` before writing to detect concurrent edits (without locking the file; reinspect and reconcile on mismatch). Review code before execution, as the helper is not a sandbox.

## Create and inspect

```bash
python scripts/notebook.py create /path/to/study.ipynb \
  --title "Scientific question" \
  --point "Explain the question and the intended calculation."
python scripts/notebook.py inspect /path/to/study.ipynb
python scripts/notebook.py validate /path/to/study.ipynb
```

Provide at least one nonempty `--point` argument (no fixed bullet count). `create` loads [`assets/notebook-template.ipynb`](../assets/notebook-template.ipynb), updates the opening, and refuses to overwrite existing files; replace its authoring prompts before executing. The template omits interpretation and uses an installed owner `minimalist` theme when present, otherwise Matplotlib's default (see `SKILL.md` for details; no theme source is bundled).

`inspect` prints the `sha256`, notebook metadata, cell IDs and sources, cell metadata, attachment names, execution counts, and output/MIME types without rendering figures or dumping full outputs (use a viewer or `nbformat` for those). Legacy version-4 notebooks lacking IDs get deterministic IDs in memory and persist them on mutation; duplicate IDs fail. `validate`, `create`, `edit`, and `execute` return concise summaries; call `inspect` whenever cell IDs or sources are needed.

## Patch only the intended cells

Copy the `sha256` and target cell IDs from `inspect` into a JSON patch file:

```json
{
  "sha256": "copy-the-current-inspect-sha256-here",
  "operations": [
    {
      "op": "replace",
      "id": "methods-explanation",
      "source": "## Method\n\nThe revised scientific explanation goes here."
    }
  ]
}
```

```bash
python scripts/notebook.py edit /path/to/study.ipynb --patch /path/to/patch.json
```

Operations execute in order:

| Operation | Fields | Effect |
| --- | --- | --- |
| `replace` | `op`, `id`, `source` | Replace only that cell's source. |
| `insert` | `op`, `after`, `cell_type`, `source`; optional `id` | Insert after an existing ID, or at the start when `after` is `null`. Types: `code`, `markdown`, `raw`. |
| `delete` | `op`, `id` | Delete the selected cell. |

Unknown fields or IDs fail. `replace` preserves cell ID, metadata, and attachments, and Markdown-only edits keep all outputs and execution counts; never use delete-and-insert for a source edit.

For code edits, an optional top-level `invalidate` array names surviving code cell IDs whose outputs and execution counts should be cleared. Include every changed or inserted code cell plus all dependent result cells (for example, editing `parameters` in the template usually requires `"invalidate": ["parameters", "run"]`, after checking actual cells). Pass `[]` only when no surviving outputs depend on the edit, such as deleting independent code. Omit `invalidate` whenever dependencies are uncertain so all code outputs, execution counts, and notebook widget state clear; explicit invalidation keeps widget state needed by retained outputs.

Computational edits set `metadata.scientific_notebook.execution` to `stale`. Absent or `not_requested` interpretation stays unchanged; existing requested interpretation becomes `review_required`. These flags never annotate prose or authorize adding interpretation; review affected claims and mark unverified claims if rerunning is out of scope. External data, imported code, or assumption changes are not tracked automatically.

`edit` prints an `output_changes` object in command output (never saved to notebook metadata):

| Field | Meaning |
| --- | --- |
| `invalidation` | `none`, `all`, or `explicit`. |
| `invalidated_cell_ids` | Surviving code cells targeted for invalidation, even if empty. |
| `cleared_output_cell_ids` | Cells whose saved outputs were cleared. |
| `removed_output_cell_ids` | Deleted cells that had saved outputs. |
| `retained_output_cell_ids` | Cells still holding saved outputs after the edit. |
| `dependency_review_cell_ids` | Retained-output cell IDs after a code edit (`[]` for prose-only edits). |

A nonempty `dependency_review_cell_ids` emits a warning; verify every flagged cell against changed or deleted code, because `output_changes` never proves retained outputs remain valid. If post-save uncertainty arises, use `nbformat` to clear all code outputs and execution counts and drop notebook widget state (replaying an unchanged edit clears nothing), keeping existing `execution` and `interpretation` flags. Use `nbformat` directly with the same preservation and hash checks for metadata, attachment, or cell-type changes.

## Execution and verification

```bash
python scripts/notebook.py execute /path/to/study.ipynb --kernel python3 --timeout 600
```

`execute` clears outputs, runs every code cell sequentially in a fresh kernel using the notebook's parent directory as working directory, and defaults `--timeout` to `600` s per cell. Pass `--kernel` explicitly whenever the project environment could be ambiguous; otherwise `nbclient` uses notebook metadata defaults.

On success, outputs save to the same file and `execution` becomes `succeeded`, while `interpretation` stays `not_requested` or becomes `review_required`. Always inspect scientific checks and figures before writing requested interpretation (then set `metadata.scientific_notebook.interpretation` to `reviewed` via `nbformat`). On error or timeout, `execute` clears code outputs, sets `execution` to `failed`, saves, and exits nonzero; it refuses to overwrite if the file hash changed during execution (note external file side effects can still persist).

For narrow requests, run affected cells and prerequisites in the project kernel or an isolated check instead of calling full-notebook `execute`. Record verified scope, inspect changed figures at reading size, and revise requested interpretation without rerunning prose-only edits. Passing `validate` or `inspect` verifies file structure only, not execution, freshness, or science.

# Optional Data guidance and provenance

This skill independently implements the owner's scientific notebook workflow and adapts these narrow practices from OpenAI's public Data Analytics notebook guidance:

- Use notebook-aware tools, inspect before editing, and preserve an existing notebook's intent with minimal structural changes.
- Keep computations reproducible by recording data sources, assumptions, parameters, environment requirements, and dependencies without hidden state.
- Keep outputs readable and bounded, with descriptive chart labels and units.
- Inspect results before writing explicitly requested conclusions, tying claims to observed values or inspected figures.
- Execute complete runnable artifacts from top to bottom, or report the exact execution gap and local action needed to resolve it.

This skill adds the scientific section order, `PARAMETERS` directly before final execution, the owner's `minimalist` plotting style, plots as the primary output, interpretation only on explicit request, proportional checks for small edits, and the cell-preserving helper. It excludes the upstream business-report layout, mandatory summaries or takeaways, top-of-notebook parameters, connector routing, and separate Data validation skill invocation. Preserve the user's shortened openings and notebook structure.

The Data plugin is optional support for data integrity, uncertainty, or presentation and is never required to create or maintain a scientific notebook. Scientific model checks follow `computational-modeling` when that skill applies.

## Source record

- Upstream: OpenAI, [`role-specific-plugins`](https://github.com/openai/role-specific-plugins).
- Inspected commit: `fe5608d2512a7d6a7b9821ce8a88c48464ecd6e4`.
- Public Data Analytics version: `0.2.6`, declared `MIT` in the [pinned manifest](https://github.com/openai/role-specific-plugins/blob/fe5608d2512a7d6a7b9821ce8a88c48464ecd6e4/plugins/data-analytics/.codex-plugin/plugin.json).
- Adapted source: [`plugins/data-analytics/skills/jupyter-notebooks/SKILL.md`](https://github.com/openai/role-specific-plugins/blob/fe5608d2512a7d6a7b9821ce8a88c48464ecd6e4/plugins/data-analytics/skills/jupyter-notebooks/SKILL.md).
- License: [upstream MIT text](https://github.com/openai/role-specific-plugins/blob/fe5608d2512a7d6a7b9821ce8a88c48464ecd6e4/LICENSE), retained in full at [licenses/openai-role-specific-plugins-MIT.txt](../licenses/openai-role-specific-plugins-MIT.txt).
- Inspected on: 2026-09-17.

Copyright (c) 2026 OpenAI applies to the adapted upstream material. Preserve the accompanying MIT notice with copies or substantial portions of that material. This record concerns only the pinned public source; it does not assign that license to the private repository or to any other plugin version. No installed proprietary Data plugin files or text were copied into this skill. No complete upstream skill or shared workflow is bundled.

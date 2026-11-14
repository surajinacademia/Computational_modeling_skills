# Changelog

## [2.2.0] - 2026-11-13

- Expands the public package from ten to twelve skills by adding [image-analysis](skills/image-analysis/SKILL.md) (calibrated experimental microscopy segmentation, fluorescence, tracking, and traction-force measurements with paired Panel A/B figures and [supplementary methods](skills/image-analysis/references/supplementary-methods.md)) and [ruminations](skills/ruminations/SKILL.md) (explicit `/ruminations` session recaps recording problem-solving steps, solutions, corrected errors, two-way lessons in `agent_lessons.md` and `my_lessons.md`, and topics to study).
- Standardizes scientific modeling, theoretical biophysics, and mathematical biology terminology across all twelve skills and onboarding guides, distinguishing numerical verification from independent physical validation, imaging and numerical artifacts from output files, and independent biological replicates from table row definitions.
- Formats `SKILL.md` entrypoints as scannable single-idea bullet checklists and single-line Markdown paragraphs while preserving YAML triggers, negative exclusions, confirmation pauses, CLI subcommands and flags, `validate_target_card.py` `schema-v1` checks, `check_lsa_report.py` Title Case LaTeX section headers, governing equations, attribution notices, and licenses.
- Adds [ONBOARDING.md](onboarding/ONBOARDING.md) and the self-contained offline [computational_modeling_walkthrough.html](onboarding/computational_modeling_walkthrough.html) step-by-step guide, links both from [README.md](README.md), and keeps the minimal README layout, zero installation instructions, and all three SVG embeds.
- Incorporates canonical updates from the unpublished `2.1.1` draft (there was no separate `2.1.1` release): `computational-modeling` competing-hypothesis test design and fresh-reader assumption review, `scientific-notebook` execution-only `nbclient` loading, `output_changes` reporting, and public [overview](skills/scientific-notebook/README.md), `paper-reproduce` Slurm batch-job and job-array wording, and `research-project-setup` Noble (2009) experiment repeatability organization.
- Corrects `Research_project_setup` to `research-project-setup` with identical files across local and public skill directories, retaining minor version `2.2.0` as an explicit maintainer exception to the normal major-version rule for renamed invocations; update saved paths and qualified names to `computational-modeling-skills:research-project-setup` (manual-only setup policy unchanged).
- Preserves all other skill names, workflow triggers, confirmation pauses, scientific checks, examples, attribution notices, privacy projections, exclusions, and license terms.

## 2.1.0 — 2026-10-11

- Adds `Research_project_setup` as the tenth skill, with explicit invocation, README and AGENTS templates, attributed Good Research Code guidance, and a reusable Git workflow.
- Uses the renamed GitHub repository `surajinacademia/Computational_modeling_skills` in package links while retaining the `computational-modeling-skills` plugin identifier and existing invocations.
- Excludes an unpublished chemoattraction model proposal and private project identifiers from the public payload; retains the runnable example, scientific limitations, required checks, editable sources, attribution, and licenses.
- Includes maintained scientific notebook, plotting, schematic, clarification, and Slurm capacity guidance; Slurm supports jobs and independent sweeps using native scheduler commands.
- Keeps tests, evaluation suites, development logs, future-work plans, caches, and superseded diagrams outside the distribution. The documented optional legacy target-card helper remains available for compatible existing use.

## 2.0.0 — 2026-09-24 (corrected release)

At the maintainer's explicit request, this corrected `2.0.0` consolidates the initial `2.0.0` and the subsequently published `2.0.1` and `3.0.0`. The original `2.0.0` is archived as `archive/v2.0.0-original`, retaining its original sources, release assets, attribution, and licenses. The former `3.0.0` is archived as `archive/v3.0.0-before-correction` with its original contents. Both archived releases are marked as prereleases; their release IDs and asset hashes are preserved. The historical `v2.0.1` tag remains. These short-lived versions are superseded by this corrected release. This is a documented one-time version correction, not a claim that those versions were never published.

This release also incorporates the previously unpublished `1.0.1` cleanup; there was no separate `1.0.1` release.

- Removes the VIGIL visual example, editable sources, supporting files, and documentation from the current public package, along with its CC BY-NC 4.0 license notice. The privately maintained example is outside this distribution.
- Removes the previously documented `build_example.py vigil` case and bundled VIGIL paths. Users of that example cannot use those paths or that command with this corrected package. All nine skills and the remaining examples are retained.
- Retains licenses and attribution for the remaining material, including ShareAlike examples and embedded fonts; the package remains mixed-license. Earlier distributed VIGIL copies retain their attribution and CC BY-NC 4.0 terms. This removal does not relicense them.
- Redraws the collective-cell schematic around complementary modeling choices, retained detail, and coarse-graining. Removes the misleading resolution axis and clarifies the captions and primary-source context.
- Separates single-site cellular automata from multisite Cellular Potts cells, and individual-cell phase fields from spatially averaged tissue density.
- Computes physical vectors from the illustrated force law and chemical field; labels model-dependency links separately from forces.
- Applies the maintainer's minimal README wording and removes installation instructions. Retains SVG examples, editable sources, and links to their scientific context and the third-party notices.
- Renames the collection from **Theoretical Biophysics Modeling Skills** to **Computational Modeling Skills**, and the plugin/extension identifier from `theoretical-biophysics-modeling-skills` to `computational-modeling-skills`. This is a breaking package identity change; the eight individual skill names remain unchanged.
- Adds `paper-reproduce` as the ninth skill, with its reviewed operational references, target-card validator, and current decision diagram. Development notes and superseded diagrams remain outside the distribution.
- Adds portable root plugin metadata, Codex and Claude repository catalogs, and package logo assets. The package contains no MCP server, app, hook, or automatic installation action.
- Documents scoped handoffs between modeling and documentation, notebooks and visualization, and schematic design and request clarification. Existing approvals and the coordinating skill's requested outputs remain authoritative.
- Changes qualified skill invocations from `theoretical-biophysics-modeling-skills:<skill-name>` to `computational-modeling-skills:<skill-name>`. For example, `theoretical-biophysics-modeling-skills:model-documentation` becomes `computational-modeling-skills:model-documentation`. Update saved qualified invocations when adopting the renamed package.
- Moves the derived local checkout to `public/computational-modeling-skills/`. The current GitHub hosting address remains `https://github.com/surajinacademia/theoretical-biophysics-modeling-skills` until the owner renames the remote repository. No installation or registration changes are performed by this local rename.
- Limits the distribution to skills and their runtime dependencies, supporting material, package metadata, and licensing information.
- Removes development tests and evaluation suites, the development-only `check_model_doc.py` checker, and unused build files.
- Routes five manual TikZ recipes through the private build workflow.
- Publishes quantitative PDF outputs through private staging and opened output directories; assembles the gallery from private inputs before publishing it. File replacements are atomic individually, not as a multi-file transaction.
- Rejects escaped or comment-obfuscated SVG CSS, unsupported style properties and functions, and SMIL animation; requires UTF-8 XML and rejects invalid XML control characters. Rejects nonregular TeX source/include files without blocking on FIFOs.
- Preserves the original eight skill names and remaining diagram creator credits and third-party license terms. The published `v1.0.0` release and its history remain unchanged.

## 1.0.0

First stable eight-skill collection. This establishes the compatibility contract in [VERSIONING.md](VERSIONING.md).

- Retains computational modeling, model documentation, schematic design, and request clarification.
- Adds scientific notebooks, linear stability analysis, data visualization, and a portable single-job CPU Slurm workflow.
- Removes `gotcha` from the current package; this does not erase prior releases or repository history. Private skills are outside this release.
- Aligns platform manifest versions and documents mixed licensing, per-example diagram attribution, notebook provenance, and font notices. VIGIL remains CC BY-NC 4.0; share-alike examples retain their applicable terms.

# Changelog

## [2.1.1] - 2026-11-13

- Syncs canonical updates to `computational-modeling` (competing-hypothesis test design and Elephant-Goldfish review) and `research-project-setup` (renaming `Research_project_setup` to `research-project-setup` and adding Noble 2009 experiment repeatability organization).
- Compresses trigger-time `SKILL.md` entrypoints and deduplicates overlapping reference prose across all ten skills using `blader/humanizer` under scientific-specification safeguards, keeping gates, CLI flags, schemas, equations, and LaTeX report checks intact.
- Fixes the stale Slurm sweep description in `paper-reproduce/SKILL.md` and `paper-reproduce/README.md` to reflect supported batch jobs and job arrays, and replaces the development test note in `scientific-notebook/README.md` with a public overview.
- Adds `onboarding/ONBOARDING.md` and the self-contained `onboarding/computational_modeling_walkthrough.html` step-by-step guide, links `onboarding/ONBOARDING.md` from `README.md`, fixes `README.md` typos (`development`, `models in`, `research`) and `ONBOARDING.md` dictation stutters, and keeps the minimal README layout, zero installation instructions, and all three SVG embeds.
- Updates local and public `research-project-setup` directories to identical files and retains version `2.1.1` as an explicit maintainer exception to the normal major-version rule for renamed invocations. Update saved paths and qualified names to `computational-modeling-skills:research-project-setup`; the setup workflow remains manual-only.
- Loads `nbclient` only during notebook execution, reports cleared, removed, and retained outputs after edits (flagging retained outputs for dependency review after code changes), and keeps established numerical baselines, accepted figure decisions, working render recipes, and single-owner Slurm monitoring.
- Preserves all other skill names, workflow triggers, approval requirements, scientific checks, examples, attribution, and license terms, alongside existing privacy projections and exclusions.

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

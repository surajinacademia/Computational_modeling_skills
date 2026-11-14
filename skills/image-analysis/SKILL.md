---
name: image-analysis
description: Analyze experimental microscopy images, volumes, and time series for measurements such as cell counts, fluorescence, morphology, tracking, and matrix deformation. Use one suitable image-analysis MCP server by default and produce a matched before-and-after figure and reproducible supplementary methods for each completed analysis.
---

# Image Analysis

- Identify the requested measurement, target object or region, measured channel, dimensionality, and unit of analysis (such as cell, spheroid, field, or biological replicate).
- Read acquisition metadata once per distinct setup to resolve axis order, channel identity, spatial pixel or voxel spacing, and frame interval when they affect the measurement.
- Report pixel or frame units explicitly when physical calibration is unavailable, and ask for missing information only when it changes what can be measured.

## Choose one MCP server

- Follow an `assistant -> image-analysis -> MCP -> tool` workflow using one Model Context Protocol (MCP) server per task, inspecting its available tools, installed models or plugins, and required input format, channel order, and dimensionality.
- Add a second MCP server **only** for a required operation the primary server cannot perform or an independent verification question; record the gap, pass the smallest saved image, label map, or field, and document the outcome.
- Use standalone local scripts for plotting, unit conversion, derived quantities, figure assembly, and Markdown reporting rather than extra MCP tools.

| Requested work | First choice and decision criteria |
| --- | --- |
| Regions of interest, thresholding, fluorescence, morphology, or tracking | Use Fiji/ImageJ MCP (with Bio-Formats for vendor data or TrackMate for tracking when available); a saved macro can run import, measurements, and overlays in one session. |
| Instance segmentation of cells or nuclei | Use Cellpose MCP; inspect its installed model and required input format, channel order, and dimensionality, map channel indices explicitly, separate depth from time, batch only individually verified settings, and derive boundaries from saved integer labels. |
| Interactive inspection, annotation, or correction of existing labels in several dimensions | Use napari MCP as the primary server; open the raw image and labels with matching axis order, scale, and coordinates, retain original labels, and save the reviewed version. |
| Matrix displacement or traction force microscopy | Use saenopy MCP on fixed-reference 3D stack pairs for displacement estimation and material-model force reconstruction (with saved time-series inspection/export when supported); write new output filenames per run, convert SI field exports (`m` for displacement, `N` for nodal force) explicitly, and run standalone Python scripts for plotting, derived stress/traction, or annular profiles rather than extra MCP tools. |

- If the preferred server is unavailable, select a single capable alternative; if no suitable MCP server is available, report that and identify an available macro, CLI, or Python API route while respecting any explicit MCP requirement.
- Reuse an existing CellProfiler pipeline, ilastik classifier, or QuPath project when it already defines the requested experiment and measurements, and record how it actually ran.

## Execute and retain the analysis

1. **Select the analysis input.** Preserve the raw images, record the series, channels, z-planes, frames, and regions used, keep sample, field, and replicate identifiers with measurements, and separate the object-detection image from the intensity-measurement image for fluorescence.
2. **Choose and check settings.** On a new batch workflow, test representative data and inspect one measurement-relevant failure mode (such as merged cells, background bias, track swaps, or stage-drift displacement); reuse previously verified settings where applicable and record field selection and per-image setting changes.
3. **Run efficiently.** Batch compatible operations into a reproducible macro, script, or tool call, save exact executed commands and resolved parameters as you go, reuse saved labels, tracks, or fields, and after any failure inspect saved outputs before rerunning only affected steps and their dependents.
4. **Save quantitative outputs.** Retain the analysis-native result (integer labels, regions of interest, tracks, or vector fields) plus measurements with identifiers and units, state how boundary-touching objects, excluded fields, and manual edits were handled, and keep replicate summaries traceable to source measurements.

## Show and report

- **Show and save the before-and-after figure:** display it in the response or viewer for every completed analysis, save it beside the analysis outputs, embed it in `Supplementary_Methods.md`, and keep quantitative data files separate from the rendered figure.
- **Pair Panel A and Panel B:** show the raw input in Panel A and the corresponding result in Panel B (such as boundaries over raw pixels, trajectories ending at the selected frame, or displacement vectors with a magnitude scale), including a calibrated scale bar when possible.
- **Couple Panel A/B alignment with display-transform disclosure:** match field, orientation, crop, channel, z-plane or projection, time point, and raw-image display limits across Panel A and Panel B, and explicitly state any spatial registration, linear or nonlinear intensity display transform, or distinct display limits in the legend.
- **REQUIRED BEFORE writing `Supplementary_Methods.md`:** read the [supplementary methods template](references/supplementary-methods.md) and populate `Supplementary_Methods.md` from the executed analysis and saved outputs with actual parameters, units, software versions, quality checks, exclusions, reproduction commands, influential defaults, and any unresolved values.
- **Verify before delivery:** confirm that the figure matches the reported measurements, check that reproduction instructions and relative links resolve to the files used, and return the figure, `Supplementary_Methods.md`, and primary quantitative results.

# Writing Supplementary_Methods.md

Use the following headings for the report, adapting the numbering to the manuscript when supplied. Write the methods in past tense for a reader with access to the input data. Give paths relative to the report or a stated dataset root. Replace the guidance under each heading with observed details. For a partial run, identify the last completed step and the missing result.

## Supplementary Method S1. [Name of measurement]

Describe the specimen or sample, image modality, experimental unit, and quantity measured in a short paragraph. Give the number of biological replicates, fields, frames, and objects when known and relevant. Identify acquisition settings from the metadata or experiment record and distinguish unavailable information from measured values. Name the analysis software, MCP server, plugins, model or weights, and their versions as applicable. Use accession numbers or persistent dataset identifiers when supplied.

### Step-by-step procedure

Number the actual operations in execution order. For each, name the input and operation, give the effective parameters with units, and identify its output. Include image-specific choices or link to their table when they vary across the batch. Select only the details relevant to the measurement.

| Operation | Details needed to reproduce it |
| --- | --- |
| Input selection and calibration | Input identifiers or file pattern, series, axis order, channel names and indices, spatial and temporal sampling, plane, projection, or crop coordinates. State the index convention. |
| Preprocessing | Order of operations, background estimate, filter kernel and size, normalization, registration reference and transformation, and which derived image was used in subsequent measurements. |
| Segmentation and measurement | Model and weights or threshold rule, threshold values or per-image estimation method, object size limits and units, connectivity, edge policy, and measurement definition. For intensity, identify the measurement channel, background correction, and statistic per region. |
| Tracking or mechanics | For tracks, give detector and linking settings, distances, allowed gaps, and treatment of divisions. For displacement, give the stack pairing, reference state, interrogation window, spacing, drift correction, and units. For force estimation, add the material law, parameter values and units, mesh, regularization, and convergence criteria. |
| Aggregation | Inclusions, exclusions, denominators, aggregation within each experimental unit, and units of reported values. |

### Quality control

Identify reviewed fields or objects and how they were chosen. Describe the checks, observed outcome, corrections, and numbers excluded. For manual edits, identify the saved annotation or corrected label file and state how to resume the analysis from it. If a second MCP was used, identify the specific missing operation or verification question, the files exchanged, and what the second server established.

### Supplementary Figure S1. [What the comparison shows]

Embed the saved figure using a relative Markdown image link. Identify panels A and B, sample or field ID, channel and plane or projection, frame or time, overlay colors or vector scale, display range, and scale bar or pixel units. Mention any transformation needed to compare panels.

### Reproducing the results

State the working directory and input layout. Include the executed macro or script and its invocation, or the ordered MCP tool names and exact arguments. Link relative paths to executable instructions, the quantitative outputs, and the figure. Capture relevant versions, weights, random seeds when used, and analysis-changing defaults. If a default could not be resolved, identify the setting and software version. For manual steps, link the saved regions, labels, or transforms required for replay. Include one observed count, dimension, or summary value a reader can use to check the rerun.

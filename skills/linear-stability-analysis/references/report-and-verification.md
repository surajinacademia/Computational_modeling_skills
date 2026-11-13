# Report And Verification Contract

Read this reference before writing or revising a linear-stability report. Follow its writing rules directly without invoking another skill at runtime; plots, code, and data are part of this deliverable.

## Contents

- [Fixed LaTeX structure](#fixed-latex-structure)
- [Section content](#section-content)
- [Artifact and figure contract](#artifact-and-figure-contract)
- [Writing discipline](#writing-discipline)
- [Verification and review](#verification-and-review)

## Fixed LaTeX Structure

Use unstarred LaTeX section commands in this exact order and spelling:

```latex
\section{Model Purpose And Questions}
\section{Physical Picture And Assumptions}
\section{Entities, Domain, And Notation}
\section{Parameters And Scales}
\section{Governing Equations}
\section{Initial And Boundary Conditions}
\section{Observables And Model Tests}
\section{Solution Method}
\subsection{Methodology And Rationale}
\subsection{Numerical Formulation}
\subsection{Algorithm And Flowchart}
\subsection{Accuracy And Verification}
\section{Model Record And Implementation}
\subsection{Implementation Mapping}
\subsection{Method Decisions And Changes}
\subsection{References}
```

Never rename, reorder, merge, omit, or add sections or subsections. Use concise paragraphs, equations, tables, and bold run-in labels; keep inapplicable sections with an explicit reason. Put the scientific model name and "Linear Stability Analysis" in the title, and list the governing-equation source, calculation code, parameter file, and spectrum file right below it using contained relative paths (never invent paths or cite uninspected files).

## Section Content

**1. Model Purpose And Questions.** State the phenomenon, stationary reference state, stability question, model status, observable criterion, what instability predicts, and what linear analysis cannot establish.

**2. Physical Picture And Assumptions.** Explain stabilizing and destabilizing mechanisms in words before equations, then list small-perturbation, stationary-state, geometry, constitutive, and scale-separation assumptions with evidence or rationale and a limitation for each.

**3. Entities, Domain, And Notation.** Define every field, index, coordinate, domain, vector orientation, geometric convention, and dimensional status before use; distinguish two spatial dimensions from two dependent fields, and define \(s\), \(\mathbf{k}\), and branch labels before first use.

**4. Parameters And Scales.** Tabulate symbol, code name, meaning, units, value, admissible range, and provenance, separating physical parameters from sampling and solver controls (which belong in Section 8.2). Define nondimensional groups and validity limits before interpreting them; missing values allow a symbolic partial result only, never fabricated numbers or plots.

**5. Governing Equations.** Present the governing equations, verify the reference-state residual, substitute perturbations, collect first-order terms, and show the full linearized system before modal reduction. Then derive the spectral matrix or polynomial, dispersion relation (when a valid wavevector basis exists), or full-operator eigenproblem, marking exact, asymptotic, and numerical results separately.

**6. Initial And Boundary Conditions.** State boundary conditions for original and perturbed fields, derive admissible spatial eigenfunctions and continuous or discrete wavenumbers, and explain constraints, gauge conditions, excluded modes, and the small initial-amplitude requirement.

**7. Observables And Model Tests.** With a valid wavevector basis, present analytical and numerical dispersion results, thresholds, unstable bands or allowed modes, and 2D growth maps when anisotropic. Without one, show a refinement-supported indexed or complex-plane spectrum without inventing a dispersion relation. Include the spectral figure, compare like quantities, report \(\lambda_*=2\pi/k_*\) only for a finite nonzero fastest admissible mode, qualify uncertain non-normal/defective signs, leave rising edge growth unresolved, and flag proven unbounded high-wavenumber growth as possible continuum ill-posedness rather than mistaking grid cutoffs for physical cutoffs.

**8. Solution Method.** Keep all four subsections distinct:

- **Methodology And Rationale:** explain why the symbolic linearization, spatial basis, and eigensolver fit the equations and question.
- **Numerical Formulation:** specify the lambdified matrix or pencil, wavenumber grid and finite modes or full-operator discretization and refinements, branch or subspace matching, constraint projection or companion linearization, tolerances, scaling, and stored data schema.
- **Algorithm And Flowchart:** give mathematical pseudocode from input validation and base-state check through symbolic derivation, lambdification, eigensolution, matching, residuals, storage, and plotting (add a compact TikZ flowchart only when branching needs clarification).
- **Accuracy And Verification:** report performed residuals, analytical comparisons, limiting cases, refinement or resolution checks, and proportionate conditioning or subspace checks (leaving signs crossing zero unresolved); separate executed evidence from unperformed checks.

**9. Model Record And Implementation.** Keep all three subsections distinct:

- **Implementation Mapping:** map equations and report quantities to source files, SymPy expressions, SciPy routines, parameter inputs, spectrum columns, and figures; record runtime and package versions, VCS revision and dirty state (hashing dirty or untracked inspected sources), and the artifact manifest.
- **Method Decisions And Changes:** record consequential analytical or numerical choices, rationale, and status (not a routine edit log).
- **References:** list only cited sources supporting assumptions, equations, values, or numerical methods, with stable identifiers.

## Artifact And Figure Contract

Keep the report, calculation, parameters, spectrum, and figures inside one analysis-output root as regular files without symlinks:

```text
analysis-output/
|-- stability-report.tex
|-- stability-report.pdf
|-- linear_stability.py
|-- parameters.json
|-- spectrum.csv
|-- artifact-manifest.sha256
`-- figures/
    |-- dispersion_relation.pdf
    `-- dispersion_relation.png
```

Match existing project filenames when present and record actual paths in Section 9.1. In Section 7, replace the template's entire `\IfFileExists` block with one unconditional direct `\includegraphics` command to the generated figure.

Serialize enough data in tidy CSV (`spectrum.csv`) and text/JSON (`parameters.json`) to reproduce every plotted point: parameters, mode or wavevector, branch or refinement label, real and imaginary parts of \(s\), admissibility, and residual or comparison metrics. Never hardcode hand-entered plot numbers in LaTeX. Give every figure labeled axes with symbols and units (or nondimensional note), a legend or direct labels, and a caption stating parameters, spectral representation, analytical vs numerical encodings, and stability convention; avoid decorative interpolation in 2D maps.

After the `.tex` and PDF are final, generate a SHA-256 manifest covering the report, script, parameters, spectrum, figures, PDF, and checker source or version, excluding the manifest itself; compute the manifest's own SHA-256 separately for external completion and review records.

## Writing Discipline

Build the argument in logical order: question, assumptions, notation, original model, linearization, modal basis, analytical result, numerical calculation, verification, interpretation, and limits. Keep symbols, signs, units, and branch labels consistent across equations, code, tables, figures, and prose, and distinguish: inspected equations/values from author assumptions; exact linearized results from asymptotic or numerical approximations; linear-approximation error from solver error; calculation verification from physical model validation; continuous dispersion curves from finite-domain admissible modes; wavevector dispersion from unparameterized operator spectra; and early-time mode selection from nonlinear final morphology.

Real-wavevector growth gives temporal spectral instability, not absolute or fixed-location instability in open advective flows without separate spatiotemporal evidence. Support claims strictly within documented parameter and wavenumber ranges.

## Verification And Review

Run `check_lsa_report.py` on the final `.tex` and root (verifying headings and figure paths only, not math or claims). Inspect TeX before compiling locally in a clean directory with shell escape disabled (never run uninspected supplied code or TeX), and inspect every rendered page for missing references, clipped or overlapping layout, missing figures, and legible mathematical glyphs.

Have the calculation review trace at least one plotted point end-to-end from displayed SymPy matrix through `lambdify`, SciPy eigenpair, stored CSV row, plotted mark, and prose conclusion, while checking base-state residual, spatial basis or discretization, pencil regularity or constraint reduction, analytical agreement, branch matching, conditioning, and limits. Have the scientific review challenge assumptions, curvature and geometry conventions, boundary compatibility, neutral modes, instability classification, short-wave behavior, and claim strength. Bind every completed check and review to the external SHA-256 hash of the final manifest, and report any skipped check as incomplete.

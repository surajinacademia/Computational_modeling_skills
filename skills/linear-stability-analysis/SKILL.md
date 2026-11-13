---
name: linear-stability-analysis
description: Derive, compute, plot, and report physical linear stability analyses for stationary states of 1D or 2D continuum systems. Use for reaction-diffusion, mechanical, curvature, and related spatial dynamical equations requiring analytical dispersion relations, numerical eigenspectra, or a reproducible LaTeX report. Exclude nonlinear time integration and stability analysis of numerical time-stepping schemes.
---

# Linear Stability Analysis

Determine whether infinitesimal perturbations of a stationary state grow or decay. Derive the linear problem with SymPy, solve it analytically when tractable and numerically with SciPy, plot a dispersion relation (when a wavevector basis holds) or eigenspectrum, and write one self-contained LaTeX report. Linearization is a first-order approximation for nonlinear dynamics; linear source systems have no perturbative truncation error.

## Runtime

Use Python 3.10+ with `requirements.txt` and a local LaTeX engine for PDF compilation (none bundled); `scripts/check_lsa_report.py` uses only the Python standard library. Package installation and TeX compilation are explicit steps.

## Scope

- Analyze 1D or 2D dynamics with any finite number of scalar or vector fields (field count is not spatial dimension), covering first-order systems, constrained systems after justified reduction, and second-order inertial mechanics on infinite, periodic, or bounded domains with valid modal bases.
- Analyze homogeneous states directly; analyze nonuniform states or curved geometries only with a justified eigenbasis or validated discretized operator (no general geometry solver).
- Exclude nonlinear time integration and CFL, timestep, or numerical-scheme stability. Keep supplied equations, signs, parameters, units, terminology, and interpretation; report conflicts or gaps instead of altering the science.

## Establish The Problem

Inspect equations or code first and record: state fields (domains, dimensions, units, component conventions); stationary state and parameter regime; geometry, coordinates, boundary conditions, and constraints; coefficients, values or symbolic assumptions, and provenance; and curvature, normal, stress, strain, and Fourier sign conventions.

Clarify ambiguities that change the reference state, linear operator, admissible modes, or stability verdict. Missing numbers allow a symbolic partial result while leaving numerical and full-report claims incomplete; never fabricate parameters, spectra, data, or plots, and reuse existing authorization without pausing again. Stay inside the authorized root without symlinks, inspect imported code or TeX before executing, and work locally unless authorized otherwise.

Use

\[
  \boldsymbol{\eta}(\mathbf{x},t)
  = \widehat{\boldsymbol{\eta}}\exp(s t+i\mathbf{k}\!\cdot\!\mathbf{x})
\]

when Fourier modes apply, with growth rate \(s\in\mathbb{C}\) (\(\operatorname{Re}s>0\) growth, \(\operatorname{Im}s\) angular frequency); transform all signs consistently if another convention is declared.

## Derive The Linear Problem With SymPy

1. Use the given stationary state or solve homogeneous stationary equations for all admissible branches without silently choosing one; verify zero simplified residual against equations, boundary conditions, and constraints (nonuniform states need supplied or validated definitions).
2. Perturb every coupled field and auxiliary variable via \(\mathbf{u}=\mathbf{u}_0+\epsilon\boldsymbol{\eta}\), extract the \(\epsilon\) coefficient, and state discarded orders.
3. Verify derivations via SymPy differentiation, series, Jacobians, coefficient extraction, and simplification, showing informative intermediate variations.
4. Derive spatial eigenfunctions from domain and boundary conditions; apply \(\partial_{x_j}\mapsto i k_j\) only after justifying a Fourier basis, keeping \((k_x,k_y)\) in 2D until isotropy holds.
5. Assemble the ordinary, generalized, polynomial, or discretized spectral problem, checking units and signs term by term.

For generalized pencils, inertia, curvature, and boundary spectra, read [spectral formulations](references/spectral-formulations.md).

## Obtain Analytical Results

- Derive the exact characteristic equation or matrix pencil; write explicit \(s_j(\mathbf{k})\) branches while tractable, or retain the exact regular-pencil matrix, determinant, or polynomial for thresholds.
- Separate asymptotic limits and numerical root estimates from exact results, and state inequality assumptions without inferring global bounds from sampled grids.
- Classify physical eigenvalues, symmetry/conservation modes, marginal modes, defective zero-real-part modes, and infinite generalized eigenvalues without counting constraints as growing modes.
- Real-wavevector growth shows temporal instability only; never claim absolute instability in open advective systems without separate spatiotemporal evidence (outside default deliverables).

## Compute The Numerical Spectrum With SciPy

1. Build evaluators from verified SymPy expressions via `sympy.lambdify`; never retype a separate model.
2. Solve ordinary problems with `scipy.linalg.eig` or `eigvals`, and generalized \(A\mathbf{q}=sB\mathbf{q}\) with a generalized solver after verifying pencil regularity, homogeneous pairs for singular \(B\), or constraint reduction.
3. Keep quadratic inertial forms \((s^2M+sC+K)\mathbf{q}=0\) in derivations; if companion-linearized for SciPy, document the form and verify equivalence.
4. With a wavevector basis, evaluate all branches over the continuous wavenumber range and separately at discrete finite-domain modes (including or explaining \(k=0\)). Otherwise compute an indexed eigenspectrum and refinement series from a validated discretized operator without inventing \(k\).
5. Track branches across neighboring wavenumbers by eigenvalue distance and eigenvector overlap (never solver return order), or match converged eigenvalues/subspaces across refinement.
6. Record parameters, mode/wavevector labels, complex eigenvalues, branch IDs, admissibility, tolerances, and package versions in a machine-readable table.

## Verify Before Interpreting

- Check eigenpair backward residuals with explicit norm and scale (note they do not prove forward accuracy), and compare numerical branches to analytical forms or characteristic residuals at interior points, thresholds, extrema, and degeneracies.
- Check dimensions, base-state residual, uncoupled/zero-coupling limits, \(k=0\), symmetry directions, large-\(k\) limits, and operator refinement convergence.
- Distinguish continuum instability bands from allowed finite-domain modes. Leave rising edge growth unresolved unless analysis gives the limit; flag proven unbounded \(|\mathbf{k}|\to\infty\) growth as possible continuum ill-posedness (never mistake numerical grid cutoffs for physical cutoffs).
- For non-normal or nearly defective problems, assess eigenvector conditioning, invariant subspaces, precision, or perturbations; leave classification unresolved if uncertainty crosses \(\operatorname{Re}s=0\).
- Symbolic-numerical agreement verifies the calculation, not the physical model.

## Plot The Dispersion Relation Or Eigenspectrum

Generate vector Matplotlib figures (raster copies only if helpful):

- In 1D, plot \(\operatorname{Re}s_j(k)\) (and \(\operatorname{Im}s_j(k)\) or \(\operatorname{Im}s_j/(2\pi)\) for cycles per unit time when oscillation matters), using lines for analytical continuum branches and distinct markers for numerical or finite-domain values; keep \(k<0\) unless symmetry holds.
- In anisotropic 2D, plot \(\max_j\operatorname{Re}s_j(k_x,k_y)\) with axes and neutral contour (radial plots only if isotropic). Without a wavevector basis, plot converged eigenvalues by mode index or in the complex plane with refinement evidence.
- Mark thresholds and unstable bands without hiding branches or crossings, stating units, parameters, range, sampling, and admissible modes in captions or text. Report \(\lambda_*=2\pi/k_*\) only for a finite nonzero fastest admissible mode as early-time selection, not nonlinear saturation.

## Write The LaTeX Report

Adapt [the LaTeX report template](assets/report-template.tex) per [the report and verification contract](references/report-and-verification.md), keeping all nine sections and seven subsections in exact unstarred order (with brief reasons for inapplicable sections). Deliver one self-contained `.tex` report (sole narrative document), one SymPy/SciPy/NumPy/Matplotlib script, contained figures, parameter/spectrum files, a compiled PDF when TeX exists, and a SHA-256 manifest.

## Completion Gate

Before claiming completion:

1. Run the structural checker:

   ```bash
   python3 <skill-dir>/scripts/check_lsa_report.py <report.tex> --root <analysis-output-dir>
   ```

2. Compile locally from a clean directory with shell escape disabled and inspect every page, equation, table, caption, and figure (missing TeX or skipped inspection is incomplete).
3. Obtain two independent reviews of the final artifacts when available (algebra/numerics/reproducibility/format and physics/modes/classification/claims), fix supported defects, rerun affected checks, and label any unrun review incomplete.
4. Hash `.tex`, script, parameters, spectrum, figures, PDF, and checker version into the SHA-256 manifest without hashing the manifest itself; record its own hash externally.

Passing `check_lsa_report.py` checks headings and local figure paths only; completion requires a zero reference-state residual (or explained reformulation), justified spatial basis, reproducible symbolic-to-numerical mapping, verified eigenpair and analytical residuals, visual inspection when tooling permits, and conclusions bounded by linearity and sampled parameters.

---
name: linear-stability-analysis
description: Derive, compute, plot, and report physical linear stability analyses for stationary states of 1D or 2D continuum systems. Use for reaction-diffusion, mechanical, curvature, and related spatial dynamical equations requiring analytical dispersion relations, numerical eigenspectra, or a reproducible LaTeX report. Exclude nonlinear time integration and stability analysis of numerical time-stepping schemes.
---

# Linear Stability Analysis

- Determine whether infinitesimal perturbations of a stationary state $\mathbf{u}_0$ in a 1D or 2D physical continuum model grow or decay.
- For nonlinear models, treat linear stability as a first-order early-time approximation for small disturbances around $\mathbf{u}_0$; a linear source equation carries zero perturbative truncation error.
- Analyze 1D or 2D continuum equations with any finite number of scalar or vector fields (coupled field count is not spatial dimension), covering first-order evolution, generalized or algebraically constrained systems after justified reduction, and second-order inertial mechanics.
- Support continuous or discrete spatial spectra on infinite, periodic, or bounded domains where boundary conditions define an admissible modal basis.
- Analyze homogeneous stationary states directly; analyze nonuniform states or curved geometries only with a justified eigenbasis or verified discretized linear operator (never invent a general geometry solver).
- Stop at linearized dispersion relations, instability thresholds, and early-time mode selection; exclude nonlinear time integration and CFL, timestep, or numerical-scheme stability.

## 1. Establish the continuum system and stationary state

- Inspect supplied equations or code before perturbing anything; preserve supplied equations, signs, parameters, units, and physical terminology, and report source conflicts or missing values explicitly.
- Record state fields, domains, dimensions, units, proposed stationary state $\mathbf{u}_0$, spatial coordinates and geometry, boundary conditions, physical constraints, parameter values or symbolic bounds with provenance, and sign conventions (curvature, normal direction, stress, strain, and Fourier convention).
- Clarify any ambiguity that alters $\mathbf{u}_0$, the linearized operator, admissible modes, or the stability conclusion.
- **If numerical parameter values are missing:** perform a symbolic derivation only, leaving numerical spectra and plots incomplete rather than fabricated.
- Keep all paths inside the authorized workspace without symlinks, inspect supplied code or TeX before running it, and reuse existing session authorization.

When a Fourier modal basis applies, expand small perturbations around $\mathbf{u}_0$ as

$$
\boldsymbol{\eta}(\mathbf{x},t) = \widehat{\boldsymbol{\eta}}\exp(s t + i\mathbf{k}\!\cdot\!\mathbf{x})
$$

where $s \in \mathbb{C}$ is the complex temporal growth rate ($\operatorname{Re}s > 0$ indicates exponential growth and $\operatorname{Im}s$ gives the angular oscillation frequency; state and transform all signs consistently if a different convention is requested).

## 2. Perturb the stationary state and linearize with SymPy

- Substitute $\mathbf{u}_0$ into the governing equations, boundary conditions, and constraints first, confirming in SymPy that the simplified residual vanishes identically.
- **When $\mathbf{u}_0$ is implicit:** solve tractable homogeneous stationary equations across all physically admissible branches without silently dropping branches.
- Perturb every coupled field and dependent auxiliary variable around verified $\mathbf{u}_0$ via $\mathbf{u} = \mathbf{u}_0 + \epsilon\boldsymbol{\eta}$, expand to $O(\epsilon)$ in SymPy (differentiation, series, Jacobians, simplification), and display physically informative intermediate variations rather than black-box algebra.
- Derive admissible spatial eigenfunctions from the actual domain and boundary conditions.
- **When a Fourier basis is justified:** apply $\partial_{x_j} \mapsto i k_j$, and in 2D retain $(k_x, k_y)$ unless rotational isotropy is established.
- Assemble the ordinary, generalized, polynomial, or spatially discretized spectral operator and verify dimensional and sign consistency term by term.

## 3. Obtain analytical dispersion or stability conditions

- Derive the exact characteristic polynomial or regular matrix pencil $A(\mathbf{k})\mathbf{q} = sB(\mathbf{k})\mathbf{q}$.
- **When closed-form roots are tractable:** write interpretable branches $s_j(\mathbf{k})$; otherwise retain the exact symbolic matrix and determinant to extract stability thresholds.
- Label long-wave, weak-coupling, or other asymptotic expansions and numerical root estimates separately from exact analytical results.
- State parameter assumptions used in symbolic inequalities rather than inferring global conditions from sampled grids.
- Classify physical eigenvalues, conservation or translational zero modes, marginal or defective $\operatorname{Re}s = 0$ algebraic-growth modes, and infinite generalized descriptor eigenvalues accurately, never counting an algebraic constraint as a growing instability.
- **For open advective flows:** treat real-$\mathbf{k}$ dispersion growth as temporal modal instability only; do not infer fixed-location absolute instability without separate spatiotemporal pinch-point analysis (outside default deliverables).

## 4. Compute the numerical spectrum with SciPy

- **With numerical parameter values:** build evaluators directly from verified SymPy expressions via `sympy.lambdify` instead of retyping a second formula.
- Solve standard eigenproblems with `scipy.linalg.eig` or `eigvals`.
- **For regular pencils $A\mathbf{q} = sB\mathbf{q}$:** check singularity of $B$ or reduce constraints first, then use a generalized solver.
- **For quadratic inertial pencils $(s^2 M + s C + K)\mathbf{q} = \mathbf{0}$:** preserve the quadratic pencil in derivations, and document and verify any companion linearization used in SciPy.
- **With a modal basis:** sweep continuous wavenumbers alongside any finite domain's discrete admissible modes, including or accounting for $k = 0$ when conservation laws allow or exclude uniform perturbations.
- **With a discretized spatial operator:** evaluate refinement series without inventing a wavevector axis.
- Track modal branches across neighboring $\mathbf{k}$ via eigenvalue proximity and eigenvector overlap (or invariant subspaces near crossings and across refinements), never relying on raw eigensolver order.
- Save `parameters.json` and tidy `spectrum.csv` tables with tolerances and library versions.

## 5. Verify before interpreting

- Check scaled backward eigenpair residuals across ordinary, generalized, or polynomial forms.
- Compare numerical curves against analytical branches or characteristic residuals at representative points, thresholds, and extrema.
- Verify dimensions, reference-state residuals, decoupled limits, $k = 0$, symmetries, and asymptotic large-$k$ behavior.
- **On finite domains:** separate a continuum instability interval from permitted discrete modes (an unstable continuum band with zero allowed finite-domain modes leaves that domain linearly stable).
- **If $\operatorname{Re}s$ rises at the upper sampled wavenumber:** leave short-wave behavior unresolved without asymptotic proof.
- **If unbounded growth holds as $|\mathbf{k}| \to \infty$:** flag possible continuum ill-posedness without mistaking a numerical grid cutoff for physical regularization.
- **For non-normal or nearly defective operators:** assess left/right eigenvector conditioning or invariant subspaces, leaving threshold signs unresolved if numerical uncertainty crosses $\operatorname{Re}s = 0$.
- Treat symbolic–numerical agreement as verification of the linear stability calculation, not physical validation of the model.

## 6. Plot the dispersion relation or eigenspectrum

- **With plottable spectra:** produce publication-ready vector Matplotlib figures matched to the geometry and basis:

| Geometry and basis | Spectral figure rule |
| --- | --- |
| 1D wavevector | Plot $\operatorname{Re}s_j(k)$ (and $\operatorname{Im}s_j(k)$ or $\operatorname{Im}s_j/(2\pi)$ when oscillatory modes matter) with continuous lines for analytical continuum branches and distinct markers for numerical or discrete finite-domain modes; retain $k < 0$ unless reflection symmetry holds. |
| 2D anisotropic | Plot $\max_j \operatorname{Re}s_j(k_x, k_y)$ with labeled wavevector axes and the neutral stability contour $\max_j \operatorname{Re}s_j = 0$. |
| 2D isotropic | Use a radial 1D plot only after establishing rotational isotropy. |
| No wavevector | Plot converged eigenvalues by mode index or in the complex plane. |

- Show thresholds and unstable bands without hiding stable branches or crossings, and state units, parameters, wavenumber bounds, and admissible modes.
- **For characteristic wavelengths:** report $\lambda_* = 2\pi / k_*$ only for a finite, nonzero fastest-growing admissible mode, bounded to early-time linear selection rather than final nonlinear pattern amplitude.

## 7. Write and verify the LaTeX report

- **When writing the LaTeX report** (default unless symbolic or numerical output alone is requested): adapt `report-template.tex` with all nine unstarred `\section` and seven `\subsection` Title Case headings in exact order.
- Retain any inapplicable section with a concise physical reason rather than altering headings.
- Run the structural heading and figure-path checker: `python3 <skill-dir>/scripts/check_lsa_report.py <report.tex> --root <analysis-output-dir>`.
- **With a local LaTeX engine:** compile from a clean directory with shell escape disabled and visually inspect every rendered page, equation, table, caption, and figure (missing TeX or skipped inspection leaves compilation incomplete).
- **With independent reviewers:** run one review of algebra, numerics, reproducibility, and template structure and a second of physical assumptions, admissible modes, spectral classification, and linear-regime bounds; fix supported issues and disclose any unrun review as incomplete.

## References and runtime

- Read [spectral-formulations.md](references/spectral-formulations.md) when handling generalized pencils $A(\mathbf{k})\mathbf{q} = sB(\mathbf{k})\mathbf{q}$, algebraic constraints, second-order inertia, curvature, or bounded/nonuniform operators.
- Read [report-and-verification.md](references/report-and-verification.md) and copy [report-template.tex](assets/report-template.tex) before producing plots, tables, the report, and reviews.
- Use Python 3.10+ with [requirements.txt](requirements.txt) packages and a local LaTeX engine for PDF compilation ([scripts/check_lsa_report.py](scripts/check_lsa_report.py) uses only the Python standard library; package installation and TeX compilation are explicit steps).

## Deliverables and stopping condition

- Package full-analysis outputs in one directory without extra narrative files: self-contained `.tex` report, reproducible Python script, vector figures, `parameters.json`, `spectrum.csv`, compiled PDF (when TeX is installed), and `artifact-manifest.sha256`.
- **For narrower requests or missing inputs/tools:** deliver verified available outputs only and mark omitted items or unrun checks incomplete.
- Record SHA-256 hashes of the `.tex` report, Python calculation, `parameters.json`, `spectrum.csv`, figures, compiled PDF, and checker source in `artifact-manifest.sha256` without hashing the manifest itself; report the manifest's own SHA-256 externally.
- Bound conclusions strictly to linear perturbations and the explored parameter domain, then stop.

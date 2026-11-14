---
name: linear-stability-analysis
description: Derive, compute, plot, and report physical linear stability analyses for stationary states of 1D or 2D continuum systems. Use for reaction-diffusion, mechanical, curvature, and related spatial dynamical equations requiring analytical dispersion relations, numerical eigenspectra, or a reproducible LaTeX report. Exclude nonlinear time integration and stability analysis of numerical time-stepping schemes.
---

# Linear Stability Analysis

Determine whether infinitesimal perturbations of a stationary state grow or decay via SymPy linearization, analytical dispersion or spectral criteria, SciPy numerical eigenspectra, vector Matplotlib figures, and one self-contained LaTeX report.

## 1. Preconditions, Runtime, and Problem Setup

- Use Python 3.10+ with `requirements.txt` and a local LaTeX engine for PDF compilation (`scripts/check_lsa_report.py` uses only the Python standard library; package installation and TeX compilation are explicit steps).
- Analyze 1D or 2D continuum dynamics with any finite number of scalar or vector fields (field count is not spatial dimension), covering first-order, reduced constrained, and second-order inertial equations on infinite, periodic, or bounded domains.
- Analyze homogeneous stationary states directly; analyze nonuniform states or curved geometries only with a justified eigenbasis or verified discretized operator (no general geometry solver).
- Exclude nonlinear time integration and CFL, timestep, or numerical-scheme stability; preserve supplied equations, signs, parameters, units, terminology, and interpretation, reporting conflicts or gaps rather than altering physics.
- Inspect equations or code to record state fields, dimensions, units, stationary state, geometry, boundary conditions, constraints, parameter values or symbolic bounds, and curvature, normal, stress, strain, and Fourier sign conventions.
- Clarify ambiguities that change the reference state, linear operator, admissible modes, or stability verdict; missing numerical parameters permit a symbolic partial result only (never fabricate values, spectra, or plots).
- Stay inside the authorized root without symlinks, inspect imported code or TeX before executing, reuse existing authorization without re-pausing, and work locally unless authorized otherwise.
- When Fourier modes apply, expand perturbations using

$$
\boldsymbol{\eta}(\mathbf{x},t) = \widehat{\boldsymbol{\eta}}\exp(s t + i\mathbf{k}\!\cdot\!\mathbf{x})
$$

- Under this convention, $s\in\mathbb{C}$ gives exponential growth for $\operatorname{Re}s>0$ and angular frequency $\operatorname{Im}s$ (transform all signs consistently if another convention is declared; linear source equations carry zero perturbative truncation error).

## 2. Symbolic Derivation, Spectral Calculation, and Verification Invariants

- REQUIRED BEFORE analyzing generalized pencils, algebraic constraints, inertia, curvature, or nonuniform/bounded operators: read [references/spectral-formulations.md](references/spectral-formulations.md) (pencil regularity, quadratic/companion forms, boundary modes, branch tracking, and scaled backward residuals).
- REQUIRED BEFORE plotting spectra or writing the LaTeX report, CSV tables, or manifest: read [references/report-and-verification.md](references/report-and-verification.md) (fixed Title Case sections, CSV column layout, figure requirements, and analytical-to-numerical verification trace).
- Solve or verify all admissible stationary branches with zero simplified SymPy residual against equations, boundary conditions, and constraints (nonuniform base states require supplied or verified definitions).
- Perturb every coupled field and auxiliary variable via $\mathbf{u}=\mathbf{u}_0+\epsilon\boldsymbol{\eta}$, extract the $O(\epsilon)$ linear operator via SymPy differentiation/Jacobians showing informative intermediate algebraic steps, and justify spatial eigenfunctions before substituting $\partial_{x_j}\mapsto i k_j$ (retaining $(k_x,k_y)$ in 2D unless isotropy holds).
- Derive exact characteristic polynomials or regular matrix pencils $A(\mathbf{k})\mathbf{q}=sB(\mathbf{k})\mathbf{q}$ (retaining quadratic $(s^2M+sC+K)\mathbf{q}=0$ in derivations), separating exact thresholds from asymptotic or numerical root estimates.
- Classify physical eigenvalues, conservation/symmetry zero modes, defective $\operatorname{Re}s=0$ algebraic-growth modes, and infinite descriptor eigenvalues without counting constraints as instabilities; real-$\mathbf{k}$ growth establishes temporal instability only, never open-flow absolute instability (outside default outputs).
- Build numerical evaluators directly via `sympy.lambdify` without retyping equations, evaluate continuous wavenumbers alongside discrete finite-domain modes (including or explaining $k=0$) or a verified discretized operator refinement series without inventing $k$, and serialize tidy `spectrum.csv` and `parameters.json` outputs.
- Track branches across neighboring $\mathbf{k}$ by eigenvalue distance and eigenvector overlap or invariant subspaces (never solver return order), and check scaled eigenpair backward residuals, base-state residuals, dimensions, decoupled limits, and refinement convergence.
- Distinguish continuum instability bands from allowed finite-domain modes, leave rising sampled-edge growth unresolved without asymptotic proof, and flag proven unbounded $|\mathbf{k}|\to\infty$ growth as continuum ill-posedness without mistaking numerical grid cutoffs for physical cutoffs.
- For non-normal or nearly defective operators, assess conditioning and invariant subspaces, leaving stability unresolved when uncertainty crosses $\operatorname{Re}s=0$; note that symbolic-numerical agreement verifies the calculation, not physical model validation.
- Plot vector Matplotlib figures: in 1D plot $\operatorname{Re}s_j(k)$ (plus $\operatorname{Im}s_j(k)$ or $\operatorname{Im}s_j/(2\pi)$ when oscillatory) using lines for analytical continuum branches and distinct markers for numerical/discrete modes (retaining $k<0$ unless symmetric); in anisotropic 2D plot $\max_j\operatorname{Re}s_j(k_x,k_y)$ with neutral contours, reporting $\lambda_*=2\pi/k_*$ only for a finite nonzero fastest admissible mode as early-time linear selection.
- Adapt [assets/report-template.tex](assets/report-template.tex) per [references/report-and-verification.md](references/report-and-verification.md), keeping all nine unstarred `\section` and seven `\subsection` Title Case headings in exact order within one self-contained `.tex` report alongside the script, figures, data files, compiled PDF (when TeX exists), and `artifact-manifest.sha256`.

## 3. Completion and Verification Criteria

- Run `python3 <skill-dir>/scripts/check_lsa_report.py <report.tex> --root <analysis-output-dir>` (note this checks section headings and local figure paths only, not mathematics or scientific claims).
- Compile locally from a clean directory with shell escape disabled and visually inspect every rendered page, equation, table, caption, and figure (missing TeX or skipped visual inspection remains incomplete).
- Obtain two independent reviews of the final outputs when available (calculation/numerics/reproducibility/format and physics/modes/classification/claims), fix supported defects, rerun affected checks, and label any unrun review incomplete.
- Record SHA-256 hashes of `.tex`, script, `parameters.json`, `spectrum.csv`, figures, PDF, and checker version in `artifact-manifest.sha256` without hashing the manifest itself, record the manifest's own SHA-256 externally, and keep all claims bounded by linearity and sampled parameter ranges.

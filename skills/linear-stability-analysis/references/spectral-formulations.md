# Spectral Formulations

Use this reference when \(A(k)\mathbf{q}=s\mathbf{q}\) is insufficient, or when boundary conditions, constraints, inertia, anisotropy, higher derivatives, or geometry shape the spectrum.

## Contents

- [Common linear form](#common-linear-form)
- [Boundary conditions and admissible modes](#boundary-conditions-and-admissible-modes)
- [Constraints and generalized pencils](#constraints-and-generalized-pencils)
- [Inertial mechanics](#inertial-mechanics)
- [Curvature and higher spatial derivatives](#curvature-and-higher-spatial-derivatives)
- [Classification and thresholds](#classification-and-thresholds)
- [Numerical branches and residuals](#numerical-branches-and-residuals)
- [Sources for specialized methods](#sources-for-specialized-methods)

## Common Linear Form

Around a verified stationary state \(\mathbf{u}_0\), expand \(\mathbf{u}(\mathbf{x},t)=\mathbf{u}_0(\mathbf{x})+\epsilon\boldsymbol{\eta}(\mathbf{x},t)\) with \(0<\epsilon\ll1\). For a valid spatial mode with amplitude \(\mathbf{q}\), first-order systems typically reduce to

\[
B(\mathbf{k})\,\dot{\mathbf{q}}=A(\mathbf{k})\mathbf{q},
\qquad
\bigl[A(\mathbf{k})-sB(\mathbf{k})\bigr]\mathbf{q}=0.
\]

This is an ordinary eigenproblem only when \(B=I\) or after a justified nonsingular transformation. Use \(\det[A-sB]=0\) only on square regular pencils where the determinant does not vanish identically in \(s\).

For a homogeneous reaction-diffusion system

\[
\partial_t\mathbf{u}=\mathbf{f}(\mathbf{u})+
\sum_{a,b=1}^{d}D^{ab}\partial_a\partial_b\mathbf{u}
+\sum_{a=1}^{d}V^a\partial_a\mathbf{u},
\]

the \(\exp(st+i\mathbf{k}\cdot\mathbf{x})\) convention yields

\[
A(\mathbf{k})=J_f-
\sum_{a,b=1}^{d}D^{ab}k_a k_b
+i\sum_{a=1}^{d}V^a k_a,
\qquad
J_f=\left.\frac{\partial\mathbf{f}}{\partial\mathbf{u}}\right|_{\mathbf{u}_0}.
\]

Derive the actual supplied operator rather than copying this template; cross diffusion, coefficient gradients, field-dependent mobility, nonlocal kernels, and mixed derivatives change its form.

## Boundary Conditions And Admissible Modes

Derive spatial eigenfunctions directly with the problem's boundary conditions. For scalar second-order Laplacians:

| Domain and boundary condition | Modes | Wavenumbers |
| --- | --- | --- |
| Infinite line or plane | \(e^{i\mathbf{k}\cdot\mathbf{x}}\) | continuous real \(\mathbf{k}\) |
| Periodic interval of length \(L\) | \(e^{i2\pi n x/L}\) | \(k_n=2\pi n/L\), \(n\in\mathbb{Z}\) |
| Neumann interval \([0,L]\) | \(\cos(n\pi x/L)\) | \(k_n=n\pi/L\), \(n=0,1,\ldots\) |
| Dirichlet interval \([0,L]\) | \(\sin(n\pi x/L)\) | \(k_n=n\pi/L\), \(n=1,2,\ldots\) |

In 2D rectangles, pair the admissible modes per coordinate. Fourth-order operators require four boundary conditions and may not match these second-order modes; irregular domains or coupled/mixed boundaries that break a shared scalar basis require discretizing the full coupled operator instead of assigning an arbitrary \(k\) per field. Keep the continuous dispersion relation separate from finite-domain discrete spectra, tracking multiplicity and symmetry-related wavevectors.

## Constraints And Generalized Pencils

A singular \(B\) usually indicates algebraic constraints, Lagrange multipliers, incompressibility, or static variables; never invert \(B\), regularize arbitrarily, or count all solver outputs as physical growth rates:

1. Linearize dynamical equations and constraints together.
2. Identify physical variables, algebraic variables, gauge freedoms, and boundary constraints.
3. Eliminate constrained variables analytically or project onto a constraint-compatible subspace when justified and documented.
4. Otherwise keep a regular descriptor pencil and inspect generalized pairs \((\alpha,\beta)\), taking finite eigenvalues \(s=\alpha/\beta\) only for \(\beta\ne0\).
5. Pairs with \(\beta=0,\alpha\ne0\) are infinite descriptor eigenvalues, not infinitely fast physical instabilities; \(\alpha=\beta=0\) indicates a singular or ill-posed formulation.

Verify rank and pencil regularity across the parameter regime; a pencil singular for all \(s\) requires reformulation before claiming stability.

## Inertial Mechanics

For second-order perturbation dynamics \(M\ddot{\mathbf{q}}+C\dot{\mathbf{q}}+K(\mathbf{k})\mathbf{q}=0\), keep the quadratic pencil

\[
P(s)\mathbf{q}=\bigl[s^2M+sC+K(\mathbf{k})\bigr]\mathbf{q}=0
\]

in derivations and analytical results. Any first-order companion linearization is purely numerical: state its construction, verify signs and dimensions, and check computed pairs with \(\|P(s)\mathbf{q}\|\) alongside the companion residual. Singular mass matrices \(M\) require constraint reduction before companion linearization. Identify rigid-body or gauge zero modes and analyze stability modulo those symmetries or qualify the verdict explicitly.

## Curvature And Higher Spatial Derivatives

Declare normal orientation, signed-curvature sign, mean-curvature normalization, and displacement direction before varying geometric laws on the stated reference surface (never copy flat Monge-gauge formulas onto curved base surfaces). Flat constant-coefficient bending typically produces \(k^4\) terms whose sign follows the supplied energy, force, mobility, and curvature conventions. Curved surfaces require covariant operators, their eigenfunctions, and curvature-induced lower-order or tangential couplings.

When the base state is nonuniform, Fourier modes couple: linearize in physical space, apply a validated spectral, finite-element, or finite-difference discretization, show refinement convergence, separate matrix eigenvalues from the continuum spectrum, and plot converged eigenvalues by mode index or in the complex plane without inventing a wavevector axis.

## Classification And Thresholds

For each finite-dimensional modal problem under \(\exp(st)\), classify finite physical eigenvalues as: unstable if any physical eigenvalue has \(\operatorname{Re}s>0\); asymptotically decaying if all satisfy \(\operatorname{Re}s<0\); marginal or neutral only after accounting for every \(\operatorname{Re}s=0\) mode with none positive; and algebraically growing if a \(\operatorname{Re}s=0\) eigenvalue is defective (Jordan chain gives polynomial growth).

Note whether conservation or symmetry forces a \(k=0\) zero mode while nonzero modes decay. On infinite or continuum domains, mode-wise \(\operatorname{Re}s<0\) alone does not prove uniform semigroup decay without spectral-gap or resolvent control, and non-normal finite operators can amplify transiently even when all \(\operatorname{Re}s<0\). Real-\(\mathbf{k}\) spectra establish temporal growth only; open advective systems require separate spatiotemporal evidence for absolute instability (outside default deliverables).

Locate stationary onset via \(s=0\) only on real critical branches, and oscillatory onset via \(s=i\omega\) (\(\omega\ne0\)) on real and imaginary parts; check transversality or flag degenerate onset. Where dominant branches swap, bracket thresholds using \(\max_j\operatorname{Re}s_j\) while retaining branch identities instead of taking coarse sign-change steps.

## Numerical Branches And Residuals

Compile numerical matrices via `sympy.lambdify`, storing complex eigenvalues and right eigenvectors per \(\mathbf{k}\). If conditioning requires scaling, record the transform and map eigenvectors back to physical variables. Track branches across neighboring points via normalized eigenvalue distance combined with eigenvector overlap, and follow invariant subspaces across exact degeneracies while checking symmetry-related 2D directions independently.

Check backward residuals using explicit norms and scales, such as

\[
r=\frac{\|A\mathbf{q}-s\mathbf{q}\|_2}{\|A\|_2\|\mathbf{q}\|_2+|s|\|\mathbf{q}\|_2+\delta}
\]

with declared small \(\delta\) (adapting numerator and denominator consistently for \(A\mathbf{q}=sB\mathbf{q}\) or \(P(s)\mathbf{q}=0\)), choosing tolerances from precision, conditioning, and matrix scale. For non-normal or nearly defective problems, assess eigenvalue conditioning with left/right eigenvectors, invariant-subspace, higher-precision, or perturbation checks, leaving sign and threshold classification unresolved if uncertainty crosses \(\operatorname{Re}s=0\); normal well-separated cases need only proportionate residual and analytical checks.

Compare analytical and numerical results at interior points, both sides of thresholds, extrema, crossings, \(k=0\), and justified large-\(k\) limits within the model's physical validity range. Unresolved growth at the sampled edge remains unresolved without asymptotic analysis; proven unbounded growth as \(|\mathbf{k}|\to\infty\) flags possible continuum ill-posedness (numerical grid cutoffs never supply physical wavelength selection).

## Sources For Specialized Methods

Cite only sources whose methods are used in the report:

- [SymPy mechanics linearization documentation](https://docs.sympy.org/latest/explanation/modules/physics/mechanics/linearize.html) for symbolic linearization conventions.
- [SciPy generalized eigensolver documentation](https://docs.scipy.org/doc/scipy/reference/generated/scipy.linalg.eig.html) for ordinary, generalized, and homogeneous eigenvalue output.
- [Tisseur and Meerbergen, "The Quadratic Eigenvalue Problem"](https://eprints.maths.manchester.ac.uk/466/1/38198.pdf) for quadratic pencils and companion linearizations.
- [Manning, Bamieh, and Carlson, "Descriptor Approach for Eliminating Spurious Eigenvalues in Hydrodynamic Equations"](https://arxiv.org/abs/0705.1542) for constraint-aware descriptor formulations.
- [Capovilla, Guven, and Santiago, "Deformations of the Geometry of Lipid Vesicles"](https://arxiv.org/abs/cond-mat/0212118) for geometric variations on curved interfaces.

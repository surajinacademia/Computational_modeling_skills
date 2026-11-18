# Model Types and Brainstorming Scope

- Use this guide during Section 1 of [computational-modeling](../SKILL.md), before selecting equations or implementation methods.
- Treat these as overlapping descriptions of purpose, assumptions, and mathematical treatment, not a mutually exclusive hierarchy of model quality. “Theoretical” is a broad term; here it names work centered on analytical deduction.
- For each candidate, ask what the user wants to learn, why that approach fits, and what a simpler alternative cannot answer. Recommend a supported approach through lets-be-clear, then agree on the task-specific table and deliverables.
- Read **Needed** as necessary for the stated claim, **Not needed by default** as work not justified by that claim alone, and **Agree during brainstorming** as choices to settle before starting. A quantitative prediction can require more evidence than an explanatory example of the same model.

## Empirical models — Out of scope

- Fit a mathematical relationship directly to observations without specifying a physical mechanism. Coefficients can carry units and descriptive meaning without identifying a physical cause.
- **Example:** Fit measured drag force at speed $v$ with a polynomial, $F_d(v)=a_0+a_1v+a_2v^2$. Here $F_d$ is drag magnitude and the $a_i$ are fitted coefficients; a good fit alone does not establish why drag occurs.
- Use this comparison to identify a request that belongs outside this skill. Experimental data and calibration of physically motivated model parameters remain supported.

| Needed for this approach | Not needed by default | Agree during brainstorming |
| --- | --- | --- |
| Measured inputs and outputs, units, uncertainty, and sampled domain | Governing physical equations or a microscopic derivation | Is the goal only interpolation or prediction from observations? |
| A fitting criterion, complexity control, and independent evaluation for predictive claims | Mechanistic interpretation of fitted coefficients | If yes, use a suitable fitting workflow instead; do not silently relabel it phenomenological. |

## Phenomenological models — Supported

- Encode observed behavior through effective laws constrained by relevant symmetries, scaling, or physical restrictions. Parameters may be fitted or estimated without a microscopic derivation; the constraints and valid regime must be justified.
- **Example:** For nonnegative speed $v$, approximate drag magnitude by $F_d(v)=b_1v+b_2v^2$, where $b_1$ and $b_2$ are effective drag coefficients. This is phenomenological when the linear and quadratic terms have a physical scaling rationale; the same polynomial used only as a fit is empirical. Ginzburg–Landau theory is another familiar effective description.

| Needed | Not needed by default | Agree during brainstorming |
| --- | --- | --- |
| Target observable, regime, effective law, relevant symmetries and constraints | Derivation of every coefficient from microphysics | Which effects and scales must the law represent? |
| Parameter meanings, units, sources, and calibration evidence when fitted | Atomistic resolution or every microscopic interaction | Which parameters are free, fixed, or unresolved? |
| Numerical checks when solved computationally; independent data for physical predictive claims | Validation outside the agreed prediction regime | What accuracy, calibration/validation split, and regime define success? |

## Theoretical or analytical models — Supported

- Deduce consequences from stated laws and assumptions, often analytically or asymptotically. Material properties may still need measurement; analytical treatment does not guarantee physical correctness or eliminate uncertainty.
- **Example:** Stokes' law gives drag magnitude $F_d=6\pi\mu Rv$ for a sphere of radius $R$ moving at speed $v$ in a Newtonian fluid of dynamic viscosity $\mu$. It assumes creeping flow, with Reynolds number $\mathrm{Re}\ll1$, a no-slip sphere surface, and an effectively unbounded fluid. Finite boundaries or larger Reynolds numbers can invalidate this approximation.

| Needed | Not needed by default | Agree during brainstorming |
| --- | --- | --- |
| Starting laws, definitions, geometry, assumptions, and applicable limits | A simulation implementation for a derivation-only question | Exact result, approximation, scaling argument, or asymptotic limit? |
| Traceable derivation, dimensions, limiting checks, and parameter sources | A claim that every coefficient is a universal known constant | Which terms may be neglected, and what controls that approximation? |
| Independent empirical evidence if claiming validity for a real system | Mesh or timestep studies when no numerical solve is used | Is the deliverable a derivation, a physical prediction, or both? |

## Mechanistic models, including ab initio — Supported

- Represent explicit processes or interactions through governing laws or rules. They can be continuum, discrete, coarse-grained, or microscopic and can use measured or calibrated constitutive parameters.
- Reserve **ab initio** or **first principles** for a justified microscopic starting point; disclose approximations and any empirical inputs. Mechanistic does not automatically mean microscopic, parameter-free, expensive, or broadly valid.
- **Continuum example:** Solve the Navier–Stokes equations for fluid velocity and pressure using specified material properties, geometry, and boundary conditions. These are continuum equations, not a direct solution of microscopic molecular motion.
- **Microscopic example:** Solve the stationary Schrödinger equation $\hat{H}\psi=E\psi$, where $\hat{H}$ is the Hamiltonian, $\psi$ the quantum state, and $E$ its energy. Specify the Hamiltonian and approximations before describing the calculation as ab initio.

| Needed | Not needed by default | Agree during brainstorming |
| --- | --- | --- |
| Entities, interactions, governing laws, scales, geometry, and conditions | Microscopic resolution for a continuum question | Which mechanism and scale must be resolved? |
| Constitutive closures, parameter sources, and disclosed approximations | Parameter-free prediction unless the stated first-principles claim requires it | Which inputs are measured, calibrated, derived, or assumed? |
| Conservation/limit checks, solution accuracy, and empirical tests appropriate to the claim | A more expensive solver or ab initio calculation for its own sake | What competing mechanism, observable, accuracy, and compute budget matter? |

## Toy or minimal models — Supported

- Deliberately simplify a system to isolate a mechanism or qualitative consequence. They can have exact mathematical predictions while offering limited quantitative realism for the target physical system.
- **Example:** A simple harmonic oscillator obeys $\ddot{x}+\omega^2x=0$, where $x$ is displacement, dots denote time derivatives, and $\omega$ is angular frequency. It isolates restoring-force oscillations while omitting damping and forcing. The one-dimensional Ising model is another minimal model, with a different scientific purpose.

| Needed | Not needed by default | Agree during brainstorming |
| --- | --- | --- |
| One explicit question, retained mechanism, and deliberate simplifications | Full biological or material realism | Which effect is essential, and which details may be discarded? |
| Consistent equations, conditions, and analytical or numerical checks | Fitting every parameter to experimental data | What qualitative behavior or mathematical result is the deliverable? |
| A stated connection to the target system and limits on interpretation | Absolute real-system accuracy for a qualitative demonstration | Is the aim intuition, a proof of principle, or a quantitative prediction? |

## Statistical and stochastic models — Supported

- Describe distributions, fluctuations, or ensembles. Statistical descriptions need not simulate random trajectories; stochastic dynamics explicitly includes randomness. Either treatment can overlap a mechanistic, phenomenological, or minimal model.
- **Example:** Langevin dynamics uses $m\dot{v}=-\gamma v+\eta(t)$ for a particle of mass $m$, velocity $v$, friction coefficient $\gamma$, and random force $\eta$. Specify the noise law; equilibrium white thermal noise at temperature $T$ has zero mean and covariance $\langle\eta(t)\eta(t')\rangle=2\gamma k_B T\delta(t-t')$, where $k_B$ is Boltzmann's constant and $\delta$ the Dirac delta. A Boltzmann distribution describes equilibrium state probabilities without requiring an individual trajectory.

| Needed | Not needed by default | Agree during brainstorming |
| --- | --- | --- |
| State/ensemble definition, probability or noise law, correlations, and physical rationale | A unique deterministic trajectory | Equilibrium distribution, fluctuations, transitions, or time evolution? |
| Sampling method; stochastic interpretation when relevant; random-number generator version, stream assignment, and seed records for sampled calculations | Random sampling when an analytical ensemble calculation suffices | Which observable, ensemble size/error criterion, and timescales matter? |
| Distribution or moment checks, correlation-aware uncertainty, and convergence for sampled claims | Trajectory-by-trajectory agreement across independent random seeds | What uncertainty and rare-event resolution are acceptable? |

## Surrogate or machine-learned models — Out of scope

- Replace a costly model's input/output map with a cheaper approximation, often fitted or learned from simulation outputs. Neural networks and Gaussian processes are common examples; surrogates need not use machine learning, and machine learning need not be a surrogate.
- **Example:** Train a Gaussian process on expensive fluid simulations to predict drag rapidly. This skill can work on the underlying physical solver but does not build, train, tune, or validate the emulator.

| Needed for this approach | Not needed by default | Agree during brainstorming |
| --- | --- | --- |
| Training/reference outputs, input coverage, fitting method, and independent evaluation | A new physical derivation inside the approximator | Is the requested deliverable an emulator or a physical model? |
| Approximation-error and out-of-distribution assessment | Repeating the expensive solve for every prediction | Handle emulator or ML work outside this skill; agree separately on any underlying physical-model work. |

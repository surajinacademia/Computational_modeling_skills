# Scientific Validation

Verify production code and data before treating outputs as scientific evidence, choosing checks by model class and claim; physical validation also requires empirical evidence under stated conditions.

## Common sequence

1. Derive independent tests from the frozen specification.
2. Run the smallest diagnostic capable of catching sign, unit, indexing, boundary, conservation, sampling, or stopping coding errors.
3. Test production code directly rather than relying on a toy oracle.
4. Benchmark representative workloads before changing algorithms, precision, parallelism, storage, or language.
5. Freeze the accepted code and configuration before running assessment evidence.
6. Verify raw coverage and invariants before analyzing or plotting.

Never use visually plausible outputs as a test oracle. The verification reviewer must derive checks from the specification independently of the code and recompute decisive observables and uncertainty from raw outputs (or verify analytical proofs), rather than copying the code's formula or trusting its summary. Record unperformed checks honestly.

## Verification and check profiles

### Algebraic or analytic

- Check dimensions, signs, limiting cases, and exact identities.
- Compare against hand derivations or independent symbolic/numerical evaluation.
- Test singular, zero, boundary, and symmetry cases.

### ODE, PDE, continuum, or field model

- Verify initial and boundary conditions independently.
- Test conservation or balance laws with the proper geometric measure.
- Check manufactured solutions or known limits when available.
- Establish timestep, grid, domain, and solver convergence for the claimed precision.
- Verify stability, positivity, residuals, and stopping rules without clipping or silent early exits.

### Stochastic or agent-based

- Bind and log deterministic seeds while keeping draws independent.
- Check update order, distribution parameterization, and RNG scope.
- Verify sampling units, inclusion rules, replicate coverage, and denominators.
- Report ensemble uncertainty instead of a single favorable realization, separating displayed instances from population claims.

### Optimization, learning, or inference

- Verify objective, constraints, gradients or update rules, and convergence.
- Keep training/calibration, tuning / model-selection set, and held-out evaluation set disjoint.
- Log seeds, initialization, baselines, preprocessing, and checkpoint policies.
- Report failed or nonconverged runs under the declared policy.

### Experimental data analysis

- Verify sample identity, independence, exclusions, normalization, units, and preprocessing order.
- Reproduce the estimator, uncertainty, statistical test, and multiple-comparison rule.
- Check whether error bars reflect replicates, samples, or fitted uncertainty.

### Optimized, parallel, or translated implementation

- Define equivalence criteria before comparing implementations.
- Test baseline vs modified paths on adversarial and representative inputs.
- Preserve precision, randomness, update order, convergence, failure handling, and output semantics, accepting the change only after all equivalence checks pass.

## Evidence checks

For each assessment run, log target ID, governing revision/hash, source IDs, code version/hash, configuration, command, minimal environment, raw-output path, exit state, and failures; for detached, retried, multi-worker, or costly runs also keep manifests, logs, checkpoints, key coverage, duplicates, missing groups, and file hashes.

Verify in order:

1. provenance and configuration;
2. parameter/replicate keys and denominators;
3. finite values, expected columns and types, units, and physical invariants;
4. independently recomputed analysis and uncertainty;
5. declared scientific assessment criteria;
6. plots as faithful renderings of verified values.

Stop affected runs and save evidence if an invariant, validity check, or predeclared stopping rule fails, diagnosing the cause before citing affected outputs. Disagreement or inconclusive evidence under declared rules can still complete an assessment; finish the authorized protocol unless a stopping rule triggers, without changing targets or dropping disagreeing runs.

Account for all material attempts (completed, failed, excluded, missing, and nonconverged) with reasons and accurate denominators, tracking which outputs entered each calculation (zero exit codes or plot files do not prove valid execution). Retain raw evidence and prior outcomes if criteria change later, marking revised analysis exploratory until separately assessed.

## Keep fidelity and outcome separate

Methodology fidelity measures how faithfully the executed method matches the source; scientific verdict measures the selected observable. A known deviation can agree numerically while an exact implementation can disagree, so report both separately. `exact_agreement` denotes exact equality on a frozen deterministic observable, never proof that code or mechanism is identical to the author's.

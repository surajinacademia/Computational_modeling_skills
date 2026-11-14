# Project instructions

## Scope and sources

- Use [README.md](README.md) for project purpose, navigation, environment, entry points, and verification commands. Inspect the files and references relevant to the task before changing them; verify that documented paths still exist.
- Preserve unrelated user edits, source data, archives, saved results, and substantive temporary work. A documentation or metadata inspection does not authorize model execution or notebook restructuring.
- Complete the requested work and its relevant authorized checks. Ask only when inspected evidence cannot resolve a decision that materially changes the scope, result, or required authorization; do not ask again for permission already provided.

## Coding principles

- Keep implementations simple, readable, and focused on the requested change.
- Reuse existing routines and established libraries. Introduce abstractions only for demonstrated reuse or a clearer expression of the computation.
- Keep comments and docstrings current with changed behavior. Explain non-obvious scientific, numerical, or programming choices rather than restating syntax.
- Use portable paths with an explicit project, script, or user-supplied base; avoid new machine-specific absolute paths in reusable code.
- Use clear names and follow the language and project conventions. Keep computational inputs explicit, make mutations visible, and separate calculation from file I/O and presentation where this improves clarity or reuse. Optimize only for a demonstrated need.

## Error diagnosis and verification

- During error diagnosis in code, isolate a representative failing case and identify the cause before choosing a fix.
- Use the smallest decisive checks for the changed behavior or material claim, and complete applicable required checks. Reuse valid evidence; rerun affected checks when code, inputs, or assumptions change, and broaden verification only for unsupported claims or unresolved uncertainty.
- For input format and bounds checks, use one check per distinct plausible failure mode; do not re-check invariants guaranteed by the preceding operation.
- Expose unexpected warnings, failed checks, and missing required results. Fix the cause or report it with context; do not suppress or silently skip failures to claim success.
- In executable workflows, run input format and bounds checks for plausible failures, prefer established readers for standard formats, check invoked commands' exit status, and stop dependent steps when a prerequisite fails. Preserve diagnostics and identify the failed stage in summaries.
- Preserve source files and stored outputs during read-only checks; use temporary copies or isolated checks when needed. Existing outputs alone do not establish that the current code ran.
- Add known-output checks when they protect meaningful behavior or a realistic failure. Avoid tests that merely repeat the implementation and broad reruns for prose-only changes.
- Report the checks actually performed, their outcomes, and any remaining verification gaps or uncertainty.

## Organization and reproducibility

- Keep source code, original inputs, generated results, and documentation distinguishable. Follow the current README layout; create directories only when needed and update affected links and commands when maintained paths change.
- Keep original data intact. Record source, dataset version/accession, retrieval date and retriever where applicable, and a checksum or other content identifier when needed; a changing URL alone does not identify an input. Preserve permitted snapshots or immutable retrieval/storage instructions and access restrictions. Write derived data and generated files to the documented output locations; retain the source and transformation needed to reproduce them.
- Use the documented project environment and dependency specification. Record dependency changes in the appropriate manifest; do not rely on an undocumented personal environment.
- For retained results, record enough to reproduce them: source identity and revision with recoverable uncommitted changes, or a source snapshot/hash when Git is absent; input provenance, parameters, relevant seeds and numerical settings, environment, command or notebook procedure, and output locations. Use the existing project records.
- For performed experiments, maintain dated research entries linking the question, reasons for choices, run/procedure, observations, evidence for conclusions, limitations, and next step. Explain unsuccessful attempts; distinguish execution failure from a scientifically informative negative result. Preserve earlier interpretations and date corrections. Use an existing log when available and disclose missing historical rationale.
- Record the ordered operations needed for repetition. Pass explicit settings and paths to helper code and document script inputs, outputs, options, and working directory. Replace intermediate hand edits with transformations or replayable corrections; disclose remaining manual steps. Grow automation with demonstrated complexity, reuse, or the requested interface.
- Keep partial and failed output files distinguishable from completed outputs. Finalize temporary output files after successful writing and checks; mark a multi-file run complete only after all required output files are checked. Reuse completed steps only with matching inputs, relevant source, settings, and environment and complete required outputs. Resume interrupted work from a verified, compatible execution checkpoint with matching provenance, retaining incomplete status until final checks pass; otherwise restart the affected step as a new attempt. Preserve prior results and failed-run evidence; inspecting progress must not silently launch computation. Follow the README's procedures and distinguish completion from scientific validation.

## Skills

- Apply relevant available skills when their stated triggers match the task. Follow those skills for their workflows; do not duplicate their detailed instructions here.
- For scientific model work, use `$computational-modeling`; for scientific notebooks, use `$scientific-notebook`. Follow the requested file format and let the notebook skill govern notebook maintenance and execution.
- Refer to installed shared skills instead of copying them into each repository. If a required skill or tool is unavailable, report the limitation and continue independent authorized work without claiming that workflow is complete.

## Scientific work, when applicable

- Preserve governing equations, established notation, parameter meanings, and existing parameter values unless a change is explicitly requested. Resolve conflicts between equations, code, documentation, and expected results before changing scientific meaning.
- Distinguish coding errors, numerical errors, and model limitations. Do not present changed physics as a code correction or tune a model merely to produce an expected outcome.
- Support material claims with inspected evidence appropriate to the claim. Explain the mechanism, assumptions, regime, and limits; distinguish derivation, numerical evidence, inference, and unresolved uncertainty. Label unimplemented mechanisms as hypotheses.
- Define quantities, symbols, and units, and explain what each term in an equation represents. For comparisons, state what each case represents and which results should agree.
- Preserve model identities and targeted versions. A folder label, source revision, parameter study, and verified release are different things; follow the modeling skill when a new model version is requested.
- Full simulations and sweeps require task authorization; targeted verification remains part of an authorized code edit.

## Git, external actions, and delegation

- Follow the [Git workflow](README.md#git-workflow) for authorized edits: preserve inherited changes and staging, isolate concurrent editing in separate worktrees, and commit verified task-owned work at meaningful checkpoints. Review the exact proposed commit and run configured staged-content checks; preserve unfinished work in scoped recovery copies and report commits and checks. Respect any narrower project-specific authorization.
- Check existing Git boundaries before initialization. Requested setup of a new standalone project includes local Git initialization; preserve existing repositories and their history. If Git is unavailable, preserve affected files and report the limitation.
- Push, create remote repositories, or create tags/releases only when requested or already authorized. Stage only the intended files or hunks; exclude unrelated work and unrequested generated files.
- Discarding local changes, rewriting shared history, force-pushing, deleting branches, and destructive cleanup require specific authorization. Preserve concurrent work when choosing a branch or worktree.
- Send external messages or publish material only when explicitly authorized. Keep credentials and private data out of tracked files and shared output files.
- Use subagents only when explicitly requested for the current task.
- Create, fork, or message other tasks only when explicitly requested; authorization to use subagents does not authorize those actions.

## Communication and maintenance

- Answer the current question directly, using concise, connected prose. Include the evidence, reasoning, and uncertainty needed to understand the result; scale detail to the request.
- Keep durable agent instructions here, project setup and navigation in the README, and detailed task workflows in skills or linked documentation. Merge equivalent rules and remove obsolete guidance when updating these files.

## Project-specific rules

No project-specific exceptions are configured in this template. Add only the scientific constraints, protected paths, workflow exceptions, and authorization boundaries that this project needs. Keep concrete environment and command details in the README.

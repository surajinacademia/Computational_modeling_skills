# Physics-Focused Model Document Template

Read before proposing a model-document plan; explicit plan approval is required before writing or editing any document. Use one document for the model, mathematical solution method, and short implementation record. This template defines required structure and section content; the skill governs approval, evidence handling, scientific writing, and independent review.

## Contents

- [Fixed skeleton](#fixed-skeleton)
- [Title and source](#title-and-source)
- [Section guidance](#section-guidance)
- [Writing and verification](#writing-and-verification)
- [Writing-format resources](#writing-format-resources)

## Fixed Skeleton

Keep these required headings literally, including numbering, capitalization, and order. Add descriptive fourth-level headings inside required subsections when distinct mechanisms (such as cell motion, chemical steering, or bond turnover) need separate explanations. Use connected paragraphs for reasoning, lists for parallel or sequential items, keep inapplicable sections with a reason, and mark proposed or unknown details explicitly.

```markdown
# <Model Name>

Implementation: [<primary source filename>](<relative source path>)

Model version control name:

## 1. Purpose, Questions, and Hypothesis

## 2. Mechanism and Assumptions

## 3. Notation, Parameters, Values, and Evidence

## 4. Governing Model

### 4.1. Model Equations

### 4.2. Mechanistic Steps

### 4.3. Initial and Boundary Conditions

## 5. Observables and Outputs

## 6. Method

### 6.1. Methodology and Rationale

### 6.2. Numerical Formulation

### 6.3. Algorithm and Flowchart

### 6.4. Verification, Validation, and Required Scientific Tests

## 7. Model Record and Implementation History

### 7.1. Scripts and Version History

### 7.2. Method Decisions and Changes

### 7.3. References
```

## Title And Source

Use only the scientific model name (such as `Active Gel Contact Formation Model` or `Chemotactic Model`), without administrative prefixes like `Canonical Model Documentation` or `Model Documentation`.

Place `Implementation:` as the first nonblank line below the title. Keep the exact filename and relative path even if it contains a repository-forbidden prose term. Link the primary Python file for Python models, else the primary source file; it must resolve to a non-symlink regular file inside the selected repository boundary. Never substitute an unrelated file for missing code.

For an unimplemented model with a source plan, use:

```markdown
Implementation: Not implemented; plan: [<plan filename>](<relative plan path>)
```

If the approved plan lives only in the conversation, use this literal line:

```markdown
Implementation: Not implemented; source: user-approved plan in this conversation.
```

Never create a second file just to supply a header link. Report inaccessible code during planning and resolve the header with the user rather than mislabeling inaccessible code as unimplemented.

Every model document (including unimplemented models) must place the literal field `Model version control name:` after `Implementation:` and before Section 1. Populate it only by copying an explicitly recorded model version or release name that applies to the documented model, citing its source in Section 7.1. Never invent a name or substitute a Git branch, commit ID, or plugin version; if none applies, leave the value literally blank rather than writing `unknown` or `N/A`. Keep the separate Section 7.1 revision, dirty-state, and content-hash record in either case.

## Section Guidance

### 1. Purpose, Questions, and Hypothesis

Open with the phenomenon and physical abstraction in words before introducing symbols. State the model variant, implemented vs proposed status, question, testable hypothesis, and observable comparison or intervention that would support or weaken it (predictions are conditional consequences, not results).

Scientific validation requires independent physical observations or experimental targets appropriate to the claim; mathematical benchmarks verify calculations without validating biological assumptions. When physical evidence is absent, state so and specify the needed tests in Section 6.4.

### 2. Mechanism and Assumptions

Explain entities, domain and spatial dimension, boundary geometry, interactions, and driving processes in connected prose giving a physical picture before the notation. State inclusions and exclusions; for each consequential assumption, connect rationale, supporting source or evidence, and limitation (use a list for independent assumptions). Distinguish evidence for a phenomenon from evidence for its constitutive law, never presenting unsupported biology as fact.

Describe fields, graph directionality and edge meaning, geometry, and dimensional vs nondimensional formulation as applicable, distinguishing physical radius, effective diameter, and interaction scale. Reserve global notation for Section 3 (defining any earlier symbol before first use) and prescribe initial and boundary conditions in Section 4.3 without repeating them here.

### 3. Notation, Parameters, Values, and Evidence

Use this section as a compact reference for global notation, state variables, physical parameters, derived scales and dimensionless groups, and numerical controls. Use one table for small models or split by role (introducing each table with a short sentence or bold label) when scanning improves. Table entries supplement but do not replace local explanations beside equations. Use tables elsewhere only for genuine comparisons. Use exactly these five columns, with mathematical notation in brackets after the quantity name (e.g., `Mass [$m$]`); keep code names in Section 7.1 unless needed to disambiguate a parameter, omit extra category/code/range columns, put supported citations in the last column, and leave unavailable citations literally blank without inventing sources or placeholders:

| Quantity [notation] | Units | Values or range | Meaning or rationale for inclusion | Citation source |
| --- | --- | --- | --- | --- |
| Quantity name [symbol] | Units or dimensionless | Supported value, definition, or range | Physical meaning and why it is included | |

Order rows by dependency: indices and coordinate/time conventions, state variables, parameters, derived quantities, and numerical controls, defining each symbol before referencing it in another row. State variables have domains and evolution/initialization definitions (referring to Section 4.3 for initial states), not fixed parameter defaults. Label dimensionless groups, normalized quantities, and indices explicitly.

Distinguish literature estimates, derived values, calibrated parameters, illustrative choices, proposed values, and unresolved values (proposed models have proposed values, not implemented defaults). Use `not specified` for unestablished ranges and `not applicable` where range has no role; never invent values or ranges. Separate mathematical admissibility, code-enforced bounds, and experimentally supported regimes (a range is not a sweep, and a code default is not physical evidence).

Explain the physical meaning of scales and dimensionless groups in short paragraphs; locally used derived symbols may instead be defined immediately before first local use. List timestep, tolerance, iteration-limit, and control values here while placing numerical rationale in Section 6.2 and accuracy/stability requirements in Section 6.4. Keep symbols, meanings, values, and units consistent throughout.

### 4. Governing Model

Present governing relations, causal mechanism, and prescribed conditions below.

### 4.1. Model Equations

Order equations by physical dependence rather than file order. For each law, give the physical idea, define new symbols, write the simplest faithful equation, and explain what each term, factor, sign, or piecewise branch does physically, briefly recalling prior symbols so the equation reads locally. Include a clarifying limit or qualitative consequence when helpful. State conditions, coupling, deterministic or stochastic character, and source-backed rationale.

Use ordinary derivatives, gradients, sums, and piecewise rules when sufficient; define vector conventions and noise correlations before use, never invent formal operators for code calls, and keep inherently discrete rules explicit (labeling unsupported continuous interpretations as inferences).

Separate implemented, optional, proposed, legacy, and unresolved relations; never present approximations as identities, and include only derivations that clarify choices. Place numerical safeguards in Section 6.2 unless they change effective physics, in which case state the physical effect here and cross-reference Section 6.2.

### 4.2. Mechanistic Steps

Describe causal physical interactions in connected prose (use numbered steps only for intrinsically ordered events), referencing Section 4.1 rules. Explain how each process drives the next and mark simultaneous or coupled processes without inventing physical ordering; include intrinsically discrete transition rules when part of the model. Separate physical causality from numerical operator splitting or timestep order (Section 6.3), never duplicating the solver or reinterpreting numerical order as physics.

### 4.3. Initial and Boundary Conditions

Prescribe initial states and mathematical boundary conditions: placement distributions, polarity or velocity, graph and field states, random-seed role, periodic distance convention, and fixed, reflecting, absorbing, or flux conditions (explain why an unbounded ODE needs no spatial boundary condition).

Describe preliminary relaxation when it alters the scientifically interpreted initial state, separating temporary relaxation rules and stopping criteria from the governing model and stating whether the relaxed state is recorded as $t=0$.

### 5. Observables and Outputs

Define each measured or derived observable mathematically, with physical meaning, units, normalization, sampling interval, averaging or ensemble, and uncertainty. Connect observables to Section 1 without repeating the hypothesis, and identify which comparison discriminates the mechanism from alternatives. Summarize stored states, derived outputs, save cadence, and interpretation conventions concisely, mapping exact source fields to scientific meanings in Section 7.1.

Label recurrence residuals or source-agreement checks as numerical consistency rather than physical observables. Link existing analyses for measured values, fits, sweep figures, or conclusions without embedding those results or creating a separate results file.

### 6. Method

Explain how the model is solved and how numerical and scientific adequacy are assessed.

### 6.1. Methodology and Rationale

Summarize the overall solution approach (analytic, numerical integration, relaxation, or event-driven) and why it fits the equations, scales, and question. Leave discrete formulas to Section 6.2, solve order to Section 6.3, and evidence-backed history to Section 7.2.

### 6.2. Numerical Formulation

Define numerical indices, timestep, discretization, and old, intermediate, and updated states before use, deriving discrete updates far enough to reconstruct each step. State explicit, implicit, split, or event-driven treatment; spatial interpolation or neighbor search; noise distribution, independence, and timestep scaling; and solver residuals, tolerances, and stopping or failure rules. For stochastic code, identify the RNG and version-sensitive dependencies, stream/seed assignment, shared vs independent draws, and draw order (never implying a seed alone reproduces runs across generators or execution orders).

Reference Section 3 control values and explain their numerical treatment and rationale here, defining locally needed numerical indices just before use. Explain truncation, caps, cutoffs, regularization, and singular-case handling (including changes to effective physics), and state when a numerical safeguard or option is absent rather than inventing one.

### 6.3. Algorithm and Flowchart

Open with a short paragraph summarizing one complete timestep or solve cycle, then write mathematical pseudocode using Section 6.2 symbols and equations. Specify inputs, outputs, initialization, state timing, dependencies, conditions, random draws, loop bounds, termination, and failure behavior, defining assignment notation before use rather than listing function names.

Embed a compact Mermaid flowchart for coupled or branching workflows (or when requested) matching the pseudocode and source/approved plan; for simple nonbranching code, state briefly why no flowchart is needed. Never create a separate diagram file, add absent operations, or conflate state advancement with measurement and serialization.

### 6.4. Verification, Validation, and Required Scientific Tests

Agree on relevant scientific tests and acceptance criteria during planning, connecting each to the model question or calculation validity (software unit tests alone do not establish scientific adequacy). Separate these categories (lists for independent checks, prose for rationale):

- **Numerical verification:** check that equations are solved accurately via error norms, analytic or manufactured references, dimensions, limiting cases, conservation or dissipation, stability, discretization convergence, and stochastic statistics (stability alone does not guarantee accuracy).
- **Sensitivity:** evaluate how uncertain physical parameters, assumptions, or numerical choices affect observables, separating stable conclusions from numerical artifacts.
- **Physical validation and hypothesis tests:** identify independent empirical evidence and comparisons or interventions that support, weaken, or discriminate the hypothesis from alternatives and confounders (source agreement, recurrence checks, and convergence cannot establish physical validity).

For each applicable test, give purpose, observable or error metric, reference or comparison, and evidence-based acceptance criterion or expected discriminating outcome (stating any unresolved criterion to agree or obtain). Never impose universal numerical thresholds, invent targets, or confuse proposed tests with executed records.

Planning or approving tests does not authorize simulations or experiments; get explicit execution authorization before running them. Disclose missing evidence and limitations, keep error tables, results, and transcripts outside the document (link existing records), and never imply a described test ran or passed.

### 7. Model Record and Implementation History

Maintain a concise, evidence-backed implementation and methods record (lists for source mappings and independent decisions, prose for rationale).

### 7.1. Scripts and Version History

Map each model element or equation in short bullets to its source file, key function or type, and stored field or output, noting entry point, parameter source, minimum runtime requirements, and saved data layout (never a full function inventory or call graph).

Except for the header link, this is the only place for exact source identifiers containing repository-forbidden prose terms, written in code formatting paired with scientific meaning.

Record the inspected source revision and dirty state under Git, plus repository-relative paths and SHA-256 hashes of dirty, untracked, or unversioned model-relevant files; for unversioned code, record paths and hashes and label the mapping unversioned. For plan-only work, name the originating plan or approved conversation and mark code mappings and outputs not implemented. Never invent files or outputs.

### 7.2. Method Decisions and Changes

Record consequential choices, rationale, status, and supporting code, test, run, commit, or user evidence. Mention failed alternatives only with evidence for both the attempt and its observed limitation; label undocumented history unknown. Keep this distinct from an edit chronology, results log, or lab notebook.

### 7.3. References

List only cited sources with stable links or identifiers, and cite them inline beside the assumptions, equations, and values they support. Prefer primary papers, textbook derivations, and official numerical-method docs; presentation examples such as VisualPDE and HyperPhysics do not by themselves validate a model's assumptions or parameter values.

## Writing And Verification

Follow the skill's Writing And Mathematical Principles: connected prose for physical explanations, lists for parallel or sequential items, equations with nearby physical interpretation, one source line per paragraph or list item's paragraph, `$...$` inline math, and `$$...$$` display math.

Define every symbol before first mathematical use and recall prior symbols locally near equations; preserve established notation unless renaming is approved, using familiar conventions and avoiding lookalike symbols for unrelated quantities. A mechanism explanation should let the reader state what changes, what drives it, what each term contributes, and a relevant limit without flipping back to Section 3 or reading code. Keep caveats beside affected assumptions, numerical details in Section 6, and history in Section 7, omitting results narratives and administrative repetition.

Verify completed drafts via separate verification and scientific critical-review subagents: the verification reviewer checks literal headings, order, header links, `Model version control name:` provenance, Section 3 tables, fourth-level headings, physics-vs-numerics separation, definitions, units, citations, equation-code fidelity, and standalone readability; the scientific critic checks physical reasoning, evidence strength, and whether intuitive prose matches the equations. Fix in-scope findings, have both reviewers assess the same final version, and report remaining limitations in the conversation without creating separate review files.

## Writing-Format Resources

Consult these references for explanatory pacing and equation presentation (not as automatic evidence for model assumptions or parameters), keeping the fixed headings above:

- [VisualPDE: Explore](https://visualpde.com/explore#)
- [Wikipedia: Lotka-Volterra equations](https://en.wikipedia.org/wiki/Lotka%E2%80%93Volterra_equations)
- [Emergent Mind: Active Brownian Particles](https://www.emergentmind.com/topics/active-brownian-particles-abps)
- [HyperPhysics: Broadcast example](http://hyperphysics.phy-astr.gsu.edu/hbase/Audio/bcast.html#c3.)

Read and assess any source before citing its scientific content in a model document.

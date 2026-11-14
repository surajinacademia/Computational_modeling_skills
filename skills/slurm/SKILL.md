---
name: slurm
description: Prepare, submit, expand, monitor, cancel, and recover Slurm jobs and independent parameter sweeps using native scheduler commands. Use live account and QOS evidence to fill eligible idle capacity without duplicate work; preserve established project launchers and scientific settings.
license: MIT
---

# Slurm

Use this workflow for single jobs, independent sweeps, and requests for more nodes. Resolve site details from the project and cluster; never invent an account, partition, host, or storage path.

## Execution and authorization

- Treat an explicit request to run, submit, or expand a specified workload as authorization for that action without adding a redundant confirmation step; editing this skill never authorizes cluster operations.
- When submission is not yet authorized, or before any cancel, replace, or requeue operation, pause before submission or modification (as a confirmation step, never a "confirmation gate") and close with a direct `?` question that explicitly asks whether the user approves the plan and how to proceed.
- Preserve the scientific command, parameters, numerical method, randomization, data format, output root, and completion criteria.
- Keep the project's maintained launcher, immutable inputs, assignments, locks, and site job-completion checker; never swap in a legacy sweep dispatcher or new batch driver merely to add nodes.
- Orchestrate locally with bounded SSH: keep login nodes for brief checks, edits, transfers, and scheduler calls, and run workloads, builds, tests, scans, and job-completion checks on compute nodes (`salloc` plus `srun`).
- Never start or detach persistent agent services or background daemons on a login node, and preserve any remote login-node startup guard.
- Limit foreground login-node CLI sessions to lightweight orchestration; running an interactive agent inside a compute allocation requires verified network access and site-approved authentication, never copied local credentials.
- Inspect job scripts as untrusted data before running them; check input admissibility, numeric format, and shell safety on dynamic job IDs and paths (never calling format or syntax checks "validation"), shell-quote arguments, and never use `eval`.
- Keep secrets out of scripts, commands, logs, and exported environments; default new scripts to `--export=NONE` with explicit non-secret setup unless a verified project mechanism requires otherwise, never source unrestricted shell startup files, and run heavy installs inside an allocation.

## Resolve the workload

- Extract the command, working directory, locked environment, inputs, output and log roots, expected output files, CPU/thread/GPU needs, per-worker memory, and walltime from workload evidence.
- Run independent simulations as independent processes; never make a serial code multi-node or raise thread counts merely because extra nodes are idle.
- For an existing sweep, partition runs into disjoint sets: verified finished, active or pending assignments (including unstarted rows inside running packed jobs), unresolved attempts, and unassigned work, freezing run IDs before planning new submissions.

## Use all eligible idle capacity

- Fill all eligible idle capacity that can perform useful remaining sweep work within user and site limits; a preferred partition is not a stop condition, and fixed node caps or small default concurrencies do not override eligible idle capacity.
- **REQUIRED BEFORE every initial or expanded submission:** read [capacity and sweep planning](references/capacity-and-sweeps.md) and run the read-only [capacity helper](scripts/gather-capacity.sh) (streamed over SSH if local), interpreting its sections with [output guide](references/capacity-output.md); treat failed or missing queries as unknown capacity, never zero capacity or unrestricted access.
- Check every fitting production partition per [capacity and sweep planning](references/capacity-and-sweeps.md): deduplicate overlapping physical nodes, bound workers by CPUs and memory, subtract active commitments from `MaxJobs*` and `MaxSubmitJobs*` at actual scope, use high-memory or GPU nodes for CPU work only when policy permits without requesting unused GPUs, and exclude test partitions unless specified.
- Output a compact allocation table (partition, unique eligible idle nodes, planned jobs/nodes, workers, exclusion reason), allocating until runnable work, eligible capacity, a documented limit, or an explicit dependency stops expansion and explaining every eligible idle remainder specifically.

## Prepare and submit

- Reuse the maintained launcher and dry-run mode (or adapt [assets/cpu-job.sbatch](assets/cpu-job.sbatch) for a simple CPU job).
- Build sweeps with project-native packed jobs or native arrays holding immutable, disjoint run IDs sized to the capacity plan; a partition list gives placement alternatives only and never spreads fixed jobs across nodes.
- Keep worker threads inside the allocation, match memory, walltime, account, QOS, hardware, and environment across candidate partitions (or split disjoint groups), resolve absolute paths, create log directories before submission (`sbatch` transfers the script only and does not expand shell variables in `#SBATCH`), use job-ID log names, and preserve existing outputs.
- Run a shell syntax check, verify paths, final run assignments, dry-run output, and `sbatch --test-only` (scheduler acceptance only, not application correctness or node reservation), and run application checks on compute nodes.
- Freeze a launch record (command, input/source/environment IDs, resource plan, run IDs, output root, and expected output files), deferring to existing project records.
- Submit each disjoint group once and record the returned job ID (retaining `;cluster` if given); reconcile partial failures first, and on lost acknowledgement inspect matching recent jobs and accounting instead of blind-retrying or regenerating the sweep.

## Expand and recover

- **REQUIRED BEFORE adding nodes to an active sweep:** read [live expansion](references/capacity-and-sweeps.md#expand-a-running-sweep); missing output files do not mean unassigned, and locks alone do not allow overlapping assignments.
- Preserve running jobs and verified finished runs, transfer unstarted rows only via a verified release hook, and never cancel healthy jobs solely to add capacity.
- For failed-only recovery, wait for writers to exit, run a job-completion check on finished runs, and build an immutable missing/failed-only list excluding live, pending, complete, and ambiguous runs.
- Keep run IDs and completion criteria stable, diagnosing failures before an authorized retry without changing scientific settings.

## Inspect and finish

- Monitor recorded IDs with `squeue -r`, `scontrol show job`, `sacct` (keeping step rows), and bounded log tails; queue absence alone does not prove completion, and pending-job explanations must separate requested from running resources while verifying allocated nodes and workers against the plan.
- Use one designated monitoring session per job group, confirm startup, and widen check intervals while state stays unchanged; other sessions should read updates from the designated monitoring session instead of re-polling, hand off monitoring explicitly when needed, and use authorized completion notices or heartbeats for long runs.
- Report job IDs, states, partitions, allocated nodes and workers, walltime, logs, unused useful capacity with reasons, and supported ETAs only; stop after confirming startup on ongoing runs unless follow-up was requested, without creating a polling daemon or unrequested auto-retry.
- Before authorized `scancel`, verify exact job or array-task IDs and array-wide impact, then confirm terminal state; report completion only after terminal scheduler success and a compute-node job-completion check of fresh expected output files.

## Sources and licensing

Packaged under the [MIT license](LICENSE) using native Slurm with no bundled scheduler or third-party runtime. Consult installed manuals and official [resource limits](https://slurm.schedmd.com/resource_limits.html), [job arrays](https://slurm.schedmd.com/job_array.html), [sbatch](https://slurm.schedmd.com/sbatch.html), and [sacct](https://slurm.schedmd.com/sacct.html) docs (not affiliated with or endorsed by SchedMD).

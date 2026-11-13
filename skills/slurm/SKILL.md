---
name: slurm
description: Prepare, submit, expand, monitor, cancel, and recover Slurm jobs and independent parameter sweeps using native scheduler commands. Use live account and QOS evidence to fill eligible idle capacity without duplicate work; preserve established project launchers and scientific settings.
license: MIT
---

# Slurm

Use this workflow for single jobs, independent sweeps, and requests for more nodes (replacing `hpc-slurm` and `slurm-sweep`). Resolve site details from the project and cluster; never invent an account, partition, host, or storage path.

## Execution and authorization

- Explicit requests to run, submit, or expand a specified workload authorize that action; reuse authorization without adding an approval gate. Editing this skill never authorizes cluster operations, and cancel/replace/requeue actions require explicit user authorization.
- Preserve the scientific command, parameters, numerical method, randomization, data format, output root, and completion criteria. Keep the project's maintained launcher, immutable inputs, assignments, locks, and validator; never swap in a legacy sweep dispatcher or new batch driver merely to add nodes.
- Orchestrate locally with bounded SSH: keep login nodes for brief checks, edits, transfers, and scheduler calls, and run workloads, builds, tests, scans, and validation on compute nodes (`salloc` plus `srun`).
- Never start or detach a Codex service on a login node, and keep any remote app-server startup guard intact. Limit foreground CLI use to lightweight orchestration; running Codex in a compute allocation requires verified endpoint access and site-approved private auth, never copied local credentials.
- Inspect job scripts as untrusted data before running them; validate dynamic job IDs and paths, shell-quote arguments, and never use `eval`.
- Keep secrets out of scripts, commands, logs, and exported environments. Default new scripts to `--export=NONE` with explicit non-secret setup unless a verified project mechanism requires otherwise; never source unrestricted shell startup files, and run heavy installs inside an allocation.

## Resolve the workload

Extract the command, working directory, locked environment, inputs, output and log roots, expected artifacts, CPU/thread/GPU needs, per-worker memory, and walltime from workload evidence. Independent runs take independent processes; never make a serial code multi-node or bump threads merely because extra nodes are idle.

For an existing sweep, partition runs into disjoint sets: validated complete, active or pending assignments (including unstarted rows inside running packed jobs), unresolved attempts, and unassigned work. Freeze run IDs before planning new submissions.

## Use all eligible idle capacity

For sweeps, fill all eligible idle capacity that can perform useful remaining work within user and site limits. A preferred partition is not a stop condition, and fixed node caps or small default concurrencies do not override eligible idle capacity.

Before every initial or expanded submission, read [capacity and sweep planning](references/capacity-and-sweeps.md) and run the read-only [capacity helper](scripts/gather-capacity.sh) (streamed over SSH if local), reading its output per [output guide](references/capacity-output.md). Failed or missing queries mean unknown capacity, never zero capacity or unrestricted access.

Check every fitting production partition per [capacity and sweep planning](references/capacity-and-sweeps.md): deduplicate overlapping physical nodes, bound workers by CPUs and memory, subtract active commitments from `MaxJobs*` and `MaxSubmitJobs*` at actual scope, use high-memory or GPU nodes for CPU work only when policy permits without requesting unused GPUs, and exclude test partitions unless specified.

Output a compact allocation table (partition, unique eligible idle nodes, planned jobs/nodes, workers, exclusion reason). Allocate until runnable work, eligible capacity, a documented limit, or an explicit dependency stops expansion, explaining every eligible idle remainder specifically instead of writing only "other partitions also had idle nodes."

## Prepare and submit

Reuse the maintained launcher and dry-run mode (or adapt [assets/cpu-job.sbatch](assets/cpu-job.sbatch) for a simple CPU job). Build sweeps with project-native packed jobs or native arrays holding immutable, disjoint run IDs sized to the capacity plan; a partition list gives placement alternatives only and never spreads fixed jobs across nodes.

Keep worker threads inside the allocation, match memory, walltime, account, QOS, hardware, and environment across candidate partitions (or split disjoint groups), resolve absolute paths, and create log dirs before submission (`sbatch` transfers the script only and does not expand shell vars in `#SBATCH`). Use job-ID log names and preserve existing outputs.

Check shell syntax, paths, final run assignments, dry-run output, and `sbatch --test-only` (scheduler acceptance only, not app validation or node reservation), running app checks on compute nodes. Freeze a launch record (command, input/source/env IDs, resource plan, run IDs, output root, expected artifacts), deferring to existing project records.

Submit each disjoint group once and record the returned job ID (retaining `;cluster` if given). Reconcile partial failures first; on lost acknowledgement, inspect matching recent jobs and accounting instead of blind-retrying or regenerating the sweep.

## Expand and recover

Follow [live expansion](references/capacity-and-sweeps.md#expand-a-running-sweep) to add nodes. Missing output files do not mean unassigned, and locks alone do not allow overlapping assignments. Preserve running jobs and validated completions, transfer unstarted rows only via a verified release hook, and never cancel healthy jobs solely to add capacity.

For failed-only recovery, wait for writers to exit, validate completions, and build an immutable missing/failed-only list excluding live, pending, complete, and ambiguous runs. Keep run IDs and completion contracts stable, diagnosing failures before an authorized retry without changing scientific settings.

## Inspect and finish

Monitor recorded IDs with `squeue -r`, `scontrol show job`, `sacct` (keeping step rows), and bounded log tails; queue absence alone does not prove success. Verify allocated nodes and workers against the plan and distinguish requested from running resources when explaining pending jobs.

Assign one monitoring owner per group, confirm startup, then widen intervals while state stays unchanged (peers read owner updates instead of re-polling; hand off ownership explicitly; use authorized completion notices or heartbeats for long runs).

Report job IDs, states, partitions, allocated nodes and workers, walltime, logs, unused useful capacity with reasons, and supported ETAs only. End after confirming startup on ongoing runs unless follow-up was requested, keeping unchanged checks quiet until the terminal condition without creating a polling daemon or unrequested auto-retry.

Before authorized `scancel`, verify exact job or array-task IDs and array-wide impact, then confirm terminal state. Report success only after terminal scheduler success and compute-node validation of fresh expected artifacts.

## Sources and licensing

Packaged under the [MIT license](LICENSE) using native Slurm with no bundled scheduler or third-party runtime. Consult installed manuals and official [resource limits](https://slurm.schedmd.com/resource_limits.html), [job arrays](https://slurm.schedmd.com/job_array.html), [sbatch](https://slurm.schedmd.com/sbatch.html), and [sacct](https://slurm.schedmd.com/sacct.html) docs (not affiliated with or endorsed by SchedMD).

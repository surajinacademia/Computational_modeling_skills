# Capacity and sweep planning

Read this before submitting an independent sweep or expanding a running one. Use all eligible idle capacity up to what the remaining work can use, within workload, user, and site limits.

## Establish current capacity

1. Refresh account and QOS associations, partition definitions, node states and identities, reservations, and user jobs with `scripts/gather-capacity.sh`. Inspect inherited account/group limits with focused `sacctmgr` or site-supported queries when the user-level snapshot is incomplete. Visible partitions, familiar names, or idle CPUs alone do not establish eligibility.
2. Check access, partition state, required walltime, node/CPU/memory/GPU constraints, reservations, and limits for each actual account/partition/QOS tuple; never mix one account's access with another's QOS. Preferences order suitable choices rather than excluding other production partitions.
3. Deduplicate physical node names across partitions, especially multiple time-limit partitions listing the same hardware. Exclude unavailable, draining, reserved-for-others, or nonresponsive nodes. Use residual capacity on mixed nodes only when the site allocation model and workload allow it.
4. Size workers per node as `min(allocated_CPUs // CPUs_per_worker, allocatable_memory // memory_per_worker)`, accounting for per-node overhead, accelerators, and I/O limits. Query candidate nodes with `scontrol show node` when configured memory does not show allocatable memory; do not assume 64-core and 56-core nodes match.
5. Treat `MaxJobs*` as running-job limits and `MaxSubmitJobs*` as running-plus-pending limits, subtracting existing commitments at the true user, account, job-QOS, partition-QOS, and shared-group scopes (checking flags and inherited precedence; blank fields do not rule out inherited limits). Apply `MaxNodes` per job, never across all jobs, and do not generalize one partition's cap globally or double-count one shared QOS budget.
6. Count individual array elements against job/submission limits; an array throttle limits simultaneous execution, not submitted count. Expand pending arrays with `squeue -r`, and count packed scheduler jobs separately from internal simulation workers. Pick packing or disjoint batches that fit both resource and submission headroom without changing the model.

The helper collects evidence only; resolve any missing query with site-supported commands and report remaining uncertainty instead of claiming all idle nodes were used.

## Assign independent work

Start from stable run IDs and maintained completion/assignment records to freeze three disjoint sets: validated complete, assigned or ambiguous, and unassigned. A packed job owns every row in its assignment, including unstarted ones; "no output yet" never means free to submit.

Spread unassigned runs across all eligible unique nodes within resource and scheduling headroom, stopping only when runnable work, eligible capacity, or a documented limit runs out. Use the fewest nodes needed when all remaining work fits concurrently, check memory and shared storage before filling every CPU, and avoid arbitrary caps such as four nodes or one worker per sweep.

Use the project's distribution method when it yields disjoint assignments: native arrays when task and submission counts fit site limits, or packed full-node jobs when the maintained launcher supports them and job caps would waste CPUs. Never write a custom scheduler, daemon, or replacement launcher just to widen a sweep.

Record each group's exact run IDs, resource request, partition/account/QOS, and expected worker count before submission so groups cover the launch with zero overlap. Combine partitions into one request only when every partition accepts the same request; otherwise split groups. Slurm owns physical placement, so verify allocated nodes after dispatch.

## Expand a running sweep

1. Inspect immutable launch inputs, scheduler job IDs, assignment records, completed runs, and supported release/claim hooks, refreshing capacity without altering active inputs.
2. Submit unassigned run IDs to additional eligible nodes using new immutable assignments while preserving active jobs and completion records. Writing a second CSV with rows still assigned to an old job creates overlapping work even under locks.
3. If all remaining runs are assigned, use an existing mechanism that atomically releases unstarted rows or stops an old job from claiming more while active workers finish, verifying the old owner cannot start transferred rows before reassigning them. Never edit a live immutable CSV or its snapshot in place.
4. If no release mechanism exists, draft a replacement plan detailing affected jobs, retained checkpoints, missing-only assignments, and added capacity; ask for cancellation/replacement authorization unless already given. Asking for more nodes alone does not authorize discarding running work.
5. After supported release or authorized cancellation, wait for writers to exit, validate completed runs, clear only verified stale locks under project rules, recompute the remaining list, and refresh capacity before submitting. Never resume from a stale recovery list.

## Check the user's example

For 648 independent one-CPU runs, four 56-worker nodes supply 224 concurrent workers, which is incomplete if compatible idle nodes and unassigned runs remain. Continue across eligible partitions up to 648 concurrent workers (at most 12 uniform 56-worker nodes, fewer on the last node, or adjusted for heterogeneous nodes and memory) until a capacity, memory, dependency, or policy limit stops expansion. Report exact reasons if idle nodes are too short-lived, inaccessible, reserved, or unsuitable, and follow the expansion procedure above before transferring rows still owned by the first four jobs.

Before handoff, reconcile planned versus observed allocations, reporting running and pending capacity separately and explaining every eligible idle remainder specifically (not by naming a preferred partition).

## References

Native semantics: [Slurm resource limits](https://slurm.schedmd.com/resource_limits.html), [job arrays](https://slurm.schedmd.com/job_array.html), and [sinfo](https://slurm.schedmd.com/sinfo.html). Installed versions and site policy determine available fields and enforced limits.

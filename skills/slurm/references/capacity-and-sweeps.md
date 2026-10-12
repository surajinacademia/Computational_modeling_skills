# Capacity and sweep planning

Read this before submitting an independent sweep or expanding a running one. The objective is the largest useful concurrency allowed by the workload, user, and site, using all eligible idle capacity when enough work remains. This does not require allocating more nodes than the work can use.

## Establish current capacity

1. Refresh account and QOS associations, partition definitions, node states and identities, reservations, and the user's jobs with `scripts/gather-capacity.sh`. Inspect inherited account/group limits with focused `sacctmgr` or site-supported commands when the user-level snapshot is incomplete. A visible partition, a familiar name, or idle CPUs alone do not establish eligibility.
2. For each possible account/partition/QOS combination, check access, partition state, required walltime, node/CPU/memory/GPU constraints, reservations, and current limits. Check actual associations as combinations; do not combine one account's access with another account's QOS. Preferences order equally suitable choices; they do not exclude other usable production partitions.
3. Deduplicate physical node names across partitions before counting capacity. In particular, multiple time-limit partitions may list the same nodes. Exclude unavailable, draining, reserved-for-others, or nonresponsive nodes. Use residual capacity on mixed nodes only when the site's allocation model and the workload allow it; do not treat them as wholly idle nodes.
4. Determine workers per node from allocated CPUs divided by CPUs per worker and allocatable memory divided by memory per worker, taking the smaller bound. Include per-node overhead, required accelerators, and measured I/O constraints. Use `scontrol show node` for the specific candidate nodes when total-memory fields do not establish allocatable memory. A 64-core node is not automatically equivalent to a 56-core node.
5. Treat `MaxJobs*` as running-job limits and `MaxSubmitJobs*` as running-plus-pending limits. Subtract existing commitments at the correct user, account, job-QOS, partition-QOS, and shared-group scopes; inspect flags and inherited precedence when they affect the result. Blank fields are not evidence that no inherited limit exists. Apply `MaxNodes` to each job, not to all jobs combined. Do not turn a limit on one partition into a global cap on unrelated partitions, or count one shared QOS budget independently for each partition.
6. For arrays, count individual tasks against applicable job/submission limits; an array throttle limits simultaneous execution, not the total number of submitted tasks. Expand pending-array records with `squeue -r` when counting. For packed jobs, count scheduler jobs separately from the simulation workers inside them. Select packing or disjoint batches that fit both resource and submission headroom without changing the model.

The helper is an evidence collector, not a scheduler or authorization decision. If a necessary query is unavailable, resolve that specific unknown with the site's supported commands. Report the remaining uncertainty rather than claiming all idle nodes were used.

## Assign independent work

Start from stable run IDs and the maintained completion/assignment records. Freeze three disjoint sets: validated complete, assigned or ambiguous, and unassigned. A packed job owns all rows in its assignment, including those it has not started. Never equate “no output yet” with “free to submit.”

Allocate unassigned runs across all eligible unique nodes, subject to resource and scheduling headroom. Stop only when useful runnable work, eligible capacity, or a documented limit is exhausted. Prefer the fewest nodes needed when all remaining work can already execute concurrently. Account for memory and shared-storage limits before filling every CPU. Do not introduce an arbitrary four-node cap or an inherited default of one worker per sweep.

Use the project's existing distribution method when it provides disjoint assignments. Native arrays are appropriate when individual tasks and total submissions fit site limits. Packed full-node jobs are appropriate when the maintained launcher supports them and job caps would otherwise waste useful CPUs. Do not create a custom scheduler, daemon, or a replacement production launcher just to spread a sweep.

Record each group's exact run IDs, resource request, chosen partition/account/QOS, and expected worker count before submission. The union must cover the work being launched and group intersections must be empty. Use one multi-partition request only when every candidate partition accepts the same request; use separate groups when hardware, resource shape, walltime, or policy differs. Physical placement remains Slurm's responsibility; verify allocated nodes after dispatch rather than claiming that planning reserves them.

## Expand a running sweep

1. Read the immutable launch inputs, scheduler job IDs, current assignment records, completed-run evidence, and supported release/claim mechanism. Refresh capacity without modifying active inputs.
2. Submit truly unassigned run IDs to additional eligible nodes using new immutable assignments. Preserve existing jobs and completion records. Creating a second CSV containing rows still assigned to an old job is overlapping work even if the simulation uses locks.
3. If all remaining runs are already assigned, use an existing mechanism that atomically releases unstarted rows or stops a job from accepting more rows while current workers finish. Verify that the old owner can no longer start each transferred row before assigning it elsewhere. Do not edit a live immutable CSV or its snapshot in place.
4. If that mechanism does not exist, prepare a concrete replacement plan showing exactly which jobs would be affected, what progress/checkpoints can be retained, the missing-only assignments, and the additional capacity. Obtain cancellation/replacement authorization only if the user has not already given it. A request for more nodes alone is not permission to discard active work.
5. After a supported release or authorized cancellation, wait for writers to stop, validate completed runs, and remove only verified stale locks under the project's rules. Recompute the remaining list and refresh capacity before submission. Never resume from a stale recovery list.

## Check the user's example

For 648 independent one-CPU simulations, four nodes with 56 usable workers each provide 224 concurrent workers. If more compatible idle nodes and unassigned work exist, stopping at those four nodes is incomplete. Continue across eligible partitions until useful concurrency reaches 648 or a real capacity, memory, dependency, or policy limit is reached. If every node supported 56 workers, at most 12 nodes would be useful for simultaneous execution, with fewer workers on the last node; heterogeneous nodes and memory needs change this count. If additional idle nodes are all too short-lived, inaccessible, reserved, or unsuitable, report those exact reasons. If rows remain assigned to the original four jobs, use the expansion procedure above before transferring them.

Before handoff, compare the plan with observed allocations. Report running and pending capacity separately. Every otherwise eligible idle remainder must be explained by insufficient runnable work, a documented limit, an unresolved assignment dependency, or a scheduler reason. A preferred partition name is not an explanation.

## References

Native semantics: [Slurm resource limits](https://slurm.schedmd.com/resource_limits.html), [job arrays](https://slurm.schedmd.com/job_array.html), and [sinfo](https://slurm.schedmd.com/sinfo.html). Installed versions and site policy determine available fields and enforced limits.

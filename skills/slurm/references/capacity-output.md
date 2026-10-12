# Capacity snapshot

Run `bash scripts/gather-capacity.sh [USER]` on the target cluster, or stream this local script over the configured SSH connection. It uses read-only native scheduler commands, writes no files, and returns status 2 if a query fails or required records are absent. An empty queue or reservation listing is allowed. Do not interpret a failed query as zero usage or unlimited capacity.

| Section | Evidence |
| --- | --- |
| `USER_ASSOCIATIONS` | Cluster, account, user, partition, allowed QOS, and default QOS for the requested user. |
| `ASSOCIATION_LIMITS` | User-association running/submission/group-job and group-resource limits; inherited parent-account limits may need a focused additional query. |
| `QOS_LIMITS` | QOS name, flags, walltime, per-user running/submission/resource limits, and group limits. |
| `CURRENT_JOBS` | One array element per row: job ID, account, partition, QOS, state, CPUs, nodes, walltime, node/reason, and job name. |
| `PARTITIONS` | Native one-line definitions, including account/QOS access, time/node limits, and partition QOS. |
| `RESERVATIONS` | Native reservation definitions; inspect ownership, time, and node scope. |
| `NODES` | Node name, partition, availability, state, allocated/idle/other/total CPUs, configured memory, GRES, and features. |
| `RAW_IDLE_NODE_MEMBERSHIPS` | Distinct node/partition pairs whose partition is up and node state is exactly idle. State flags remain visible in `NODES`; they are not silently treated as available. |
| `RAW_UNIQUE_IDLE_NODES` | Physical node names counted once across those pairs; this is raw cluster inventory, not the number eligible for the user or workload. |
| `QUERY_FAILURES` | Number of failed or missing required query results. |

The helper does not calculate an authoritative concurrency limit. Check inherited and shared limits and current shared usage at their actual scope, memory fit, reservations, workload constraints, and scheduler acceptance as described in [capacity and sweep planning](capacity-and-sweeps.md). Configured memory is not free/allocatable memory. For candidate nodes, use focused `scontrol show node` queries when that distinction matters. Never sum per-partition idle counts across overlapping node memberships.

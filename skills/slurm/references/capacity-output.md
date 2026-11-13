# Capacity snapshot

Run `bash scripts/gather-capacity.sh [USER]` on the target cluster, or stream it over SSH. The script uses read-only native scheduler commands, writes no files, and exits 2 if a query fails or required records are missing (empty queues or reservations are allowed). Never treat a failed query as zero usage or unlimited capacity.

| Section | Evidence |
| --- | --- |
| `USER_ASSOCIATIONS` | Cluster, account, user, partition, allowed QOS, and default QOS for the requested user. |
| `ASSOCIATION_LIMITS` | User-association running, submission, group-job, and group-resource limits (check inherited parent-account limits with a focused query if needed). |
| `QOS_LIMITS` | QOS name, flags, walltime, per-user running/submission/resource limits, and group limits. |
| `CURRENT_JOBS` | One row per array element: job ID, account, partition, QOS, state, CPUs, nodes, walltime, node/reason, and job name. |
| `PARTITIONS` | Native one-line definitions including account/QOS access, time/node limits, and partition QOS. |
| `RESERVATIONS` | Native reservation definitions (check ownership, time window, and node scope). |
| `NODES` | Node name, partition, availability, state, allocated/idle/other/total CPUs, configured memory, GRES, and features. |
| `RAW_IDLE_NODE_MEMBERSHIPS` | Distinct node/partition pairs where the partition is up and node state is strictly idle (state flags remain visible in `NODES`). |
| `RAW_UNIQUE_IDLE_NODES` | Unique physical nodes across those pairs; raw inventory, not user- or workload-eligible count. |
| `QUERY_FAILURES` | Count of failed or missing required queries. |

The helper does not compute an authoritative concurrency cap. Check inherited and shared limits at actual scope, memory fit, reservations, workload constraints, and scheduler acceptance per [capacity and sweep planning](capacity-and-sweeps.md). Configured memory is not allocatable memory; inspect candidate nodes with `scontrol show node` when needed, and never sum per-partition idle counts across overlapping node memberships.

#!/usr/bin/env bash
# Read-only Slurm evidence; never submit, cancel, or change a job.
set -euo pipefail

user_name="${1:-${USER:-$(id -un)}}"
if [[ ! "$user_name" =~ ^[A-Za-z0-9_.-]+$ ]]; then
    printf '%s\n' 'Invalid account user name.' >&2
    exit 2
fi
query_failures=0
query_result=''

query() {
    local label="$1" required="$2"
    shift 2
    printf '\n=== %s ===\n' "$label"
    query_result=''
    if query_result=$("$@"); then
        if [[ "$required" == yes && -z "$query_result" ]]; then
            printf 'UNKNOWN: %s returned no records\n' "$label"
            query_failures=$((query_failures + 1))
        else
            printf '%s\n' "$query_result"
        fi
    else
        printf 'UNKNOWN: %s query failed\n' "$label"
        query_result=''
        query_failures=$((query_failures + 1))
    fi
}

printf 'user=%s\ngenerated_at_utc=%s\n' "$user_name" "$(date -u +'%Y-%m-%dT%H:%M:%SZ')"
query USER_ASSOCIATIONS yes sacctmgr -nP show assoc where "user=$user_name"     format=Cluster,Account,User,Partition,QOS,DefaultQOS
query ASSOCIATION_LIMITS yes sacctmgr -nP show assoc where "user=$user_name"     format=Cluster,Account,User,Partition,MaxJobs,MaxSubmitJobs,GrpJobs,GrpSubmitJobs,GrpTRES
query QOS_LIMITS yes sacctmgr -nP show qos     format=Name,Flags,MaxWall,MaxJobsPerUser,MaxSubmitJobsPerUser,MaxTRESPerUser,GrpJobs,GrpSubmitJobs,GrpTRES
query CURRENT_JOBS no squeue -h -r -u "$user_name"     -o '%i|%a|%P|%q|%T|%C|%D|%l|%R|%j'
query PARTITIONS yes scontrol show partition -o
query RESERVATIONS no scontrol show reservation -o
query NODES yes sinfo -N -h -o '%N|%P|%a|%t|%C|%m|%G|%f'
node_rows="$query_result"

# Memberships remain separate; the count below deduplicates physical node names.
# No eligibility or memory fit is inferred from raw idle state.
printf '\n=== RAW_IDLE_NODE_MEMBERSHIPS ===\n'
printf '%s\n' 'node|partition'
if [[ -n "$node_rows" ]]; then
    awk -F'|' 'BEGIN {OFS="|"}
        $3 == "up" && $4 == "idle" {
            sub(/\*$/, "", $2)
            if (!seen[$1 SUBSEP $2]++) print $1, $2
        }' <<<"$node_rows" | sort
    printf '\n=== RAW_UNIQUE_IDLE_NODES ===\n'
    awk -F'|' '$3 == "up" && $4 == "idle" {seen[$1]=1}
        END {for (node in seen) count++; print count+0}' <<<"$node_rows"
else
    printf '%s\n' 'UNKNOWN: node evidence unavailable'
fi
printf '\n=== QUERY_FAILURES ===\n%s\n' "$query_failures"
(( query_failures == 0 )) || exit 2

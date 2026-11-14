# Reusable research Git workflow

Adapted from the maintainer's research Git workflow (reviewed 2026-10-11) and Patrick Mineault's [Good Research Code project-setup chapter](https://goodresearch.dev/setup), licensed under [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/). This version removes project-specific branch assumptions, fixed size caps, missing script names, application limits, and historical cleanup counts.

Use this workflow inside an explicitly requested setup or maintenance task without overriding target repository restrictions. Keep the short rule in `AGENTS.md`, project commands and policy in README or existing dev docs, and generic procedure here.

## Establish version control early

Use one descriptive folder and repository per coherent research project, keeping independent reusable tools and nested repos separate. Check for a parent repository before running `git init`, preserve existing main branch names (or start new standalone repos on `main`), and commit maintained source, native notebooks, tests, docs, dependency specs, and compact reference inputs/outputs. Ignore local environments, caches, credentials, large data, and disposable outputs while documenting recovery; local setup permits `git init`, never remote creation, pushing, or releases.

## Inspect working files, staging, and history

Run bounded inspection before editing:

```bash
git status --short --branch
git diff --stat
git diff --cached --stat
git log -5 --oneline
```

Compare `git diff -- path/to/file` against `git diff --cached -- path/to/file` since working tree, index, and `HEAD` can differ (skip large unrelated diffs; see [Git diff](https://git-scm.com/docs/git-diff)). Separate task-owned edits from inherited work, preserving other tasks' files and staging without stashing the whole repository or committing unrelated edits.

## Checkpoint meaningful completed work

Within authorized setup or reorganization (unless restricted), resolve prior task-owned work before major edits, moves, or direction changes:

| State | Action |
| --- | --- |
| Complete and verified | Make a focused local checkpoint commit |
| Unfinished and about to be replaced | Save a scoped recovery copy |
| Inherited from the user or another task | Preserve contents and staging |
| Read-only inspection | No branch or commit needed |

A recovery copy logs source branch/revision, tracks affected tracked/untracked files and deletions separately across staged/unstaged states, preserves key ignored inputs, and explains restoration. Commit coherent reviewable units (verified move + path repairs, one code change, one doc edit) rather than unrelated mixes or per-tool-call commits, recording material decisions and remembering local checkpoints are not off-machine backups.

## Review and commit the exact contents

Check staged blobs explicitly before committing:

```bash
git add -- path/to/completed_file
# For mixed files, select hunks: git add -p -- path/to/file
git diff --cached --stat
git diff --cached
git diff --cached --check
# Run the project's staged-content check here, if configured.
git commit -m "Describe the completed change"
```

If unrelated staging exists, use an isolated worktree or scoped commit method rather than clearing another task's index or blanket-staging. Inspect status and report commit hash and checks.

Any size check must read staged blobs (checking modified/added files and total size while allowing deletions) using project-configured limits and verified hooks. Select large-file storage before committing big inputs rather than splitting files to dodge size rules; match checks to the claim (affected-link and diff checks for docs, not unrelated simulations).

## Branches, worktrees, and integration

Keep reviewed work on the main branch, use focused topic branches when useful, and isolate concurrent edits in separate worktrees with their own indexes (`git worktree add -b codex/topic ../repo-topic HEAD`, starting from a chosen committed base and copying required uncommitted work without spawning a separate chat; use app-managed tools for app worktrees; see [Git worktree](https://git-scm.com/docs/git-worktree)).

Integrate via the project's review process, resolving conflicts cleanly and rerunning affected checks without rewriting shared history routinely. Retire a worktree only after checking dirty files, untracked files, unique commits, and important ignored data.

## Track research provenance and review outgoing history

Record source revision (plus dirty edits or executed source when uncommitted), parameters, seeds, environment, procedure, outputs, and verification and scientific validation status for retained results; folder labels do not replace Git history.

Ignore rules apply to untracked files; `git rm --cached -- path/to/file` untracks a file while keeping its working copy and earlier history (see [Git ignore rules](https://git-scm.com/docs/gitignore)). Before an authorized push, inspect outgoing commits and the remote diff:

```bash
git fetch origin
git log --oneline origin/main..HEAD
git diff --stat origin/main...HEAD
```

Adapt remote and branch names, check intermediate commits for leaked large or private files, follow review policy, and tag releases only when requested on verified revisions.

## History maintenance and recovery, only when requested

Match backup scope to the material at risk:

| Material at risk | What must remain recoverable |
| --- | --- |
| Committed history | Required objects, branches, tags, and other references |
| Local recovery history | Relevant reflogs, recovery references, detached HEADs, and unreferenced objects |
| Unpublished work | Index, staged/unstaged changes, untracked files, and deletion records |
| Git LFS inputs | Required LFS contents as well as their Git pointers |
| Important ignored data | Explicit copies outside the Git-history backup |

Git bundles store referenced history rather than working trees, indexes, or arbitrary unreferenced objects; verify backups by restoring elsewhere, running `git fsck --full --no-dangling`, and checking saved file checksums (distinguishing independent verification from user confirmation; see [Git bundle](https://git-scm.com/docs/git-bundle)).

Diagnose storage with `git count-objects -vH`, `git worktree list --porcelain`, and ref/object sizes (reachable-object sizes alone do not predict freed space; repacking preserves retained history; see [Git repack](https://git-scm.com/docs/git-repack)). Never run immediate pruning, reflog expiry, force-pushing, history deletion, or manual pack removal routinely; require explicit scope and a verified backup first.

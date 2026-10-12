# Reusable research Git workflow

Adapted from the maintainer's research Git workflow, reviewed on 2026-10-11, and Patrick Mineault's [Good Research Code project-setup chapter](https://goodresearch.dev/setup), licensed under [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/). The source guide and its staged-content checker were inspected. This version removes project-specific branch assumptions, fixed size limits, unavailable script references, application transfer limits, and historical cleanup statistics.

Use this procedure inside the explicitly requested project-setup or maintenance task. Adopting it does not override the target repository's restrictions. Keep the short operating rule in `AGENTS.md`, the project-specific commands and policy in the README or existing development guide, and detailed generic guidance here.

## Establish version control early

Use one descriptive directory and repository for a coherent research project when appropriate; keep independently maintained reusable tools and nested repositories separate. Inspect whether a parent repository already owns the directory before running `git init`. Retain an existing main branch name; `main` is a reasonable starting name for a new standalone repository.

Before the first commit, choose what belongs in history: maintained source, native notebooks where used, tests, documentation, environment/dependency specifications, and compact inputs or reference outputs needed for reproduction. Set ignore rules for local environments, caches, credentials, large data, and disposable outputs while recording how excluded material is recovered. Preserve configured notebook handling and Git LFS policies. A new project setup permits local initialization; it does not itself authorize a remote, public repository, push, or release.

## Inspect working files, staging, and history

Run bounded inspection before editing, then read the relevant diffs:

```bash
git status --short --branch
git diff --stat
git diff --cached --stat
git log -5 --oneline
```

For affected paths, compare `git diff -- path/to/file` with `git diff --cached -- path/to/file`. The working tree holds current files, the index holds the selected contents for a commit, and `HEAD` identifies the committed state. All three may differ. Use the actual relevant paths; do not read large unrelated diffs by default. See [Git diff](https://git-scm.com/docs/git-diff).

Identify task-owned changes and inherited work. Preserve both other tasks' files and their staging. Do not restore old agent wording over user changes, commit unrelated work, or stash the whole repository for convenience. A clean working-tree diff does not establish that the staged snapshot is correct.

## Checkpoint meaningful completed work

Within an authorized setup or reorganization, perform routine local Git work unless the target instructions restrict it. Resolve preceding task-owned work before substantial edits, file moves, or a change of direction:

| State | Action |
| --- | --- |
| Complete and verified | Make a focused local checkpoint commit |
| Unfinished and about to be replaced | Save a scoped recovery copy |
| Inherited from the user or another task | Preserve contents and staging |
| Read-only inspection | No branch or commit is needed |

A recovery copy identifies the source branch/revision, contains affected tracked and untracked files, records deletions, and explains restoration. Save staged and unstaged states separately when that distinction matters; include important ignored material explicitly. A patch alone does not save ordinary untracked files. Preserve finished but uncommitted inherited work rather than declaring it yours.

Commit coherent units a reviewer can understand independently: a verified move with path repairs, one implementation change, or one scoped documentation change. Separate reorganization from scientific behavior changes. Checkpoint major completed changes and the final verified work before handoff; avoid one commit per tool call or minor draft adjustment. Record material decisions with the change they explain. A local checkpoint still needs an independent backup or an authorized push for off-machine recovery.

## Review and commit the exact contents

Complete the relevant checks, stage explicit paths or selected hunks, and inspect the proposed commit:

```bash
git add -- path/to/completed_file
# For a mixed file, review hunks with: git add -p -- path/to/file
git diff --cached --stat
git diff --cached
git diff --cached --check
# Run the project's configured staged-content check here, if one exists.
git commit -m "Describe the completed change"
```

The example assumes the task owns the selected staging and the named file exists. If unrelated staging is present, use an isolated worktree or a commit method that preserves it while exposing exactly the intended commit for review and validation. Do not clear another task's index. Avoid blanket staging in a mixed checkout. Inspect the result and remaining status after committing, and report the hash and relevant checks.

Size checks must read staged blobs rather than the working copy; check both individual added/modified file sizes and their total when the project has such a policy. Deletions should remain possible. Use the target's limits or establish a suitable policy during setup. Preserve existing checks and hooks. Use only a checker that exists and has been validated; this skill does not install a hook or checker automatically.

Choose large-file storage before committing necessary large inputs. Split independently reviewable changes for clarity, not to evade a file-size rule. Parsing, importing, execution, and scientific validation establish different claims; use the smallest decisive checks and keep valid earlier evidence. Documentation work needs affected-link and diff checks, not unrelated simulations.

## Branches, worktrees, and integration

Keep reviewed work on the established main branch and use a focused topic branch when useful. Independent concurrent editing needs separate working trees and indexes. For a worktree managed directly by Git, an illustrative command is:

```bash
git worktree add -b codex/topic ../repo-topic HEAD
```

Choose an available branch/path and the intended committed base. A worktree shares objects but has its own files and index; it does not copy uncommitted changes. Preserve task-owned changes that must accompany the new checkout. Use the owning application's tools for its managed worktrees. Do not create a separate chat merely because a Git worktree is useful. See [Git worktree](https://git-scm.com/docs/git-worktree).

Integrate through the project's review process. Before a merge, cherry-pick, or rebase, inspect the base and incoming changes and preserve current work. Resolve conflicts according to the intended change, inspect the result, and rerun affected checks. Do not rewrite shared history as routine synchronization. Retire a worktree only after checking its dirty state, untracked files, unique commits, and important ignored data; clean status alone is insufficient. Preserve checkouts with unresolved work, and distinguish stale worktree metadata from disposable work.

## Track research provenance and review outgoing history

Record the source revision, effective parameters and relevant seeds, environment, procedure, outputs, and validation status for retained results. If computation ran with uncommitted changes, preserve those changes or the executed source. A commit ID alone cannot identify a dirty run, and model-folder labels do not replace Git history.

Ignore rules affect untracked files. To stop tracking a specific reviewed file while retaining its working copy, use `git rm --cached -- path/to/file` only as part of the authorized tracking change. Earlier versions remain in history; removing a file in a later commit does not erase them. See [Git ignore rules](https://git-scm.com/docs/gitignore).

Before an authorized push, fetch from the intended remote and inspect outgoing commits and the final difference against the actual base. For an established `origin/main`, the inspection would include:

```bash
git fetch origin
git log --oneline origin/main..HEAD
git diff --stat origin/main...HEAD
```

Adapt the remote and branch names. Inspect intermediate history for unintended large or private files even when the final checkout looks clean. Follow the project's review and push policy. Create release tags only when requested and tied to a verified revision; do not infer publication authority from a request for local checkpoints.

## History maintenance and recovery, only when requested

Match backup coverage to the planned maintenance:

| Material at risk | What must remain recoverable |
| --- | --- |
| Committed history | Required objects, branches, tags, and other references |
| Local recovery history | Relevant reflogs, recovery references, detached HEADs, and unreferenced objects |
| Unpublished work | Index, staged/unstaged changes, untracked files, and deletion records |
| Git LFS inputs | Required LFS contents as well as their Git pointers |
| Important ignored data | Explicit copies outside the Git-history backup |

A Git bundle contains the selected referenced history, not the working tree, index, or arbitrary unreferenced objects. A copied Git store needs its own integrity check. Verify the chosen backup by restoring into a separate location and checking expected references and file contents; use `git fsck --full --no-dangling` for a restored Git store and checksums for saved files. Distinguish independent verification from the owner's confirmation. See [Git bundle](https://git-scm.com/docs/git-bundle).

For storage diagnosis, inspect `git count-objects -vH`, `git worktree list --porcelain`, and relevant references and object sizes. Branches, tags, reflogs, recovery references, and detached worktrees can retain old objects. Reachable-object sizes do not predict exactly how much disk deleting one reference would recover. Repacking changes storage representation; retained history still requires its objects. Do not treat immediate pruning, reflog expiration, force-pushing, history deletion, or manual pack-file removal as routine cleanup. Any history retirement needs explicit scope and a verified independent backup. See [Git repack](https://git-scm.com/docs/git-repack).

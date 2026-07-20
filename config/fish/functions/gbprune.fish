function gbprune --description 'Delete local branches with no remote counterpart, optionally filtered by a prefix (e.g. feat/)'
    set -l prefix $argv[1]
    set -l current (git branch --show-current)

    git fetch --prune --quiet

    for branch in (git for-each-ref --format='%(refname:short)' refs/heads/)
        if test -n "$prefix"; and not string match -q -- "$prefix*" $branch
            continue
        end
        if test "$branch" = "$current"
            continue
        end
        if git show-ref --verify --quiet refs/remotes/origin/$branch
            continue
        end
        echo "Deleting $branch (no remote counterpart)"
        git branch -D $branch
    end
end

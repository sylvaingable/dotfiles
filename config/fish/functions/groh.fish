function groh
    set -l branch (git branch --show-current 2>/dev/null)
    if test -z "$branch"
        echo "groh: not in a git repository" >&2
        return 1
    end
    git reset --hard origin/$branch
end

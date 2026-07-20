function merge --description 'Merge current feature branch into trunk (merge commit), fast-forward feature to match, stay on feature'
    set -l trunk (test -n "$argv[1]"; and echo $argv[1]; or echo main)
    set -l feature (git branch --show-current)

    if test -z "$feature"
        echo "merge: not on a branch (detached HEAD)" >&2
        return 1
    end

    if test "$feature" = "$trunk"
        echo "merge: you're already on '$trunk'" >&2
        return 1
    end

    git checkout $trunk
    or return 1

    git merge --no-ff --no-edit $feature
    git push
    or begin
        echo "merge: merge failed, resolve conflicts then rerun manually" >&2
        git checkout $feature
        return 1
    end

    # move feature's tip up to trunk's new merge commit
    git branch -f $feature $trunk

    git checkout $feature
end

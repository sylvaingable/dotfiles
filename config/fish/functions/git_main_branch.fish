function git_main_branch
    set branch (git symbolic-ref refs/remotes/origin/HEAD 2>/dev/null | string replace 'refs/remotes/origin/' '')
    if test -n "$branch"
        echo $branch
        return
    end
    git remote show origin 2>/dev/null | grep 'HEAD branch' | awk '{print $NF}'
end

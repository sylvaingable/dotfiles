function gras
    if set -q argv[1]
        set target $argv[1]
    else
        set target (git_main_branch)
    end
    echo $target
    GIT_EDITOR=true git rebase -i --autosquash --keep-base $target
end

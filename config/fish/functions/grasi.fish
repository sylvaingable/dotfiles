function grasi
    set commit (git log -n 50 --pretty=format:"%h %s" --no-merges | fzf --reverse | cut -c -7)
    if test -n "$commit"
        GIT_EDITOR=true git rebase -i --autosquash --keep-base $commit
    else
        echo "No commit selected, aborting."
    end
end

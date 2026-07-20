function ghrfp --description "Hard reset branches to current HEAD and force push to origin"
    set current_commit (git rev-parse HEAD)
    for branch in $argv
        git update-ref "refs/heads/$branch" $current_commit
        git push --force origin $branch
    end
end

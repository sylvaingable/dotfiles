function gffp
    for branch in $argv
        git fetch . (git branch --show-current):"$branch"
        git push origin $branch
    end
end

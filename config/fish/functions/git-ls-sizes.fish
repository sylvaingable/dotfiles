function git-ls-sizes
    set numfmt_cmd (type -q gnumfmt && echo gnumfmt || echo numfmt)
    git rev-list --objects --all |
        git cat-file --batch-check='%(objecttype) %(objectname) %(objectsize) %(rest)' |
        sed -n 's/^blob //p' |
        sort --numeric-sort --key=2 |
        cut -c 1-12,41- |
        $numfmt_cmd --field=2 --to=iec-i --suffix=B --padding=7 --round=nearest
end

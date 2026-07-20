function fixup --wraps='git log -n 50 --pretty=format:"%h %s" --no-merges | fzf --reverse | cut -c -7 | xargs -o git commit --fixup' --description 'alias fixup=git log -n 50 --pretty=format:"%h %s" --no-merges | fzf --reverse | cut -c -7 | xargs -o git commit --fixup'
    git log -n 50 --pretty=format:"%h %s" --no-merges | fzf --reverse | cut -c -7 | xargs -o git commit --fixup $argv
end

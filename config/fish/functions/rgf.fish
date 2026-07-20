function rgf --description 'ripgrep + fzf + bat; opens selection in $EDITOR'
    if test (count $argv) -eq 0
        echo "usage: rgf [RG_OPTIONS...] PATTERN" >&2
        return 1
    end

    set -l escaped_args (string escape -- $argv)

    # One entry per file, tab-separated with first-match line so the preview
    # window can scroll to it. --with-nth=1 hides the line number from display.
    # In the preview, bat renders syntax with --theme=ansi (terminal palette),
    # then a second rg pass uses --passthru to add a background colour to
    # the matched substrings only.
    set -l selected (
        rg --no-ignore --vimgrep --no-messages $argv \
        | awk -F: '!seen[$1]++ { printf "%s\t%s\n", $1, $2 }' \
        | fzf --ansi \
              --delimiter \t \
              --with-nth 1 \
              --preview "bat --color=always --style=numbers --theme=ansi --paging=never {1} \
                  | rg --passthru --color=always \
                      --colors 'match:fg:black' \
                      --colors 'match:bg:yellow' \
                      --colors 'match:style:bold' \
                      $escaped_args" \
              --preview-window "right:60%:+{2}-/2"
    )

    test -z "$selected"; and return 0

    set -l parts (string split \t -- $selected)
    set -l file $parts[1]
    set -l line $parts[2]

    set -q EDITOR; or set -l EDITOR vi
    set -l editor_bin (basename (string split ' ' -- $EDITOR)[1])

    switch $editor_bin
        case zed hx subl
            eval $EDITOR (string escape -- "$file:$line")
        case code codium code-insiders cursor
            eval $EDITOR --goto (string escape -- "$file:$line")
        case vim nvim vi view nano emacs micro
            eval $EDITOR +$line (string escape -- $file)
        case '*'
            eval $EDITOR (string escape -- $file)
    end
end

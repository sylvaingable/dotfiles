function odv
    set -q argv[1] && set pattern $argv[1] || set pattern '.'

    set view (python manage.py show_urls | rg $pattern | fzf --height=60% --reverse | awk -F'\t' '{print $2}')
    test -z "$view"; and return

    set parts (string split -r -m1 '.' $view)
    set class_name $parts[2]
    set file_path (string replace -a '.' '/' $parts[1]).py

    set found_file (git ls-files "*/$file_path" | head -1)
    if test -z "$found_file"
        set found_file (git grep -l "class $class_name" | head -1)
    end
    test -z "$found_file"; and echo "Could not find file or class: $class_name"; and return

    set line_number (rg -n "class $class_name\\b" $found_file | cut -d: -f1 | head -1)
    if test -n "$line_number"
        $EDITOR "$found_file:$line_number"
    else
        $EDITOR $found_file
        echo "Class $class_name not found in $found_file, opened file instead"
    end
end

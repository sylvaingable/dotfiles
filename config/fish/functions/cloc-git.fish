function cloc-git
    set tmp_folder (cat /dev/urandom | base64 | tr -dc '0-9a-zA-Z' | head -c25)
    git clone --depth 1 $argv[1] /tmp/$tmp_folder
    cloc /tmp/$tmp_folder
    rm -rf /tmp/$tmp_folder
end

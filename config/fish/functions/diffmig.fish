function diffmig
    git diff --name-only $argv[1]..$argv[2] | rg --color=never /migrations/ | rg -v '__init__.py'
end

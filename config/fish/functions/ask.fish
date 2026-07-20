function ask
    if test (count $argv) -eq 0
        echo "Usage: ask <question> [model]"
        return 1
    end

    set question $argv[1]
    if test (count $argv) -gt 1
        set model $argv[2]
    else
        set model haiku
    end

    claude --allowedTools "WebSearch" --model $model $question | glow
end

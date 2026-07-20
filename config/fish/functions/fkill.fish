function fkill
    if test (id -u) != 0
        set pid (ps -f -u (id -u) | sed 1d | fzf -m | awk '{print $2}')
    else
        set pid (ps -ef | sed 1d | fzf -m | awk '{print $2}')
    end

    if test -n "$pid"
        set signal (set -q argv[1] && echo $argv[1] || echo 9)
        echo $pid | xargs kill -$signal
    end
end

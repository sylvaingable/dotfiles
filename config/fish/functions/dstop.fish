function dstop --description "Stop all running containers"
    set -l running (docker ps -q)
    if test -n "$running"
        echo "🛑 Stopping $(count $running) running container(s)..."
        docker stop $running
    else
        echo "No running containers."
    end
end

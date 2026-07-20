function dswitch --description "Stop all running containers and start docker compose in current directory"
    dstop
    echo "🚀 Starting docker compose in $(pwd)..."
    docker compose up -d
end

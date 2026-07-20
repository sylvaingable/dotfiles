function venv
    if functions -q deactivate
        deactivate
    end
    if test -d venv
        source venv/bin/activate.fish
    else if test -d .venv
        source .venv/bin/activate.fish
    else
        echo "No venv found"
    end
end

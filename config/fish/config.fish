if status is-interactive
    # Commands to run in interactive sessions can go here

    # Django abbreviations
    abbr -a rs python -Wonce::DeprecationWarning manage.py runserver
    abbr -a sp PYTHONSTARTUP=".startup.py" python manage.py shell_plus
    abbr -a shu python manage.py show_urls
    abbr -a mm python manage.py makemigrations
    abbr -a mg python manage.py migrate
    abbr -a shm python manage.py showmigrations
    abbr -a ck python manage.py check

    # Docker abbreviations
    abbr -a dc docker compose

    # Git abbreviations
    abbr -a gaa git add --all
    abbr -a gcan git commit --verbose --all --no-edit --amend
    abbr -a gau git add --update
    abbr -a gca git commit --all --no-edit --amend
    abbr -a gco git checkout
    abbr -a gd git diff
    abbr -a gcm git commit -m
    abbr -a gl git pull
    abbr -a glog git log --oneline --decorate --graph
    abbr -a glr git pull --rebase
    abbr -a gp git push
    abbr -a gpf git push --force
    abbr -a grs git restore
    abbr -a gs git switch
    abbr -a gss git status --short

    abbr -a wt wrike-timer

    # Zoxide init
    if command -v zoxide >/dev/null 2>&1
        zoxide init fish | source
    end

end

# Use XDG config dir on macOS too (so tools like aerc don't fall back to ~/Library/Preferences)
set -gx XDG_CONFIG_HOME "$HOME/.config"

# uv
fish_add_path "/Users/sylvain/.local/bin"

# mise
mise activate fish | source

# Pi
fish_add_path "/Users/sylvain/.local/share/mise/installs/node/26.3.0/bin"

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init2.fish 2>/dev/null || :

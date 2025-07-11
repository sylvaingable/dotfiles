# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Set locale to English
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Init brew
eval "$(/opt/homebrew/bin/brew shellenv)"

# Load zsh completions
FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

# Start ssh-agent with personal key
#eval `keychain --agents ssh --eval ~/.ssh/vingtcinq_id_rsa`
eval "$(ssh-agent)"

# File to load on python shells startup
export PYTHONSTARTUP=".startup.py"
# Enable Python’s development mode
export PYTHONDEVMODE=1

# Zoxide init
eval "$(zoxide init zsh)"

# zsh-autoenv init — https://github.com/Tarrasch/zsh-autoenv
source ~/projects/dotfiles/lib/zsh-autoenv/autoenv.zsh

# Path to your oh-my-zsh installation.
export ZSH="/Users/sylvain/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# No need to activate a theme if starship is activated
# ZSH_THEME="robbyrussell"
ZSH_THEME=""
# Activate starship prompt
eval "$(starship init zsh)"


# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000000
SAVEHIST=10000000
# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="yyyy-mm-dd"

HISTORY_IGNORE="(ls|cd|pwd|exit|cd)*"
setopt EXTENDED_HISTORY      # Write the history file in the ':start:elapsed;command' format.
setopt INC_APPEND_HISTORY    # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY         # Share history between all sessions.
setopt HIST_IGNORE_DUPS      # Do not record an event that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS  # Delete an old recorded event if a new event is a duplicate.
setopt HIST_IGNORE_SPACE     # Do not record an event starting with a space.
setopt HIST_SAVE_NO_DUPS     # Do not write a duplicate event to the history file.
setopt HIST_VERIFY           # Do not execute immediately upon history expansion.
setopt APPEND_HISTORY        # append to history file (Default)
setopt HIST_NO_STORE         # Don't store history commands
setopt HIST_REDUCE_BLANKS    # Remove superfluous blanks from each command line being added to the history.

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    iterm2
    git
    macos
    python
)

# If iterm2 plugin is activated
zstyle :omz:plugins:iterm2 shell-integration yes

source $ZSH/oh-my-zsh.sh

# Brew plugins
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
# source /opt/homebrew/opt/zsh-vi-mode/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


# fzf-relatd configuration
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix --hidden'

# Android dev tools paths
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Useful less options
export LESS='--chop-long-lines --HILITE-UNREAD --ignore-case --incsearch --jump-target=4 --LONG-PROMPT --no-init --quit-if-one-screen --RAW-CONTROL-CHARS --use-color --window=-4'

# Colored man pages with less
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'
export LESS_TERMCAP_ue=$'\E[0m'

# Init nvm
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# Init pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Custom aliases

## Generic aliases
alias ll='ls -alh'

# One CLI client
alias 'one=PYTHONPATH=$HOME/projects/one-cli/ $HOME/projects/one-cli/.venv/bin/one'

## Django-related aliases
alias 'rs=python -Wonce::DeprecationWarning manage.py runserver'
alias 'drs=python -Xfrozen_modules=off -m debugpy --wait-for-client --listen localhost:5678 manage.py runserver --nothreading'
alias 'sp=PYTHONSTARTUP=".startup.py" python manage.py shell_plus'
alias 'dsp=PYTHONSTARTUP=".startup.py" python -m debugpy --wait-for-client --listen localhost:5678 manage.py shell_plus'
alias 'shu=python manage.py show_urls'
alias 'mm=python manage.py makemigrations'
alias 'mg=python manage.py migrate'
alias 'shm=python manage.py showmigrations'
alias 'ck=python manage.py check'
alias 't=python manage.py test --keepdb --failfast -k'
alias 'tr=python manage.py test --noinput --failfast -k'
alias 'ft=fail python manage.py test --keepdb --failfast -k'
alias 'dt=python manage.py test --keepdb --failfast --pudb -k'
alias 'fdt=fail python manage.py test --keepdb --pudb -k'
alias 'tv=python manage.py test --keepdb --failfast -v2 --print-result -k'

## Python aliases
alias 'dbgpy=PYDEVD_WARN_SLOW_RESOLVE_TIMEOUT=5 python -Xfrozen_modules=off -m debugpy --wait-for-client --listen localhost:5678'
alias 'pudb=python -m pudb -c'

## Custom git aliases
alias 'commit=git add . && git commit -a -m'
### Pick commit to fixup interactively
### https://jordanelver.co.uk/blog/2020/06/04/fixing-commits-with-git-commit-fixup-and-git-rebase-autosquash/#fixup-commits
alias 'fixup=git log -n 50 --pretty=format:"%h %s" --no-merges | fzf | cut -c -7 | xargs -o git commit --fixup'
### Switch branches interactively
alias 'gs=git branch --sort=-committerdate --format="%(refname:short)" | fzf --preview="git log --date=relative --color main..{}" | xargs git switch'
### Pick commit to show interactively
alias 'gshow=git log --pretty=format:"%h %s" --no-merges | fzf | cut -c -7 | xargs -o git show'

# Custom functions

mkcd() { mkdir $1 && cd $1; }

fail() { while $*; do :; done }

5times() { for i in {1..5}; do "$@"; done }


# switch venv automatically
venv() {
  if command -v deactivate &> /dev/null ; then
    deactivate
  fi
  if [ -d "venv" ] ; then
    source venv/bin/activate
  elif [ -d ".venv" ] ; then
    source .venv/bin/activate
  else
    echo "No venv found"
  fi
}

# Locally fast-forward the checked-out branch into another and push the latter to origin
gffp() {
  for branch in "$@"
  do
    git fetch . $(git branch --show-current):"$branch"
    git push origin "$branch"
  done
}

# Fetch remote branch without checking it out
gfb() {
  git fetch . origin/$1:$1
}

# Hard reset local branch to remote counterpart without checking it out
gbf() {
  git reset -f $1 origin/$1
}

# Autosquash rebase the current branch onto a specific commit (last commit of the main
# branch by default)
gras() {
  local target=${1:-$(git_main_branch)}
  echo $target
  GIT_EDITOR=true git rebase -i --autosquash --keep-base "$target"
}
# Same as above with interactive selection of a specific commit to rebase onto
grasi() {
  export GIT_EDITOR=true
  local commit
  commit=$(git log -n 50 --pretty=format:"%h %s" --no-merges | fzf | cut -c -7)
  
  if [[ -n $commit ]]; then
    git rebase -i --autosquash --keep-base "$commit"
  else
    echo "No commit selected, aborting."
  fi

  unset GIT_EDITOR
}



# List Django migrations modified between two commits
diffmig() {
  git diff --name-only $1..$2 | rg --color=never /migrations/ | rg -v '__init__.py'
}

# Remove a migration file
rmig() {
   fd $@ . --exec rm
}

# Get the name of a Django class-based view from its namespace
cbv() {
#  venv
  python manage.py show_urls | rg "\S+\s+\S+\.(\S+)\s+$@$" -or '$1' | tee >(pbcopy)
}

# Combine ripgrep/fzf/delta to search for a string in a git repo
rgf() {
  rg --files-with-matches --no-messages "$@" | fzf --preview "rg --json --context 10 '$@[-1]' {} | delta"
}

git-ls-sizes() {
git rev-list --objects --all |
  git cat-file --batch-check='%(objecttype) %(objectname) %(objectsize) %(rest)' |
  sed -n 's/^blob //p' |
  sort --numeric-sort --key=2 |
  cut -c 1-12,41- |
  $(command -v gnumfmt || echo numfmt) --field=2 --to=iec-i --suffix=B --padding=7 --round=nearest
}

# Fuzzy kill
fkill() {
    local pid 
    if [ "$UID" != "0" ]; then
        pid=$(ps -f -u $UID | sed 1d | fzf -m | awk '{print $2}')
    else
        pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')
    fi  

    if [ "x$pid" != "x" ]
    then
        echo $pid | xargs kill -${1:-9}
    fi  
}

# Execute a command n times and compute its average execution time
function avg_time {
    local n=$1
    shift
    local command="$@"

    local total_time=0

    for (( i=1; i<=n; i++ ))
    do
        # Measure the execution time using zsh's built-in time feature
        local exec_time=$(zsh -ic "time $command" 2>&1)
        
        # Extract the total time using awk, focusing on the line with 'total'
        local time_in_seconds=$(echo "$exec_time" | awk '/total/ {print $(NF-1)}')
        
        # Add to total time
        total_time=$(awk -v total="$total_time" -v current="$time_in_seconds" 'BEGIN {printf "%.3f", total + current}')
        
        echo "Iteration $i: $time_in_seconds seconds" >&2
    done

    local average_time=$(awk -v total="$total_time" -v n="$n" 'BEGIN {printf "%.3f", total / n}')
    echo "Average execution time: $average_time seconds"
}

cloc-git () {
  local tmp_folder=$(cat /dev/urandom | base64 | \tr -dc '0-9a-zA-Z' | head -c25)
  git clone --depth 1 "$1" /tmp/$tmp_folder
  cloc /tmp/$tmp_folder
  rm -rf /tmp/$tmp_folder
}

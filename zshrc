# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Set locale to English
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Detect host OS
is_macos=false
is_linux=false
case "$OSTYPE" in
  darwin*) is_macos=true ;;
  linux*) is_linux=true ;;
esac

# Init brew when available
if [[ -x /opt/homebrew/bin/brew ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Load zsh completions
if command -v brew >/dev/null 2>&1; then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
fi

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
export ZSH="$HOME/.oh-my-zsh"

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
# ENABLE_CORRECTION="true"

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
    git
    python
)
if [[ "$is_macos" == true ]]; then
    plugins+=(iterm2 macos)
fi

# If iterm2 plugin is activated
if [[ "$is_macos" == true ]]; then
  zstyle :omz:plugins:iterm2 shell-integration yes
fi

source $ZSH/oh-my-zsh.sh

# Brew plugins
if command -v brew >/dev/null 2>&1; then
  autosuggestions_file="$(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
  [ -f "$autosuggestions_file" ] && source "$autosuggestions_file"
fi
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
if [[ "$is_macos" == true ]]; then
  export ANDROID_HOME="$HOME/Library/Android/sdk"
elif [[ "$is_linux" == true ]]; then
  export ANDROID_HOME="$HOME/Android/Sdk"
fi
if [[ -n "$ANDROID_HOME" ]]; then
  export PATH=$PATH:$ANDROID_HOME/emulator
  export PATH=$PATH:$ANDROID_HOME/tools
  export PATH=$PATH:$ANDROID_HOME/tools/bin
  export PATH=$PATH:$ANDROID_HOME/platform-tools
fi

if [[ "$is_macos" == true ]]; then
  test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
fi

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
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
if command -v brew >/dev/null 2>&1; then
  [ -s "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" ] && \. "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm"
fi

# Init pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Custom aliases

## Generic aliases
alias ll='ls -alh'

## One CLI client
alias 'one=PYTHONPATH=$HOME/projects/one-cli/ $HOME/projects/one-cli/.venv/bin/one'

## localcurl alias
alias lc='localcurl http://127.0.0.1:8000'

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
alias 'fixup=git log -n 50 --pretty=format:"%h %s" --no-merges | fzf --reverse | cut -c -7 | xargs -o git commit --fixup'
### Switch branches interactively
alias 'gs=git branch --sort=-committerdate --format="%(refname:short)" | fzf --preview="git log --date=relative --color main..{}" | xargs git switch'
### Pick commit to show interactively
alias 'gshow=git log --pretty=format:"%h %s" --no-merges | fzf --reverse | cut -c -7 | xargs -o git show'
### Pick commit to switch to interactively (detached HEAD)
alias 'gsd=git log --pretty=format:"%h %s" --no-merges --all | fzf --reverse | cut -c -7 | xargs -o git switch --detach'

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

# Locally hard reset the provided branches to the checked-out branch and force push them to origin
ghrfp() {
  local current_commit=$(git rev-parse HEAD)
  for branch in "$@"
  do
    git update-ref "refs/heads/$branch" "$current_commit"
    git push --force origin "$branch"
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
  commit=$(git log -n 50 --pretty=format:"%h %s" --no-merges | fzf --reverse | cut -c -7)
  
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

# Open a Django view by filtering Django URLs interactively (a first filter can be
# provided as a regex )
odv() {
  local pattern=$1
  local selected
  if [ -n "$pattern" ]; then
    selected=$(python manage.py show_urls | rg "$pattern")
  else
    selected=$(python manage.py show_urls)
  fi
  local view=$(echo "$selected" | fzf --height=60% --reverse | awk -F'\t' '{print $2}')
  
  if [ -n "$view" ]; then
    # Extract just the class name (without module path)
    local class_name="${view##*.}"
    # Extract the module path
    local module_path="${view%.*}"
    # Convert module path to file path
    local file_path="${module_path//.//}.py"
    
    # Try to find the file using git
    local found_file=$(git ls-files "*/$file_path" | head -1)
    
    if [ -n "$found_file" ]; then
      # Search for the class definition in the file
      local line_number=$(rg -n "class $class_name\b" "$found_file" | cut -d: -f1 | head -1)
      
      if [ -n "$line_number" ]; then
        # Open in VS Code at the specific line
        code -g "$found_file:$line_number"
      else
        # Open the file without a specific line if class not found
        code "$found_file"
        echo "Class $class_name not found in $found_file, opened file instead"
      fi
    else
      # If file not found, try to find the class anywhere in the project
      local class_location=$(git grep -l "class $class_name" | head -1)
      
      if [ -n "$class_location" ]; then
        local line_number=$(rg -n "class $class_name\b" "$class_location" | cut -d: -f1 | head -1)
        code -g "$class_location:$line_number"
      else
        echo "Could not find file or class: $class_name"
      fi
    fi
  fi
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


cloc-git () {
  local tmp_folder=$(cat /dev/urandom | base64 | \tr -dc '0-9a-zA-Z' | head -c25)
  git clone --depth 1 "$1" /tmp/$tmp_folder
  cloc /tmp/$tmp_folder
  rm -rf /tmp/$tmp_folder
}

function mem() {
  # Run command with OS-appropriate \time output format.
  if [[ "$is_macos" == true ]]; then
    output=$( ( \time -l "$@" ) 2>&1 )
    # macOS reports maximum resident set size in bytes.
    max_rss=$(echo "$output" | awk '/maximum resident set size/ {print $1}')
    max_rss_mib=$((max_rss / 1024 / 1024))
  else
    output=$( ( /usr/bin/time -v "$@" ) 2>&1 )
    # Linux reports maximum resident set size in KiB.
    max_rss=$(echo "$output" | awk -F': *' '/Maximum resident set size/ {print $2}')
    max_rss_mib=$((max_rss / 1024))
  fi
  exit_status=$?

  echo "${max_rss_mib} MiB"

  return $exit_status
}

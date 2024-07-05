#!/bin/sh

# Enable shell script strictness
set -eu

# Enable command tracing
set -x

# Ensure config directory exists
mkdir -p ~/.config

# Link Git config
[ ! -e ~/.config/git ] && ln -s "$PWD/config/git" ~/.config/git

# Link zsh config
[ ! -e ~/.zshrc ] && ln -s "$PWD/zshrc" ~/.zshrc

# Link ipython default profile startup scripts
for file in $PWD/ipython/profile_default/startup/*; do
    # echo "$file"
    [ ! -e ~/.ipython/profile_default/startup/$(basename "$file") ] && ln -s "$file" ~/.ipython/profile_default/startup/$(basename "$file")
done

# Link psql config
[ ! -e ~/.psqlrc ] && ln -s "$PWD/psqlrc" ~/.psqlrc

# Link pip config
mkdir -p ~/.pip
[ ! -e ~/.pip/pip.conf ] && ln -s "$PWD/pip.conf" ~/.pip/pip.conf
#!/bin/sh

# Enable shell script strictness
set -eu

# Enable command tracing
set -x

# Ensure config directory exists
mkdir -p ~/.config

# Link Git config
ln -sf "$PWD/config/git" ~/.config/git

# Link zsh config (replace existing one if it exists)
ln -sf "$PWD/zshrc" ~/.zshrc

# Link ipython default profile startup scripts
mkdir -p ~/.ipython/profile_default/startup
for file in $PWD/ipython/profile_default/startup/*; do
    [ -f "$file" ] || continue
    [ ! -e ~/.ipython/profile_default/startup/$(basename "$file") ] && ln -s "$file" ~/.ipython/profile_default/startup/$(basename "$file")
done

# Link (i)pdb config
ln -sf "$PWD/pdbrc" ~/.pdbrc


# Link psql config
ln -sf "$PWD/psqlrc" ~/.psqlrc

# Link pip config
mkdir -p ~/.pip
ln -sf "$PWD/pip.conf" ~/.pip/pip.conf
#!/usr/bin/sh

# Description:
# This script is used to link the dotfiles to the proper
# locations in the home directory.

set -ex

# Link the nvim config
ln -sf $(realpath ./nvim/) ~/.config/

# Link the .gitconfig
ln -sf $(realpath ./git/.gitconfig) ~/.gitconfig

# Link the .tmux.conf
ln -sf $(realpath ./tmux/.tmux.conf) ~/.tmux.conf

# Add the git hooks
if [ ! -d "~/gitconfig/hooks" ]; then
    mkdir -p ~/gitconfig/hooks
fi
ln -sf $(realpath ./git/hooks/pre-commit) ~/gitconfig/hooks/pre-commit

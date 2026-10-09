#!/usr/bin/env bash
set -euo pipefail
DIR="$(cd "$(dirname "$0")" && pwd)"

# zap
git -C "$DIR" submodule update --init --depth 1
mkdir -p ~/.local/share
ZAP_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
mkdir -p "$ZAP_HOME"
ln -sfn "$DIR/zap" "$ZAP_HOME/zap"

ln -sf "$DIR/.zshrc" ~/.zshrc
ln -sf "$DIR/.zsh" ~/.zsh

# container-safe git signing via forwarded agent
if key="$(ssh-add -L 2>/dev/null | grep -m1 '^ssh-')"; then
  git config --global gpg.format ssh
  git config --global user.signingkey "key::$key"
else
  git config --global commit.gpgsign false
fi

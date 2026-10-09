#!/usr/bin/env bash
set -euo pipefail
DIR="$(cd "$(dirname "$0")" && pwd)"
mkdir -p ~/.local/share

ln -sf "$DIR/.zshrc" ~/.zshrc
ln -sf "$DIR/.zsh" ~/.zsh
ln -sf "$DIR/zap" ~/.local/share/zap

# container-safe git signing via forwarded agent
if key="$(ssh-add -L 2>/dev/null | grep -m1 '^ssh-')"; then
  git config --global gpg.format ssh
  git config --global user.signingkey "key::$key"
else
  git config --global commit.gpgsign false
fi

#!/usr/bin/env bash
set -euo pipefail
DIR="$(cd "$(dirname "$0")" && pwd)"

# zap
ZAP_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
mkdir -p "$ZAP_HOME"
ZAP_DIR="${ZAP_HOME}/zap"
[ -d "$ZAP_DIR" ] || git clone --depth 1 -b release-v1 https://github.com/zap-zsh/zap.git "$ZAP_DIR"

ln -sf "$DIR/.zshrc" ~/.zshrc
ln -sf "$DIR/.zsh" ~/.zsh
ln -sf "$DIR/.gitconfig" ~/.gitconfig

# container-safe git signing via forwarded agent
if key="$(ssh-add -L 2>/dev/null | grep -m1 '^ssh-')"; then
  git config --global gpg.format ssh
  git config --global user.signingkey "key::$key"
else
  git config --global commit.gpgsign false
fi

zsh -ic 'exit' >/dev/null 2>&1 || true

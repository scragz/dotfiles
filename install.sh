#!/usr/bin/env bash
set -euo pipefail
DIR="$(cd "$(dirname "$0")" && pwd)"

link() {
  local src="$DIR/$1" dst="$HOME/$1"
  if [[ -e "$dst" && ! -L "$dst" ]]; then mv "$dst" "$dst.bak.$(date +%s)"; fi
  ln -sfn "$src" "$dst"
  echo "dotfiles: linked $1"
}

# 1. local + deterministic first
link .zshrc
link .zsh
link .gitconfig
touch ~/.gitconfig.local

# 2. network, non-fatal
ZAP_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/zap"
mkdir -p "$(dirname "$ZAP_DIR")"
if [[ ! -d "$ZAP_DIR" ]]; then
  git clone --depth 1 -b release-v1 https://github.com/zap-zsh/zap.git "$ZAP_DIR" \
    && echo "dotfiles: zap installed" \
    || echo "dotfiles: WARN zap clone failed; will retry on next shell" >&2
fi

# 3. warm plugins, bounded
timeout 120 zsh -ic 'exit' >/dev/null 2>&1 || echo "dotfiles: WARN zsh warmup failed/timed out" >&2

echo "dotfiles: done"

zmodload zsh/complist

# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"

plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
plug "zap-zsh/zap-prompt"
plug "zsh-users/zsh-syntax-highlighting"

ZAP_PROMPT_ELEMENTS=(user host dir git status)

# Load and initialise completion system
autoload -Uz compinit
compinit

export ZSH="$HOME/.zsh"
export PATH=$HOME/bin:/usr/local/bin:/Users/scragz/.lmstudio/bin:$PATH
export GOPATH="$HOME/src/go"
export PATH="$PATH:$GOPATH/bin"
export DYLD_LIBRARY_PATH=/opt/homebrew/lib:/usr/local/lib:$DYLD_LIBRARY_PATH

# export RUBYOPT='-W:no-deprecated -W:no-experimental'
export RUBYOPT='-W0'

source "$ZSH/aliases.zsh"
source "$ZSH/keybindings.zsh"
source "$ZSH/environment.zsh"
source "$ZSH/completion.zsh"
source "$ZSH/history.zsh"
source "$ZSH/ssh.zsh"
source "$ZSH/git.zsh"
source "$ZSH/gh.zsh"
source "$ZSH/npm.zsh"
source "$ZSH/uv.zsh"
source "$ZSH/command-not-found.zsh"

ssh_host_segment() {
  if [[ -n "$SSH_CLIENT" || -n "$SSH_TTY" ]]; then
    echo "%F{yellow}@%m%f "
  fi
}

# Inject before current prompt segment
PROMPT='$(ssh_host_segment)'"$PROMPT"

[[ "$TERM_PROGRAM" == "vscode" ]] && . "$(code --locate-shell-integration-path zsh)"

if [[ "$OSTYPE" == darwin* ]]; then
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
  export PATH="/Applications/SuperCollider.app/Contents/MacOS:/Applications/SuperCollider.app/Contents/Resources/:$PATH"
fi

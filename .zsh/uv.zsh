_auto_venv() {
  if [[ -f "$PWD/.venv/bin/activate" ]]; then
    [[ "$VIRTUAL_ENV" != "$PWD/.venv" ]] && source "$PWD/.venv/bin/activate"
  elif [[ -n "$VIRTUAL_ENV" && "$PWD" != "${VIRTUAL_ENV:h}"* ]]; then
    deactivate
  fi
}
autoload -U add-zsh-hook
add-zsh-hook chpwd _auto_venv
_auto_venv

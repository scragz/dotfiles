alias l='ls -1A'         # Lists in one column, hidden files.
alias ll='ls -lh'        # Lists human readable sizes.
alias lr='ll -R'         # Lists human readable sizes, recursively.
alias la='ll -A'         # Lists human readable sizes, hidden files.
alias lm='la | "$PAGER"' # Lists human readable sizes, hidden files through pager.
alias lk='ll -Sr'        # Lists sorted by size, largest last.
alias lt='ll -tr'        # Lists sorted by date, most recent last.
alias lc='lt -c'         # Lists sorted by date, most recent last, shows change time.
alias lu='lt -u'         # Lists sorted by date, most recent last, shows access time.
alias sl='ls'            # Correction for common spelling error.
export GREP_COLOR=${GREP_COLOR:-'37;45'}            # BSD.
export GREP_COLORS=${GREP_COLORS:-"mt=$GREP_COLOR"} # GNU.
alias grep="${aliases[grep]:-grep} --color=auto"
alias o='open'
alias pbc='pbcopy'
alias pbp='pbpaste'
# Resource Usage
alias df='df -kh'
alias du='du -kh'
alias topc='top -o cpu'
alias topm='top -o vsize'
alias _='sudo'
alias b='${(z)BROWSER}'
alias diffu="diff --unified"
alias e='${(z)VISUAL:-${(z)EDITOR}}'
alias mkdir="${aliases[mkdir]:-mkdir} -p"
alias p='${(z)PAGER}'
alias po='popd'
alias pu='pushd'
alias sa='alias | grep -i'
alias type='type -a'
# Safe
#alias cp="${aliases[cp]:-cp} -i"
#alias ln="${aliases[ln]:-ln} -i"
#alias mv="${aliases[mv]:-mv} -i"
#alias rm="${aliases[rm]:-rm} -i"
# Changes directory to the current Finder directory.
alias cdf='cd "$(pfd)"'
# Pushes directory to the current Finder directory.
alias pushdf='pushd "$(pfd)"'

alias d='dirs -v'
for index ({1..9}) alias "$index"="cd +${index}"; unset index

# ruby
alias be='bundle exec'
alias bi='bundle install'

# npm
alias npmi='npm install'
alias npml='npm list'
alias npmo='npm outdated'
alias npmp='npm publish'
alias npmP='npm prune'
alias npmr='npm run'
alias npms='npm search'
alias npmt='npm test'
alias npmu='npm update'
alias npmx='npm uninstall'
alias npmci='npm ci'
alias npmcit='npm cit'
alias npmit='npm it'

# code
alias code='code-insiders'

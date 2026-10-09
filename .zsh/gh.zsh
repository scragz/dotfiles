function lll-gh-project() {
  local cmd=$1; shift
  gh project "$cmd" 2 --owner lllreptile "$@"
}
function lll-gh() {
  # repo flag goes last so it works regardless of subcommand nesting
  gh "$@" --repo lllreptile/lllreptile5
}
function lll-create-issue() {
  local title=$1 body=${2-} url
  url=$(lll-gh issue create -t "$title" -b "$body") || return
  lll-gh-project item-add --url "$url"
}
function lll-item-list() {
  lll-gh-project item-list --limit 100 --format json \
  --jq '.items[] | "\(.content.number) \(.status // "no status") \(.content.title)"'
}
function lll-item-archive() {
  lll-gh-project item-archive "$@"
}
function lll-item-delete() {
  lll-gh-project item-delete "$@"
}
function lll-item-edit() {
  lll-gh-project item-edit "$@"
}

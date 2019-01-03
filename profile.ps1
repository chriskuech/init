
function Open-Branch {
  $origin = git config remote.origin.url
  $branch = git branch --format "%(refname:short)"
  start "$origin/$branch"
}


function Get-Branch {
  git rev-parse --abbrev-ref HEAD
}

function Get-Origin {
  (git config remote.origin.url) -replace "\.git$"
}

function New-PullRequest {
  $branch = Get-Branch
  $branchEscaped = [uri]::EscapeUriString($branch)
  $origin = Get-Origin
  if ($origin -like "*.visualstudio.com*" -or $origin -like "*dev.azure.com*") {
    Start-Process "$origin/pullrequestcreate?sourceRef=$branchEscaped&targetRef=master"
  }
  else {
    $origin -match "https?://([^/]+)" | Out-Null
    $hostname = $Matches[1]
    throw "Git host '$hostname' is not supported by this cmdlet"
  }
}
function Open-Branch {
  $branch = Get-Branch
  $origin = Get-Origin
  if ($origin -like "*github.com*") {
    Start-Process "$origin/tree/$branch"
  }
  elseif ($origin -like "*.visualstudio.com*" -or $origin -like "*dev.azure.com*") {
    Start-Process "$origin/$branch"
  }
  else {
    $origin -match "https?://([^/]+)" | Out-Null
    $hostname = $Matches[1]
    throw "Git host '$hostname' is not supported by this cmdlet"
  }
}

function Publish-Branch {
  git push --set-upstream origin (Get-Branch)
}

function Repair-Git {
  git gc --prune=now --aggressive
  git remote prune origin
}

Set-Location "C:\Repos"

# Git Zsh plugin Cheatsheet

### Installation

git zsh plugin requires [zsh](https://github.com/robbyrussell/oh-my-zsh) to run.

### Plugins

Dillinger is currently extended with the following plugins. Instructions on how to use them in your own application are linked below.

| Command | Description | Syntax |
| ------  | ------      | --    |
| gcb "branch name" | Change branch | git checkout -b
| gaa | Add all files | git add --all
| gcam "commit message" | Commit with message | git commit -a -m
| gpsup | push to origin | git push --set-upstream origin $(current_branch)
| ggl | pull current branch | git pull origin $(current_branch)
| gsta | stash current change | git stash save
| gstp | pop stash | git stash pop
| gstaa | apply stash | git stash apply
| glol | show commit tree | 
| glola | show all commit tree |
| gcm | checkout to master | git checkout master |

For full command detail check git zsh plugin [wiki](https://github.com/robbyrussell/oh-my-zsh/wiki/Plugin:git) page.
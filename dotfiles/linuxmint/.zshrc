export ZSH="$HOME/.oh-my-zsh"
export PATH=$PATH:/usr/local/go/bin

ZSH_THEME="robbyrussell"

plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

EDITOR="code"
alias zshconfig="$EDITOR ~/.zshrc"
alias ohmyzsh="$EDITOR ~/.oh-my-zsh"

alias upd="sudo apt update"
alias upg="sudo apt upgrade"
alias i="sudo apt install"
alias ui="sudo apt purge"
alias fastlane="bundle exec fastlane"

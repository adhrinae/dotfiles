export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

alias vi="vim"
alias zshconfig="vim ~/.zshrc"
alias vimconfig="vim ~/.vimrc"

alias nr="npm run"
alias ys="yarn start"
alias yt="yarn test"
alias ysb="yarn storybook"
alias y="yarn"

alias py3="python3"

export EDITOR="vim"

setopt EXTENDED_GLOB
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

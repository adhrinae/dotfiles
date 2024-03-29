export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

alias vi="nvim"
alias vim="nvim"
alias zshconfig="nvim ~/.zshrc"
alias vimconfig="nvim ~/.vimrc"

alias nr="npm run"
alias ys="yarn start"
alias yt="yarn test"
alias ysb="yarn storybook"
alias y="yarn"

alias py3="python3"

alias az="arch -x86_64 zsh"

export EDITOR="nvim"

# prezto
setopt EXTENDED_GLOB
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

if [[ $OSTYPE == darwin* && $CPUTYPE == arm64 ]]; then
  # Homebrew
  eval $(/opt/homebrew/bin/brew shellenv)

  # asdf
  source $(brew --prefix asdf)/libexec/asdf.sh
else
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
fi

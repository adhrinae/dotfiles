# Fig pre block. Keep at the top of this file.
export PATH="${PATH}:${HOME}/.local/bin"
eval "$(fig init zsh pre)"




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
  . $HOME/.asdf/asdf.sh
  # append completions to fpath
  fpath=(${ASDF_DIR}/completions $fpath)
  # initialise completions with ZSH's compinit
  autoload -Uz compinit && compinit
else
  export PATH="/usr/local/sbin:$PATH"
fi

export VOLTA_HOME="$HOME/.volta"
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH="$VOLTA_HOME/bin:$PATH"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh" || true



# Fig post block. Keep at the bottom of this file.
eval "$(fig init zsh post)"

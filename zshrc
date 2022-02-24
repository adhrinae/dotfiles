
#### FIG ENV VARIABLES ####
# Please make sure this block is at the start of this file.
[ -s ~/.fig/shell/pre.sh ] && source ~/.fig/shell/pre.sh
#### END FIG ENV VARIABLES ####

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
  alias brew=/usr/local/homebrew/bin/brew
  # Homebrew
  eval $(/opt/homebrew/bin/brew shellenv)
  # asdf
  . /opt/homebrew/opt/asdf/asdf.sh
else
  export PATH="/usr/local/sbin:$PATH"

  export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
fi


test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh" || true


export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

#### FIG ENV VARIABLES ####
# Please make sure this block is at the end of this file.
[ -s ~/.fig/fig.sh ] && source ~/.fig/fig.sh
#### END FIG ENV VARIABLES ####

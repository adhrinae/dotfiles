setopt EXTENDED_GLOB
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

export PATH=/usr/local/bin:$HOME/bin:$PATH

# Include pure-power settings
source ~/.purepower

# plugins=(git npm colorize alias-tips fasd zsh-completions zsh-autosuggestions zsh-syntax-highlighting)

export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

alias vi="vim"
alias zshconfig="vim ~/.zshrc"
alias vimconfig="vim ~/.vimrc"
alias rbs="ruby -run -e httpd . -p 7777"

alias gud="gup origin develop"
alias gpd="gp origin develop"

alias nr="npm run"
alias ys="yarn start"
alias yt="yarn test"
alias ysb="yarn storybook"
alias y="yarn"

alias cdw="cd ~/development/project_work/cloud-web"

export EDITOR="vim"

# Fzf with Ripgrep
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files --follow --hidden'

export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).


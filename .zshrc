export TERM="xterm-256color"

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

CONFIG=$HOME/.config/zsh
source $CONFIG/.aliases
source $CONFIG/.themes

# ZSH_THEME="spaceship"

plugins=(
  git
  zsh-syntax-highlighting
  virtualenv
  extract
)

source $ZSH/oh-my-zsh.sh

# Anaconda3
export PATH="$HOME/anaconda3/bin:$PATH"  # commented out by conda initialize

export PATH="$HOME/Library/Python/3.7/bin:$PATH"


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_DEFAULT_COMMAND="fd --exclude={.git,.idea,.vscode,.sass-cache,node_modules,build} --type f"

realpath() {
    [[ $1 = /* ]] && echo "$1" || echo "$PWD/${1#./}"
}

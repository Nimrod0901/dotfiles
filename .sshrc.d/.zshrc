
export TERM="xterm-256color"

export ZSH=$SSHHOME/.sshrc.d/.oh-my-zsh

ZSH_THEME="robbyrussell"

plugins=(
  git
  extract
  autojump
#  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

export PATH=$HOME/local/bin:$PATH

alias clr='clear'
alias clr='clear'
alias c='cd ./*(/om[1])'
alias gc='git checkout $(git branch -r | fzf)'
#alias tmux='tmux -2'

DISABLE_UNTRACKED_FILES_DIRTY="true"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

install_autojump() {
    if [ -d ~/autojump ]; then
        echo "autojump already installed"
    else
        echo "installing autojump"
        git clone git://github.com/wting/autojump.git
        cd autojump
        ./install.py
        cd -
    fi
}

install_fzf() {
  if [ -d ~/.fzf ]; then
      echo "fzf already installed"
  else
      echo "installing fzf"
      git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
      ~/.fzf/install
  fi
}

rld() {
    source $ZDOTDIR
}

export PATH=$HOME/local/bin:$PATH
export PKG_CONFIG_PATH=$HOME/local/lib/pkgconfig:$PKG_CONFIG_PATH
export PATH=$HOME/.pyenv/bin:$PATH

function open_pyenv()
{
    export PATH="/home/ybwang/.pyenv/bin:$PATH"
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
}

function jd() {
  diff <(jq -S . $1) <(jq -S . $2) $3
}

function vjd() {
  vimdiff <(jq -S . $1) <(jq -S . $2) $3
}

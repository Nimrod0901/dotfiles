[[ $TMUX = "" ]] && export TERM="xterm-256color"
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"

plugins=(
  git
  extract
  autojump
  docker
  docker-compose
#  zsh-syntax-highlighting
)
source $ZSH/oh-my-zsh.sh


alias clr='clear'
alias c='cd ./*(/om[1])'
alias gc='git checkout $(git branch -r | fzf)'
alias tmux='tmux -2'
alias md='mkdir $(date --rfc-3339=date)'
alias gstu='git status -uno'

DISABLE_UNTRACKED_FILES_DIRTY="true"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export PATH=$HOME/local/bin:$HOME/local/clang+llvm/bin:$PATH
export PKG_CONFIG_PATH=$HOME/local/lib/pkgconfig:$PKG_CONFIG_PATH
export PATH=$HOME/.pyenv/bin:$PATH

function open_pyenv()
{
    export PATH="$HOME/.pyenv/bin:$PATH"
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
}

function jd() {
  diff <(jq -S . $1) <(jq -S . $2) $3
}

function vjd() {
  vimdiff <(jq -S . $1) <(jq -S . $2) $3
}

calc() #@ Perform arithmetic, including decimal fractions
{
    local result=$(awk 'BEGIN { OFMT="%f"; print '"$*"'; exit}')
    case $result in
        *.*0) result=${result%"${result##*[!0]}"} ;;
    esac
    printf "%s\n" "$result"
}

function thread_stat() {
    watch -d -n 1 "cat /proc/$1/status| grep Threads"
}

function getip() {
    ifconfig | grep "inet addr" | head -n 1 | cut -d ':' -f 2 | cut -d ' ' -f 1
}

function tmuxrc() {
    local TMUXDIR=/tmp/russelltmuxserver
    if ! [ -d $TMUXDIR ]; then
        rm -rf $TMUXDIR
        mkdir -p $TMUXDIR
    fi
#    rm -rf $TMUXDIR/.sshrc.d >/dev/null 2>&1
    cp -r $SSHHOME/.sshrc $SSHHOME/bashsshrc $SSHHOME/sshrc $SSHHOME/.sshrc.d $TMUXDIR 2>&1 > /dev/null
    export SSHHOME=$TMUXDIR
    export ZDOTDIR=$SSHHOME/.sshrc.d/ 
    export VIMINIT="let \$MYVIMRC='$SSHHOME/.sshrc.d/.vimrc' | source \$MYVIMRC"
    SHELL=$TMUXDIR/bashsshrc /usr/bin/tmux -2 -S $TMUXDIR/tmuxserver $@
}

alias dpsl="docker ps -l"
alias dps="docker ps"
alias dpsa="docker ps -a"
alias di="docker images"
alias dip="docker inspect --format '{{ .NetworkSettings.IPAddress }}'"
alias dkd="docker run -d -P"
alias drit="docker run -i -t"
alias dxit="docker exec -i -t"
alias drmf='docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)'
alias vim='nvim'

# Stop all containers
dstop() { docker stop $(docker ps -a -q); }

# Remove all containers
drm() { docker rm $(docker ps -a -q); }

# Remove all images
dri() { docker rmi $(docker images -q); }

# Dockerfile build, e.g., $dbu tcnksm/test 
dbu() { docker build -t=$1 .; }

# Show all alias related docker
dalias() { alias | grep 'docker' | sed "s/^\([^=]*\)=\(.*\)/\1 => \2/"| sed "s/['|\']//g" | sort; }

# Bash into running container
dbash() { docker exec -it $(docker ps -aqf "name=$1") bash; }

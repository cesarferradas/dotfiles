export PATH=$HOME/bin:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH
export PATH=/usr/local/opt/ruby/bin:$PATH

export PYTHONDONTWRITEBYTECODE=1

export NVM_DIR="$HOME/.nvm"

export ZSH=$HOME/.oh-my-zsh

ZSH_THEME=powerlevel9k/powerlevel9k

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(status time virtualenv dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=()
POWERLEVEL9K_STATUS_CROSS=true
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"
POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
POWERLEVEL9K_SHORTEN_DELIMITER=""

plugins=(
  git
  zsh-autosuggestions
  z
)

source $ZSH/oh-my-zsh.sh

export EDITOR="nvim"

alias dc="docker-compose"
alias gl="git log --format='format:%C(yellow)%h%Creset %s %C(red)%D%Creset %C(bold blue)<%an>%Creset'"
alias gpl="git pull"
alias ngrok="~/ngrok"
alias rmdsstore="find ./ -iname .DS_Store -delete"
alias t="task"
alias venv="source venv/bin/activate"
alias vim="nvim"

greplace () {
    grep -rl $1 $3 | LANG=C xargs sed -i "" "s/$1/$2/g"
}
jurl () {
    curl -LSs \
        -H "Accept: application/json" \
        -H "Content-Type: application/json" \
        "$@" | jq .
}
nvmload () {
    # load nvm manually to avoid slowing down shell startup time
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
}
setenv () {
    if [ -f .env-$1 ]; then
        export $(cat .env-$1 | xargs)
        echo "ENV set to $ENV"
    else
        echo "No file .env-$1"
    fi
}

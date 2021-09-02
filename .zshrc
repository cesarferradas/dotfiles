export PATH=$HOME/bin:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH
export PATH=/usr/local/opt/ruby/bin:$PATH
export EDITOR="nvim"
export PYTHONDONTWRITEBYTECODE=1
export HISTCONTROL=ignorespace
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME=powerlevel9k/powerlevel9k

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(status time virtualenv dir)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=()
POWERLEVEL9K_STATUS_CROSS=true
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"
POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
POWERLEVEL9K_SHORTEN_DELIMITER=""

plugins=(
  git
  z
)

source $ZSH/oh-my-zsh.sh

alias dc="docker-compose"
alias gl="git log --format='format:%C(yellow)%h%Creset %s %C(red)%D%Creset %C(bold blue)<%an>%Creset'"
alias gpl="git pull"
alias k="kubectl"
alias rmdsstore="find ./ -iname .DS_Store -delete"
alias tf="terraform"
alias venv="source venv/bin/activate"
alias vim="nvim"

function cd () {
  if [[ -d ./venv ]] ; then
    deactivate
  fi
  builtin cd $1
  if [[ -d ./venv ]] ; then
    . ./venv/bin/activate
  fi
}
function greplace () {
    grep -rl $1 $3 | LANG=C xargs sed -i "" "s/$1/$2/g"
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
if [ -f '/Users/cesar/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/cesar/google-cloud-sdk/path.zsh.inc'; fi
if [ -f '/Users/cesar/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/cesar/google-cloud-sdk/completion.zsh.inc'; fi

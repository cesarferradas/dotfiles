# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export PATH=$HOME/bin:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH
export PATH=/usr/local/opt/ruby/bin:$PATH
export PATH=/opt/homebrew/Cellar:$PATH
export PATH=$HOME/apache-maven-3.8.6/bin:$PATH
export EDITOR="nvim"
export HISTFILE=$HOME/.zsh_history
export PYTHONDONTWRITEBYTECODE=1
export HISTCONTROL=ignorespace
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME=powerlevel10k/powerlevel10k

plugins=(
  git
  python
  z
  zsh-autosuggestions
  zsh-syntax-highlighting
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

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

eval "$(/opt/homebrew/bin/brew shellenv)"

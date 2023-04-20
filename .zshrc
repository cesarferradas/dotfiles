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
export PATH=/opt/homebrew/opt:$PATH
export PATH=/opt/homebrew/Cellar:$PATH
export PATH=/opt/homebrew/bin:$PATH
export PATH=$HOME/.asdf/installs:$PATH
export PATH=./node_modules/.bin:$PATH

export EDITOR="nvim"
export HISTFILE=$HOME/.zsh_history
export PYTHONDONTWRITEBYTECODE=1
export HISTCONTROL=ignorespace
export ZSH=$HOME/.oh-my-zsh
export RIPGREP_CONFIG_PATH=$HOME/.ripgreprc

ZSH_THEME=powerlevel10k/powerlevel10k

plugins=(
  git
  python
  z
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ~/.asdf/asdf.sh ] && source ~/.asdf/asdf.sh
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
if [ -f '/Users/cesar/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/cesar/google-cloud-sdk/path.zsh.inc'; fi
if [ -f '/Users/cesar/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/cesar/google-cloud-sdk/completion.zsh.inc'; fi

alias dc="docker-compose"
alias gl="git log --format='format:%C(yellow)%h%Creset %s %C(red)%D%Creset %C(bold blue)<%an>%Creset'"
alias gpl="git pull"
alias k="kubectl"
alias rmdsstore="find ./ -iname .DS_Store -delete"
alias tf="terraform"
alias venv="source venv/bin/activate"
alias python="python3"
alias vim="nvim"

function greplace () {
    grep -rl $1 $3 | LANG=C xargs sed -i "" "s/$1/$2/g"
}

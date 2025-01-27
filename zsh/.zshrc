# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


function init_astro() {
	$NODE_PACKAGE_MANAGER create astro@latest
}

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(git)
source $ZSH/oh-my-zsh.sh
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


# Code
dev_dir="$HOME/code"
#
# Go
export GOPATH="$dev_dir/go"

# nodejs
export NVM_DIR="$HOME/.nvm"

# node
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# pnpm
export PNPM_HOME="/home/gd0st/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# Applications
#
# Emacs
export PATH="$PATH:$HOME/.config/emacs/bin"



# Aliases
alias clear="clear -x"
alias tree="tree -a"

export CDPATH="$HOME/.code:$CDPATH"

alias tempd='tmpd=$(mktemp -d)'
alias tempf='tmpf=$(mktemp)'

export EDITOR="vim"

# Macros
#
function mkcd() {
	local target=$1
	mkdir -p $target
	cd $target
}

function mkconfig() {
	local target=$1
	mkdir -p "$HOME/.config/$target"
	cd "$HOME/.config/$target"
}

[ -f "/home/gd0st/.ghcup/env" ] && . "/home/gd0st/.ghcup/env" # ghcup-env

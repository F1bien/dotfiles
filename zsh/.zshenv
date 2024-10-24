# ENVIRONMENT VARIABLE


export DOTFILES="$HOME/.dotfiles"
export WORKSPACE="$HOME/workspace"


# XDG
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$XDG_CONFIG_HOME/local/share
export XDG_CACHE_HOME=$XDG_CONFIG_HOME/cache


# EDITOR
export EDITOR="nvim"
export VISUAL="nvim"


# ZSH
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export HISTFILE="$ZDOTDIR/.zhistory" 
export HISTSIZE=10000 
export SAVEHIST=10000


# STARSHIP
export STARSHIP_CONFIG=$XDG_CONFIG_HOME/starship/starship.toml


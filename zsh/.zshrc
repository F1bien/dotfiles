

# HISTORY
setopt EXTENDED_HISTORY
setopt SHARE_HISTORY 
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_SAVE_NO_DUPS
setopt HIST_VERIFY

# ALIASES
source $ZDOTDIR/aliases


# COMPLETION
# source $DOTFILES/zsh/completion.zsh


# PROMPT
eval "$(starship init zsh)"


# SYNTAX HIGHLIGHTING
# source $DOTFILES/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


# AUTO SUGGESTIONS
# source $DOTFILES/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh


# FZF
source <(fzf --zsh)

# HOMEBREW
# eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"


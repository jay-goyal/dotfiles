HISTSIZE=10000000
SAVEHIST=10000000
HISTFILE=~/.cache/zshhistory
setopt appendhistory
setopt autocd

# Vi Mode
bindkey -v
bindkey jk vi-cmd-mode
autoload -z edit-command-line
zle -N edit-command-line
bindkey -M vicmd '^V' edit-command-line

# Basic auto/tab complete:
source $HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2> /dev/null
source $HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh 2> /dev/null

autoload -U compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

OPT="$HOME/opt"

# FZF History Search
source <(fzf --zsh)

# direnv
eval "$(direnv hook zsh)"

# Cross Compilation
export CROSS_PREFIX="$OPT/cross"
export PATH="$CROSS_PREFIX/bin:$PATH"

# other commands
alias clear='clear && tmux clear-history 2>/dev/null || true'
alias c='clear && tmux clear-history 2>/dev/null || true'
alias v="nvim"
alias vim="nvim"

# ls aliases
alias ls='eza --color=always --group-directories-first'
alias l='eza --color=always --group-directories-first'
alias la='eza --git -al --group --color=always --group-directories-first' 
alias ll='eza --git -l --group --color=always --group-directories-first' 
alias lt='eza -aT --color=always --group-directories-first'

# package manager
alias zyp='sudo zypper'

# tmux aliases
alias tnew='tmux -u new-session -s'
alias tat='tmux -u attach-session -t'

export PATH="$HOME/zig:$HOME/.config/tmux/plugins/tmuxifier/bin:$HOME/.local/bin:$PATH"
export TMUXIFIER_LAYOUT_PATH="$HOME/.tmux_layouts"

# register tmux sessionizer as a widget
tmux-sessionizer-widget() {
  LBUFFER="$LBUFFER$HOME/.local/bin/tmux-sessionizer.sh"
  zle accept-line
}
zle -N tmux-sessionizer-widget

# Keybinds
bindkey '^f' tmux-sessionizer-widget
bindkey '^e' autosuggest-accept
bindkey '^r' fzf-history-widget
bindkey '^n' fzf-cd-widget
bindkey '^j' history-search-forward
bindkey '^k' history-search-backward

eval "$(oh-my-posh init zsh --config $HOME/.config/oh-my-posh/custom.omp.toml)"
eval "$(tmuxifier init -)"
eval "$(zoxide init zsh)"
eval "$(fnm env --use-on-cd --shell zsh)"

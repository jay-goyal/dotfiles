HISTSIZE=10000000
SAVEHIST=10000000
HISTFILE=~/.cache/zshhistory
setopt appendhistory
setopt autocd

# Vi Mode
bindkey -v
bindkey jk vi-cmd-mode

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

# Cross Compilation
export CROSS_PREFIX="$OPT/cross"
export PATH="$CROSS_PREFIX/bin:$PATH"

# other commands
alias clear='clear && tmux clear-history 2>/dev/null || true'
alias c='clear && tmux clear-history 2>/dev/null || true'
alias v="nvim"
alias vim="nvim"

# ls aliases
alias ls='eza --color=always --group-directories-first' # my preferred listing
alias l='eza --color=always --group-directories-first' # my preferred listing
alias la='eza --git -al --group --color=always --group-directories-first'  # all files and dirs
alias ll='eza --git -l --group --color=always --group-directories-first'  # long format
alias lt='eza -aT --color=always --group-directories-first' # tree listing

# package manager
alias zyp='sudo zypper'

# git aliases
alias g='git'
alias gs='git status --short'
alias ga='git add'
alias gc='git commit'
alias gca='git commit --amend'
alias gp='git push'
alias gf='git pull'
alias gd='git diff'
alias gl='git log --oneline'
alias gcl='git clone'

# tmux aliases
alias tnew='tmux -u new-session -s'
alias tat='tmux -u attach-session -t'

export PATH="$HOME/.cabal/bin:$HOME/.ghcup/bin:$HOME/.config/tmux/plugins/tmuxifier/bin:$HOME/.local/bin:$PATH"
export TMUXIFIER_LAYOUT_PATH="$HOME/.tmux_layouts"

# Keybinds
bindkey -s '^f' "$HOME/.local/bin/tmux-sessionizer.sh\n"
bindkey '^e' autosuggest-accept
bindkey '^r' fzf-history-widget
bindkey '^n' fzf-cd-widget

eval "$(oh-my-posh init zsh --config $HOME/.config/oh-my-posh/tokyonight.omp.toml)"
eval "$(tmuxifier init -)"

# Pyenv
export PYENV_VIRTUALENV_DISABLE_PROMPT=1
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"

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

# Archive Extraction
ex () {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *.tar.zst)   unzstd $1    ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# file running
com() {
  if [[ ! -f "$1" ]]; then
    echo "Error: File $1 not found."
    return 1
  fi

  filename="${1%.*}"  # Remove the extension
  extension="${1##*.}"  # Extract the file extension
  shift

  case "$extension" in
    c)
      gcc $filename.c -o $filename.out $@ && ./$filename.out
      ;;
    cpp)
      g++ $filename.cpp -o $filename.out $@ && ./$filename.out
      ;;
    *)
      echo "Error: Unsupported file extension. Please provide a .c or .cpp file."
      return 1
      ;;
  esac
}

OPT="$HOME/opt"

# FZF History Search
source <(fzf --zsh)

# Cross Compilation
export CROSS_PREFIX="$OPT/cross"
export PATH="$CROSS_PREFIX/bin:$PATH"

# other commands
alias c="clear"
alias v="nvim"
alias vim="nvim"
alias grep="rg"

# ls aliases
alias ls='eza --color=always --group-directories-first' # my preferred listing
alias l='eza --color=always --group-directories-first' # my preferred listing
alias la='eza --git -al --color=always --group-directories-first'  # all files and dirs
alias ll='eza --git -l --color=always --group-directories-first'  # long format
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
bindkey '^n' autosuggest-accept
bindkey '^d' history-search-forward
bindkey '^u' history-search-backward
bindkey '^r' fzf-history-widget
bindkey '^e' fzf-cd-widget

eval "$(oh-my-posh init zsh --config $HOME/.config/oh-my-posh/tokyonight.omp.toml)"
eval "$(tmuxifier init -)"

# Pyenv
export PYENV_VIRTUALENV_DISABLE_PROMPT=1
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"

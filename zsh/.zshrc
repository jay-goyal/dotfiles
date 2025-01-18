HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zshhistory
setopt appendhistory

# Vi Mode
bindkey -v
bindkey jk vi-cmd-mode

# Basic auto/tab complete:
source ~/.zsh/conda-zsh-completion/conda-zsh-completion.plugin.zsh
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# Archive Extraction
ex ()
{
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
      gcc $filename.c -o $filename $@ && ./$filename
      ;;
    cpp)
      g++ $filename.cpp -o $filename $@ && ./$filename
      ;;
    *)
      echo "Error: Unsupported file extension. Please provide a .c or .cpp file."
      return 1
      ;;
  esac
}

OPT="$HOME/opt"

# Go Lang
export GO_PREFIX="$OPT/go"
export PATH="$GO_PREFIX/bin:$PATH"

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
alias pn='pnpm'
alias pnx='pnpm dlx'
alias clpkg='sudo pacman -Rsn $(pacman -Qdtq)'

# git aliases
alias gs='git status'
alias ga='git add'
alias gc='git commit -m'
alias gca='git commit --amend'
alias gp='git push'
alias gf='git pull'
alias gd='git diff'
alias gl='git log --oneline'
alias gcl='git clone'
alias gr='git remote'

# ROS Init
rosh() {
  if source /opt/ros/humble/setup.zsh; then
    source ./install/setup.zsh 2> /dev/null
    eval "$(register-python-argcomplete3 colcon)"
    eval "$(register-python-argcomplete3 ros2)"
  fi
}

roshc() {
  source ./install/setup.zsh 2> /dev/null
}

# pnpm
export PNPM_HOME="/home/jay/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
export PATH="$HOME/.config/tmux/plugins/tmuxifier/bin/:$PATH"
export TMUXIFIER_LAYOUT_PATH="$HOME/.tmux_layouts"
export TERM="xterm-256color"
export SHELL="/usr/bin/zsh"

# Keybinds
bindkey -s "^f" "$HOME/.local/bin/tmux-sessionizer.sh\n"

source $HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
source $HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null
eval "$(starship init zsh)"
eval "$(tmuxifier init -)"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/jay/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/jay/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/jay/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/jay/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# fnm
FNM_PATH="/home/jay/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="/home/jay/.local/share/fnm:$PATH"
  eval "`fnm env`"
  eval "$(fnm completions --shell zsh)"
fi

catnap

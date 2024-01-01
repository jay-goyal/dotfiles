HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zshhistory
setopt appendhistory

# Basic auto/tab complete:
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

# C file running
com() {gcc $1.c -o $1 && ./$1}

# other commands
alias c="clear"
alias v="nvim"
alias vim="nvim"
alias grep="rg"
alias ls='eza --color=always --group-directories-first' # my preferred listing
alias l='eza --color=always --group-directories-first' # my preferred listing
alias la='eza --git -al --color=always --group-directories-first'  # all files and dirs
alias ll='eza --git -l --color=always --group-directories-first'  # long format
alias lt='eza -aT --color=always --group-directories-first' # tree listing
alias lp='browser-sync start --server --files "./**/*"'

# package manager
alias pn='pnpm'
alias pnx='pnpm dlx'
alias in='sudo apt install'
alias se='apt search'
alias up='sudo apt update && sudo apt upgrade'
alias rem='sudo apt remove'
alias dcl='sudo apt autoremove'

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
alias nitch='~/nitch/nitch'

# vpn
alias vpnst="sudo systemctl start openvpn-oracle"
alias vpnstp="sudo systemctl stop openvpn-oracle"

# pnpm
export PNPM_HOME="/home/jay/.local/share/pnpm"
export PATH="$HOME/.local/share/pnpm:$HOME/.config/tmux/plugins/tmuxifier/bin/:$PATH"
export TMUXIFIER_LAYOUT_PATH="$HOME/.tmux_layouts"
export TERM="xterm-256color"

# Keybinds
bindkey -s ^f "$HOME/.local/bin/tmux-sessionizer.sh\n"
bindkey -s ^e "cd $HOME/dotfiles && nvim . && cd -\n"

source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null
source ~/powerlevel10k/powerlevel10k.zsh-theme 2> /dev/null
eval "$(tmuxifier init -)"
~/nitch/nitch

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

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

if [ -f "/home/jay/miniconda3/etc/profile.d/mamba.sh" ]; then
    . "/home/jay/miniconda3/etc/profile.d/mamba.sh"
fi

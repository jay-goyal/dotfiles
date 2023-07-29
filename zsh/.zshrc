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
alias ls='exa  --color=always --group-directories-first' # my preferred listing
alias l='exa  --color=always --group-directories-first' # my preferred listing
alias la='exa -al --color=always --group-directories-first'  # all files and dirs
alias ll='exa -l --color=always --group-directories-first'  # long format
alias lt='exa -aT --color=always --group-directories-first' # tree listing
alias mu='sudo reflector --latest 50 --sort rate --protocol https --verbose --save /etc/pacman.d/mirrorlist'
alias lp='browser-sync start --server --files "./**/*"'

# package manager
alias pn='pnpm'
alias pnx='pnpm dlx'
alias in='doas emerge -aUD --autounmask-continue'
alias se='emerge --search'
alias up='doas emerge -auUD @world'
alias rem='doas emerge -aW'
alias dcl='doas emerge -ac'
alias pcl='doas emerge --ask --clean'
alias sync='doas emerge --sync'

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

# doasedit
alias doasedit='$HOME/.local/bin/doasedit.sh'

# Wayland environment fixes
alias emulator='QT_QPA_PLATFORM=xcb emulator'
alias neovide='WINIT_UNIX_BACKEND=x11 neovide'

# pnpm
export PNPM_HOME="/home/jay/.local/share/pnpm"
export PATH="$PNPM_HOME:$HOME/.cargo/bin:$HOME/.config/tmux/plugins/tmuxifier/bin/:$PATH"

# FZF Theme
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS' 
	--color=fg:#c0caf5,bg:#1a1b26,hl:#bb9af7
	--color=fg+:#c0caf5,bg+:#1a1b26,hl+:#7dcfff
	--color=info:#7aa2f7,prompt:#7dcfff,pointer:#7dcfff 
	--color=marker:#9ece6a,spinner:#9ece6a,header:#9ece6a'

# Keybinds
bindkey -s ^f "$HOME/.local/bin/tmux-sessionizer.sh\n"

source /usr/share/zsh/site-functions/zsh-syntax-highlighting.zsh 2>/dev/null
source /usr/share/zsh/site-functions/zsh-autosuggestions.zsh 2>/dev/null
#eval "$(starship init zsh)"
source $HOME/powerlevel10k/powerlevel10k.zsh-theme 2>/dev/null
eval "$(tmuxifier init -)"
nitch


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


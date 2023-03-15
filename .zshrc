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
alias install='paru -S'
alias search='paru -Ss'
alias update='paru -Syu'
alias remove='paru -Rns'

# git aliases
alias gs='git status'
alias ga='git add'
alias gc='git commit -m'
alias gp='git push'
alias gf='git pull'

# Wayland environment fixes
alias emulator='QT_QPA_PLATFORM=xcb emulator'
alias neovide='WINIT_UNIX_BACKEND=x11 neovide'

eval "$(fnm env)"
# pnpm
export PNPM_HOME="/home/jay/.local/share/pnpm"
export PATH="$PNPM_HOME:$HOME/.config/emacs/bin:$PATH"

source ~/.zsh/catppuccin_mocha-zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null
eval "$(starship init zsh)"
#source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme 2>/dev/null
nitch

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export EDITOR="nvim"
export VISUAL="nvim"
export SUDO_EDITOR="nvim"
export MANPAGER="nvim -c 'Man!' -o -"
export MANWIDTH=100

# FZF Theme
export FZF_DEFAULT_OPTS='--color=fg:#d3c6aa,bg:#2b3339,hl:#a7c080
  --color=fg+:#d3c6aa,bg+:#323c41,hl+:#a7c080
  --color=info:#83c092,prompt:#e69875,pointer:#a7c080
  --color=marker:#dbbc7f,spinner:#7fbbb3,header:#859289'

FZF_FD_OPTS="--hidden --follow --no-ignore --exclude '.git' --exclude '.cache' --exclude '.rustup' --exclude '.pyenv' --exclude '.npm'"
export FZF_DEFAULT_COMMAND="fd ${FZF_FD_OPTS}"
export FZF_CTRL_T_COMMAND="fd ${FZF_FD_OPTS}"
export FZF_ALT_C_COMMAND="fd --type d ${FZF_FD_OPTS}"

. "$HOME/.cargo/env"

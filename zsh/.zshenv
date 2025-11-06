export EDITOR="nvim"
export VISUAL="nvim"
export SUDO_EDITOR="nvim"
export MANPAGER="nvim -c 'Man!' -o -"
export MANWIDTH=100

# FZF Theme
export FZF_DEFAULT_OPTS='
  --color bg:#141b1e,fg:#b3b9b8
  --color bg+:#141b1e,fg+:#67b0e8
  --color hl:#dadada,hl+:#e57474,gutter:#232a2d
  --color pointer:#67b0e8,info:#606672'

FZF_FD_OPTS="--hidden --follow --no-ignore --exclude '.git' --exclude '.cache' --exclude '.rustup' --exclude '.pyenv' --exclude '.npm'"
export FZF_DEFAULT_COMMAND="fd ${FZF_FD_OPTS}"
export FZF_CTRL_T_COMMAND="fd ${FZF_FD_OPTS}"
export FZF_ALT_C_COMMAND="fd --type d ${FZF_FD_OPTS}"

. "$HOME/.cargo/env"

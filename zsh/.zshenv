export EDITOR="nvim"
export VISUAL="nvim"
export SUDO_EDITOR="nvim"
export MANPAGER="nvim -c 'Man!' -o -"
export MANWIDTH=100

# FZF Theme
export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS \
  --highlight-line \
  --info=inline-right \
  --ansi \
  --layout=reverse \
  --border=none \
  --color=bg+:#0C0E14 \
  --color=bg:#16161e \
  --color=border:#27a1b9 \
  --color=fg:#c0caf5 \
  --color=gutter:#16161e \
  --color=header:#ff9e64 \
  --color=hl+:#f7768e \
  --color=hl:#f7768e \
  --color=info:#545c7e \
  --color=marker:#7aa2f7 \
  --color=pointer:#7aa2f7 \
  --color=prompt:#2ac3de \
  --color=query:#c0caf5:regular \
  --color=scrollbar:#7aa2f7 \
  --color=separator:#ff9e64 \
  --color=spinner:#ff007c \
"

FZF_FD_OPTS="--hidden --follow --no-ignore --exclude '.git' --exclude '.cache' --exclude '.rustup' --exclude '.pyenv' --exclude '.npm'"
export FZF_DEFAULT_COMMAND="fd ${FZF_FD_OPTS}"
export FZF_CTRL_T_COMMAND="fd ${FZF_FD_OPTS}"
export FZF_ALT_C_COMMAND="fd --type d ${FZF_FD_OPTS}"

. "$HOME/.cargo/env"

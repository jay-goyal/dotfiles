export EDITOR="nvim"
export VISUAL="nvim"
export SUDO_EDITOR="nvim"
# export MANPAGER='less'
export MANPAGER="nvim -c 'Man!' -o -"
export MANWIDTH=100

# FZF Theme
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS' 
	--color=fg:#c0caf5,bg:#1a1b26,hl:#bb9af7
	--color=fg+:#c0caf5,bg+:#1a1b26,hl+:#7dcfff
	--color=info:#7aa2f7,prompt:#7dcfff,pointer:#7dcfff 
	--color=marker:#9ece6a,spinner:#9ece6a,header:#9ece6a'

. "$HOME/.cargo/env"

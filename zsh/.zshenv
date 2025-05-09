export EDITOR="nvim"
export VISUAL="nvim"
export SUDO_EDITOR="nvim"
export MANPAGER="nvim -c 'Man!' -o -"
export MANWIDTH=100

# FZF Theme
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS' 
	--color=fg:#c0caf5,bg:-1,hl:#bb9af7
	--color=fg+:#c0caf5,hl+:#7dcfff
	--color=info:#7aa2f7,prompt:#7dcfff,pointer:#7dcfff 
	--color=marker:#9ece6a,spinner:#9ece6a,header:#9ece6a
	--color=gutter:-1'

export FZF_DEFAULT_COMMAND='rg --files --hidden --follow 
	--glob "\\!.git/*" --glob "\\!.pyenv/*" 
	--glob "\\!.cargo/*" --glob "\\!.npm/*"
	--glob "\\!.rustup/*" --glob "\\!.vscode/*" --max-depth 3'

. "$HOME/.cargo/env"

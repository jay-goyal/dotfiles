session_root "~/projects/learning/usaco-guide/"

if initialize_session "usaco-guide"; then
  load_window "neovim"
  new_window "run"

  select_window 1
fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session

session_root "~/projects/personal/ferrOS"

if initialize_session "ferrOS"; then
  load_window "neovim"
  new_window "exec"

  select_window 1
fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session

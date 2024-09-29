session_root "~/projects/network_prog/np_assignment1"

if initialize_session "np_assignment1"; then

  load_window "neovim"
  new_window "exec"

  select_window 0
fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session

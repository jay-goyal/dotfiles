session_root "~/projects/network_prog/network_prog_front"

# Create session with specified name if it does not already exist. If no
# argument is given, session name will be based on layout file name.
if initialize_session "network_prog_front"; then
  load_window "neovim"
  new_window "exec"
  new_window "server"
  run_cmd "pnpm dev"

  select_window 1
fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session

session_root "~/projects/learning/oaprep"

# Create session with specified name if it does not already exist. If no
# argument is given, session name will be based on layout file name.
if initialize_session "oaprep"; then
  new_window "neovim"
  run_cmd "conda activate oaprep"
  run_cmd "nvim ."

  new_window "exec"
  run_cmd "conda activate oaprep"

  select_window 1
fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session

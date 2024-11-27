session_root "~/projects/personal/personal-tests"

# Create session with specified name if it does not already exist. If no
# argument is given, session name will be based on layout file name.
if initialize_session "personal-tests"; then
  load_window "neovim"
  new_window "exec"
  run_cmd "conda activate personal_test"
  select_window 1
fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session

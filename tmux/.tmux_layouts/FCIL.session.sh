session_root "~/projects/ps/FCIL/"

if initialize_session "fcil"; then
  new_window "neovim"
  run_cmd "conda activate fcil"
  run_cmd "nvim ."
  new_window "python"
  run_cmd "conda activate fcil"
  select_window 1
fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session

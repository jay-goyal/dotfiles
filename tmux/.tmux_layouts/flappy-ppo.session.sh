session_root "~/projects/personal/flappy-ppo"
if initialize_session "flappy-ppo"; then
  load_window "neovim"
  new_window "cargo"
  new_window "git"

  select_window 0
fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session

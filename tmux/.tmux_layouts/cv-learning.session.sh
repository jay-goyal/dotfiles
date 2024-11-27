session_root "~/projects/learning/cv-learning"

if initialize_session "cv-learning"; then

  new_window "neovim"
  run_cmd "conda activate cv-learning"
  run_cmd "nvim ."

  new_window "exec"
  run_cmd "conda activate cv-learning"

  select_window 1
fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session

session_root "~/projects/learning/stm32f446re_stepper"

# Create session with specified name if it does not already exist. If no
# argument is given, session name will be based on layout file name.
if initialize_session "stm32f446re_stepper"; then

  load_window "neovim"
  new_window "exec"

  # Select the default active window on session creation.
  select_window 1

fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session

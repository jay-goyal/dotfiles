session_root "~/projects/personal/crafting-interpreters-rs"

if initialize_session "crafting-interpreters-rs"; then
  load_window "neovim"
  new_window "exec"

  select_window 1
fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session

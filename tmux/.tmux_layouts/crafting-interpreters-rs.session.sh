session_root "~/projects/personal/crafting-interpreters-rs"

if initialize_session "crafting-interpreters-rs"; then
  load_window "neovim"
  new_window "test"

  select_window 0
fi

finalize_and_go_to_session

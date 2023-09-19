session_root "~/projects/personal/ferrOS"

if initialize_session "ferrOS"; then
  new_window "neovim"
  run_cmd nvim
  new_window "cargo"
  select_window 0
fi

finalize_and_go_to_session

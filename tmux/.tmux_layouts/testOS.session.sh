session_root "~/projects/personal/testOS/"

if initialize_session "testOS"; then
  new_window "neovim"
  run_cmd nvim
  new_window "compile"
  select_window 0
fi

finalize_and_go_to_session

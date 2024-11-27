session_root "~/projects/personal/codecrafters-http-server-rust"

if initialize_session "dns-server"; then
  load_window "neovim"
  new_window "test"
  split_h 50
  new_window "git"

  select_window 1
fi

finalize_and_go_to_session

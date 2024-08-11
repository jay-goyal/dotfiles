session_root "~/projects/personal/toc-parser/"

if initialize_session "toc-parser"; then
  load_window "neovim"
  new_window "trunk"
  run_cmd "trunk serve"
  new_window "misc"

  select_window 0
fi

finalize_and_go_to_session

# Set a custom session root path. Default is `$HOME`.
# Must be called before `initialize_session`.
session_root "~/projects/personal/toc-parser/"

# Create session with specified name if it does not already exist. If no
# argument is given, session name will be based on layout file name.
if initialize_session "toc-parser"; then
  load_window "neovim"
  new_window "trunk"
  run_cmd "trunk serve"
  new_window "misc"

  select_window 0
fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session

# Set a custom session root path. Default is `$HOME`.
# Must be called before `initialize_session`.
session_root "~/projects/personal/codecrafters-dns-server-rust"

# Create session with specified name if it does not already exist. If no
# argument is given, session name will be based on layout file name.
if initialize_session "codecrafters-dns-server-rust"; then
  load_window "neovim"
  new_window "cargo"
  split_h 50
  new_window "git"

  select_window 0
fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session

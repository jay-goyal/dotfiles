# Set a custom session root path. Default is `$HOME`.
# Must be called before `initialize_session`.
session_root "~/projects/personal/codecrafters-dns-server-rust"

# Create session with specified name if it does not already exist. If no
# argument is given, session name will be based on layout file name.
if initialize_session "dns-server"; then
  load_window "neovim"
  new_window "test"
  new_window "git"

  select_window 1
fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session

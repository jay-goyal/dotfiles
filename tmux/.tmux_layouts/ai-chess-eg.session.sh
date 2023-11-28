# Set a custom session root path. Default is `$HOME`.
# Must be called before `initialize_session`.
session_root "~/projects/ai/ai-chess-eg/"

# Create session with specified name if it does not already exist. If no
# argument is given, session name will be based on layout file name.
if initialize_session "ai-chess-eg"; then

  # Create a new window inline within session layout definition.
  new_window "neovim"
  run_cmd "conda activate ai-chess-eg"
  run_cmd "nvim"

  new_window "python"
  run_cmd "distrobox enter debian-dev"
  run_cmd "conda activate ai-chess-eg"

  select_window 0
fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session

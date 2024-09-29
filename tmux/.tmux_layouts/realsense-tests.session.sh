session_root "~/projects/meetha_sop/realsense-tests/"

# Create session with specified name if it does not already exist. If no
# argument is given, session name will be based on layout file name.
if initialize_session "realsense-tests"; then

  new_window "neovim"
  run_cmd "conda activate realsense_meetha_sop"
  run_cmd "nvim ."

  new_window "runing"
  run_cmd "distrobox enter ubuntu-realsense"
  run_cmd "conda activate realsense_meetha_sop"

  select_window 0
fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session

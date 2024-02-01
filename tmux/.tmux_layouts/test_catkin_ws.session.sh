session_root "~/projects/learning/test_catkin_ws"

if initialize_session "test_catkin_ws"; then
  new_window "neovim"
  run_cmd "conda activate ros_learning"
  run_cmd "nvim ."
  load_window "ros-cmd"
  load_window "ros-init"

  select_window 0
fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session

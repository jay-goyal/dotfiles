session_root "~/projects/learning/test_ros2_ws"

if initialize_session "test_ros2_ws"; then
  new_window "neovim"
  run_cmd "conda activate ros_humble_learning"
  run_cmd "nvim ."
  load_window "ros2-cmd"
  load_window "ros2-init"

  select_window 0
fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session

session_root "~/projects/vigu-sop/spanning_tree_sec/"

if initialize_session "spanning_tree_sec"; then

  new_window "neovim"
  run_cmd "conda activate ros_vigu_sop"
  run_cmd "nvim ."

  new_window "ros2-cmd"
  run_cmd "distrobox enter ubuntu-vigu-sop"
  run_cmd "source /opt/ros/humble/setup.zsh"
  run_cmd "source ./install/setup.zsh"
  run_cmd 'eval "$(register-python-argcomplete3 ros2)"'
  run_cmd 'eval "$(register-python-argcomplete3 colcon)"'

  select_window 1
fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session

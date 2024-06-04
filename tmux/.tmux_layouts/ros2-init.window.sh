new_window "ros2-init"

run_cmd "distrobox enter ubuntu-ros-humble"
run_cmd "source /opt/ros/humble/setup.zsh"
run_cmd "source ./install/setup.zsh"
run_cmd 'eval "$(register-python-argcomplete3 ros2)"'
run_cmd 'eval "$(register-python-argcomplete3 colcon)"'

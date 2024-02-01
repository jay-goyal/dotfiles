new_window "ros-init"

split_h 50

run_cmd "distrobox enter ubuntu-ros-noetic" 0
run_cmd "source ./devel/setup.zsh" 0
run_cmd "roscore" 0
run_cmd "distrobox enter ubuntu-ros-noetic" 1
run_cmd "source ./devel/setup.zsh" 1

select_pane 1

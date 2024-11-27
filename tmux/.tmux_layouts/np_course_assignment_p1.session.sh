session_root "~/projects/network_prog/np_course_assignment_p1"

if initialize_session "np_course_assignment_p1"; then
  load_window "neovim"
  new_window "exec"

  select_window 1
fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session

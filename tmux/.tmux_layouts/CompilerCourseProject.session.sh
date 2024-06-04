session_root "~/projects/coco/CompilerCourseProject"

# Create session with specified name if it does not already exist. If no
# argument is given, session name will be based on layout file name.
if initialize_session "CompilerCourseProject"; then
  load_window "neovim"
  new_window "test"
  run_cmd "distrobox enter coco-test"
  new_window "git"
  run_cmd "git pull"
  new_window "codelldb"
  run_cmd "while sleep 1; do ~/.local/share/nvim/mason/packages/codelldb/extension/adapter/codelldb --port 13000; done"

  select_window 0
fi

finalize_and_go_to_session

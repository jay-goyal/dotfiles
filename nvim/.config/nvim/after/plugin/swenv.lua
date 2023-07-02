local status_ok_swenv, swenv = pcall(require, "swenv")
local status_ok_api, api = pcall(require, "swenv.api")

if not (status_ok_swenv and status_ok_api) then
	return
end

swenv.setup()
keymap("n", "<leader>gpv", api.pick_venv, opts)

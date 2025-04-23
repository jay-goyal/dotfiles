return {
	"mfussenegger/nvim-dap-python",
	dependencies = {
		"mfussenegger/nvim-dap",
	},
	config = function()
		require("dap-python").setup(
			" ~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
		)
	end,
	ft = "python",
}

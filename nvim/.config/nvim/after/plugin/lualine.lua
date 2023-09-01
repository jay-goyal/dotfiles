local colors = {
	red = "#F7768E",
	grey = "#1A1B26",
	black = "#1A1B26",
	white = "#414868",
	light_green = "#587738",
	orange = "#FF9E64",
	green = "#9ECE6A",
	blue = "#2AC3DE",
	light_blue = "#3D59A1",
}

local function add_missing(dst, src)
	for k, v in pairs(src) do
		if dst[k] == nil then
			dst[k] = v
		end
	end
	return dst -- for convenience (chaining)
end

local theme = {
	normal = {
		a = { fg = colors.black, bg = colors.blue },
		b = { fg = colors.blue, bg = colors.white },
		c = { fg = colors.white, bg = colors.grey },
		z = { fg = colors.white, bg = colors.grey },
	},
	insert = { a = { fg = colors.black, bg = colors.orange } },
	visual = { a = { fg = colors.black, bg = colors.green } },
	replace = { a = { fg = colors.black, bg = colors.green } },
}

local vim_icons = {
	function()
		return " "
	end,
	separator = { left = "", right = "" },
	color = { bg = colors.white, fg = colors.blue },
}

local space = {
	function()
		return " "
	end,
	color = { bg = colors.grey, fg = colors.blue },
}

local filename = {
	"filename",
	color = { bg = colors.blue, fg = colors.grey },
	separator = { left = "", right = "" },
}

local filetype = {
	"filetype",
	icon_only = true,
	colored = true,
	color = { bg = colors.white },
	separator = { left = "", right = "" },
}

local fileformat = {
	"fileformat",
	color = { bg = colors.light_blue, fg = colors.black },
	separator = { left = "", right = "" },
}

local encoding = {
	"encoding",
	color = { bg = colors.white, fg = colors.blue },
	separator = { left = "", right = "" },
}

local branch = {
	"branch",
	color = { bg = colors.green, fg = colors.black },
	separator = { left = "", right = "" },
}

local diff = {
	"diff",
	color = { bg = colors.white, fg = colors.black },
	separator = { left = "", right = "" },
}

local modes = {
	"mode",
	fmt = function(str)
		return str:sub(1, 1)
	end,
	color = { bg = colors.orange, fg = colors.black },
	separator = { left = "", right = "" },
}

local function getLspName()
	local msg = "No Active Lsp"
	local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
	local clients = vim.lsp.get_active_clients()
	if next(clients) == nil then
		return msg
	end
	for _, client in ipairs(clients) do
		local filetypes = client.config.filetypes
		if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
			return "  " .. client.name
		end
	end
	return "  " .. msg
end

local dia = {
	"diagnostics",
	color = { bg = colors.white, fg = colors.blue },
	separator = { left = "", right = "" },
}

local lsp = {
	function()
		return getLspName()
	end,
	separator = { left = "", right = "" },
	color = { bg = colors.red, fg = colors.black },
}

local swenv = {
	"swenv",
	separator = { left = "", right = "" },
	color = { fg = colors.black, bg = colors.orange },
	cond = function()
		return getLspName() == "  pyright"
	end,
}

require("lualine").setup({
	options = {
		icons_enabled = true,
		theme = theme,
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = {
			statusline = {},
			winbar = {},
		},
		ignore_focus = {},
		always_divide_middle = true,
		globalstatus = true,
		refresh = {
			statusline = 1000,
			winbar = 1000,
		},
	},

	sections = {
		lualine_a = {
			--{ 'mode', fmt = function(str) return str:gsub(str, "  ") end },
			modes,
			vim_icons,
			--{ 'mode', fmt = function(str) return str:sub(1, 1) end },
		},
		lualine_b = {
			space,
		},
		lualine_c = {

			filename,
			filetype,
			space,
			branch,
			diff,
		},
		lualine_v = {
			space,
		},
		lualine_w = {
			encoding,
			fileformat,
			space,
		},
		lualine_x = {
			dia,
			lsp,
		},
		lualine_y = {
			add_missing({
				cond = function()
					return getLspName() == "  pyright"
				end,
			}, space),
		},
		lualine_z = {
			swenv,
		},
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	winbar = {},
	inactive_winbar = {},
})

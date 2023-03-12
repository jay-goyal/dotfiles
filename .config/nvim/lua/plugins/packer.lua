local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

return packer.startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  -- Themes
  use { "catppuccin/nvim", as = "catppuccin" }
  use 'folke/tokyonight.nvim'

  -- LSP
  use "neovim/nvim-lspconfig" -- enable LSP
  use "williamboman/mason.nvim" -- simple to use language server installer
  use "williamboman/mason-lspconfig.nvim" -- simple to use language server installer
  use 'jose-elias-alvarez/null-ls.nvim' -- LSP diagnostics and code actions

  -- Coding
  use {
    'saecki/crates.nvim',
    tag = 'v0.3.0',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
        require('crates').setup()
    end,
  }

  -- Cmp Plugins
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-nvim-lua"

  -- Snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  -- Greatness
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
    -- or                          , branch = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use 'nvim-telescope/telescope-media-files.nvim'

  -- Status Line and Tab Line
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  use {
		'kdheepak/tabline.nvim',
		config = function()
			require 'tabline'.setup {
				-- Defaults configuration options
				enable = true,
				options = {
					-- If lualine is installed tabline will use separators configured in lualine by default.
					-- These options can be used to override those settings.
					component_separators = { '', '' },
					section_separators = { '', '' },
					max_bufferline_percent = 66, -- set to nil by default, and it uses vim.o.columns * 2/3
					show_tabs_always = true, -- this shows tabs only when there are more than one tab or if the first tab is named
					show_devicons = true, -- this shows devicons in buffer section
					colored = true,
					show_bufnr = false, -- this appends [bufnr] to buffer section,
					tabline_show_last_separator = true,
					show_filename_only = true, -- shows base filename only instead of relative path in filename
					modified_icon = "+ ", -- change the default modified icon
					modified_italic = true, -- set to true by default; this determines whether the filename turns italic if modified
					show_tabs_only = false, -- this shows only tabs instead of tabs + buffers
				}
			}
			vim.cmd [[
      set guioptions-=e " Use showtabline in gui vim
      set sessionoptions+=tabpages,globals " store tabpages and globals in session
    ]]
		end,
		requires = { { 'hoob3rt/lualine.nvim', opt = true }, { 'kyazdani42/nvim-web-devicons', opt = true } }
  }


  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)

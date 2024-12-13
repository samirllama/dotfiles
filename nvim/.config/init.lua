-- nvim/.config/init.lua

-- First ensure lazy is installed and available
require("config.lazy")

-- Then setup plugins
require("lazy").setup({
	spec = {
		{ import = "user.plugins" },
	},
	defaults = {
		lazy = false,
	},
	install = {
		colorscheme = { "catppuccin" },
	},
	change_detection = {
		notify = false,
	},
})

-- Ensure proper loading of snacks.nvim
vim.opt.termguicolors = true

-- Load core configurations
require("user.settings") -- Global settings
require("user.keymaps") -- Key mappings
require("user.autocmds") -- Autocommands

-- Disable other dashboard plugins from loading on startup
vim.g.loaded_alpha = 1

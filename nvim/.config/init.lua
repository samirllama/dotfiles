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

-- Load core configurations
require("user.settings") -- Global settings
require("user.keymaps") -- Key mappings
require("user.autocmds") -- Autocommands

-- Ensure proper loading of snack.nvim
vim.opt.termguicolors = true

-- nvim/.config/init.lua

-- First ensure lazy is installed and available
require("config.lazy")

-- Now setup plugins
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
})

-- Load other configurations after plugins
require("user.keymaps")
require("user.autocmds")

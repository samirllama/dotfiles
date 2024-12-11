-- nvim/.config/init.lua

-- First ensure lazy is installed and available
require("config.lazy")

-- Then etup plugins
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

-- Load core configurations
require("user.settings") -- Global settings
require("user.keymaps") -- Key mappings
require("user.autocmds") -- Autocommands

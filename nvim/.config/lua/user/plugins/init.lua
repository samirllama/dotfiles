-- nvim/.config/lua/user/plugins/init.lua

return {
	-- Import all plugin configurations
	require("user.plugins.database"),
	require("user.plugins.telescope"),
	require("user.plugins.lsp"),
	require("user.plugins.treesitter"),
	require("user.plugins.completion"),
	require("user.plugins.colorscheme"),
	require("user.plugins.harpoon"),
	require("user.plugins.statusline"),
	require("user.plugins.avante"),
	require("user.plugins.oil"),
	require("user.plugins.snacks"),

	-- Core dependencies
	{ "nvim-lua/plenary.nvim" },
	{ "folke/lazy.nvim" },
	{ "nvim-tree/nvim-web-devicons" },
	{ "MunifTanjim/nui.nvim" },
	{ "rcarriga/nvim-notify" },
	{ "tpope/vim-surround" },
	{ "junegunn/fzf", build = "./install --all" },

	-- Remove or comment out the alpha-nvim configuration
	-- {
	--     "goolord/alpha-nvim",
	--     ...
	-- },

	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				flavour = "mocha",
				transparent_background = true,
				styles = {
					comments = { "italic" },
					functions = {},
					keywords = {},
					strings = {},
					variables = {},
				},
				integrations = {
					treesitter = true,
					native_lsp = true,
					telescope = true,
				},
			})
			vim.cmd.colorscheme("catppuccin")
		end,
	},
}

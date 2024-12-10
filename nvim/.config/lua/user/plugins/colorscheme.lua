return {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
		priority = 1000,
	},
	{ "rebelot/kanagawa.nvim", priority = 1000 },
	{ "Shatur/neovim-ayu", priority = 1000 },
	{ "RRethy/base16-nvim", priority = 1000 },
	{ "cocopon/iceberg.vim", priority = 1000 },
	{ "kepano/flexoki-neovim", priority = 1000 },
	{ "uloco/bluloco.nvim", priority = 1000 },
	{ "ricardoraposo/gruvbox-minor.nvim", priority = 1000 },
	{
		"maxmx03/fluoromachine.nvim",
		priority = 1000,
		config = function()
			require("fluoromachine").setup({
				glow = true,
				theme = "fluoromachine",
			})
		end,
	},
}

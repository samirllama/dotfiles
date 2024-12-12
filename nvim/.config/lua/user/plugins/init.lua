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
	-- require("user.plugins.mini"), -- Disabled as snacks provides these features
	require("user.plugins.statusline"),
	-- require("user.plugins.notify"), -- Disabled as snacks provides notifications
	require("user.plugins.avante"),
	require("user.plugins.oil"),
	require("user.plugins.snack"),

	-- Core dependencies
	{ "nvim-lua/plenary.nvim" },
	{ "folke/lazy.nvim" },
	{ "folke/edgy.nvim" },
	{ "MunifTanjim/nui.nvim" },
	{ "tpope/vim-surround" },
	{ "junegunn/fzf", build = "./install --all" },
}

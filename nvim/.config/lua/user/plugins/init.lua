-- nvim/.config/lua/user/plugins/init.lua

return {
	-- Import all plugin configurations
	require("user.plugins.database"),
	require("user.plugins.telescope"),
	require("user.plugins.lsp"),
	require("user.plugins.treesitter"),
	require("user.plugins.completion"),
	require("user.plugins.colorscheme"), -- Add this line
	require("user.plugins.harpoon"),
	require("user.plugins.mini"),
	require("user.plugins.statusline"),
	require("user.plugins.notify"),
	require("user.plugins.avante"),
	require("user.plugins.oil"),

	-- Core dependencies that don't need special config
	{ "nvim-lua/plenary.nvim" },
	{ "folke/lazy.nvim" },
	{ "tpope/vim-surround" },
	{ "junegunn/fzf", build = "./install --all" },
}

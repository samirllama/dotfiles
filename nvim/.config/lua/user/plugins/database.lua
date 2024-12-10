-- nvim/.config/lua/user/plugins/database.lua
return {
	{
		"tpope/vim-dadbod",
		dependencies = {
			"kristijanhusak/vim-dadbod-completion",
			"kristijanhusak/vim-dadbod-ui",
			"nanotee/sqls.nvim",
			"pbogut/vim-dadbod-ssh",
		},
		config = function()
			require("config.db").setup()
		end,
	},
}

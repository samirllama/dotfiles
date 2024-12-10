--nvim/.config/lua/config/db.lua

local M = {}

function M.setup()
	-- Save query history between sessions
	vim.g.db_ui_save_location = vim.fn.stdpath("config") .. "/db_ui"

	-- Use icons
	vim.g.db_ui_use_nerd_fonts = true
	vim.g.db_ui_show_database_icon = true

	-- Add SQL enhancements
	vim.g.sql_type_default = "sqlite"
	vim.g.sqlformat_options = "-k upper -s 2 -r"

	-- Table hover actions
	vim.g.db_ui_table_helpers = {
		sqlite = {
			Count = "SELECT COUNT(*) FROM {table}",
			Explain = "EXPLAIN QUERY PLAN {last_query}",
			Indexes = "SELECT * FROM sqlite_master WHERE type = 'index' AND tbl_name = '{table}'",
			Show = "SELECT * FROM {table} LIMIT 200",
		},
	}

	-- Window layout
	vim.g.db_ui_winwidth = 30 -- Sets the width of the DB UI window
	vim.g.db_ui_win_position = "right" -- Position the DB UI window on the right

	-- Add SQL file type settings
	vim.api.nvim_create_autocmd("FileType", {
		pattern = { "sql", "mysql", "plsql" },
		callback = function()
			vim.opt_local.omnifunc = "vim_dadbod_completion#omni"
			vim.opt_local.expandtab = true
			vim.opt_local.shiftwidth = 2
			vim.opt_local.softtabstop = 2
			vim.opt_local.foldmethod = "syntax"
			vim.opt_local.foldenable = false
		end,
	})
end

return M

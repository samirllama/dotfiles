return {
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		dependencies = {
			"folke/edgy.nvim",
			"MunifTanjim/nui.nvim",
		},
		opts = function()
			local config = require("config.snacks").setup()
			return vim.tbl_deep_extend("force", {
				bigfile = { enabled = true },
				scratch = { enabled = true },
				zen = {
					enabled = true,
					win = { backdrop = { transparent = false } },
					toggles = { dim = false },
				},
				indent = { enabled = true },
				input = { enabled = true },
				notifier = {
					enabled = true,
					style = "fancy",
					level = vim.log.levels.WARN,
				},
				quickfile = { enabled = true },
				statuscolumn = { enabled = true },
				words = { enabled = true },
				styles = {
					notification = { wo = { wrap = true } },
					lazygit = { width = 0, height = 0 },
				},
			}, config)
		end,
		keys = {
			{
				"<leader>cz",
				function()
					require("snacks").zen()
				end,
				desc = "Toggle Zen Mode",
			},
			{
				"<leader>uH",
				function()
					require("snacks").notifier.show_history()
				end,
				desc = "Notification History",
			},
			{
				"<leader>un",
				function()
					require("snacks").notifier.hide()
				end,
				desc = "Dismiss Notifications",
			},
			{
				"<leader>no",
				function()
					require("snacks").scratch()
				end,
				desc = "Open Scratch Buffer",
			},
			{
				"<leader>ns",
				function()
					require("snacks").scratch.select()
				end,
				desc = "Select Scratch Buffer",
			},
			{
				"<S-q>",
				function()
					require("snacks").bufdelete()
				end,
				desc = "Delete Buffer",
			},
			{
				"<leader>bd",
				function()
					require("snacks").bufdelete()
				end,
				desc = "Delete Buffer",
			},
			{
				"<leader>cR",
				function()
					require("snacks").rename.rename_file()
				end,
				desc = "Rename File",
			},
			{
				"<leader>gg",
				function()
					require("snacks").lazygit()
				end,
				desc = "Lazygit",
			},
			{
				"<leader>go",
				function()
					require("snacks").gitbrowse()
				end,
				desc = "Git Browse",
				mode = { "n", "v" },
			},
			{
				"<leader>gf",
				function()
					require("snacks").lazygit.log_file()
				end,
				desc = "File History",
			},
			{
				"<leader>gl",
				function()
					require("snacks").lazygit.log()
				end,
				desc = "Git Log",
			},
			{
				"<leader>gL",
				function()
					require("snacks").git.blame_line()
				end,
				desc = "Git Blame",
			},
			{
				"<c-/>",
				function()
					require("snacks").terminal()
				end,
				desc = "Toggle Terminal",
			},
			{
				"]]",
				function()
					require("snacks").words.jump(vim.v.count1)
				end,
				desc = "Next Reference",
				mode = { "n", "t" },
			},
			{
				"[[",
				function()
					require("snacks").words.jump(-vim.v.count1)
				end,
				desc = "Prev Reference",
				mode = { "n", "t" },
			},
		},
		init = function()
			-- Disable conflicting plugins
			vim.g.loaded_mini = 1
			vim.g.loaded_notify = 1
		end,
	},
}

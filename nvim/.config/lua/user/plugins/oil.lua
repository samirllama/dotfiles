return {
	"stevearc/oil.nvim",
	opts = {
		-- Show hidden files by default
		show_hidden = true,
		-- Optional but recommended settings
		view_options = {
			-- Show files and directories that start with "."
			show_hidden = true,
			-- This function defines what is considered a "hidden" file
			is_hidden_file = function(name, bufnr)
				return vim.startswith(name, ".")
			end,
		},
		-- Disable default file explorer behavior
		default_file_explorer = false,
		-- Keymaps in oil buffer
		keymaps = {
			["g?"] = "actions.show_help",
			["<CR>"] = "actions.select",
			["<C-v>"] = "actions.select_vsplit",
			["<C-s>"] = "actions.select_split",
			["<C-t>"] = "actions.select_tab",
			["<C-p>"] = "actions.preview",
			["<C-c>"] = "actions.close",
			["<C-r>"] = "actions.refresh",
		},
	},
}

return {
	"stevearc/oil.nvim",
	config = function()
		require("oil").setup({
			-- Your oil.nvim configuration here
		})

		-- Basic keymap for oil
		vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
	end,
}

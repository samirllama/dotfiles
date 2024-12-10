local M = {}

function M.setup()
	-- Set your preferred colorscheme here
	vim.cmd.colorscheme("catppuccin")

	-- Additional colorscheme configurations
	vim.o.background = "dark"

	-- Optional: Set transparent background
	-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

return M

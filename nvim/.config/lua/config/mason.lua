local M = {}

function M.setup()
	local mr = require("mason-registry")

	-- Setup mason with basic configuration
	require("mason").setup({
		ui = {
			icons = {
				package_installed = "✓",
				package_pending = "➜",
				package_uninstalled = "✗",
			},
		},
	})

	-- Setup installation handler
	mr:on("package:install:success", function()
		vim.defer_fn(function()
			require("lazy.core.handler.event").trigger({
				event = "FileType",
				buf = vim.api.nvim_get_current_buf(),
			})
		end, 100)
	end)
end

return M

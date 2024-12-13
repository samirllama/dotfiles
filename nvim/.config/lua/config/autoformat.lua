local M = {}

function M.setup()
	local conform = require("conform")

	conform.setup({
		formatters_by_ft = {
			python = { "black", "isort" },
			javascript = { "prettier" },
			typescript = { "prettier" },
			javascriptreact = { "prettier" },
			typescriptreact = { "prettier" },
			go = {
				"gopls",
				"goimports-reviser",
			},
			lua = { "stylua" },
		},
		format_on_save = {
			timeout_ms = 3000,
			lsp_fallback = true,
		},
		formatters = {
			black = {
				prepend_args = { "--fast" },
			},
			isort = {
				prepend_args = { "--profile", "black" },
			},
			["goimports-reviser"] = {
				prepend_args = {
					"-rm-unused",
					"-set-alias",
					"-format",
				},
			},
			gopls = {
				command = "gopls",
				args = { "format" },
				stdin = true,
			},
		},
	})

	-- Format command with longer timeout and error handling
	vim.keymap.set({ "n", "v" }, "<leader>f", function()
		conform.format({
			timeout_ms = 5000,
			lsp_fallback = true,
			async = true,
			quiet = false, -- Set to false to see error messages
		})
	end, { desc = "Format file or range (in visual mode)" })

	-- Add format on save autocmd with error handling
	vim.api.nvim_create_autocmd("BufWritePre", {
		pattern = "*",
		callback = function(args)
			-- Protect against formatter errors interrupting the save
			local success, err = pcall(function()
				conform.format({
					bufnr = args.buf,
					timeout_ms = 5000,
					lsp_fallback = true,
					async = false,
				})
			end)
			if not success then
				vim.notify("Format on save failed: " .. tostring(err), vim.log.levels.WARN)
			end
		end,
	})
end

return M

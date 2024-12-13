local M = {}

M.setup = function()
	local capabilities = nil
	if pcall(require, "cmp_nvim_lsp") then
		capabilities = require("cmp_nvim_lsp").default_capabilities()
	end

	-- Set default capabilities for all servers
	require("mason-lspconfig").setup_handlers({
		-- Default handler (optional)
		function(server_name)
			require("lspconfig")[server_name].setup({
				capabilities = capabilities,
			})
		end,
		-- Specific server handlers
		["lua_ls"] = function()
			require("lspconfig").lua_ls.setup({
				capabilities = capabilities,
				server_capabilities = {
					semanticTokensProvider = vim.NIL,
				},
			})
		end,
		["gopls"] = function()
			require("lspconfig").gopls.setup({
				capabilities = capabilities,
				settings = {
					gopls = {
						hints = {
							assignVariableTypes = true,
							compositeLiteralFields = true,
							compositeLiteralTypes = true,
							constantValues = true,
							functionTypeParameters = true,
							parameterNames = true,
							rangeVariableTypes = true,
						},
					},
				},
			})
		end,
		-- Add other specific server configurations as needed
	})

	-- LSP Attach keymaps
	vim.api.nvim_create_autocmd("LspAttach", {
		callback = function(args)
			local bufnr = args.buf
			local client = vim.lsp.get_client_by_id(args.data.client_id)
			if not client then
				return
			end

			local builtin = require("telescope.builtin")

			-- LSP keymaps
			vim.keymap.set("n", "gd", builtin.lsp_definitions, { buffer = bufnr })
			vim.keymap.set("n", "gr", builtin.lsp_references, { buffer = bufnr })
			vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = bufnr })
			vim.keymap.set("n", "gT", vim.lsp.buf.type_definition, { buffer = bufnr })
			vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr })
			vim.keymap.set("n", "<space>cr", vim.lsp.buf.rename, { buffer = bufnr })
			vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, { buffer = bufnr })
			vim.keymap.set("n", "<space>wd", builtin.lsp_document_symbols, { buffer = bufnr })
		end,
	})

	require("config.autoformat").setup()

	require("lsp_lines").setup()
	vim.diagnostic.config({ virtual_text = true, virtual_lines = false })

	-- Toggle LSP lines
	vim.keymap.set("", "<leader>l", function()
		local config = vim.diagnostic.config() or {}
		if config.virtual_text then
			vim.diagnostic.config({ virtual_text = false, virtual_lines = true })
		else
			vim.diagnostic.config({ virtual_text = true, virtual_lines = false })
		end
	end, { desc = "Toggle lsp_lines" })
end

return M

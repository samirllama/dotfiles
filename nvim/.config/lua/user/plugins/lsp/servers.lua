local M = {}

M.setup = function()
	local capabilities = nil
	if pcall(require, "cmp_nvim_lsp") then
		capabilities = require("cmp_nvim_lsp").default_capabilities()
	end

	local lspconfig = require("lspconfig")

	local servers = {
		bashls = true,
		gopls = {
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
		},
		lua_ls = {
			server_capabilities = {
				semanticTokensProvider = vim.NIL,
			},
		},
		rust_analyzer = true,
		pyright = true,
		jsonls = {
			settings = {
				json = {
					schemas = require("schemastore").json.schemas(),
					validate = { enable = true },
				},
			},
		},
		ts_ls = {
			root_dir = require("lspconfig").util.root_pattern("package.json"),
			single_file = false,
			server_capabilities = {
				documentFormattingProvider = false,
			},
		},
		sqlls = {
			settings = {
				sqlLanguageServer = {
					connections = {
						{
							name = "SQLite Database",
							adapter = "sqlite",
							database = "/Users/apex/Developer/sql-app/database.db",
						},
					},
				},
			},
		},
	}

	-- Setup mason
	require("mason").setup()
	local ensure_installed = {
		"stylua",
		"lua_ls",
		"sqlls",
		"sqlfmt",
	}

	-- Filter and install servers
	local servers_to_install = vim.tbl_filter(function(key)
		local t = servers[key]
		if type(t) == "table" then
			return not t.manual_install
		else
			return t
		end
	end, vim.tbl_keys(servers))

	vim.list_extend(ensure_installed, servers_to_install)
	require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

	-- Setup servers
	for name, config in pairs(servers) do
		if config == true then
			config = {}
		end
		config = vim.tbl_deep_extend("force", {}, {
			capabilities = capabilities,
		}, config)

		lspconfig[name].setup(config)
	end

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

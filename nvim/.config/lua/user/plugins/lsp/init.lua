return {
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			{
				-- `lazydev` configures Lua LSP for your Neovim config, runtime and plugins
				-- used for completion, annotations and signatures of Neovim apis
				"folke/lazydev.nvim",
				ft = "lua",
				opts = {
					library = {
						-- Load luvit types when the `vim.uv` word is found
						{ path = "luvit-meta/library", words = { "vim%.uv" } },
					},
				},
			},
			{ "Bilal2453/luvit-meta", lazy = true },
			{
				"williamboman/mason-lspconfig.nvim",
				priority = 90,
				dependencies = { "mason.nvim" },
				config = function()
					require("mason-lspconfig").setup({
						ensure_installed = {
							"lua_ls",
							"pyright",
							"gopls",
							"tsserver",
							"sqlls",
							"bashls",
							"rust_analyzer",
							"jsonls",
						},
						automatic_installation = false,
						handlers = {
							-- Default handler
							function(server_name)
								require("lspconfig")[server_name].setup({})
							end,
							-- Override handlers for specific servers
							["lua_ls"] = function()
								require("lspconfig").lua_ls.setup({
									server_capabilities = {
										semanticTokensProvider = vim.NIL,
									},
								})
							end,
						},
					})
				end,
			},
			{
				"WhoIsSethDaniel/mason-tool-installer.nvim",
				priority = 80,
				dependencies = { "mason.nvim", "mason-lspconfig.nvim" },
				lazy = false,
				config = function()
					require("mason-tool-installer").setup({
						ensure_installed = {
							-- Formatters and linters only
							"black",
							"isort",
							"prettier",
							"goimports-reviser",
							"stylua",
							-- Add any other formatters/linters you need
						},
						auto_update = false,
						run_on_start = true,
						start_delay = 3000, -- 3 second delay
					})
				end,
			},

			{ "j-hui/fidget.nvim", opts = {} },
			{ "https://git.sr.ht/~whynothugo/lsp_lines.nvim" },

			{ "elixir-tools/elixir-tools.nvim" },

			-- Autoformatting
			{
				"stevearc/conform.nvim",
				opts = false,
				config = function()
					require("config.autoformat").setup()
				end,
				dependencies = {
					"mason.nvim",
				},
				lazy = false,
			},

			-- Schema information
			"b0o/SchemaStore.nvim",
		},

		config = function()
			require("user.plugins.lsp.servers").setup()
		end,
	},
}

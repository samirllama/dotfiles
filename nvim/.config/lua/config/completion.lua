local M = {}

function M.setup()
	-- Copilot setup
	require("copilot").setup({
		suggestion = { enabled = false },
		panel = { enabled = false },
	})

	require("copilot_cmp").setup()

	-- LSPkind setup
	local lspkind = require("lspkind")
	lspkind.init({
		symbol_map = {
			Copilot = "",
		},
	})

	vim.api.nvim_set_hl(0, "CmpItemKindCopilot", { fg = "#6CC644" })

	-- nvim-cmp setup
	local cmp = require("cmp")

	cmp.setup({
		snippet = {
			expand = function(args)
				require("luasnip").lsp_expand(args.body)
			end,
		},

		mapping = {
			["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
			["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
			["<C-y>"] = cmp.mapping.confirm({ select = true }),
			["<C-e>"] = cmp.mapping.abort(),
		},

		sources = {
			{ name = "copilot" },
			{ name = "nvim_lsp" },
			{ name = "luasnip" },
			{ name = "buffer" },
			{ name = "path" },
			{ name = "vim-dadbod-completion" },
		},

		formatting = {
			format = lspkind.cmp_format({
				mode = "symbol_text",
				maxwidth = 50,
				before = function(entry, vim_item)
					return vim_item
				end,
			}),
		},
	})

	-- Set up buffer-specific completion for SQL files
	vim.api.nvim_create_autocmd("FileType", {
		pattern = {
			"sql",
			"mysql",
			"plsql",
		},
		callback = function()
			cmp.setup.buffer({
				sources = {
					{ name = "vim-dadbod-completion" },
					{ name = "buffer" },
					{ name = "luasnip" },
				},
			})
		end,
	})
end

return M

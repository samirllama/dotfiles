-- nvim/.config/lua/user/keymaps.lua

local set = vim.keymap.set
local k = vim.keycode
local f = require("config.f")
local fn = f.fn
local builtin = require("telescope.builtin")

-- Basic movement keybinds, these make navigating splits easy for me
set("n", "<c-j>", "<c-w><c-j>")
set("n", "<c-k>", "<c-w><c-k>")
set("n", "<c-l>", "<c-w><c-l>")
set("n", "<c-h>", "<c-w><c-h>")

set("n", "<leader>x", "<cmd>.lua<CR>", { desc = "Execute the current line" })
set("n", "<leader><leader>x", "<cmd>source %<CR>", { desc = "Execute the current file" })

-- Toggle hlsearch if it's on, otherwise just do "enter"
set("n", "<CR>", function()
	---@diagnostic disable-next-line: undefined-field
	if vim.v.hlsearch == 1 then
		vim.cmd.nohl()
		return ""
	else
		return k("<CR>")
	end
end, { expr = true })

-- Normally these are not good mappings, but I have left/right on my thumb
-- cluster, so navigating tabs is quite easy this way.
set("n", "<left>", "gT")
set("n", "<right>", "gt")

-- There are builtin keymaps for this now, but I like that it shows
-- the float when I navigate to the error - so I override them.
set("n", "]d", fn(vim.diagnostic.jump, { count = 1, float = true }))
set("n", "[d", fn(vim.diagnostic.jump, { count = -1, float = true }))

-- These mappings control the size of splits (height/width)
set("n", "<M-,>", "<c-w>5<")
set("n", "<M-.>", "<c-w>5>")
set("n", "<M-t>", "<C-W>+")
set("n", "<M-s>", "<C-W>-")

set("n", "<M-j>", function()
	if vim.opt.diff:get() then
		vim.cmd([[normal! ]c]])
	else
		vim.cmd([[m .+1<CR>==]])
	end
end)

set("n", "<M-k>", function()
	if vim.opt.diff:get() then
		vim.cmd([[normal! [c]])
	else
		vim.cmd([[m .-2<CR>==]])
	end
end)

set("n", "<space>tt", function()
	vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = 0 }), { bufnr = 0 })
end)

vim.api.nvim_set_keymap("n", "<leader>t", "<Plug>PlenaryTestFile", { noremap = false, silent = false })

set("n", "j", function(...)
	local count = vim.v.count

	if count == 0 then
		return "gj"
	else
		return "j"
	end
end, { expr = true })

set("n", "k", function(...)
	local count = vim.v.count

	if count == 0 then
		return "gk"
	else
		return "k"
	end
end, { expr = true })

-- Telescope keymaps
set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
set("n", "<leader>fg", builtin.live_grep, { desc = "Live grep" })
set("n", "<leader>fb", builtin.buffers, { desc = "Find buffers" })
set("n", "<leader>fh", builtin.help_tags, { desc = "Help tags" })

-- Database keymaps
set("n", "<leader>db", "<cmd>DBUIToggle<CR>", { desc = "Toggle DB UI" })
set("n", "<leader>df", "<cmd>DBUIFindBuffer<CR>", { desc = "Find DB Buffer" })
set("n", "<leader>dr", "<cmd>DBUIRenameBuffer<CR>", { desc = "Rename DB Buffer" })
set("n", "<leader>dl", "<cmd>DBUILastQueryInfo<CR>", { desc = "Show Last Query" })

-- Add new SQL-specific keymaps
set("n", "<leader>qf", vim.lsp.buf.format, { desc = "Format SQL" })
set("n", "<leader>qh", "<cmd>DBUIHideResult<CR>", { desc = "Hide Query Result" })

-- Better window navigation
set("n", "<C-h>", "<C-w>h", { desc = "Navigate left window" })
set("n", "<C-j>", "<C-w>j", { desc = "Navigate down window" })
set("n", "<C-k>", "<C-w>k", { desc = "Navigate up window" })
set("n", "<C-l>", "<C-w>l", { desc = "Navigate right window" })

-- Window management
set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
set("n", "<leader>sx", ":close<CR>", { desc = "Close current split" })

-- Oil.nvim
set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- Clear search highlights
set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- Better paste
set("v", "p", '"_dP', { desc = "Better paste" })

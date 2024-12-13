--nvim/.config/lua/user/settings.lua
local opt = vim.opt

opt.number = true -- Show line numbers
opt.relativenumber = true -- Relative line numbers
opt.tabstop = 4 -- Tab width
opt.shiftwidth = 4
opt.expandtab = true

-- You have to turn this one on :), super useful feature for live preview of search and replace operations. Here's what it does:
-- 1. When you type a substitute command like: %s/old/new/g
-- 2. It will show you a live preview of the changes in a split window before you execute them.
-- For example:
-- If you have text: "The old dog jumps over the old fence", And we type: :%s/old/young/g
-- A split window appears showing: "The young dog jumps over the young fence", Before you even press Enter!

-- Values for inccommand:
-- "split" - Shows preview in a split window
-- "nosplit" - Shows preview inline
-- "" - Disables preview
-- It's useful because:
-- You can see changes before committing them
-- 2. Helps avoid mistakes in complex replacements
opt.inccommand = "split"

-- Add these new settings
opt.termguicolors = true -- Enable 24-bit RGB colors
opt.winblend = 50 -- Make floating windows transparent (similar to your 0.50 opacity in WezTerm)
opt.pumblend = 50 -- Make popup menu transparent
opt.background = "dark" -- Use dark theme variant

-- If you want to ensure transparency works properly
vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "*",
	callback = function()
		-- These are examples of things you might want to highlight
		vim.api.nvim_set_hl(0, "Normal", { bg = "NONE", ctermbg = "NONE" })
		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE", ctermbg = "NONE" })
		vim.api.nvim_set_hl(0, "SignColumn", { bg = "NONE", ctermbg = "NONE" })
		vim.api.nvim_set_hl(0, "NormalNC", { bg = "NONE", ctermbg = "NONE" })
		vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "NONE", ctermbg = "NONE" })
		vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "NONE", ctermbg = "NONE" })
	end,
})

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

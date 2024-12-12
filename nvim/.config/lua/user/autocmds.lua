-- Add this to your existing autocmds
local function augroup(name)
	return vim.api.nvim_create_augroup("apex_" .. name, { clear = true })
end

-- Auto open alpha when no files are specified
vim.api.nvim_create_autocmd("VimEnter", {
	group = augroup("alpha_autostart"),
	callback = function()
		-- Only start alpha if no arguments were passed and we're not in a git rebase
		if vim.fn.argc() == 0 and vim.bo.filetype ~= "gitrebase" then
			-- If a directory was passed, let oil handle it
			if vim.fn.isdirectory(vim.fn.getcwd()) == 0 then
				require("alpha").start()
			end
		end
	end,
})

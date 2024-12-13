-- Add this to your existing autocmds
local function augroup(name)
	return vim.api.nvim_create_augroup("apex_" .. name, { clear = true })
end

-- Auto open alpha when no files are specified
vim.api.nvim_create_autocmd("VimEnter", {
	group = augroup("alpha_autostart"),
	callback = function()
		if vim.fn.argc() == 0 and vim.bo.filetype ~= "gitrebase" then
			require("alpha").start()
		end
	end,
})

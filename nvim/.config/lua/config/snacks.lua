local M = {}

-- Create a custom logo
local logo = [[
    ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
    ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
    ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
    ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
    ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
    ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
]]

local function term_nav(dir)
	return function(self)
		return self:is_floating() and "<c-" .. dir .. ">" or vim.schedule(function()
			vim.cmd.wincmd(dir)
		end)
	end
end

function M.setup()
	return {
		dashboard = {
			enabled = true,
			sections = {
				-- Left pane with chafa image
				{
					section = "terminal",
					cmd = "chafa ~/Downloads/dark_samu.png --format symbols --symbols vhalf --size 60x17 --stretch; sleep .1",
					height = 17,
					padding = 1,
				},
				-- Right pane with actions and recent files
				{
					pane = 2,
					{
						section = "keys",
						gap = 1,
						padding = 1,
						items = {
							{
								icon = " ",
								key = "f",
								desc = "Find File",
								action = ":lua Snacks.dashboard.pick('files')",
							},
							{
								icon = " ",
								key = "g",
								desc = "Find Text",
								action = ":lua Snacks.dashboard.pick('live_grep')",
							},
							{
								icon = " ",
								key = "r",
								desc = "Recent Files",
								action = ":lua Snacks.dashboard.pick('oldfiles')",
							},
							{
								icon = " ",
								key = "c",
								desc = "Config",
								action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
							},
							{ icon = " ", key = "s", desc = "Restore Session", section = "session" },
							{ icon = " ", key = "q", desc = "Quit", action = ":qa" },
							{ icon = " ", key = "l", desc = "Lazy", action = ":Lazy" },
						},
					},
					{
						icon = " ",
						title = "Recent Files",
						section = "recent_files",
						indent = 2,
						padding = 1,
					},
					{
						icon = " ",
						title = "Projects",
						section = "projects",
						indent = 2,
						padding = 1,
					},
				},
			},
		},
		terminal = {
			win = {
				keys = {
					nav_h = { "<C-h>", term_nav("h"), desc = "Go to Left Window", expr = true, mode = "t" },
					nav_j = { "<C-j>", term_nav("j"), desc = "Go to Lower Window", expr = true, mode = "t" },
					nav_k = { "<C-k>", term_nav("k"), desc = "Go to Upper Window", expr = true, mode = "t" },
					nav_l = { "<C-l>", term_nav("l"), desc = "Go to Right Window", expr = true, mode = "t" },
				},
			},
		},
	}
end

return M

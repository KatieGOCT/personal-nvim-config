return {
	{
		"nvimdev/dashboard-nvim",
		event = "VimEnter",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			local db = require("dashboard")

			-- Custom header
			db.custom_header = {
				"                                      ",
				"  ██╗  ██╗██╗   ██╗██╗███╗   ███╗     ",
				"  ██║ ██╔╝██║   ██║██║████╗ ████║     ",
				"  █████╔╝ ██║   ██║██║██╔████╔██║     ",
				"  ██╔═██╗ ╚██╗ ██╔╝██║██║╚██╔╝██║     ",
				"  ██║  ██╗ ╚████╔╝ ██║██║ ╚═╝ ██║     ",
				"  ╚═╝  ╚═╝  ╚═══╝  ╚═╝╚═╝     ╚═╝     ",
				"                                      ",
				"     Welcome to my coding sanctuary   ",
				"                                      ",
			}

			-- Custom center items
			db.custom_center = {
                {
					icon = "🧠 ",
					desc = "Second Me                              ",
					action = "edit /Users/katie.gilmour/notes/me_2/index.norg",
					key = "i",
				}, 
				{
					icon = "  ",
					desc = "Find file                              ",
					action = "Telescope find_files",
					key = "f",
				},
				{
					icon = "  ",
					desc = "Recent files                           ",
					action = "Telescope oldfiles",
					key = "r",
				},
				{
					icon = "  ",
					desc = "Find text                              ",
					action = "Telescope live_grep",
					key = "g",
				},
				{
					icon = "  ",
					desc = "New file                               ",
					action = "enew",
					key = "n",
				},
				{
					icon = "  ",
					desc = "Config files                           ",
					action = "edit ~/.config/nvim/init.lua",
					key = "c",
				},
				{
					icon = "  ",
					desc = "File explorer                          ",
					action = "Ex",
					key = "e",
				},
				{
					icon = "  ",
					desc = "New note                               ",
					action = "lua vim.cmd('Neorg dirman new-note')",
					key = "o",
				},
				{
					icon = "  ",
					desc = "Quit                                   ",
					action = "qa",
					key = "q",
				},
			}

			-- Custom footer
			db.custom_footer = {
				"",
				"⚡ Neovim loaded " .. vim.fn.len(vim.fn.globpath(vim.fn.stdpath("data") .. "/lazy", "*", 0, 1)) .. " plugins",
				"",
				"💡 Today is " .. os.date("%A, %B %d, %Y"),
			}

			-- Dashboard configuration
			db.setup({
				theme = "doom",
				config = {
					header = db.custom_header,
					center = db.custom_center,
					footer = db.custom_footer,
				},
			})

			-- Hide tabline and statusline on dashboard
			vim.api.nvim_create_autocmd("FileType", {
				pattern = "dashboard",
				callback = function()
					vim.opt_local.laststatus = 0
					vim.opt_local.showtabline = 0
				end,
			})

			-- Restore tabline and statusline when leaving dashboard
			vim.api.nvim_create_autocmd("BufLeave", {
				pattern = "dashboard",
				callback = function()
					vim.opt.laststatus = 2
					vim.opt.showtabline = 2
				end,
			})
		end,
	},
}

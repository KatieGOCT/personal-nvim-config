return {
	{
		"luukvbaal/nnn.nvim",
		config = function()
			-- Set nnn environment variables for better integration
			vim.env.NNN_PLUG = 'o:fzopen;p:mocplay;d:diffs;t:nmount;v:imgview'
			vim.env.NNN_COLORS = '#0a1b2c3d;1234'
			vim.env.NNN_FCOLORS = '030304020005060801'
			vim.env.NNN_OPTS = 'H' -- Show hidden files
			-- Enable tree view by default
			vim.env.NNN_CONTEXT_COLORS = '1234'
			
			local builtin = require("nnn").builtin
			require("nnn").setup({
				command = "nnn -o", -- Simplified command to ensure it works
				set_default_mappings = false,
				replace_netrw = "picker", -- Replace netrw with nnn picker
				mappings = {
					{ "<C-t>", builtin.open_in_tab },
					{ "<C-s>", builtin.open_in_split },
					{ "<C-v>", builtin.open_in_vsplit },
					{ "<C-x>", builtin.open_in_split },      -- Alternative horizontal split
					{ "<C-z>", builtin.open_in_vsplit },     -- Alternative vertical split
					{ "<C-o>", builtin.copy_to_clipboard },
					{ "<C-w>", builtin.cd_to_path },
					{ "<C-y>", builtin.copy_to_clipboard },
					{ "<C-e>", builtin.populate_cmdline },
				},
				explorer = {
					cmd = "nnn",
					width = 24,
					side = "topleft",
					session = "",
					tabs = true,
					fullscreen = false,
				},
				picker = {
					cmd = "nnn",
					style = {
						width = 0.8,     -- Larger picker window
						height = 0.8,    -- Larger picker window
						xoffset = 0.5,   -- Centered
						yoffset = 0.5,   -- Centered
						border = "rounded"
					},
					session = "",
					tabs = true,
					fullscreen = false,
				},
				auto_open = {
					setup = nil,
					tabpage = nil,
					empty = false,
					ft_ignore = {
						"gitcommit",
						"gitrebase",
						"svn",
						"hgcommit",
					},
				},
				auto_close = false,
				offset = false,
				session = "",
				tabs = true,
				buflisted = false,
				quitcd = nil,
			})
		end,
	},
}

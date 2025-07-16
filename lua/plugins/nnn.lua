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
				windownav = {
					left = "<C-w>h",
					down = "<C-w>j",
					up = "<C-w>k",
					right = "<C-w>l",
					next = "<C-w>w",
				},
				layout = {
					window = {
						width = 0.25,  -- Slightly narrower for tree view
						height = 1.0, -- Full height
						xoffset = 0.0, -- Left side
						yoffset = 0.0, -- Top
					},
					split = "vertical", -- Use vertical split for sidebar
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
				auto_close = false, -- Keep it open like VS Code
				offset = false,
				session = "",
				tabs = true,
				picker = {
					cmd = "nnn",
					style = {
						width = 0.3,  -- Sidebar width
						height = 1.0, -- Full height
						xoffset = 0.0, -- Left side
						yoffset = 0.0, -- Top
					},
					session = "",
					tabs = true,
				},
			})
		end,
	},
}

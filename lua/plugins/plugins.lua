return {
	{ 
		"folke/todo-comments.nvim", opts = {} 
	},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},
	{
		"ray-x/go.nvim",
		dependencies = {  -- optional packages
			"ray-x/guihua.lua",
			"neovim/nvim-lspconfig",
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			require("go").setup()
		end,
		event = {"CmdlineEnter"},
		ft = {"go", 'gomod'},
		build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
	},
	{
		"folke/which-key.nvim",
		opts = {
			spec = {
				{ "<BS>", desc = "Decrement Selection", mode = "x" },
				{ "<c-space>", desc = "Increment Selection", mode = { "x", "n" } },
			},
		},
	},
	{
		'nvim-orgmode/orgmode',
		event = 'VeryLazy',
		config = function()
			-- Setup orgmode
			require('orgmode').setup({
				org_agenda_files = '~/orgfiles/**/*',
				org_default_notes_file = '~/orgfiles/refile.org',
			})
		end,
	}
}



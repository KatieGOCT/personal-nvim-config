return {
	{
		"PedramNavid/dbtpal",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
		},
		ft = {
			"sql",
			"md",
			"yaml",
		},
		keys = {
			{ "<leader>drf", "<cmd>DbtRun<cr>", desc = "Run dbt model" },
			{ "<leader>drp", "<cmd>DbtRunCurrent<cr>", desc = "Run current dbt model" },
			{ "<leader>dtf", "<cmd>DbtTest<cr>", desc = "Test dbt model" },
			{ "<leader>dtp", "<cmd>DbtTestCurrent<cr>", desc = "Test current dbt model" },
			{ "<leader>dco", "<cmd>DbtCompile<cr>", desc = "Compile dbt model" },
			{ "<leader>dcp", "<cmd>DbtCompileCurrent<cr>", desc = "Compile current dbt model" },
		},
		config = function()
			require("dbtpal").setup({
				path_to_dbt = "dbt",
				path_to_dbt_project = "",
				path_to_dbt_profiles_dir = vim.fn.expand("~/.dbt"),
				extended_path_search = true,
				protect_compiled_files = true,
			})
		end,
	},
	{
		"towolf/vim-helm",
		ft = "yaml",
	},
}

return {
	-- Basic SQL support
	{
		"vim-scripts/SQLComplete.vim",
		ft = { "sql" },
	},
	-- SQL formatting
	{
		"jsborjesson/vim-uppercase-sql",
		ft = { "sql" },
		config = function()
			vim.g.sql_type_default = "mysql"
		end,
	},
	-- YAML support for configuration files
	{
		"towolf/vim-helm",
		ft = "yaml",
	},
}

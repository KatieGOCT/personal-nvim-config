-- Basic SQL file type detection
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
	pattern = { "*.sql" },
	callback = function()
		vim.bo.filetype = "sql"
		vim.g.sql_type_default = "mysql"
	end,
})

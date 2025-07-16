-- Basic SQL file type plugin
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "sql" },
	callback = function()
		-- Set up basic SQL options
		vim.opt_local.commentstring = "-- %s"
		vim.opt_local.iskeyword:append("@-@")
	end,
})

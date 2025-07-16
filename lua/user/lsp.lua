-- LSP-related keymaps and settings
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist)

-- Enable inlay hints (if supported)
if vim.lsp.inlay_hint then
	vim.keymap.set("n", "<leader>ih", function()
		vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
	end)
end

-- Auto-format on save (optional)
vim.api.nvim_create_autocmd("BufWritePre", {
	callback = function()
		vim.lsp.buf.format({ async = false })
	end,
})

-- Show diagnostics in a floating window on hover
vim.api.nvim_create_autocmd("CursorHold", {
	callback = function()
		local opts = {
			focusable = false,
			close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
			border = 'rounded',
			source = 'always',
			prefix = ' ',
		}
		vim.diagnostic.open_float(nil, opts)
	end
})


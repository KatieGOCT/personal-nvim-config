-- Helper module for nnn integration
local M = {}

function M.open_nnn(path)
	-- Default to current working directory
	local target_path = path or vim.fn.getcwd()
	
	-- Check if nnn plugin is loaded
	local ok, nnn = pcall(require, "nnn")
	if not ok then
		vim.notify("nnn.nvim plugin not loaded yet. Loading...", vim.log.levels.WARN)
		-- Try to load the plugin
		local lazy_ok, lazy = pcall(require, "lazy")
		if lazy_ok then
			lazy.load({ plugins = { "nnn.nvim" } })
			-- Try again after loading
			ok, nnn = pcall(require, "nnn")
		end
	end
	
	if not ok then
		vim.notify("Failed to load nnn.nvim plugin", vim.log.levels.ERROR)
		return
	end
	
	-- Ensure path exists
	if not vim.fn.isdirectory(target_path) then
		target_path = vim.fn.getcwd()
	end
	
	-- Open nnn
	nnn.builtin(target_path)
end

return M

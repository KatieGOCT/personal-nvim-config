vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- Neorg keymaps
vim.keymap.set("n", "<leader>pn", "<Plug>(neorg.dirman.new-note)")
vim.keymap.set("n", "<leader>pv", function()
	local current_file = vim.fn.expand("%:p")
	if current_file == "" then
		-- If no file is open, use current working directory
		vim.cmd("NnnExplorer")
	else
		-- Open nnn in the directory of the current file
		vim.cmd("NnnExplorer " .. vim.fn.expand("%:p:h"))
	end
end, { desc = "Open nnn tree in current file directory" })

-- Dashboard keymaps
vim.keymap.set("n", "<leader>db", ":Dashboard<CR>", { desc = "Open Dashboard" })
vim.keymap.set("n", "<leader>h", ":Dashboard<CR>", { desc = "Home screen" })

-- Navigation keymaps
vim.keymap.set("n", "<leader>bb", "<C-o>", { desc = "Go back" })
vim.keymap.set("n", "<leader>bf", "<C-i>", { desc = "Go forward" })

-- LSP-related keymaps
vim.keymap.set("n", "<leader>lr", ":LspRestart<CR>")
vim.keymap.set("n", "<leader>li", ":LspInfo<CR>")
vim.keymap.set("n", "<leader>ls", ":LspStart<CR>")
vim.keymap.set("n", "<leader>lt", ":LspStop<CR>")

-- Telescope LSP keymaps for enhanced navigation
vim.keymap.set("n", "<leader>fd", "<cmd>Telescope lsp_definitions<CR>")
vim.keymap.set("n", "<leader>fr", "<cmd>Telescope lsp_references<CR>")
vim.keymap.set("n", "<leader>fi", "<cmd>Telescope lsp_implementations<CR>")
vim.keymap.set("n", "<leader>ft", "<cmd>Telescope lsp_type_definitions<CR>")
vim.keymap.set("n", "<leader>fs", "<cmd>Telescope lsp_document_symbols<CR>")
vim.keymap.set("n", "<leader>fw", "<cmd>Telescope lsp_workspace_symbols<CR>")
vim.keymap.set("n", "<leader>fI", "<cmd>Telescope lsp_incoming_calls<CR>")
vim.keymap.set("n", "<leader>fO", "<cmd>Telescope lsp_outgoing_calls<CR>")

-- Telescope file search keymaps
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Find files (global)" })
vim.keymap.set("n", "<leader>fF", function()
	local current_file = vim.fn.expand("%:p")
	if current_file == "" then
		-- If no file is open, use current working directory
		vim.cmd("Telescope find_files")
	else
		-- Find files in the directory of the current file
		local current_dir = vim.fn.expand("%:p:h")
		vim.cmd("Telescope find_files cwd=" .. current_dir)
	end
end, { desc = "Find files in current file's directory" })
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { desc = "Live grep (global)" })
vim.keymap.set("n", "<leader>fG", function()
	local current_file = vim.fn.expand("%:p")
	if current_file == "" then
		-- If no file is open, use current working directory
		vim.cmd("Telescope live_grep")
	else
		-- Live grep in the directory of the current file
		local current_dir = vim.fn.expand("%:p:h")
		vim.cmd("Telescope live_grep cwd=" .. current_dir)
	end
end, { desc = "Live grep in current file's directory" })

-- Quick note-taking and workspace switching
vim.keymap.set("n", "<leader>nn", "<cmd>Neorg workspace notes<CR>", { desc = "Open notes workspace" })
vim.keymap.set("n", "<leader>nw", "<cmd>Neorg workspace work<CR>", { desc = "Open work workspace" })
vim.keymap.set("n", "<leader>np", "<cmd>Neorg workspace projects<CR>", { desc = "Open projects workspace" })
vim.keymap.set("n", "<leader>nj", "<cmd>Neorg workspace journal<CR>", { desc = "Open journal workspace" })

-- Better window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })

-- Resize windows
vim.keymap.set("n", "<C-Up>", ":resize +2<CR>", { desc = "Increase window height" })
vim.keymap.set("n", "<C-Down>", ":resize -2<CR>", { desc = "Decrease window height" })
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Decrease window width" })
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Increase window width" })

-- Better indenting
vim.keymap.set("v", "<", "<gv", { desc = "Indent left" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right" })

-- Move text up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move text down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move text up" })

-- Clear search highlighting
vim.keymap.set("n", "<leader>cl", ":nohl<CR>", { desc = "Clear search highlighting" })

-- Quick save and quit
vim.keymap.set("n", "<leader>w", ":w<CR>", { desc = "Save file" })
vim.keymap.set("n", "<leader>q", ":q<CR>", { desc = "Quit" })
vim.keymap.set("n", "<leader>Q", ":q!<CR>", { desc = "Force quit" })

-- Toggle wrap
vim.keymap.set("n", "<leader>tw", ":set wrap!<CR>", { desc = "Toggle wrap" })

-- Toggle spell check
vim.keymap.set("n", "<leader>ts", ":set spell!<CR>", { desc = "Toggle spell check" })

-- File tree keymaps (nnn tree view)
vim.keymap.set("n", "<leader>e", ":NnnExplorer<CR>", { desc = "Open nnn tree" })
vim.keymap.set("n", "<C-b>", ":NnnExplorer<CR>", { desc = "Open nnn tree (VS Code style)" })
vim.keymap.set("n", "<leader>ef", function()
	local current_file = vim.fn.expand("%:p")
	if current_file == "" then
		-- If no file is open, use current working directory
		vim.cmd("NnnExplorer")
	else
		-- Open nnn in the directory of the current file
		vim.cmd("NnnExplorer " .. vim.fn.expand("%:p:h"))
	end
end, { desc = "Find current file in nnn tree" })
vim.keymap.set("n", "<leader>er", ":NnnExplorer<CR>", { desc = "Refresh nnn tree" })
vim.keymap.set("n", "<leader>eo", ":NnnExplorer<CR>", { desc = "Open nnn tree" })
vim.keymap.set("n", "<leader>eq", ":q<CR>", { desc = "Close nnn tree" })

-- nnn file manager keymaps (additional)
vim.keymap.set("n", "<leader>fp", ":NnnPicker<CR>", { desc = "Open nnn picker" })
vim.keymap.set("n", "<leader>fn", ":NnnExplorer %:p:h<CR>", { desc = "Open nnn in current directory" })
vim.keymap.set("n", "<leader>eb", "<C-w>l", { desc = "Focus back on file from nnn" })
vim.g.mapleader = " "

vim.keymap.set("n", "<leader>pn", "<Plug>(neorg.dirman.new-note)")
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

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

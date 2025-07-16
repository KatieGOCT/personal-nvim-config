return {
	{
		"nvim-neorg/neorg",
		lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
		version = "*", -- Pin Neorg to the latest stable release
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-neorg/neorg-telescope",
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			require("neorg").setup {
				load = {
					-- Core modules
					["core.defaults"] = {},
					["core.concealer"] = {
						config = {
							icon_preset = "varied",
							icons = {
								todo = {
									done = { icon = "✓" },
									pending = { icon = "○" },
									undone = { icon = "✗" },
									urgent = { icon = "⚠" },
									on_hold = { icon = "⏸" },
									cancelled = { icon = "⊘" },
									recurring = { icon = "↻" },
								},
								list = {
									icons = { "•", "◦", "▸", "▹" },
								},
							},
						},
					},
					
					-- Directory and workspace management
					["core.dirman"] = {
						config = {
							workspaces = {
								notes = "~/notes",
								work = "~/work-notes",
								projects = "~/projects",
								journal = "~/journal",
							},
							default_workspace = "notes",
							index = "index.norg",
						},
					},
					
					-- Completion support
					["core.completion"] = {
						config = {
							engine = "nvim-cmp",
						},
					},
					
					-- Export functionality
					["core.export"] = {},
					["core.export.markdown"] = {
						config = {
							extensions = "all",
						},
					},
					
					-- Integrations
					["core.integrations.telescope"] = {},
					["core.integrations.treesitter"] = {},
					
					-- Journal and GTD
					["core.journal"] = {
						config = {
							workspace = "journal",
							journal_folder = "daily",
							use_template = false,
						},
					},
					
					-- Summary and organization
					["core.summary"] = {},
					["core.tangle"] = {},
					
					-- Presenter mode
					["core.presenter"] = {
						config = {
							zen_mode = "zen-mode",
						},
					},
					
					-- Syntax and highlighting
					["core.syntax"] = {},
					
					-- Queries and searching
					["core.queries.native"] = {},
					
					-- Keybinds
					["core.keybinds"] = {
						config = {
							default_keybinds = true,
							neorg_leader = "<LocalLeader>",
						},
					},
					
					-- Autocommands
					["core.autocommands"] = {},
					
					-- Storage and metadata
					["core.storage"] = {},
					
					-- Looking glass (preview)
					["core.looking-glass"] = {},
					
					-- Quality of life features
					["core.qol.toc"] = {},
					["core.qol.todo_items"] = {},
				},
			}

			-- Enhanced Neorg settings
			vim.api.nvim_create_autocmd("Filetype", {
				pattern = "norg",
				callback = function()
					vim.wo.foldlevel = 99
					vim.wo.conceallevel = 2
					vim.wo.wrap = true
					vim.wo.linebreak = true
					vim.wo.breakindent = true
					
					-- Buffer-specific keymaps
					local opts = { buffer = true, silent = true }
					
					-- Task management
					vim.keymap.set("n", "<leader>td", "<cmd>Neorg keybind all core.qol.todo_items.todo.task_done<CR>", opts)
					vim.keymap.set("n", "<leader>tu", "<cmd>Neorg keybind all core.qol.todo_items.todo.task_undone<CR>", opts)
					vim.keymap.set("n", "<leader>tp", "<cmd>Neorg keybind all core.qol.todo_items.todo.task_pending<CR>", opts)
					vim.keymap.set("n", "<leader>th", "<cmd>Neorg keybind all core.qol.todo_items.todo.task_on_hold<CR>", opts)
					vim.keymap.set("n", "<leader>tc", "<cmd>Neorg keybind all core.qol.todo_items.todo.task_cancelled<CR>", opts)
					vim.keymap.set("n", "<leader>tr", "<cmd>Neorg keybind all core.qol.todo_items.todo.task_recurring<CR>", opts)
					vim.keymap.set("n", "<leader>ti", "<cmd>Neorg keybind all core.qol.todo_items.todo.task_important<CR>", opts)
					
					-- Navigation
					vim.keymap.set("n", "<leader>nl", "<cmd>Neorg keybind all core.dirman.new.location<CR>", opts)
					vim.keymap.set("n", "<leader>nf", "<cmd>Neorg keybind all core.dirman.new.file<CR>", opts)
					
					-- Journal
					vim.keymap.set("n", "<leader>jt", "<cmd>Neorg journal today<CR>", opts)
					vim.keymap.set("n", "<leader>jy", "<cmd>Neorg journal yesterday<CR>", opts)
					vim.keymap.set("n", "<leader>jm", "<cmd>Neorg journal tomorrow<CR>", opts)
					vim.keymap.set("n", "<leader>jj", "<cmd>Neorg journal<CR>", opts)
					
					-- Export
					vim.keymap.set("n", "<leader>ne", "<cmd>Neorg export<CR>", opts)
					
					-- Table of contents
					vim.keymap.set("n", "<leader>nt", "<cmd>Neorg toc<CR>", opts)
					
					-- Telescope integration
					vim.keymap.set("n", "<leader>nw", "<cmd>Telescope neorg switch_workspace<CR>", opts)
					vim.keymap.set("n", "<leader>nff", "<cmd>Telescope neorg find_norg_files<CR>", opts)
					vim.keymap.set("n", "<leader>nfl", "<cmd>Telescope neorg find_linkable<CR>", opts)
					vim.keymap.set("n", "<leader>nfh", "<cmd>Telescope neorg search_headings<CR>", opts)
					vim.keymap.set("n", "<leader>nfi", "<cmd>Telescope neorg insert_link<CR>", opts)
					vim.keymap.set("n", "<leader>nft", "<cmd>Telescope neorg find_project_tasks<CR>", opts)
					vim.keymap.set("n", "<leader>nfa", "<cmd>Telescope neorg find_aof_project_tasks<CR>", opts)
					vim.keymap.set("n", "<leader>nfc", "<cmd>Telescope neorg find_context_tasks<CR>", opts)
					vim.keymap.set("n", "<leader>nfr", "<cmd>Telescope neorg find_aof_tasks<CR>", opts)
				end,
			})

			-- Global Neorg keymaps
			vim.keymap.set("n", "<leader>nI", "<cmd>Neorg index<CR>", { desc = "Open Neorg index" })
			vim.keymap.set("n", "<leader>nr", "<cmd>Neorg return<CR>", { desc = "Return from Neorg" })
			vim.keymap.set("n", "<leader>nc", "<cmd>Neorg toggle-concealer<CR>", { desc = "Toggle concealer" })
			vim.keymap.set("n", "<leader>no", "<cmd>Neorg presenter start<CR>", { desc = "Start presenter mode" })
		end,
	},
	{
		"nvim-neorg/neorg-telescope",
		dependencies = {
			"nvim-neorg/neorg",
			"nvim-telescope/telescope.nvim",
		},
	},
	{
		"folke/zen-mode.nvim",
		opts = {
			window = {
				backdrop = 0.95,
				width = 120,
				height = 1,
				options = {
					signcolumn = "no",
					number = false,
					relativenumber = false,
					cursorline = false,
					cursorcolumn = false,
					foldcolumn = "0",
					list = false,
				},
			},
			plugins = {
				options = {
					enabled = true,
					ruler = false,
					showcmd = false,
				},
				twilight = { enabled = true },
				gitsigns = { enabled = false },
				tmux = { enabled = false },
			},
		},
	},
}

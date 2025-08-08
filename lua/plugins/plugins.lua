return {
	{
		"folke/todo-comments.nvim",
		opts = {
			signs = true,
			sign_priority = 8,
			keywords = {
				FIX = {
					icon = " ",
					color = "error",
					alt = { "FIXME", "BUG", "FIXIT", "ISSUE" },
				},
				TODO = { icon = " ", color = "info" },
				HACK = { icon = " ", color = "warning" },
				WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
				PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
				NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
				TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
			},
			colors = {
				error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
				warning = { "DiagnosticWarn", "WarningMsg", "#FBBF24" },
				info = { "DiagnosticInfo", "#2563EB" },
				hint = { "DiagnosticHint", "#10B981" },
				default = { "Identifier", "#7C3AED" },
				test = { "Identifier", "#FF006E" },
			},
		},
	},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			style = "storm",
			transparent = true,
			terminal_colors = true,
			styles = {
				comments = { italic = true },
				keywords = { italic = true },
				functions = {},
				variables = {},
				sidebars = "transparent",
				floats = "transparent",
			},
			sidebars = { "qf", "help", "terminal", "packer" },
			day_brightness = 0.3,
			hide_inactive_statusline = false,
			dim_inactive = false,
			lualine_bold = false,
		},
	},
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		lazy = true,
		cmd = { "NvimTreeToggle", "NvimTreeFocus" },
		keys = {
			{ "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Toggle file explorer" },
			{ "<leader>o", "<cmd>NvimTreeFocus<cr>", desc = "Focus file explorer" },
		},
		opts = {
			disable_netrw = true,
			hijack_netrw = true,
			hijack_cursor = false,
			hijack_unnamed_buffer_when_opening = false,
			sync_root_with_cwd = true,
			respect_buf_cwd = true,
			on_attach = function(bufnr)
				local api = require("nvim-tree.api")
				
				local function opts(desc)
					return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
				end
				
				-- Default mappings
				api.config.mappings.default_on_attach(bufnr)
				
				-- Custom mappings
				vim.keymap.set('n', '<CR>', api.node.open.edit, opts('Open'))
				vim.keymap.set('n', 'o', api.node.open.edit, opts('Open'))
				vim.keymap.set('n', 'v', api.node.open.vertical, opts('Open: Vertical Split'))
				vim.keymap.set('n', 's', api.node.open.horizontal, opts('Open: Horizontal Split'))
				vim.keymap.set('n', 't', api.node.open.tab, opts('Open: New Tab'))
				vim.keymap.set('n', 'f', api.live_filter.start, opts('Start Live Filter'))
				vim.keymap.set('n', 'F', api.live_filter.clear, opts('Clear Live Filter'))
			end,
			sort = {
				sorter = "name",
			},
			view = {
				width = 35,
				preserve_window_proportions = false,
				number = false,
				relativenumber = false,
				signcolumn = "yes",
			},
			renderer = {
				add_trailing = false,
				group_empty = false,
				highlight_git = false,
				full_name = false,
				highlight_opened_files = "none",
				root_folder_label = ":~:s?$?/..?",
				indent_width = 2,
				indent_markers = {
					enable = true,
					inline_arrows = true,
					icons = {
						corner = "└",
						edge = "│",
						item = "│",
						bottom = "─",
						none = " ",
					},
				},
				icons = {
					webdev_colors = true,
					git_placement = "before",
					padding = " ",
					symlink_arrow = " ➛ ",
					show = {
						file = true,
						folder = true,
						folder_arrow = true,
						git = false, -- Disable git icons for speed
					},
					glyphs = {
						default = "",
						symlink = "",
						bookmark = "",
						folder = {
							arrow_closed = "",
							arrow_open = "",
							default = "",
							open = "",
							empty = "",
							empty_open = "",
							symlink = "",
							symlink_open = "",
						},
						git = {
							unstaged = "✗",
							staged = "✓",
							unmerged = "",
							renamed = "➜",
							untracked = "★",
							deleted = "",
							ignored = "◌",
						},
					},
				},
				special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
				symlink_destination = true,
			},
			update_focused_file = {
				enable = false, -- Disable for speed
				update_root = false,
			},
			git = {
				enable = false, -- Disable git integration for speed
				ignore = true,
				show_on_dirs = false,
				show_on_open_dirs = false,
				timeout = 400,
			},
			diagnostics = {
				enable = false, -- Disable diagnostics for speed
			},
			filters = {
				dotfiles = false,
				git_clean = false,
				no_buffer = false,
				custom = { "node_modules", "\\.cache", ".DS_Store" },
				exclude = {},
			},
			filesystem_watchers = {
				enable = false, -- Disable file watching for speed
				debounce_delay = 50,
				ignore_dirs = {},
			},
			actions = {
				use_system_clipboard = true,
				change_dir = {
					enable = true,
					global = false,
					restrict_above_cwd = false,
				},
				expand_all = {
					max_folder_discovery = 300,
					exclude = {},
				},
				file_popup = {
					open_win_config = {
						col = 1,
						row = 1,
						relative = "cursor",
						border = "shadow",
						style = "minimal",
					},
				},
				open_file = {
					quit_on_open = false,
					resize_window = true,
					window_picker = {
						enable = true,
						picker = "default",
						chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
						exclude = {
							filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
							buftype = { "nofile", "terminal", "help" },
						},
					},
				},
				remove_file = {
					close_window = true,
				},
			},
			trash = {
				cmd = "gio trash",
			},
			live_filter = {
				prefix = "[FILTER]: ",
				always_show_folders = true,
			},
			tab = {
				sync = {
					open = false,
					close = false,
					ignore = {},
				},
			},
			notify = {
				threshold = vim.log.levels.INFO,
			},
			log = {
				enable = false,
				truncate = false,
				types = {
					all = false,
					config = false,
					copy_paste = false,
					dev = false,
					diagnostics = false,
					git = false,
					profile = false,
					watcher = false,
				},
			},
		},
	},
	{
		"ray-x/go.nvim",
		dependencies = { -- optional packages
			"ray-x/guihua.lua",
			"neovim/nvim-lspconfig",
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			require("go").setup()
		end,
		event = { "CmdlineEnter" },
		ft = { "go", "gomod" },
		build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
	},
	{
		"folke/which-key.nvim",
		opts = {
			spec = {
				{ "<BS>",       desc = "Decrement Selection", mode = "x" },
				{ "<c-space>",  desc = "Increment Selection", mode = { "x", "n" } },
				{ "<leader>n",  group = "Neorg" },
				{ "<leader>nf", group = "Find" },
				{ "<leader>j",  group = "Journal" },
				{ "<leader>t",  group = "Tasks/Todo" },
				{ "<leader>f",  group = "Find" },
				{ "<leader>l",  group = "LSP" },
				{ "<leader>e",  desc = "Toggle Explorer" },
				{ "<leader>o",  desc = "Focus Explorer" },
			},
		},
	},
	{
		"nvim-orgmode/orgmode",
		event = "VeryLazy",
		config = function()
			-- Setup orgmode
			require("orgmode").setup({
				org_agenda_files = "~/orgfiles/**/*",
				org_default_notes_file = "~/orgfiles/refile.org",
			})
		end,
	},
	{
		"folke/twilight.nvim",
		opts = {
			dimming = {
				alpha = 0.25,
				color = { "Normal", "#ffffff" },
				term_bg = "#000000",
				inactive = false,
			},
			context = 10,
			treesitter = true,
			expand = {
				"function",
				"method",
				"table",
				"if_statement",
			},
			exclude = {},
		},
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {
			indent = {
				char = "│",
				tab_char = "│",
			},
			scope = { enabled = false },
			exclude = {
				filetypes = {
					"help",
					"alpha",
					"dashboard",
					"NvimTree",
					"Trouble",
					"trouble",
					"lazy",
					"mason",
					"notify",
					"toggleterm",
					"lazyterm",
					"norg",
				},
			},
		},
	},
	{
		"echasnovski/mini.pairs",
		version = false,
		opts = {},
	},
	{
		"echasnovski/mini.surround",
		version = false,
		opts = {},
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			options = {
				theme = "horizon",
				globalstatus = true,
				disabled_filetypes = { statusline = { "dashboard", "alpha", "starter" } },
				component_separators = { left = '󱎕', right = '󰳗' },
				section_separators = { left = '󱎕', right = '󰳗' },
			},
			sections = {
				lualine_a = {
					{
						"mode",
						separator = { left = "", right = "" },
						right_padding = 2,
					},
				},
				lualine_b = {
					{
						"branch",
						separator = { left = "", right = "" },
						right_padding = 2,
					},
				},
				lualine_c = {
					{
						"diagnostics",
						symbols = {
							error = " ",
							warn = " ",
							info = " ",
							hint = " ",
						},
						separator = { left = "", right = "" },
						right_padding = 2,
					},
					{
						"filename",
						path = 4,
						shorting_target = 25,
						symbols = { modified = "", readonly = "", unnamed = "" },
						separator = { left = "", right = "" },
						left_padding = 2,
					},
					{
						function()
							local reg = vim.fn.reg_recording()
							if reg == "" then
								return ""
							else
								return "recording @" .. reg
							end
						end,
						color = { fg = "#ff9e64" },
					},
				},
				lualine_x = {
					{
						"encoding",
						separator = { left = "", right = "" },
						right_padding = 2,
					},
					{
						"fileformat",
						separator = { left = "", right = "" },
						right_padding = 2,
					},
				},
				lualine_y = {
					{
						"progress",
						separator = { left = "", right = "" },
						right_padding = 2,
					},
				},
				lualine_z = {
					{
						"location",
						separator = { left = "", right = "" },
						left_padding = 2,
					},
				},
			},
			extensions = { "nvim-tree", "lazy" },
		},
	},
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			lsp = {
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true,
				},
			},
			routes = {
				{
					filter = {
						event = "msg_show",
						any = {
							{ find = "%d+L, %d+B" },
							{ find = "; after #%d+" },
							{ find = "; before #%d+" },
						},
					},
					view = "mini",
				},
			},
			presets = {
				bottom_search = true,
				command_palette = true,
				long_message_to_split = true,
				inc_rename = true,
				lsp_doc_border = false,
			},
		},
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
	},
	{
		"rcarriga/nvim-notify",
		opts = {
			timeout = 3000,
			max_height = function()
				return math.floor(vim.o.lines * 0.75)
			end,
			max_width = function()
				return math.floor(vim.o.columns * 0.75)
			end,
		},
	},
}

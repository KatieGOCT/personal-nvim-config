return {
	{
		'nvim-telescope/telescope.nvim',
		tag = '0.1.8',
		dependencies = {
			'nvim-lua/plenary.nvim',
			'nvim-telescope/telescope-fzf-native.nvim',
		},
		config = function()
			local telescope = require('telescope')
			local actions = require('telescope.actions')
			
			telescope.setup({
				defaults = {
					mappings = {
						i = {
							["<C-n>"] = actions.cycle_history_next,
							["<C-p>"] = actions.cycle_history_prev,
							["<C-j>"] = actions.move_selection_next,
							["<C-k>"] = actions.move_selection_previous,
							["<C-c>"] = actions.close,
							["<Down>"] = actions.move_selection_next,
							["<Up>"] = actions.move_selection_previous,
							["<CR>"] = actions.select_default,
							["<C-x>"] = actions.select_horizontal,
							["<C-v>"] = actions.select_vertical,
							["<C-t>"] = actions.select_tab,
							["<C-u>"] = actions.preview_scrolling_up,
							["<C-d>"] = actions.preview_scrolling_down,
							["<PageUp>"] = actions.results_scrolling_up,
							["<PageDown>"] = actions.results_scrolling_down,
							["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
							["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
							["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
							["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
							["<C-l>"] = actions.complete_tag,
							["<C-_>"] = actions.which_key,
						},
					},
					prompt_prefix = "🔍 ",
					selection_caret = "➤ ",
					path_display = { "truncate" },
					file_ignore_patterns = {
						"%.git/",
						"node_modules/",
						"%.DS_Store",
						"%.lock",
					},
					layout_config = {
						horizontal = {
							prompt_position = "top",
							preview_width = 0.55,
							results_width = 0.8,
						},
						vertical = {
							mirror = false,
						},
						width = 0.87,
						height = 0.80,
						preview_cutoff = 120,
					},
					sorting_strategy = "ascending",
					winblend = 0,
					border = {},
					borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
					color_devicons = true,
					use_less = true,
					set_env = { ["COLORTERM"] = "truecolor" },
				},
				pickers = {
					find_files = {
						theme = "dropdown",
						previewer = false,
					},
					live_grep = {
						theme = "ivy",
					},
					buffers = {
						theme = "dropdown",
						previewer = false,
						initial_mode = "normal",
						mappings = {
							i = {
								["<C-d>"] = actions.delete_buffer,
							},
							n = {
								["dd"] = actions.delete_buffer,
							},
						},
					},
				},
				extensions = {
					fzf = {
						fuzzy = true,
						override_generic_sorter = true,
						override_file_sorter = true,
						case_mode = "smart_case",
					},
				},
			})
			
			-- Load extensions
			telescope.load_extension('fzf')
			
			-- Global telescope keymaps
			local builtin = require('telescope.builtin')
			vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Find files' })
			vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Live grep' })
			vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Find buffers' })
			vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Help tags' })
			vim.keymap.set('n', '<leader>fr', builtin.oldfiles, { desc = 'Recent files' })
			vim.keymap.set('n', '<leader>fc', builtin.commands, { desc = 'Commands' })
			vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = 'Keymaps' })
			vim.keymap.set('n', '<leader>fm', builtin.man_pages, { desc = 'Man pages' })
			vim.keymap.set('n', '<leader>fo', builtin.vim_options, { desc = 'Vim options' })
			vim.keymap.set('n', '<leader>ft', builtin.builtin, { desc = 'Telescope builtin' })
			vim.keymap.set('n', '<leader>fs', builtin.grep_string, { desc = 'Grep string' })
			vim.keymap.set('n', '<leader>fq', builtin.quickfix, { desc = 'Quickfix' })
			vim.keymap.set('n', '<leader>fl', builtin.loclist, { desc = 'Location list' })
			vim.keymap.set('n', '<leader>fj', builtin.jumplist, { desc = 'Jump list' })
			vim.keymap.set('n', '<leader>fp', builtin.planets, { desc = 'Planets' })
			vim.keymap.set('n', '<leader>fz', builtin.current_buffer_fuzzy_find, { desc = 'Fuzzy find in buffer' })
		end,
	},
	{
		'nvim-telescope/telescope-fzf-native.nvim',
		build = 'make'
	},
}

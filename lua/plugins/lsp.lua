return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"hrsh7th/cmp-nvim-lsp",
		},
		config = function()
			-- Setup mason-lspconfig
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"pyright",
					"ts_ls",
					"gopls",
					"rust_analyzer",
				},
				automatic_installation = true,
			})

			-- Enhanced capabilities with nvim-cmp
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			-- Common on_attach function
			local on_attach = function(client, bufnr)
				local opts = { buffer = bufnr, remap = false }

				-- LSP keymaps
				vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
				vim.keymap.set("n", "gD", function() vim.lsp.buf.declaration() end, opts)
				vim.keymap.set("n", "gi", function() vim.lsp.buf.implementation() end, opts)
				vim.keymap.set("n", "gr", function() vim.lsp.buf.references() end, opts)
				vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
				vim.keymap.set("n", "<C-k>", function() vim.lsp.buf.signature_help() end, opts)
				vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
				vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
				vim.keymap.set("n", "<leader>f", function() vim.lsp.buf.format() end, opts)
				vim.keymap.set("n", "<leader>d", function() vim.diagnostic.open_float() end, opts)
				vim.keymap.set("n", "[d", function() vim.diagnostic.goto_prev() end, opts)
				vim.keymap.set("n", "]d", function() vim.diagnostic.goto_next() end, opts)
			end

			-- Configure diagnostic signs
			local signs = {
				Error = " ",
				Warn = " ",
				Hint = " ",
				Info = " "
			}
			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
			end

			-- Configure diagnostic display
			vim.diagnostic.config({
				virtual_text = {
					prefix = "●",
				},
				signs = true,
				underline = true,
				update_in_insert = false,
				severity_sort = true,
				float = {
					border = "rounded",
					source = "always",
					header = "",
					prefix = "",
				},
			})

			-- Setup LSP servers
			local lspconfig = require("lspconfig")

			-- Lua LSP
			lspconfig.lua_ls.setup({
				on_attach = on_attach,
				capabilities = capabilities,
				settings = {
					Lua = {
						runtime = {
							version = "LuaJIT",
						},
						diagnostics = {
							globals = { "vim" },
						},
						workspace = {
							library = vim.api.nvim_get_runtime_file("", true),
						},
						telemetry = {
							enable = false,
						},
					},
				},
			})

			-- Python LSP
			lspconfig.pyright.setup({
				on_attach = on_attach,
				capabilities = capabilities,
			})

			-- TypeScript LSP
			lspconfig.ts_ls.setup({
				on_attach = on_attach,
				capabilities = capabilities,
			})

			-- Go LSP (if you want to use lspconfig instead of go.nvim)
			lspconfig.gopls.setup({
				on_attach = on_attach,
				capabilities = capabilities,
				settings = {
					gopls = {
						analyses = {
							unusedparams = true,
						},
						staticcheck = true,
					},
				},
			})

			-- Rust LSP
			lspconfig.rust_analyzer.setup({
				on_attach = on_attach,
				capabilities = capabilities,
				settings = {
					["rust-analyzer"] = {
						cargo = {
							allFeatures = true,
						},
					},
				},
			})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "mason.nvim" },
	},
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
		},
		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")

			cmp.setup({
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						elseif luasnip.expand_or_jumpable() then
							luasnip.expand_or_jump()
						else
							fallback()
						end
					end, { "i", "s" }),
					["<S-Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						elseif luasnip.jumpable(-1) then
							luasnip.jump(-1)
						else
							fallback()
						end
					end, { "i", "s" }),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
				}, {
					{ name = "buffer" },
				}),
			})

			-- Setup cmdline completion
			cmp.setup.cmdline({ "/", "?" }, {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = "buffer" }
				}
			})

			cmp.setup.cmdline(":", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = "path" }
				}, {
					{ name = "cmdline" }
				})
			})
		end,
	},
}

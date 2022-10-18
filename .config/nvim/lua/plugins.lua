return require('packer').startup(function(use)
	-- PACKER
	use 'wbthomason/packer.nvim'

	-- PLUGINS
	use {
		'nvim-treesitter/nvim-treesitter',
		config = function()
			require('nvim-treesitter').setup {
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false,
				},
				rainbow = {
					enable = true,
					disable = { "html" },
					extended_mode = false,
					max_file_lines = nil,
				},
				autotag = {
					enable = true,
				},
			}
		end
	}
	use {
		'lukas-reineke/indent-blankline.nvim';
		config = function()
			require('indent_blankline').setup {
				show_current_context = true,
				show_current_context_start = true,
			}
		end
	}	
	use {
		'darazaki/indent-o-matic',
		config = function()
			require('indent-o-matic').setup {
				max_lines = 2048,
				standard_widths = { 2, 4, 8 },
				skip_multiline = true,
			}
		end
	}
	use 'rebelot/heirline.nvim'
	use {
		'lewis6991/impatient.nvim',
		config = function()
			require('impatient')
		end
	}
	use 'nvim-tree/nvim-web-devicons'
	use 'nvim-lua/plenary.nvim'
	use 'nvim-telescope/telescope.nvim'
	use {
		'williamboman/mason.nvim',
		config = function()
			require('mason').setup()
		end
	}
	use {
		'williamboman/mason-lspconfig.nvim',
		config = function()
			require('mason-lspconfig').setup()
		end
	}
	use {
		'neovim/nvim-lspconfig',
		config = function()
			local lspconfig = require('lspconfig')
			local lsp_defaults = lspconfig.util.default_config

			lsp_defaults.capabilities = vim.tbl_deep_extend(
			'force',
			lsp_defaults.capabilities,
			require('cmp_nvim_lsp').default_capabilities()
			)
		end
	}
	use 'mfussenegger/nvim-lint'
	use 'gpanders/editorconfig.nvim'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'
	use {
		'hrsh7th/nvim-cmp',
		config = function()
			local cmp = require'cmp'

			cmp.setup({
				snippet = {
					expand = function(args)
					end,
				},
				window = {
					-- completion = cmp.config.window.bordered(),
					-- documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					['<C-b>'] = cmp.mapping.scroll_docs(-4),
					['<C-f>'] = cmp.mapping.scroll_docs(4),
					['<C-Space>'] = cmp.mapping.complete(),
					['<C-e>'] = cmp.mapping.abort(),
					['<CR>'] = cmp.mapping.confirm({ select = true }), 
				}),
				sources = cmp.config.sources({
					{ name = 'nvim_lsp' },
				}, {
					{ name = 'buffer' },
				})
			})

			cmp.setup.filetype('gitcommit', {
				sources = cmp.config.sources({
					{ name = 'cmp_git' },
				}, {
					{ name = 'buffer' },
				})
			})

			cmp.setup.cmdline({ '/', '?' }, {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = 'buffer' }
				}
			})

			cmp.setup.cmdline(':', {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = 'path' }
				}, {
					{ name = 'cmdline' }
				})
			})
		end
	}

	-- THEME	
	use {
		"catppuccin/nvim",
		as = "catppuccin",
		config = function()
			vim.g.catppuccin_flavour = "macchiato" -- latte, frappe, macchiato, mocha
			require("catppuccin").setup {
				transparent_background = true,
			}
			vim.api.nvim_command "colorscheme catppuccin"
		end
	}
end)

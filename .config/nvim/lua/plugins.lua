return require('packer').startup(function(use)
	-- PACKER
	use 'wbthomason/packer.nvim'

	-- PLUGINS
	use {
		'VonHeikemen/lsp-zero.nvim',
		requires = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},
			{'williamboman/mason.nvim'},
			{'williamboman/mason-lspconfig.nvim'},

			-- Autocompletion
			{'hrsh7th/nvim-cmp'},
			{'hrsh7th/cmp-buffer'},
			{'hrsh7th/cmp-path'},
			{'saadparwaiz1/cmp_luasnip'},
			{'hrsh7th/cmp-nvim-lsp'},
			{'hrsh7th/cmp-nvim-lua'},

			-- Snippets
			{'L3MON4D3/LuaSnip'},
			{'rafamadriz/friendly-snippets'},
		},
		config = function()
			local lsp = require('lsp-zero')

			lsp.preset('recommended')
			lsp.nvim_workspace()
			lsp.setup()
		end
	}
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
	use 'mfussenegger/nvim-lint'
	use 'gpanders/editorconfig.nvim'

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

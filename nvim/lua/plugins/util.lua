local symbols = require 'symbols'
local iterm_profile_is_hotkey = os.getenv 'ITERM_PROFILE' == 'Hotkey Window'

return {
	-- Library
	'kkharji/sqlite.lua',
	{ 'echasnovski/mini.nvim', version = false },
	{
		'nvim-treesitter/nvim-treesitter',
		build = ':TSUpdate',
		config = function()
			require('nvim-treesitter.configs').setup {
				auto_install = true,
				ignore_install = { 'markdown' },
				highlight = { enable = true, additional_vim_regex_highlighting = false },
			}
		end,
	},
	'nvim-lua/plenary.nvim',
	'MunifTanjim/nui.nvim',
	'nvim-tree/nvim-web-devicons',
	'chrisgrieser/nvim-spider',
	{
		'f-person/auto-dark-mode.nvim',
		config = function()
			local req = require 'auto-dark-mode'
			if not iterm_profile_is_hotkey then
				req.setup {}
			end
		end,
	},
	{
		'catppuccin/nvim',
		name = 'catppuccin',
		config = function()
			require('catppuccin').setup {
				--		transparent_background = true,
				term_colors = true,
				dim_inactive = { enabled = true },
				styles = {
					keywords = { 'bold' },
					properties = { 'italic', 'bold' },
				},
			}
			vim.cmd 'colo catppuccin'
		end,
	},
	--	{
	--		'yorik1984/newpaper.nvim',
	--		config = function()
	--			require('newpaper').setup {}
	--			vim.cmd 'colo newpaper'
	--		end,
	--	},
	{
		'onsails/lspkind.nvim',
		config = function()
			require('lspkind').init {
				symbol_map = symbols,
			}
		end,
	},
	{
		'williamboman/mason.nvim',
		config = true,
	},
	{
		'williamboman/mason-lspconfig.nvim',
		opts = {
			ensure_installed = {
				'rust_analyzer@nightly',
				'lua_ls',
			},
		},
	},
	{
		-- A simple statusline/winbar component that uses LSP to show your current code context
		'SmiteshP/nvim-navic',
		opts = {
			icons = symbols,
			lsp = { preference = { 'marksman', 'texlab' } },
			highlight = true,
			click = true,
		},
	},
	{
		'nvimtools/none-ls.nvim',
		config = function()
			local b = require('null-ls').builtins
			require('null-ls').setup {
				sources = {
					b.formatting.stylua,
					b.hover.printenv,
					b.diagnostics.zsh,
					b.code_actions.gitrebase,
					b.code_actions.gitsigns,
				},
			}
		end,
	},
	{ 'rcarriga/nvim-notify', opts = { background_colour = '#000000' } },
	{
		'folke/noice.nvim',
		event = 'VeryLazy',
		opts = {
			presets = { bottom_search = true },
			routes = {
				{
					filter = {
						event = 'msg_show',
						find = 'Unable to find native fzy native lua dep file. Probably need to update submodules!',
					},
					opts = { skip = true },
				},
			},
		},
	},
	{
		-- TODO: consider using tree-sitter todo comment
		'folke/todo-comments.nvim',
		config = true,
	},
	'norcalli/nvim-colorizer.lua',
	'stevearc/dressing.nvim',
	{
		'lewis6991/gitsigns.nvim',
		config = function()
			require('gitsigns').setup {}
		end,
	},
	'hrsh7th/cmp-nvim-lsp',
	'hrsh7th/cmp-nvim-lua',
	'hrsh7th/cmp-nvim-lsp-signature-help',
	'hrsh7th/cmp-buffer',
	'hrsh7th/cmp-path',
	'hrsh7th/cmp-cmdline',
	'lukas-reineke/cmp-rg',
	'saadparwaiz1/cmp_luasnip',
	'ray-x/cmp-treesitter',
	{
		'zbirenbaum/copilot-cmp',
		config = function()
			require('copilot_cmp').setup()
		end,
	},
	{
		'kylechui/nvim-surround',
		version = '*',
		event = 'VeryLazy',
		config = true,
	},
	{ 'XxiaoA/ns-textobject.nvim', config = true },
	'subnut/nvim-ghost.nvim',
	{
		'windwp/nvim-autopairs',
		config = function()
			require('nvim-autopairs').setup { check_ts = true, map_bs = false, map_c_h = true }
		end,
	},
	{
		'danielfalk/smart-open.nvim',
		branch = '0.2.x',
	},
	'nvim-telescope/telescope-ui-select.nvim',
	'aspeddro/gitui.nvim',
	{
		'zbirenbaum/copilot.lua',
		cmd = 'Copilot',
		event = 'InsertEnter',
		opts = {
			panel = { enabled = false },
			suggestion = { enabled = false },
			filetypes = { ['*'] = true },
		},
	},
	{
		'windwp/nvim-ts-autotag',
		config = function()
			require('nvim-ts-autotag').setup {}
		end,
	},
	{
		'toppair/peek.nvim',
		event = { 'VeryLazy' },
		build = 'deno task --quiet build:fast',
		opts = {
			app = 'browser',
		},
	},
	'nvim-telescope/telescope-file-browser.nvim',
	{
		'vyfor/cord.nvim',
		build = './build || .\\build',
		event = 'VeryLazy',
		opts = {},
	},
	{ 'OXY2DEV/helpview.nvim', lazy = false },
	{
		-- TODO: render on documentation comment like rust filetype
		'MeanderingProgrammer/render-markdown.nvim',
		opts = { file_types = { 'markdown', 'noice', 'cmp_docs' } },
	},
	'Hiphish/rainbow-delimiters.nvim',
}

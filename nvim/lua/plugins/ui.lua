return {
	'rcarriga/nvim-notify',
	{
		'folke/noice.nvim',
		config = true,
	},
	{
		'folke/todo-comments.nvim',
		config = function()
			require('todo-comments').setup {
				keywords = {
					FIX = { alt = { 'e' } },
					TODO = { alt = { 'q' } },
					HACK = { color = 'doc', alt = { 'a' } },
					WARN = { alt = { 'x' } },
					PERF = { color = 'cmt', alt = { 'p' } },
					NOTE = { alt = { 'd' } },
					TEST = { alt = { 't', 'PASS', 'FAIL' } },
				},
				colors = { cmt = { 'Comment' }, doc = { 'SpecialComment' } },
			}
		end,
	},
	{
		'norcalli/nvim-colorizer.lua',
		config = function()
			require('colorizer').setup()
		end,
	},
	--{ 'giusgad/pets.nvim', config = function() require('pets').setup() end, },
}

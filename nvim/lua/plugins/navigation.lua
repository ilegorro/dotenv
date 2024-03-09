return {
	{
		-- f F navigation maps
		"jinh0/eyeliner.nvim",
		lazy = false,
		config = function()
			require("eyeliner").setup({
				highlight_on_key = true, -- this must be set to true for dimming to work!
				dim = true,
			})
			vim.cmd([[
                let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
                highlight EyelinerPrimary guifg='#fc2642' gui=underline ctermfg=155 cterm=underline
                highlight EyelinerSecondary guifg='#26fcf5' gui=underline ctermfg=81 cterm=underline
            ]])
		end,
	},
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		dependencies = {
			"SmiteshP/nvim-navic",
			"MunifTanjim/nui.nvim",
		},
		opts = {
			modes = {
				char = {
					enabled = false,
				},
			},
		},
		keys = {
			{
				"m",
				function()
					require("flash").jump()
				end,
				mode = { "n", "x", "o" },
			},
			{
				"M",
				function()
					require("flash").treesitter_search()
				end,
				mode = { "n" },
			},
		},
	},
}

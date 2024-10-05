return {
	{
		"rasulomaroff/reactive.nvim",
		event = "VeryLazy",
		config = function()
			require("reactive").setup({
				builtin = {
					cursorline = true,
					cursor = true,
					modemsg = true,
				},
			})
		end,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				integrations = {
					cmp = true,
					gitsigns = true,
					nvimtree = true,
					treesitter = true,
					notify = true,
					lsp_trouble = true,
					mini = {
						enabled = true,
						indentscope_color = "",
					},
					telescope = {
						enabled = true,
						style = "nvchad",
					},
				},
				color_overrides = {
					mocha = {
						base = "#202329",
						-- base = "#282c34",
						-- base = "#000000",
						-- mantle = "#000000",
						mantle = "#353b45",
						-- crust = "#000000",
						crust = "#11111B",

						-- this 16 colors are changed to onedark
						surface0 = "#3e4451",
						surface1 = "#545862",
						surface2 = "#565c64",
						text = "#abb2bf",
						rosewater = "#b6bdca",
						lavender = "#c8ccd4",
						red = "#e06c75",
						peach = "#d19a66",
						yellow = "#e5c07b",
						green = "#98c379",
						teal = "#56b6c2",
						blue = "#61afef",
						mauve = "#c678dd",
						flamingo = "#be5046",

						-- now patching extra palettes
						maroon = "#e06c75",
						sky = "#d19a66",

						-- extra colors not decided what to do
						pink = "#F5C2E7",
						sapphire = "#74C7EC",

						subtext1 = "#BAC2DE",
						subtext0 = "#A6ADC8",
						overlay2 = "#9399B2",
						overlay1 = "#7F849C",
						overlay0 = "#6C7086",
					},
				},
				no_italic = true,
				term_colors = true,
				transparent_background = false,
			})
			vim.cmd([[
	                colorscheme catppuccin
	                hi WinSeparator guifg=VertSplit
	            ]])
		end,
	},
}

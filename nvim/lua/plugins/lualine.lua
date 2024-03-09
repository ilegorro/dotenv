return {
	"nvim-lualine/lualine.nvim",
	lazy = false,
	dependencies = {
		"SmiteshP/nvim-navic",
		"Mofiqul/vscode.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local navic = require("nvim-navic")
		local c = require("vscode.colors").get_colors()

		require("lualine").setup({
			options = {
				componlnt_separators = "|",
				section_separators = { left = "", right = "" },
				globalstatus = true,
				theme = "vscode",
			},
			tabline = {
				lualine_a = {
					{
						"filename",
						path = 1,
					},
				},
				lualine_b = {
					{
						function()
							local size = 4
							local loc = navic.get_location()
							local parts = vim.split(loc, ">")

							if #parts <= size then
								return loc
							end

							local newloc = parts[1]
							for i = 2, size, 1 do
								newloc = newloc .. ">" .. parts[i]
							end

							return newloc
						end,
					},
				},
				lualine_c = { "branch" },
			},
			sections = {
				lualine_a = {
					{
						"tabs",
						tab_max_length = 80,
						max_length = vim.o.columns / 1.5,
						mode = 2,
						path = 0,
						use_mode_colors = false,
						show_modified_status = true, -- Shows a symbol next to the tab name if the file has been modified.
						symbols = {
							modified = "[+]", -- Text to show when the file is modified.
						},
						fmt = function(name, context)
							-- Show + if buffer is modified in tab
							local buflist = vim.fn.tabpagebuflist(context.tabnr)
							local winnr = vim.fn.tabpagewinnr(context.tabnr)
							local bufnr = buflist[winnr]
							local mod = vim.fn.getbufvar(bufnr, "&mod")

							return name .. (mod == 1 and " +" or "")
						end,
					},
				},
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = { "filetype" },
				lualine_z = { "location" },
			},
		})
	end,
}

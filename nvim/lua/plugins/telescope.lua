local opts = { noremap = true, silent = true }

return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-telescope/telescope-live-grep-args.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"junegunn/fzf.vim",
		"ThePrimeagen/git-worktree.nvim",
		"gbprod/yanky.nvim",
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-frecency.nvim",
		"nvim-lua/plenary.nvim",
		"fdschmidt93/telescope-egrepify.nvim",
		config = function()
			require("telescope").load_extension("harpoon")
		end,
	},
	config = function()
		local Path = require("plenary.path")
		require("telescope").setup({
			defaults = {
				initial_mode = "insert",
				file_ignore_patterns = { "node%_modules", "%.git" },
				layout_config = {
					center = {
						preview_cutoff = 120,
						width = function(_, cols, _)
							if cols > 200 then
								return 170
							else
								return math.floor(cols * 0.87)
							end
						end,

						height = function(_, _, max_lines)
							return math.min(max_lines, 80)
						end,
					},
				},
				theme = "dropdown", -- use dropdown theme
				preview = true,
				wrap_results = true,
			},

			extensions = {
				frecency = {
					workspace_scan_cmd = { "fd", "-Htf" },
					theme = "dropdown",
					default_workspace = "CWD",
					preview = false,
					show_filter_column = false,
					db_validate_threshold = 1,
					path_display = function(opts, path)
						local fu = require("telescope.utils")
						local tail = fu.path_tail(path)
						local dir = vim.fs.dirname(path)
						local parent = Path:new(dir):make_relative(opts.cwd)
						return string.format("%s\t\t%s", tail, parent)
					end,
				},
				egrepify = {
					wrap_results = false,
					theme = "dropdown",
					preview = true,
				},
			},
			pickers = {
				lsp_references = {
					theme = "dropdown",
					show_line = false,
					preview = true,
				},
				lsp_implementations = {
					theme = "dropdown",
					show_line = false,
				},

				find_files = {
					theme = "dropdown",
					preview = false,
				},
			},
		})

		vim.api.nvim_create_autocmd("FileType", {
			pattern = "TelescopeResults",
			callback = function(ctx)
				vim.api.nvim_buf_call(ctx.buf, function()
					vim.fn.matchadd("TelescopeParent", "\t\t.*$")
					vim.api.nvim_set_hl(0, "TelescopeParent", { link = "Comment" })
				end)
			end,
		})

		require("telescope").load_extension("fzf")
		require("telescope").load_extension("git_worktree")
		require("telescope").load_extension("live_grep_args")
		require("telescope").load_extension("yank_history")
		require("telescope").load_extension("frecency")
		require("telescope").load_extension("egrepify")
		require("yanky.telescope.mapping").put("p")
		require("yanky.telescope.mapping").put("P")
		require("yanky.telescope.mapping").put("gp")
		require("yanky.telescope.mapping").put("gP")
		require("yanky.telescope.mapping").delete()
	end,
	keys = {
		{ "<leader>ff", "<Cmd>Telescope frecency<CR>", opts },
		{ "<leader>fn", "<Cmd>Telescope notify<CR>", opts },
		{ "<leader>fg", ":Telescope egrepify<CR>", opts },
		{ "<leader>fb", ":Telescope buffers<CR>", opts },
		{ "<leader>fh", ":Telescope help_tags<CR>", opts },
		{ "<leader>ft", ":Telescope treesitter<CR>", opts },
		{ "<leader>fc", ":Telescope commands<CR>", opts },
		{ "<leader>fr", ":Telescope resume<CR>", opts },
		{
			"<leader>cs",
			[[:lua require("telescope.builtin").spell_suggest(require("telescope.themes").get_cursor({}))<CR>]],
			opts,
		},
		{ "<leader>fy", ":Telescope yank_history<CR>", opts },
		{ "gr", ":Telescope lsp_references<CR>", opts },
		{ "gd", '<cmd>lua require"telescope.builtin".lsp_definitions({jump_type="tab"})<CR>', opts },
		{ "gi", ":Telescope lsp_implementations<CR>", opts },
	},
}

local opts = {
	ensure_installed = {
		"bash",
		"dockerfile",
		"go",
		"html",
		"json",
		"lua",
		"php",
		"proto",
		"sql",
		"terraform",
		"vim",
		"vimdoc",
		"xml",
		"yaml",
	},
	query_linter = {
		enable = true,
		use_virtual_text = true,
		lint_events = { "BufWrite", "CursorHold" },
	},
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	indent = {
		enable = true,
	},
	sync_install = true,
	playground = {
		enable = true,
		disable = {},
		updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
		persist_queries = true, -- Whether the query persists across vim sessions
		keybindings = {
			toggle_query_editor = "o",
			toggle_hl_groups = "i",
			toggle_injected_languages = "t",
			toggle_anonymous_nodes = "a",
			toggle_language_display = "I",
			focus_language = "f",
			unfocus_language = "F",
			update = "R",
			goto_node = "<cr>",
			show_help = "?",
		},
	},
}

return {
	{
		"nvim-treesitter/nvim-treesitter",
		version = "0.9.2",
		build = ":TSUpdate",
		event = { "BufReadPre", "BufNewFile" },

		config = function()
			require("nvim-treesitter.configs").setup(opts)
		end,
	},
}

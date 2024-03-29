local ensure_installed = {
	"go",
	"bash",
	"dockerfile",
	"glsl",
	"hcl",
	"javascript",
	"json",
	"lua",
	"toml",
	"typescript",
	"vim",
	"yaml",
	"python",
	"markdown",
	"markdown_inline",
	"proto",
	"sql",
	"graphql",
	"php",
}

local opts = {
	query_linter = {
		enable = true,
		use_virtual_text = true,
		lint_events = { "BufWrite", "CursorHold" },
	},
	ensure_installed = ensure_installed,
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "gnn", -- set to `false` to disable one of the mappings
			node_incremental = "grn",
			scope_incremental = "grc",
			node_decremental = "grm",
		},
	},
	textsubjects = {
		enable = true,
		prev_selection = ",", -- (Optional) keymap to select the previous selection
		keymaps = {
			["."] = "textsubjects-smart",
			[";"] = "textsubjects-container-outer",
			["i;"] = "textsubjects-container-inner",
		},
	},
	textobjects = {
		select = {
			enable = true,
			keymaps = {
				-- Your custom capture.
				["ip"] = "@parameter.inner",
				["ap"] = "@parameter.outer",
				["aa"] = "@assignment.outer",
				["ai"] = "@assignment.inner",
				["al"] = "@assignment.lhs",
				["ar"] = "@assignment.rhs",
				["as"] = "@statement.outer",
				["is"] = "@statement.inner",
			},
		},
		move = {
			enable = true,
			set_jumps = true,
			goto_next = {
				-- ["]]"] = "@conditional.outer",
				["]f"] = "@function.outer",
			},
			goto_previous = {
				-- ["[["] = "@conditional.outer",
				["[f"] = "@function.outer",
			},
		},
	},
	-- Install languages synchronously (only applied to `ensure_installed`)
	sync_install = true,

	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
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
	indent = {
		enable = true,
	},
}

return {
	{
		"nvim-treesitter/nvim-treesitter",
		version = "0.9.2",
		build = ":TSUpdate",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
			"JoosepAlviste/nvim-ts-context-commentstring",
		},

		config = function()
			require("nvim-treesitter.configs").setup(opts)

			-- MDX
			vim.filetype.add({
				extension = {
					mdx = "mdx",
				},
			})
			vim.treesitter.language.register("markdown", "mdx")
		end,
	},
}

Routes = {
	{
		view = "split",
		filter = { find = "go test" },
	},
}

return {
	"meain/vim-jsontogo",
	{
		"ray-x/go.nvim",
		dependencies = {
			"ray-x/guihua.lua",
		},
		config = function()
			require("go").setup({
				verbose = true,
				icons = {
					code_action_icon = "💡",
					breakpoint = "🔺",
					currentpos = "🔸",
				},
				lsp_inlay_hints = {
					enable = false,
					other_hints_prefix = "=> ",
					parameter_hints_prefix = "#",
				},
				lsp_on_client_start = function(client, bufnr)
					require("config.keymap").go_on_attach(client, bufnr)
					require("lsp_signature").on_attach()
					vim.lsp.codelens.refresh()
				end,
			})
		end,
	},
	{
		"leoluz/nvim-dap-go",
		dependencies = {
			"williamboman/mason.nvim",
			"jay-babu/mason-nvim-dap.nvim",
			"mfussenegger/nvim-dap",
			"rcarriga/nvim-dap-ui",
			"theHamsta/nvim-dap-virtual-text",
		},
		config = function()
			require("mason-nvim-dap").setup({
				ensure_installed = { "delve" },
				automatic_installation = false,
			})
			require("dap-go").setup({
				dap_configurations = {
					{
						type = "go",
						name = "Attach remote",
						mode = "remote",
						request = "attach",
					},
				},
				-- delve configurations
				delve = {
					-- the path to the executable dlv which will be used for debugging.
					-- by default, this is the "dlv" executable on your PATH.
					path = "dlv",
					-- time to wait for delve to initialize the debug session.
					-- default to 20 seconds
					initialize_timeout_sec = 20,
					-- a string that defines the port to start delve debugger.
					-- default to string "${port}" which instructs nvim-dap
					-- to start the process in a random available port
					port = "2345",
					-- additional args to pass to dlv
					args = {},
				},
			})
			require("dapui").setup()
		end,
	},
	{
		"popoffvg/goimpl.nvim",
		dependencies = {
			"nvim-telescope/telescope.nvim",
		},
		config = function()
			require("telescope").load_extension("goimpl")
		end,
		keys = {
			{
				"<leader>ci",
				"<cmd>lua require'telescope'.extensions.goimpl.goimpl{}<CR>]",
				"implement interface",
				noremap = true,
				silent = true,
			},
		},
	},
	{
		"ThePrimeagen/refactoring.nvim",
		config = function()
			require("refactoring").setup({
				prompt_func_return_type = {
					go = true,
				},
				prompt_func_param_type = {
					go = true,
				},
			})
		end,
		keys = {
			{
				"<leader>cr",
				function()
					require("telescope").extensions.refactoring.refactors()
				end,
				silent = true,
				desc = "refactoring list",
			},
		},
	},
}

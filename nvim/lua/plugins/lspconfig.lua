local servers = {
	"lua_ls",
	"sqlls",
	"bashls",
	"gopls",
	"yamlls",
	"phpactor",
	"pyright",
	-- "golangci_lint_ls",
}

local signs = {
	Error = "",
	Warn = "",
	Info = "",
	Hint = "💡",
}

local api = vim.api
local lsp = vim.lsp

-- LSP settings (for overriding per client)
local handlers = {
	["textDocument/hover"] = lsp.with(lsp.handlers.hover, { border = "rounded" }),
	["textDocument/signatureHelp"] = lsp.with(lsp.handlers.signature_help, { border = "rounded" }),
	["textDocument/publishDiagnostics"] = lsp.with(lsp.diagnostic.on_publish_diagnostics, {
		virtual_text = false,
	}),
}

local on_attach = function()
	return function(client, bufnr)
		local function bufoptsWithDesc(desc)
			return { silent = true, buffer = bufnr, desc = desc }
		end

		api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

		if client.name == "null-ls" then
			return
		end

		if client.name == "gopls" and not client.server_capabilities.semanticTokensProvider then
			local semantic = client.config.capabilities.textDocument.semanticTokens
			client.server_capabilities.semanticTokensProvider = {
				full = true,
				legend = { tokenModifiers = semantic.tokenModifiers, tokenTypes = semantic.tokenTypes },
				range = true,
			}
			client.server_capabilities.publishDiagnostics = false
		end

		-- client.resolved_capabilities.hover = false
		require("nvim-navic").attach(client, bufnr)

		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>fs", builtin.lsp_document_symbols, bufoptsWithDesc("Open symbol picker"))
		vim.keymap.set(
			"n",
			"<leader>fS",
			builtin.lsp_dynamic_workspace_symbols,
			bufoptsWithDesc("Open symbol picker (workspace)")
		)
		vim.keymap.set("n", "fu", builtin.lsp_references, bufoptsWithDesc("Open references picker"))
		api.nvim_command("autocmd CursorHold <buffer> lua vim.diagnostic.open_float({focusable = false})")

		api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
	end
end

local function setup_lsp_diags()
	lsp.handlers["textDocument/publishDiagnostics"] = lsp.with(lsp.diagnostic.on_publish_diagnostics, {
		virtual_text = false,
		signs = true,
		update_in_insert = false,
		underline = true,
	})
end

local goimports = function()
	vim.api.nvim_create_autocmd("BufWritePre", {
		pattern = "*.go",
		callback = function()
			local params = vim.lsp.util.make_range_params()
			params.context = { only = { "source.organizeImports" } }
			-- buf_request_sync defaults to a 1000ms timeout. Depending on your
			-- machine and codebase, you may want longer. Add an additional
			-- argument after params if you find that you have to write the file
			-- twice for changes to be saved.
			-- E.g., vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 3000)
			local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params)
			for cid, res in pairs(result or {}) do
				for _, r in pairs(res.result or {}) do
					if r.edit then
						local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
						vim.lsp.util.apply_workspace_edit(r.edit, enc)
					end
				end
			end
			vim.lsp.buf.format({ async = false })
		end,
	})
end

return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{
				"nvimtools/none-ls.nvim",
				config = function() end,
			},
			"williamboman/mason.nvim",
			"SmiteshP/nvim-navic",
			"williamboman/mason-lspconfig.nvim",
			{
				-- Additional lua configuration, makes nvim stuff amazing!
				"folke/neodev.nvim",
				opts = {
					library = { plugins = { "nvim-dap-ui" }, types = true },
				},
			},
			{
				"MysticalDevil/inlay-hints.nvim",
				event = "LspAttach",
				dependencies = { "neovim/nvim-lspconfig" },
				config = function()
					require("inlay-hints").setup()
				end,
			},
			-- Interaction between cmp and lspconfig
			"hrsh7th/cmp-nvim-lsp",
		},
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local cmp = require("cmp_nvim_lsp")
			local capabilities = cmp.default_capabilities(lsp.protocol.make_client_capabilities())

			vim.lsp.handlers["textDocument/hover"] = lsp.with(lsp.handlers.hover, { focusable = false, float = true })

			require("mason-lspconfig").setup_handlers({
				function(server_name)
					local ok, settings = pcall(require, "plugins.lsp." .. server_name)
					if not ok then
						print("not found settings for " .. server_name)
						return
					end

					require("lspconfig")[server_name].setup({
						capabilities = capabilities,
						on_attach = on_attach(),
						settings = settings,
						handlers = handlers,
					})
				end,
			})
			require("mason-lspconfig").setup({
				ensure_installed = servers,
			})

			goimports()
			setup_lsp_diags()

			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
			end

			local null_ls = require("null-ls")
			null_ls.setup({
				on_attach = on_attach(),
				filetypes = "go",
				sources = {
					null_ls.builtins.completion.spell,
				},
			})

			local lspconfig = require("lspconfig")
			local configs = require("lspconfig/configs")

			if not configs.golangcilsp then
				configs.golangcilsp = {
					default_config = {
						cmd = { "golangci-lint-langserver" },
						root_dir = lspconfig.util.root_pattern(".git", "go.mod"),
						init_options = {
							command = {
								"golangci-lint",
								"run",
								"--enable-all",
								"--disable",
								"lll",
								"--out-format",
								"json",
								"--issues-exit-code=1",
							},
						},
					},
				}
			end
			-- lspconfig.golangci_lint_ls.setup({
			-- 	filetypes = { "go", "gomod" },
			-- })
		end,
		keys = {
			{ "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>" },
			{ "]d", "<cmd>lua vim.diagnostic.goto_next()<CR> " },
			{ "<Leader>fe", "<cmd>lua vim.diagnostic.setloclist()<CR>" },
			{ "<C-s>", "<cmd>lua vim.lsp.buf.signature_help()<CR>" },
			{
				"<leader>rn",
				function()
					vim.lsp.buf.rename()
				end,
			},
			{
				"<leader>ca",
				function()
					vim.lsp.buf.code_action()
				end,
				mode = { "n", "v" },
			},
		},
	},
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {},
		cmd = "Trouble",
		keys = {
			{
				"<leader>xw",
				"<cmd>Trouble diagnostics toggle<cr>",
				desc = "Diagnostics (Trouble)",
			},
			{
				"<leader>xd",
				"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
				desc = "Buffer Diagnostics (Trouble)",
			},
			{
				"<leader>xl",
				"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
				desc = "LSP Definitions / references / ... (Trouble)",
			},
			{
				"<leader>xq",
				"<cmd>Trouble qflist toggle<cr>",
				desc = "Quickfix List (Trouble)",
			},
		},
	},
	{
		"smjonas/inc-rename.nvim",
		event = "BufEnter",
		config = function()
			require("inc_rename").setup({})
			vim.keymap.set("n", "<leader>rn", function()
				return ":IncRename " .. vim.fn.expand("<cword>")
			end, { expr = true })
		end,
	},
	-- { "VidocqH/lsp-lens.nvim", config = true },
}

return {
	{
		"stevearc/conform.nvim",
		config = function()
			local conform = require("conform")
			conform.formatters = {
				php = {
					command = "php-cs-fixer",
					args = {
						"fix",
						"$FILENAME",
					},
					stdin = false,
				},
			}
			conform.setup({
				formatters_by_ft = {
					lua = { "stylua" },
					python = { "black" },
					javascript = { "prettier" },
					typescript = { "prettier" },
					go = { "gofumpt" },
					php = { "php" },
					json = { "jq" },
					html = { "prettier" },
					css = { "prettier" },
					scss = { "prettier" },
					markdown = { "prettier" },
					vue = { "prettier" },
					yaml = { "prettier" },
				},
				format_on_save = {
					timeout_ms = 500,
					lsp_fallback = true,
				},
			})
		end,
	},
}

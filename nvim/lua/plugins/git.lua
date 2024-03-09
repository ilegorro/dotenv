return {
	"ThePrimeagen/git-worktree.nvim",
	"TimUntersberger/neogit",
	"lewis6991/gitsigns.nvim",
	"https://github.com/tpope/vim-fugitive.git",
	{
		"pwntester/octo.nvim",
		event = "VeryLazy",
		config = function()
			require("octo").setup({
				suppress_missing_scope = {
					projects_v2 = true,
				},
			})
		end,
	},
}

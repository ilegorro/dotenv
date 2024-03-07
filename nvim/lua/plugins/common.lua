return {
    {
        "akinsho/toggleterm.nvim",
        keys = {
            { "ttm", ":ToggleTerm<Cr>" },
        },
    },
    {
        "sindrets/diffview.nvim",
        event = "VeryLazy",
    },
    {
        "APZelos/blamer.nvim",
        event = "VeryLazy",
    },
    {
        "kkharji/sqlite.lua",
    },
    { "folke/neoconf.nvim",   cmd = "Neoconf" },
    { "folke/neodev.nvim" },
    { "nvim-lua/plenary.nvim" },
    {
        "karb94/neoscroll.nvim",
        lazy = false,
        init = function()
            require("neoscroll").setup()
        end,
    },
    {
        "gbprod/yanky.nvim",
        dependencies = {
            "kkharji/sqlite.lua",
        },
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("yanky").setup({
                highlight = {
                    on_put = false,
                    on_yank = true,
                    timer = 500,
                },
            })
        end,
        keys = {
            { "p",  "<Plug>(YankyPutAfter)",           mode = { "n", "x" } },
            { "P",  "<Plug>(YankyPutBefore)",          mode = { "n", "x" } },
            { "fp", "<cmd>Telescope yank_history<CR>", noremap = true,     mode = { "n" } },
        },
    },
    { "tpope/vim-abolish" },
    {
        "numToStr/Comment.nvim",
        dependencies = {
            "folke/todo-comments.nvim",
        },
        config = function()
            require("todo-comments").setup({})
            require("Comment").setup()
        end,
    },
    {
        "AckslD/nvim-trevJ.lua",
        config = function()
            require("trevj").setup()
        end,
        keys = {
            {
                "<Leader>j",
                function()
                    require("trevj").format_at_cursor()
                end,

                silent = true,
            },
        },
    },
    {
        "kosayoda/nvim-lightbulb",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("nvim-lightbulb").setup({
                autocmd = { enabled = true },
            })
        end,
    },
    {
        "stevearc/dressing.nvim",
        event = { "BufReadPre", "BufNewFile" },
    },
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" },
        keys = {
            {
                "<leader>a",
                function()
                    require("harpoon.mark").add_file()
                end,
                mode = "n",
            },
            {
                "<leader>e",
                function()
                    require("harpoon.ui").toggle_quick_menu()
                end,
                mode = "n",
            },
        },
    },
    {
        "numToStr/FTerm.nvim",
        config = true,
        keys = {
            {
                "<leader><leader>t",
                function()
                    require("FTerm").toggle()
                end,
                desc = "Toggle terminal",
                mode = { "n", "t" },
            },
        },
    },
    {
        "famiu/bufdelete.nvim",
    },
}

return {
    {
        "echasnovski/mini.pairs",
        event = { "BufReadPre", "BufNewFile" },
        init = function()
            require("mini.pairs").setup()
        end,
    },
    {
        "echasnovski/mini.splitjoin",
        event = { "BufReadPre", "BufNewFile" },
        init = function()
            require("mini.splitjoin").setup()
        end,
    },
    {
        "echasnovski/mini.move",
        event = { "BufReadPre", "BufNewFile" },
        init = function()
            require("mini.move").setup({
                mappings = {
                    left = "<M-h>",
                    right = "<M-l>",
                    down = "<M-j>",
                    up = "<M-k>",

                    line_left = "<M-h>",
                    line_right = "<M-l>",
                    line_down = "<M-j>",
                    line_up = "<M-k>",
                },
            })
        end,
    },
    {
        "echasnovski/mini.trailspace",
        event = { "BufReadPre", "BufNewFile" },
        init = function()
            require("mini.trailspace").setup()
        end,
    },
    --[[
    {
        "echasnovski/mini.surround",
        event = { "BufReadPre", "BufNewFile" },
        init = function()
            require("mini.surround").setup()
        end,
    },
 ]]
}

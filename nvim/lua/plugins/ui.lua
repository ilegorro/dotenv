local routes = {
    {
        view = "split",
        filter = { event = "msg_show", min_height = 20 },
    },
    {
        filter = { event = "msg_show", kind = "confirm" },
        opts = { skip = true },
    },
    {
        filter = { event = "msg_show", kind = "" },
        opts = { skip = true },
    },
    {
        filter = { event = "msg_show", kind = "lua_error" },
        opts = { skip = true },
    },
}

table.insert(routes, require("plugins.languages.go").Routes)

return {
    -- CMD custimization
    {
        -- ast place
        "SmiteshP/nvim-navic",
        lazy = false,
        config = function()
            local navic = require("nvim-navic")
            navic.setup({
                icons = {
                    File = " ",
                    Module = " ",
                    Namespace = " ",
                    Package = " ",
                    Class = " ",
                    Method = " ",
                    Property = " ",
                    Field = " ",
                    Constructor = " ",
                    Enum = " ",
                    Interface = " ",
                    Function = " ",
                    Variable = " ",
                    Constant = " ",
                    String = " ",
                    Number = " ",
                    Boolean = " ",
                    Array = " ",
                    Object = " ",
                    Key = " ",
                    Null = " ",
                    EnumMember = " ",
                    Struct = " ",
                    Event = " ",
                    Operator = " ",
                    TypeParameter = " ",
                },
            })
        end,
    },
    {
        -- messagaes and cmd new UI
        "folke/noice.nvim",
        event = "VeryLazy",
        dependencies = {
            "SmiteshP/nvim-navic",
            "rcarriga/nvim-notify",
            "MunifTanjim/nui.nvim",
            "kyazdani42/nvim-web-devicons",
        },
        config = function()
            require("noice").setup({
                routes = routes,
                lsp = {
                    -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
                    override = {
                        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                        ["vim.lsp.util.stylize_markdown"] = true,
                        ["cmp.entry.get_documentation"] = true,
                        ["config.lsp.signature.enabled"] = false,
                    },
                    hover = { enabled = false },
                    signature = { enabled = false },
                },
                -- you can enable a preset for easier configuration
                presets = {
                    bottom_search = false,        -- use a classic bottom cmdline for search
                    command_palette = true,       -- position the cmdline and popupmenu together
                    long_message_to_split = true, -- long messages will be sent to a split
                    inc_rename = false,           -- enables an input dialog for inc-rename.nvim
                    lsp_doc_border = true,        -- add a border to hover docs and signature help
                },
            })
        end,
    },
    {
        "rcarriga/nvim-notify",
        opts = {
            background_colour = "#000000",
        },
    },
    {
        -- for nvim builin ui elements
        "stevearc/dressing.nvim",
        opts = {},
    },
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {},
    },
    {
        -- zen mod
        "pocco81/true-zen.nvim",
        dependencies = {
            {
                "folke/twilight.nvim",
                opts = {
                    context = 10,
                },
            },
        },
        keys = {
            { "<leader>zs", ":TZNarrow<CR>",      mode = { "n" } },
            { "<leader>zs", ":'<,'>TZNarrow<CR>", mode = { "v" } },
            { "<leader>zz", ":TZAtaraxis<CR>",    mode = { "n" } },
            {
                "<leader>zd",
                function()
                    require("twilight.view").toggle()
                end,
                mode = { "n" },
            },
        },
        opts = {
            integrations = {
                tmux = true,    -- hide tmux status bar in (minimalist, ataraxis)
                lualine = true, -- hide nvim-lualine (ataraxis)
                twilight = true,
            },
            modes = {
                narrow = {
                    --- change the style of the fold lines. Set it to:
                    --- `informative`: to get nice pre-baked folds
                    --- `invisible`: hide them
                    --- function() end: pass a custom func with your fold lines. See :h foldtext
                    run_ataraxis = true,
                    folds_style = "invisible",
                    options = {
                        number = true,
                    },
                    open_pre = function()
                        require("twilight.view").disable()
                    end,
                },
                minimalist = {
                    options = {
                        number = true,
                        statusline = " ",
                        list = false,
                    },
                },
            },
        },
    },
    {
        -- closed buffer after x minutes
        "chrisgrieser/nvim-early-retirement",
        config = true,
        event = "VeryLazy",
    },
    {
        -- buffer float title
        "b0o/incline.nvim",
        config = function()
            local function get_diagnostic_label(props)
                local icons = {
                    Error = "",
                    Warn = "",
                    Info = "",
                    Hint = "💡",
                }
                local label = {}
                for severity, icon in pairs(icons) do
                    local n =
                        #vim.diagnostic.get(props.buf, { severity = vim.diagnostic.severity[string.upper(severity)] })
                    if n > 0 then
                        table.insert(label, { icon .. " " .. n .. " " })
                    end
                end
                return label
            end

            require("incline").setup({
                debounce_threshold = { falling = 500, rising = 250 },
                render = function(props)
                    local bufname = vim.api.nvim_buf_get_name(props.buf)
                    local filename = vim.fn.fnamemodify(bufname, ":t")
                    local diagnostics = get_diagnostic_label(props)
                    local modified = vim.api.nvim_buf_get_option(props.buf, "modified") and "bold,italic" or "None"
                    local filetype_icon, color = require("nvim-web-devicons").get_icon_color(filename)
                    local buffer = {
                        { filetype_icon, guifg = color },
                        { " " },
                        { filename,      gui = modified },
                    }
                    if #diagnostics > 0 then
                        table.insert(diagnostics, { "| ", guifg = "grey" })
                    end
                    for _, buffer_ in ipairs(buffer) do
                        table.insert(diagnostics, buffer_)
                    end
                    return diagnostics
                end,
            })
        end,
    },
}

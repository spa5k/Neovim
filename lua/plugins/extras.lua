return {
    { "wakatime/vim-wakatime", lazy = false },
    {
        "NStefan002/screenkey.nvim",
        cmd = "Screenkey",
        version = "*",
        config = true,
    },
    -- Heuristically set buffer options
    {
        "tpope/vim-sleuth",
    },
    -- editor config support
    {
        "editorconfig/editorconfig-vim",
    },
    {
        "folke/flash.nvim",
        event = "VeryLazy",
        ---@type Flash.Config
        opts = {},
        -- stylua: ignore
        keys = {
            { "s",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
            { "S",     mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
            { "r",     mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
            { "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
            { "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
        },
        config = function()
            -- Define key mappings for WhichKey
            local wk = require("which-key")
            wk.register({
                f = {
                    name = "+flash",
                    s = { "<cmd>lua require('flash').jump()<CR>", "Flash" },
                    S = { "<cmd>lua require('flash').treesitter()<CR>", "Flash Treesitter" },
                    r = { "<cmd>lua require('flash').remote()<CR>", "Remote Flash" },
                    R = { "<cmd>lua require('flash').treesitter_search()<CR>", "Treesitter Search" },
                    ["<C-s>"] = { "<cmd>lua require('flash').toggle()<CR>", "Toggle Flash Search" },
                },
            }, { prefix = "<leader>" })
        end,
    },
    {
        "folke/todo-comments.nvim",
        event = "VimEnter",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = { signs = false },
    },
    {
        "fedepujol/move.nvim",
        opts = {},
        keys = function()
            local keys = {
                -- Normal-mode commands
                { "<A-j>",      ":MoveLine(1)<CR>",   desc = "Move line down" },
                { "<A-k>",      ":MoveLine(-1)<CR>",  desc = "Move line up" },
                { "<A-h>",      ":MoveHChar(-1)<CR>", desc = "Move character left" },
                { "<A-l>",      ":MoveHChar(1)<CR>",  desc = "Move character right" },
                { "<leader>wf", ":MoveWord(1)<CR>",   desc = "Move word forward" },
                { "<leader>wb", ":MoveWord(-1)<CR>",  desc = "Move word backward" },

                -- Visual-mode commands
                { "v",          "<A-j>",              ":MoveBlock(1)<CR>",          desc = "Move block down" },
                { "v",          "<A-k>",              ":MoveBlock(-1)<CR>",         desc = "Move block up" },
                { "v",          "<A-h>",              ":MoveHBlock(-1)<CR>",        desc = "Move block left" },
                { "v",          "<A-l>",              ":MoveHBlock(1)<CR>",         desc = "Move block right" },

                -- also make them work with arrow keys
                { "<A-Down>",   ":MoveLine(1)<CR>",   desc = "Move line down" },
                { "<A-Up>",     ":MoveLine(-1)<CR>",  desc = "Move line up" },
                { "<A-Left>",   ":MoveHChar(-1)<CR>", desc = "Move character left" },
                { "<A-Right>",  ":MoveHChar(1)<CR>",  desc = "Move character right" },
                { "v",          "<A-Down>",           ":MoveBlock(1)<CR>",          desc = "Move block down" },
                { "v",          "<A-Up>",             ":MoveBlock(-1)<CR>",         desc = "Move block up" },
                { "v",          "<A-Left>",           ":MoveHBlock(-1)<CR>",        desc = "Move block left" },
                { "v",          "<A-Right>",          ":MoveHBlock(1)<CR>",         desc = "Move block right" },
            }
            return keys
        end,
        config = function()
            require("move").setup({})
            -- Define key mappings for WhichKey
            local wk = require("which-key")
            wk.register({
                m = {
                    name = "+move",
                    j = { "<cmd>MoveLine(1)<CR>", "Move line down" },
                    k = { "<cmd>MoveLine(-1)<CR>", "Move line up" },
                    h = { "<cmd>MoveHChar(-1)<CR>", "Move character left" },
                    l = { "<cmd>MoveHChar(1)<CR>", "Move character right" },
                    f = { "<cmd>MoveWord(1)<CR>", "Move word forward" },
                    b = { "<cmd>MoveWord(-1)<CR>", "Move word backward" },
                    d = { "<cmd>MoveBlock(1)<CR>", "Move block down" },
                    u = { "<cmd>MoveBlock(-1)<CR>", "Move block up" },
                    left = { "<cmd>MoveHBlock(-1)<CR>", "Move block left" },
                    right = { "<cmd>MoveHBlock(1)<CR>", "Move block right" },
                },
            }, { prefix = "<leader>" })
        end,
    },
    {
        "karb94/neoscroll.nvim",
        config = function()
            if not vim.g.neovide then
                require("neoscroll").setup({
                    stop_eof = true,
                    easing_function = "sine",
                    hide_cursor = true,
                    cursor_scrolls_alone = true,
                })
            end
        end,
    },
    {
        'JoosepAlviste/nvim-ts-context-commentstring',
        config = function()
            require('ts_context_commentstring').setup {
                enable_autocmd = false,
            }
        end
    },
    {
        'stevearc/overseer.nvim',
        opts = {},
    }
}

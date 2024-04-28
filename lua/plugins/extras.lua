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
        'numToStr/Comment.nvim',
        opts = {
            ---Add a space b/w comment and the line
            padding = true,
            ---Whether the cursor should stay at its position
            sticky = true,
            ---Lines to be ignored while (un)comment
            ignore = nil,
            ---LHS of toggle mappings in NORMAL mode
            toggler = {
                ---Line-comment toggle keymap
                line = 'gcc',
                ---Block-comment toggle keymap
                block = 'gbc',
            },
            ---LHS of operator-pending mappings in NORMAL and VISUAL mode
            opleader = {
                ---Line-comment keymap
                line = 'gc',
                ---Block-comment keymap
                block = 'gb',
            },
            ---LHS of extra mappings
            extra = {
                ---Add comment on the line above
                above = 'gcO',
                ---Add comment on the line below
                below = 'gco',
                ---Add comment at the end of line
                eol = 'gcA',
            },
            ---Enable keybindings
            ---NOTE: If given `false` then the plugin won't create any mappings
            mappings = {
                ---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
                basic = true,
                ---Extra mapping; `gco`, `gcO`, `gcA`
                extra = true,
            },

        },
        config = function()
            require('Comment').setup {
                pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
            }
        end
    },
}

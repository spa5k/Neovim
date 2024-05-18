return {
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        enabled = true,
        dependencies = {
            "MunifTanjim/nui.nvim",
            -- OPTIONAL:
            --   `nvim-notify` is only needed, if you want to use the notification view.
            --   If not available, we use `mini` as the fallback
            -- "rcarriga/nvim-notify",
        },
        opts = {
            lsp = {
                override = {
                    ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                    ["vim.lsp.util.stylize_markdown"] = true,
                    ["cmp.entry.get_documentation"] = true,
                },
            },
            routes = {
                {
                    filter = {
                        event = "msg_show",
                        any = {
                            { find = "%d+L, %d+B" },
                            { find = "; after #%d+" },
                            { find = "; before #%d+" },
                        },
                    },
                    view = "mini",
                },
            },
            presets = {
                bottom_search = true,         -- use a classic bottom cmdline for search
                command_palette = true,       -- position the cmdline and popupmenu together
                long_message_to_split = true, -- long messages will be sent to a split
                inc_rename = true,            -- enables an input dialog for inc-rename.nvim
                lsp_doc_border = true,        -- add a border to hover docs and signature help
            },
        },
        -- stylua: ignore
        keys = {
            { "<S-Enter>",   function() require("noice").redirect(vim.fn.getcmdline()) end,                 mode = "c",                 desc = "Redirect Cmdline" },
            { "<leader>snl", function() require("noice").cmd("last") end,                                   desc = "Noice Last Message" },
            { "<leader>snh", function() require("noice").cmd("history") end,                                desc = "Noice History" },
            { "<leader>sna", function() require("noice").cmd("all") end,                                    desc = "Noice All" },
            { "<leader>snd", function() require("noice").cmd("dismiss") end,                                desc = "Dismiss All" },
            { "<c-f>",       function() if not require("noice.lsp").scroll(4) then return "<c-f>" end end,  silent = true,              expr = true,              desc = "Scroll Forward",  mode = { "i", "n", "s" } },
            { "<c-b>",       function() if not require("noice.lsp").scroll(-4) then return "<c-b>" end end, silent = true,              expr = true,              desc = "Scroll Backward", mode = { "i", "n", "s" } },
        },
        config = function()
            -- Define key mappings for WhichKey
            local wk = require("which-key")
            wk.register({
                ["<S-Enter>"] = { "<cmd>lua require('noice').redirect(vim.fn.getcmdline())<CR>", "Redirect Cmdline" },
                sn = {
                    name = "+noice",
                    l = { "<cmd>lua require('noice').cmd('last')<CR>", "Noice Last Message" },
                    h = { "<cmd>lua require('noice').cmd('history')<CR>", "Noice History" },
                    a = { "<cmd>lua require('noice').cmd('all')<CR>", "Noice All" },
                    d = { "<cmd>lua require('noice').cmd('dismiss')<CR>", "Dismiss All" },
                },
                ["<c-f>"] = { "<cmd>lua if not require('noice.lsp').scroll(4) then return '<c-f>' end<CR>", "Scroll Forward" },
                ["<c-b>"] = { "<cmd>lua if not require('noice.lsp').scroll(-4) then return '<c-b>' end<CR>", "Scroll Backward" },
            }, { prefix = "<leader>" }) -- replace <leader> with your leader key
        end,
    },
}

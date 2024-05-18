return {
    {
        "folke/trouble.nvim",
        branch = "dev", -- IMPORTANT!
        keys = {
            {
                "<leader>xx",
                "<cmd>Trouble diagnostics toggle<cr>",
                desc = "Diagnostics (Trouble)",
            },
            {
                "<leader>xX",
                "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
                desc = "Buffer Diagnostics (Trouble)",
            },
            {
                "<leader>cs",
                "<cmd>Trouble symbols toggle focus=false<cr>",
                desc = "Symbols (Trouble)",
            },
            {
                "<leader>cl",
                "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
                desc = "LSP Definitions / references / ... (Trouble)",
            },
            {
                "<leader>xL",
                "<cmd>Trouble loclist toggle<cr>",
                desc = "Location List (Trouble)",
            },
            {
                "<leader>xQ",
                "<cmd>Trouble qflist toggle<cr>",
                desc = "Quickfix List (Trouble)",
            },
            -- leader q
            {
                "<leader>q",
                "<cmd>Trouble quickfix<cr>",
                desc = "Quickfix (Trouble)",
            },
            {
                "<leader>Q",
                "<cmd>Trouble loclist<cr>",
                desc = "Location List (Trouble)",
            },
        },
        opts = {}, -- for default options, refer to the configuration section for custom setup.
        config = function()
            -- Define key mappings for WhichKey
            local wk = require("which-key")
            wk.register({
                ["<leader>xx"] = { "<cmd>Trouble diagnostics toggle<cr>", "Diagnostics (Trouble)" },
                ["<leader>xX"] = { "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", "Buffer Diagnostics (Trouble)" },
                ["<leader>cs"] = { "<cmd>Trouble symbols toggle focus=false<cr>", "Symbols (Trouble)" },
                ["<leader>cl"] = { "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", "LSP Definitions / references / ... (Trouble)" },
                ["<leader>xL"] = { "<cmd>Trouble loclist toggle<cr>", "Location List (Trouble)" },
                ["<leader>xQ"] = { "<cmd>Trouble qflist toggle<cr>", "Quickfix List (Trouble)" },
                ["<leader>q"] = { "<cmd>Trouble quickfix<cr>", "Quickfix (Trouble)" },
                ["<leader>Q"] = { "<cmd>Trouble loclist<cr>", "Location List (Trouble)" },
            }, { prefix = "" }) -- no prefix for these mappings
        end,
    }
}

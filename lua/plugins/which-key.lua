return {
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = {

        },

        config = function()
            local wk = require("which-key")

            wk.register({
                ["<space>"] = { "<cmd>SomeCommand<cr>", "Description for <space>" },
                A = { "<cmd>SomeCommand<cr>", "Description for A" },
                a = { "<cmd>SomeCommand<cr>", "Description for a" },
                O = { "<cmd>SomeCommand<cr>", "Smart [O]pen" },
                V = { "<cmd>SomeCommand<cr>", "Description for V" },
                C = { "<cmd>SomeCommand<cr>", "Description for C" },
                m = { "<cmd>SomeCommand<cr>", "Description for m" },
                N = { "<cmd>SomeCommand<cr>", "Description for N" },
                S = { "<cmd>SomeCommand<cr>", "Description for S" },
                W = { "<cmd>SomeCommand<cr>", "Description for W" },
                x = { "<cmd>SomeCommand<cr>", "Description for x" },
                p = { "<cmd>SomeCommand<cr>", "Description for p" },
                q = { "<cmd>SomeCommand<cr>", "Description for q" },
                k = { "<cmd>SomeCommand<cr>", "Description for k" },
                ["0"] = { "<cmd>SomeCommand<cr>", "Description for 0" },
                ["+"] = { "<cmd>SomeCommand<cr>", "Node Incremental" },
                ["-"] = { "<cmd>SomeCommand<cr>", "Node Decremental" },
                ["<leader>xx"] = { "<cmd>Trouble diagnostics toggle<cr>", "Diagnostics (Trouble)" },
                ["<leader>xQ"] = { "<cmd>Trouble qflist toggle<cr>", "Quickfix List (Trouble)" },
                ["<leader>q"] = { "<cmd>Trouble quickfix<cr>", "Quickfix (Trouble)" },
                ["<leader>Q"] = { "<cmd>Trouble loclist<cr>", "Location List (Trouble)" },
            }, { prefix = "<leader>" }) -- replace <leader> with your leader key
        end,
    }
}

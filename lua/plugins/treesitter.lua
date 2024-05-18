return {
    {
        "nvim-treesitter/nvim-treesitter",
        version = false,
        build = ":TSUpdate",
        event = { "BufReadPost", "BufNewFile" },
        dependencies = {
            "nvim-treesitter/nvim-treesitter-textobjects",
        },
        config = function()
            require("nvim-treesitter.configs").setup({
                sync_install = false,
                ignore_install = { "javascript" },
                modules = {},
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },
                indent = { enable = true },
                auto_install = true,
                ensure_installed = {
                    "bash",
                    "c",
                    "html",
                    "gomod",
                    "gowork",
                    "gosum",
                    "javascript",
                    "json",
                    "lua",
                    "luadoc",
                    "luap",
                    "markdown",
                    "markdown_inline",
                    "python",
                    "query",
                    "regex",
                    "tsx",
                    "typescript",
                    "vim",
                    "vimdoc",
                    "yaml",
                    "rust",
                    "go",
                    "terraform",
                    "proto",
                },
                incremental_selection = {
                    enable = true,
                    keymaps = {
                        init_selection = "<leader>vv",
                        node_incremental = "+",
                        scope_incremental = false,
                        node_decremental = "_",
                    },
                },
                textobjects = {
                    select = {
                        enable = true,
                        lookahead = true,

                        keymaps = {
                            -- You can use the capture groups defined in textobjects.scm
                            ["af"] = { query = "@function.outer", desc = "around a function" },
                            ["if"] = { query = "@function.inner", desc = "inner part of a function" },
                            ["ac"] = { query = "@class.outer", desc = "around a class" },
                            ["ic"] = { query = "@class.inner", desc = "inner part of a class" },
                            ["ai"] = { query = "@conditional.outer", desc = "around an if statement" },
                            ["ii"] = { query = "@conditional.inner", desc = "inner part of an if statement" },
                            ["al"] = { query = "@loop.outer", desc = "around a loop" },
                            ["il"] = { query = "@loop.inner", desc = "inner part of a loop" },
                            ["ap"] = { query = "@parameter.outer", desc = "around parameter" },
                            ["ip"] = { query = "@parameter.inner", desc = "inside a parameter" },
                        },
                        selection_modes = {
                            ["@parameter.outer"] = "v",   -- charwise
                            ["@parameter.inner"] = "v",   -- charwise
                            ["@function.outer"] = "v",    -- charwise
                            ["@conditional.outer"] = "V", -- linewise
                            ["@loop.outer"] = "V",        -- linewise
                            ["@class.outer"] = "<c-v>",   -- blockwise
                        },
                        include_surrounding_whitespace = false,
                    },
                    move = {
                        enable = true,
                        set_jumps = true, -- whether to set jumps in the jumplist
                        goto_previous_start = {
                            ["[f"] = { query = "@function.outer", desc = "Previous function" },
                            ["[c"] = { query = "@class.outer", desc = "Previous class" },
                            ["[p"] = { query = "@parameter.inner", desc = "Previous parameter" },
                        },
                        goto_next_start = {
                            ["]f"] = { query = "@function.outer", desc = "Next function" },
                            ["]c"] = { query = "@class.outer", desc = "Next class" },
                            ["]p"] = { query = "@parameter.inner", desc = "Next parameter" },
                        },
                    },
                    swap = {
                        enable = true,
                        swap_next = {
                            ["<leader>a"] = "@parameter.inner",
                        },
                        swap_previous = {
                            ["<leader>A"] = "@parameter.inner",
                        },
                    },
                },
            })

            -- Define key mappings for WhichKey
            local wk = require("which-key")
            wk.register({
                vv = { "<cmd>lua require('nvim-treesitter.configs').setup({incremental_selection = {init_selection = '<leader>vv'}})<CR>", "Init Selection" },
                ["+"] = { "<cmd>lua require('nvim-treesitter.configs').setup({incremental_selection = {node_incremental = '+'}})<CR>", "Node Incremental" },
                ["_"] = { "<cmd>lua require('nvim-treesitter.configs').setup({incremental_selection = {node_decremental = '_'}})<CR>", "Node Decremental" },
                af = { "<cmd>lua require('nvim-treesitter.configs').setup({textobjects = {select = {keymaps = {af = '@function.outer'}}}})<CR>", "Around a function" },
                ["if"] = { "<cmd>lua require('nvim-treesitter.configs').setup({textobjects = {select = {keymaps = {if = '@function.inner'}}}})<CR>", "Inner part of a function" },
                ac = { "<cmd>lua require('nvim-treesitter.configs').setup({textobjects = {select = {keymaps = {ac = '@class.outer'}}}})<CR>", "Around a class" },
                ic = { "<cmd>lua require('nvim-treesitter.configs').setup({textobjects = {select = {keymaps = {ic = '@class.inner'}}}})<CR>", "Inner part of a class" },
                ai = { "<cmd>lua require('nvim-treesitter.configs').setup({textobjects = {select = {keymaps = {ai = '@conditional.outer'}}}})<CR>", "Around an if statement" },
                ii = { "<cmd>lua require('nvim-treesitter.configs').setup({textobjects = {select = {keymaps = {ii = '@conditional.inner'}}}})<CR>", "Inner part of an if statement" },
                al = { "<cmd>lua require('nvim-treesitter.configs').setup({textobjects = {select = {keymaps = {al = '@loop.outer'}}}})<CR>", "Around a loop" },
                il = { "<cmd>lua require('nvim-treesitter.configs').setup({textobjects = {select = {keymaps = {il = '@loop.inner'}}}})<CR>", "Inner part of a loop" },
                ap = { "<cmd>lua require('nvim-treesitter.configs').setup({textobjects = {select = {keymaps = {ap = '@parameter.outer'}}}})<CR>", "Around parameter" },
                ip = { "<cmd>lua require('nvim-treesitter.configs').setup({textobjects = {select = {keymaps = {ip = '@parameter.inner'}}}})<CR>", "Inside a parameter" },
                ["[f"] = { "<cmd>lua require('nvim-treesitter.configs').setup({textobjects = {move = {goto_previous_start = {['[f'] = '@function.outer'}}}})<CR>", "Previous function" },
                ["[c"] = { "<cmd>lua require('nvim-treesitter.configs').setup({textobjects = {move = {goto_previous_start = {['[c'] = '@class.outer'}}}})<CR>", "Previous class" },
                ["[p"] = { "<cmd>lua require('nvim-treesitter.configs').setup({textobjects = {move = {goto_previous_start = {['[p'] = '@parameter.inner'}}}})<CR>", "Previous parameter" },
                ["]f"] = { "<cmd>lua require('nvim-treesitter.configs').setup({textobjects = {move = {goto_next_start = {[']f'] = '@function.outer'}}}})<CR>", "Next function" },
                ["]c"] = { "<cmd>lua require('nvim-treesitter.configs').setup({textobjects = {move = {goto_next_start = {[']c'] = '@class.outer'}}}})<CR>", "Next class" },
                ["]p"] = { "<cmd>lua require('nvim-treesitter.configs').setup({textobjects = {move = {goto_next_start = {[']p'] = '@parameter.inner'}}}})<CR>", "Next parameter" },
                a = { "<cmd>lua require('nvim-treesitter.configs').setup({textobjects = {swap = {swap_next = {['<leader>a'] = '@parameter.inner'}}}})<CR>", "Swap next" },
                A = { "<cmd>lua require('nvim-treesitter.configs').setup({textobjects = {swap = {swap_previous = {['<leader>A'] = '@parameter.inner'}}}})<CR>", "Swap previous" },
            }, { prefix = "<leader>" })
        end,
    },
}

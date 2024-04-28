return {
    {
        "RRethy/vim-illuminate",
        enabled = false,
        event = { "BufReadPost", "BufNewFile" },
        opts = {
            delay = 200,
            filetypes_denylist = {
                "mason",
                "harpoon",
                "neo-tree",
                "DressingInput",
                "NeogitCommitMessage",
                "qf",
                "dirvish",
                "fugitive",
                "alpha",
                "NvimTree",
                "lazy",
                "Trouble",
                "netrw",
                "lir",
                "DiffviewFiles",
                "Outline",
                "Jaq",
                "spectre_panel",
                "toggleterm",
                "DressingSelect",
                "TelescopePrompt",
            },
        },
        lazy = false,
        config = function(_, opts)
            require("illuminate").configure(opts)

            vim.keymap.set("n", "]w", function()
                require("illuminate").goto_next_reference(false)
            end, { desc = "Next Reference" })
            vim.keymap.set("n", "[w", function()
                require("illuminate").goto_prev_reference(false)
            end, { desc = "Prev Reference" })

            vim.api.nvim_create_autocmd("FileType", {
                callback = function()
                    local buffer = vim.api.nvim_get_current_buf()
                    -- map("]]", "next", buffer)
                    -- map("[[", "prev", buffer)
                    vim.keymap.set("n", "]]", function()
                        require("illuminate").goto_next_reference(false)
                    end, { buffer = buffer, desc = "Next Reference" })
                    vim.keymap.set("n", "[[", function()
                        require("illuminate").goto_prev_reference(false)
                    end, { buffer = buffer, desc = "Prev Reference" })
                end,
            })

            vim.api.nvim_set_hl(0, "IlluminatedWordText", { link = "Visual" })
            vim.api.nvim_set_hl(0, "IlluminatedWordRead", { link = "Visual" })
            vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { link = "Visual" })

            vim.api.nvim_create_autocmd({ "ColorScheme" }, {
                pattern = { "*" },
                callback = function(_)
                    vim.api.nvim_set_hl(0, "IlluminatedWordText", { link = "Visual" })
                    vim.api.nvim_set_hl(0, "IlluminatedWordRead", { link = "Visual" })
                    vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { link = "Visual" })
                end,
            })
        end,

    }
}

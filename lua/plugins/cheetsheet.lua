return {
    {
        "doctorfree/cheatsheet.nvim",
        event = "VeryLazy",
        dependencies = {
            { "nvim-telescope/telescope.nvim" },
            { "nvim-lua/popup.nvim" },
            { "nvim-lua/plenary.nvim" },
        },
        config = function()
            local ctactions = require("cheatsheet.telescope.actions")
            require("cheatsheet").setup({
                bundled_cheetsheets = {
                    enabled = { "default", "lua", "markdown", "regex", "netrw", "unicode" },
                    disabled = { "nerd-fonts" },
                },
                bundled_plugin_cheatsheets = {
                    enabled = {
                        "auto-session",
                        "goto-preview",
                        "octo.nvim",
                        "telescope.nvim",
                        "vim-easy-align",
                        "vim-sandwich",
                    },
                    disabled = { "gitsigns" },
                },
                include_only_installed_plugins = true,
                telescope_mappings = {
                    ["<CR>"] = ctactions.select_or_fill_commandline,
                    ["<A-CR>"] = ctactions.select_or_execute,
                    ["<C-Y>"] = ctactions.copy_cheat_value,
                    ["<C-E>"] = ctactions.edit_user_cheatsheet,
                },
            })

            local wk = require("which-key")
            wk.register({
                c = {
                    name = "+cheatsheet",
                    c = { "<cmd>Cheatsheet<CR>", "Open cheatsheet" },
                    e = { "<cmd>lua require('cheatsheet').edit_user_cheatsheet()<CR>", "Edit user cheatsheet" },
                    y = { "<cmd>lua require('cheatsheet').copy_cheat_value()<CR>", "Copy cheat value" },
                },
            }, { prefix = "<leader>" })
        end,
    }
}

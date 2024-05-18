return {
    {
        "pmizio/typescript-tools.nvim",
        event = "BufReadPre",
        dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
        opts = {},
        config = function()
            require("typescript-tools").setup({
                settings = {
                    separate_diagnostic_server = true,
                    expose_as_code_action = "all",
                    -- tsserver_plugins = {},
                    tsserver_max_memory = "auto",
                    complete_function_calls = true,
                    include_completions_with_insert_text = true,
                    tsserver_file_preferences = {
                        includeInlayParameterNameHints = "all", -- "none" | "literals" | "all";
                        includeInlayParameterNameHintsWhenArgumentMatchesName = true,
                        includeInlayFunctionParameterTypeHints = true,
                        includeInlayVariableTypeHints = true,
                        includeInlayVariableTypeHintsWhenTypeMatchesName = true,
                        includeInlayPropertyDeclarationTypeHints = true,
                        includeInlayFunctionLikeReturnTypeHints = true,
                        includeInlayEnumMemberValueHints = true,
                        includeCompletionsForModuleExports = true,
                        quotePreference = "auto",
                        -- autoImportFileExcludePatterns = { "node_modules/*", ".git/*" },
                    },
                },
            })
        end,
    },
    {
        "vuki656/package-info.nvim",
        event = "BufReadPre",
        config = function()
            require("package-info").setup()

            vim.keymap.set('n', '<leader>Ns', "<cmd>lua require('package-info').show()<CR>",
                { desc = "Show dependency versions" })
            vim.keymap.set('n', '<leader>Nc', "<cmd>lua require('package-info').hide()<CR>",
                { desc = "Hide dependency versions" })
            vim.keymap.set('n', '<leader>NT', "<cmd>lua require('package-info').toggle()<CR>",
                { desc = "Toggle dependency versions" })
            vim.keymap.set('n', '<leader>Nu', "<cmd>lua require('package-info').update()<CR>",
                { desc = "Update dependency on the line" })
            vim.keymap.set('n', '<leader>Nd', "<cmd>lua require('package-info').delete()<CR>",
                { desc = "Delete dependency on the line" })
            vim.keymap.set('n', '<leader>Ni', "<cmd>lua require('package-info').install()<CR>",
                { desc = "Install a new dependency" })
            vim.keymap.set('n', '<leader>Np', "<cmd>lua require('package-info').change_version()<CR>",
                { desc = "Install a different dependency version" })
            vim.keymap.set('n', '<leader>Nt', ":Telescope package_info<CR>", { desc = "Telescope package info" })
            -- Define key mappings for WhichKey
            local wk = require("which-key")
            wk.register({
                N = {
                    name = "+package-info",
                    s = { "<cmd>lua require('package-info').show()<CR>", "Show dependency versions" },
                    c = { "<cmd>lua require('package-info').hide()<CR>", "Hide dependency versions" },
                    T = { "<cmd>lua require('package-info').toggle()<CR>", "Toggle dependency versions" },
                    u = { "<cmd>lua require('package-info').update()<CR>", "Update dependency on the line" },
                    d = { "<cmd>lua require('package-info').delete()<CR>", "Delete dependency on the line" },
                    i = { "<cmd>lua require('package-info').install()<CR>", "Install a new dependency" },
                    p = { "<cmd>lua require('package-info').change_version()<CR>", "Install a different dependency version" },
                    t = { ":Telescope package_info<CR>", "Telescope package info" },
                },
            }, { prefix = "<leader>" })
        end,
    }
}

return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            { "williamboman/mason.nvim", config = true },
            "williamboman/mason-lspconfig.nvim",
            { "j-hui/fidget.nvim",       opts = {} },
            -- "folke/neodev.nvim",
            { "b0o/schemastore.nvim" },
            { "hrsh7th/cmp-nvim-lsp" },
        },
        config = function()
            -- require("fidget").setup({})
            require("mason").setup()
            local builtin = require("telescope.builtin")
            local servers = {
                "tsserver",
                "lua_ls",
                "dockerls",
                "gopls",
                "jsonls",
            }
            require("mason-lspconfig").setup({
                ensure_installed = servers,
                handlers = {
                    function(name)
                        require("lspconfig")[name].setup({})
                    end,
                },
            })
            require("lspconfig.ui.windows").default_options.border = "single"

            -- require("neodev").setup()

            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
                callback = function(event)
                    local map = function(keys, func, desc)
                        if func then
                            vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
                        else
                            print("Function for keymap " .. keys .. " is not available.")
                        end
                    end

                    map("gd", builtin.lsp_definitions, "Goto Definition")
                    map("gr", builtin.lsp_references, "Goto References")
                    map("gi", builtin.lsp_implementations, "Goto Implementation")
                    map("go", builtin.lsp_type_definitions, "Type Definition")
                    map("<leader>p", builtin.lsp_document_symbols, "Document Symbols")
                    map("<leader>P", builtin.lsp_workspace_symbols, "Workspace Symbols")
                    map("<leader>Ps", builtin.lsp_dynamic_workspace_symbols, "Workspace Symbols")
                    -- code actions
                    map("<leader>ca", vim.lsp.buf.code_action, "Code Actions")

                    map("gl", vim.diagnostic.open_float, "Open Diagnostic Float")
                    map("K", vim.lsp.buf.hover, "Hover Documentation")
                    map("gs", vim.lsp.buf.signature_help, "Signature Documentation")
                    map("gD", vim.lsp.buf.declaration, "Goto Declaration")
                    map("grn", vim.lsp.buf.rename, "Rename Symbol")
                    map("<F2>", vim.lsp.buf.rename, "Rename Symbol")

                    map("<leader>v", "<cmd>vsplit | lua vim.lsp.buf.definition()<cr>",
                        "Goto Definition in Vertical Split")

                    -- Thank you teej
                    -- https://github.com/nvim-lua/kickstart.nvim/blob/master/init.lua#L502
                    local client = vim.lsp.get_client_by_id(event.data.client_id)
                    if client and client.server_capabilities.documentHighlightProvider then
                        vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
                            buffer = event.buf,
                            callback = vim.lsp.buf.document_highlight,
                        })

                        vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
                            buffer = event.buf,
                            callback = vim.lsp.buf.clear_references,
                        })
                    end
                end,
            })

            -- Define key mappings for WhichKey
            local wk = require("which-key")
            wk.register({
                g = {
                    name = "+goto",
                    d = { "<cmd>lua require('telescope.builtin').lsp_definitions()<CR>", "Goto Definition" },
                    r = { "<cmd>lua require('telescope.builtin').lsp_references()<CR>", "Goto References" },
                    i = { "<cmd>lua require('telescope.builtin').lsp_implementations()<CR>", "Goto Implementation" },
                    o = { "<cmd>lua require('telescope.builtin').lsp_type_definitions()<CR>", "Type Definition" },
                    D = { "<cmd>lua vim.lsp.buf.declaration()<CR>", "Goto Declaration" },
                    s = { "<cmd>lua vim.lsp.buf.signature_help()<CR>", "Signature Documentation" },
                    l = { "<cmd>lua vim.diagnostic.open_float()<CR>", "Open Diagnostic Float" },
                    rn = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename Symbol" },
                },
                K = { "<cmd>lua vim.lsp.buf.hover()<CR>", "Hover Documentation" },
                ["<leader>"] = {
                    p = { "<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>", "Document Symbols" },
                    P = { "<cmd>lua require('telescope.builtin').lsp_workspace_symbols()<CR>", "Workspace Symbols" },
                    Ps = { "<cmd>lua require('telescope.builtin').lsp_dynamic_workspace_symbols()<CR>", "Dynamic Workspace Symbols" },
                    ca = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "Code Actions" },
                    v = { "<cmd>vsplit | lua vim.lsp.buf.definition()<cr>", "Goto Definition in Vertical Split" },
                },
                ["<F2>"] = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename Symbol" },
            }, { prefix = "" }) -- no prefix for these mappings

            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

            local mason_lspconfig = require("mason-lspconfig")

            mason_lspconfig.setup_handlers({
                function(server_name)
                    require("lspconfig")[server_name].setup({
                        capabilities = capabilities,
                        settings = servers[server_name],
                        filetypes = (servers[server_name] or {}).filetypes,
                    })
                end,
            })

            vim.diagnostic.config({
                underline = true,
                virtual_text = true,
                signs = true,
                update_in_insert = false,
                severity_sort = true,
                float = {
                    source = "always"
                },
            })

            local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
            for type, icon in pairs(signs) do
                local hl = "DiagnosticSign" .. type
                vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
            end
        end,
    }
}

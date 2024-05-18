return {
    {
        "hrsh7th/nvim-cmp",
        version = false,
        event = "InsertEnter",
        dependencies = {
            -- Snippet Engine & its associated nvim-cmp source
            { "L3MON4D3/LuaSnip" },
            "saadparwaiz1/cmp_luasnip",

            -- Adds LSP completion capabilities
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-nvim-lua",
            "hrsh7th/cmp-buffer",
            'hrsh7th/cmp-cmdline',
            "luckasRanarison/tailwind-tools.nvim",

            -- Adds a number of user-friendly snippets
            "rafamadriz/friendly-snippets",

            -- Adds vscode-like pictograms
            "onsails/lspkind.nvim",

        },
        config = function()
            local cmp = require("cmp")
            local luasnip = require("luasnip")

            local kind_icons = {
                Text = "",
                Method = "󰆧",
                Function = "󰊕",
                Constructor = "",
                Field = "󰇽",
                Variable = "󰂡",
                Class = "󰠱",
                Interface = "",
                Module = "",
                Property = "󰜢",
                Unit = "",
                Value = "󰎠",
                Enum = "",
                Keyword = "󰌋",
                Snippet = "",
                Color = "󰏘",
                File = "󰈙",
                Reference = "",
                Folder = "󰉋",
                EnumMember = "",
                Constant = "󰏿",
                Struct = "",
                Event = "",
                Operator = "󰆕",
                TypeParameter = "󰅲",
            }
            require("luasnip.loaders.from_vscode").lazy_load()
            luasnip.config.setup({})

            cmp.setup({
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                completion = {
                    completeopt = "menu,menuone,noinsert",
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-p>"] = cmp.mapping.select_prev_item(),
                    ['<C-n>'] = cmp.mapping.select_next_item(),
                    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        elseif luasnip.expand_or_locally_jumpable() then
                            luasnip.expand_or_jump()
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                    ["<S-Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        elseif luasnip.locally_jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                    ["<CR>"] = cmp.mapping.confirm({
                        behavior = cmp.ConfirmBehavior.Replace,
                        select = true,
                    }),
                    ['<C-y>'] = cmp.mapping.confirm({
                        behavior = cmp.ConfirmBehavior.Insert,
                        select = true,
                    }),
                    ['<C-e>'] = cmp.mapping.abort(),
                    ['<C-Space>'] = cmp.mapping.complete(),
                }),
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                sources = {
                    { name = "copilot" },
                    { name = "nvim_lsp" },
                    { name = "nvim_lua" },
                    { name = "luasnip" },
                    { name = "buffer" },
                    { name = "path" },
                    { name = "calc" },
                    { name = "emoji" },
                    { name = "treesitter" },
                    { name = "crates" },
                    -- tailwind
                    { name = "tailwind" },
                },
                formatting = {
                    format = function(entry, vim_item)
                        local lspkind_ok, lspkind = pcall(require, "lspkind")

                        if not lspkind_ok then
                            -- From kind_icons array
                            vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind)
                            -- Source
                            vim_item.menu = ({
                                copilot = "[Copilot]",
                                nvim_lsp = "[LSP]",
                                nvim_lua = "[Lua]",
                                luasnip = "[LuaSnip]",
                                buffer = "[Buffer]",
                                latex_symbols = "[LaTeX]",
                                emoji = "[Emoji]",
                                treesitter = "[Treesitter]",
                                calc = "[Calc]",
                                path = "[Path]",
                            })[entry.source.name]
                            return vim_item
                        else
                            -- From lspkind
                            return lspkind.cmp_format({
                                before = require("tailwind-tools.cmp").lspkind_format
                            })(entry, vim_item)
                        end
                    end,
                },
            })

            -- Define key mappings for WhichKey
            local wk = require("which-key")
            wk.register({
                c = {
                    name = "+completion",
                    p = { "<cmd>lua require('cmp').select_prev_item()<CR>", "Select previous item" },
                    n = { "<cmd>lua require('cmp').select_next_item()<CR>", "Select next item" },
                    b = { "<cmd>lua require('cmp').scroll_docs(-4)<CR>", "Scroll docs up" },
                    f = { "<cmd>lua require('cmp').scroll_docs(4)<CR>", "Scroll docs down" },
                    t = { "<cmd>lua require('cmp').select_next_item()<CR>", "Select next item or expand snippet" },
                    s = { "<cmd>lua require('cmp').select_prev_item()<CR>", "Select previous item or jump to previous snippet" },
                    r = { "<cmd>lua require('cmp').confirm({behavior = cmp.ConfirmBehavior.Replace, select = true})<CR>", "Confirm selection and replace" },
                    y = { "<cmd>lua require('cmp').confirm({behavior = cmp.ConfirmBehavior.Insert, select = true})<CR>", "Confirm selection and insert" },
                    e = { "<cmd>lua require('cmp').abort()<CR>", "Abort completion" },
                    space = { "<cmd>lua require('cmp').complete()<CR>", "Trigger completion" },
                },
            }, { prefix = "<leader>" })
        end
    },
    {
        "L3MON4D3/LuaSnip",
        build = "echo 'NOTE: jsregexp is optional, so not a big deal if it fails to build'; make install_jsregexp"
    }
}

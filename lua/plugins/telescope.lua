return {
    {
        'nvim-telescope/telescope.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-telescope/telescope-file-browser.nvim',
            "nvim-tree/nvim-web-devicons",
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
            "nvim-telescope/telescope-ui-select.nvim",
            "kkharji/sqlite.lua",
            "nvim-telescope/telescope-frecency.nvim",
            "nvim-telescope/telescope-project.nvim",
            "rcarriga/nvim-notify",
            "nvim-telescope/telescope-fzy-native.nvim",
            "danielfalk/smart-open.nvim",
        },
        config = function(_, opts)
            local telescope = require("telescope")
            local actions = require("telescope.actions")
            local previewers = require("telescope.previewers")
            local sorters = require("telescope.sorters")

            -- Keymaps
            -- vim.keymap.set('n', '<C-p>', function() require('telescope.builtin').find_files() end,
            --     { desc = 'Search Files [P]opup' })
            -- frecency
            vim.keymap.set('n', '<C-p>', function()
                require('telescope').extensions.frecency.frecency(require('telescope.themes').get_dropdown {
                    winblend = 10,
                    previewer = true,
                })
            end, { desc = 'Search [F]iles' })
            -- smart open

            vim.keymap.set('n', '<leader><leader>', function()
                require('telescope').extensions.smart_open.smart_open {
                    cwd_only = true,
                    filename_first = false,
                }
            end, { desc = 'Smart [O]pen' })


            vim.keymap.set('n', '<leader>/', function()
                require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
                    winblend = 10,
                    previewer = true,
                })
            end, { desc = '[/] Fuzzily search in current buffer' })

            vim.keymap.set('n', '<leader>sp', '<Cmd>Telescope projects<CR>', { desc = '[S]earch [P]rojects' })
            -- open cheetsheet
            vim.keymap.set('n', '<C-S-p>', function()
                require('telescope').extensions.cheatsheet.cheatsheet(require('telescope.themes').get_dropdown {
                    winblend = 10,
                    previewer = true,
                })
            end, { desc = 'Search [C]heatsheet' })
            vim.keymap.set('n', '<C-S-f>', '<Cmd>Telescope live_grep<CR>', { desc = 'Search [F]iles' })
            vim.keymap.set('n', '<leader>sb', '<Cmd>Telescope buffers<CR>', { desc = 'Search [B]uffers' })
            vim.keymap.set('n', '<C-p>', '<Cmd>Telescope find_files<CR>', { desc = 'Search Files' })

            vim.keymap.set('n', '<leader>/', function()
                require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
                    winblend = 10,
                    previewer = true,
                })
            end, { desc = '[/] Fuzzily search in current buffer' })
            -- open file_browser with the path of the current buffer
            -- vim.keymap.set("n", "<space>fb", ":Telescope file_browser path=%:p:h select_buffer=true<CR>",
            --     { desc = "File Browser" })
            -- list keymaps
            vim.keymap.set('n', '<leader>hk', function()
                require('telescope.builtin').keymaps(require('telescope.themes').get_dropdown {
                    winblend = 10,
                    previewer = false,
                })
            end, { desc = 'List [K]eymaps' })
            -- leader , to search for open buffers
            vim.keymap.set('n', '<leader>,', function()
                require('telescope.builtin').buffers(require('telescope.themes').get_dropdown {
                    winblend = 10,
                    previewer = false,
                })
            end, { desc = 'List [O]pen Buffers' })
            -- colorschemes
            vim.keymap.set('n', '<leader>cs', function()
                require('telescope.builtin').colorscheme(require('telescope.themes').get_dropdown {
                    winblend = 10,
                    previewer = false,
                })
            end, { desc = 'List [C]olorschemes' })
            -- Define key mappings for WhichKey
            local wk = require("which-key")
            wk.register({
                ["<C-p>"] = { "<cmd>lua require('telescope').extensions.frecency.frecency(require('telescope.themes').get_dropdown { winblend = 10, previewer = true, })<CR>", "Search [F]iles" },
                ["<leader><leader>"] = { "<cmd>lua require('telescope').extensions.smart_open.smart_open { cwd_only = true, filename_first = false, }<CR>", "Smart [O]pen" },
                ["<leader>/"] = { "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown { winblend = 10, previewer = true, })<CR>", "[/] Fuzzily search in current buffer" },
                ["<leader>sp"] = { "<Cmd>Telescope projects<CR>", "[S]earch [P]rojects" },
                ["<C-S-p>"] = { "<cmd>lua require('telescope').extensions.cheatsheet.cheatsheet(require('telescope.themes').get_dropdown { winblend = 10, previewer = true, })<CR>", "Search [C]heatsheet" },
                ["<C-S-f>"] = { "<Cmd>Telescope live_grep<CR>", "Search [F]iles" },
                ["<leader>sb"] = { "<Cmd>Telescope buffers<CR>", "Search [B]uffers" },
                ["<leader>hk"] = { "<cmd>lua require('telescope.builtin').keymaps(require('telescope.themes').get_dropdown { winblend = 10, previewer = false, })<CR>", "List [K]eymaps" },
                ["<leader>,"] = { "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown { winblend = 10, previewer = false, })<CR>", "List [O]pen Buffers" },
                ["<leader>cs"] = { "<cmd>lua require('telescope.builtin').colorscheme(require('telescope.themes').get_dropdown { winblend = 10, previewer = false, })<CR>", "List [C]olorschemes" },
            }, { prefix = "" })

            -- extensions
            telescope.setup {
                defaults = {
                    mappings = {
                        i = {
                            -- ["<CR>"] = actions.file_edit,
                        },
                    },
                },
                vimgrep_arguments = {
                    "rg",
                    "-L",
                    "--color=never",
                    "--no-heading",
                    "--with-filename",
                    "--line-number",
                    "--column",
                    "--smart-case",
                },

                file_sorter = sorters.get_fuzzy_file,
                file_ignore_patterns = { "node_modules", ".git", ".cache", ".venv", ".vscode", ".idea", ".DS_Store", ".next" },
                generic_sorter = sorters.get_generic_fuzzy_sorter,
                extensions = {
                    file_browser = {
                        -- theme = "ivy",
                        -- disables netrw and use telescope-file-browser in its place
                        -- hijack_netrw = true,
                    },
                    fzf = {
                        fuzzy = true,
                        override_generic_sorter = true,
                        override_file_sorter = true,
                        case_mode = "smart_case",
                    },
                    -- ["ui-select"] = {
                    --     require("telescope.themes").get_dropdown {
                    --     }
                    -- },
                    frecency = {
                        default_workspace = "CWD",
                        db_safe_mode = false,
                        ignore_patterns = {
                            "*.git/*",
                            "*/tmp/*",
                            "*/node_modules/*",
                            "*/lua-language-server/*",
                        },
                    },
                },
                -- borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
                color_devicons = true,
                set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
                file_previewer = previewers.vim_buffer_cat.new,
                grep_previewer = previewers.vim_buffer_vimgrep.new,
                qflist_previewer = previewers.vim_buffer_qflist.new,
                -- Developer configurations: Not meant for general override
                buffer_previewer_maker = previewers.buffer_previewer_maker,
                mappings = {
                    n = { ["q"] = actions.close },
                },
            }
            -- To get telescope-file-browser loaded and working with telescope,
            -- you need to call load_extension, somewhere after setup function:
            telescope.load_extension("file_browser")
            telescope.load_extension("frecency")
            telescope.load_extension("fzf")
            -- telescope.load_extension("ui-select")
            telescope.load_extension("notify")
            telescope.load_extension("project")
            telescope.load_extension("smart_open")
        end,
    },
}

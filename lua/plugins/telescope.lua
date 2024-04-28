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
            "rcarriga/nvim-notify"
        },
        config = function(_, opts)
            local telescope = require("telescope")
            local actions = require("telescope.actions")
            local previewers = require("telescope.previewers")
            local sorters = require("telescope.sorters")

            -- Keymaps
            vim.keymap.set('n', '<C-p>', function() require('telescope.builtin').find_files() end,
                { desc = 'Search Files [P]opup' })
            vim.keymap.set('n', '<leader>/', function()
                require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
                    winblend = 10,
                    previewer = false,
                })
            end, { desc = '[/] Fuzzily search in current buffer' })
            vim.keymap.set('n', '<leader>sp', '<Cmd>Telescope projects<CR>', { desc = '[S]earch [P]rojects' })
            vim.keymap.set('n', '<C-S-p>', '<Cmd>Telescope commands<CR>', { desc = 'Search [C]ommands' })
            vim.keymap.set('n', '<C-S-f>', '<Cmd>Telescope live_grep<CR>', { desc = 'Search [F]iles' })
            vim.keymap.set('n', '<leader>sb', '<Cmd>Telescope buffers<CR>', { desc = 'Search [B]uffers' })
            vim.keymap.set('n', '<C-p>', '<Cmd>Telescope find_files<CR>', { desc = 'Search Files' })
            vim.keymap.set('n', '<leader>/', function()
                require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
                    winblend = 10,
                    previewer = false,
                })
            end, { desc = '[/] Fuzzily search in current buffer' })
            -- open file_browser with the path of the current buffer
            vim.keymap.set("n", "<space>fb", ":Telescope file_browser path=%:p:h select_buffer=true<CR>",
                { desc = "File Browser" })
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

            -- extensions
            telescope.setup {
                defaults = {
                    mappings = {
                        i = {
                            ["<CR>"] = actions.file_edit,
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
                prompt_prefix = "   ",
                selection_caret = "  ",
                entry_prefix = "  ",
                initial_mode = "insert",
                selection_strategy = "reset",
                sorting_strategy = "ascending",
                layout_strategy = "horizontal",
                layout_config = {
                    horizontal = {
                        prompt_position = "top",
                        -- preview_width = 0.55,
                        -- results_width = 0.8,
                    },
                    vertical = {
                        mirror = false,
                    },
                    -- width = 0.87,
                    -- height = 0.80,
                    -- preview_cutoff = 120,
                    prompt_position = "top",
                },
                pickers = {
                    find_files = {
                        -- path_display = formattedName,
                        layout_config = {
                            -- height = 0.4,
                            prompt_position = "top",
                            -- preview_cutoff = 120,
                        },
                    },
                    git_files = {
                        -- path_display = formattedName,
                        layout_config = {
                            -- height = 0.4,
                            prompt_position = "top",
                            -- preview_cutoff = 120,
                        },
                    },
                    buffers = {
                        mappings = {
                            i = {
                                ["<c-d>"] = actions.delete_buffer,
                            },
                            n = {
                                ["<c-d>"] = actions.delete_buffer,
                            },
                        },
                        initial_mode = "normal",
                        -- theme = "dropdown",
                        layout_config = {
                            -- height = 0.4,
                            -- width = 0.6,
                            prompt_position = "top",
                            -- preview_cutoff = 120,
                        },
                    },
                    current_buffer_fuzzy_find = {
                        previewer = true,
                        layout_config = {
                            prompt_position = "top",
                            -- preview_cutoff = 120,
                        },
                    },
                    live_grep = {
                        only_sort_text = true,
                        previewer = true,
                    },
                    grep_string = {
                        only_sort_text = true,
                        previewer = true,
                    },
                    lsp_references = {
                        show_line = false,
                        previewer = true,
                    },
                    treesitter = {
                        show_line = false,
                        previewer = true,
                    },
                    colorscheme = {
                        enable_preview = true,
                    },
                },
                file_sorter = sorters.get_fuzzy_file,
                file_ignore_patterns = { "node_modules" },
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
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown {
                        }
                    },
                    frecency = {
                        default_workspace = "CWD",
                        db_safe_mode = false,
                        ignore_patterns = {
                            "*.git/*",
                            "*/tmp/*",
                            "*/lua-language-server/*",
                        },
                    },
                },
                path_display = { "truncate" },
                winblend = 0,
                border = {},
                borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
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
            telescope.load_extension("ui-select")
            telescope.load_extension("notify")
            telescope.load_extension("project")
        end,
    },
}

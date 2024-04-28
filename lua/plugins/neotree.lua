return {
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        lazy = false,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            --         *:NvimTreeToggle*

            -- Open or close the tree. See |nvim-tree-api.tree.toggle()|

            -- Calls: `api.tree.toggle({ path = "<args>", find_file = false, update_root = false, focus = true, })`
            -- ctrl + e to toggle
            vim.keymap.set("n", "<C-e>", ":NvimTreeToggle<CR>",
                { noremap = true, silent = true, desc = "Toggle NvimTree" })
            -- leader + e to toggle
            vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>",
                { noremap = true, silent = true, desc = "Toggle NvimTree" })
            -- focus on the tree
            vim.keymap.set("n", "<leader>1", ":NvimTreeFocus<CR>",
                { noremap = true, silent = true, desc = "Focus NvimTree" })

            require("nvim-tree").setup({
                filters = {
                    dotfiles = false,
                },
                disable_netrw = true,
                hijack_netrw = true,
                hijack_cursor = true,
                hijack_unnamed_buffer_when_opening = false,
                sync_root_with_cwd = true,
                update_focused_file = {
                    enable = true,
                    update_root = false,
                },
                view = {
                    adaptive_size = true,
                    side = "right",
                    width = 30,
                    preserve_window_proportions = true,
                },
                git = {
                    enable = true,
                    ignore = true,
                },
                filesystem_watchers = {
                    enable = true,
                },
                actions = {
                    open_file = {
                        resize_window = true,
                    },
                },
                renderer = {
                    root_folder_label = false,
                    highlight_git = true,
                    highlight_opened_files = "none",

                    indent_markers = {
                        enable = true,
                    },

                    icons = {
                        show = {
                            file = true,
                            folder = true,
                            folder_arrow = true,
                            git = true,
                        },

                        glyphs = {
                            default = "󰈚",
                            symlink = "",
                            folder = {
                                default = "",
                                empty = "",
                                empty_open = "",
                                open = "",
                                symlink = "",
                                symlink_open = "",
                                arrow_open = "",
                                arrow_closed = "",
                            },
                            git = {
                                unstaged = "✗",
                                staged = "✓",
                                unmerged = "",
                                renamed = "➜",
                                untracked = "★",
                                deleted = "",
                                ignored = "◌",
                            },
                        },
                    },
                },
            })
        end,
    }
}
-- return {
--     {
--         "nvim-neo-tree/neo-tree.nvim",
--         branch = "v3.x",
--         dependencies = {
--             "nvim-lua/plenary.nvim",
--             "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
--             "MunifTanjim/nui.nvim",
--             "3rd/image.nvim",              -- Optional image support in preview window: See `# Preview Mode` for more information
--         },
--         opts = {},
--         config = function()
--             vim.keymap.set('n', '<leader>be', ':Neotree<CR>',
--                 { noremap = true, silent = true, desc = 'Buffer Explorer' })
--             vim.keymap.set('n', '<leader>e', ':Neotree toggle<CR>',
--                 { noremap = true, silent = true, desc = 'Explorer NeoTree (Root Dir)' })
--             vim.keymap.set('n', '<leader>E', ':cd %:p:h | Neotree<CR>',
--                 { noremap = true, silent = true, desc = 'Explorer NeoTree (cwd)' })
--             vim.keymap.set('n', '<leader>fe', ':Neotree<CR>',
--                 { noremap = true, silent = true, desc = 'Explorer NeoTree (Root Dir)' })
--             vim.keymap.set('n', '<leader>fE', ':cd %:p:h | Neotree<CR>',
--                 { noremap = true, silent = true, desc = 'Explorer NeoTree (cwd)' })
--             vim.keymap.set('n', '<leader>ge', ':NeoTreeGit<CR>', { noremap = true, silent = true, desc = 'Git Explorer' })

--             require("neo-tree").setup({
--                 close_if_last_window = true,
--                 popup_border_style = "single",
--                 enable_git_status = true,
--                 enable_modified_markers = true,
--                 enable_diagnostics = true,
--                 sort_case_insensitive = true,
--                 filesystem = {
--                     follow_current_file = {
--                         enabled = true,
--                     },
--                     filtered_items = {
--                         hide_dotfiles = false,
--                         hide_gitignored = false,
--                         hide_by_name = {
--                             "node_modules",
--                         },
--                         never_show = {
--                             ".DS_Store",
--                             "thumbs.db",
--                         },
--                     },
--                     use_libuv_file_watcher = true, -- Set to true to enable automatic refresh
--                 },
--                 window = {
--                     position = "float",
--                 },
--                 event_handlers = {
--                     {
--                         event = "neo_tree_window_after_open",
--                         handler = function(args)
--                             if args.position == "left" or args.position == "right" then
--                                 vim.cmd("wincmd =")
--                             end
--                             vim.cmd("wincmd p") -- Focus the neo-tree window
--                         end,
--                     },
--                     {
--                         event = "neo_tree_window_after_close",
--                         handler = function(args)
--                             if args.position == "left" or args.position == "right" then
--                                 vim.cmd("wincmd =")
--                             end
--                         end,
--                     },
--                 },

--             })
--             -- require("neo-tree").paste_default_config()
--         end
--     }
-- }

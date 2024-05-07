-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
-- vim.api.nvim_create_autocmd('TextYankPost', {
--     desc = 'Highlight when yanking (copying) text',
--     group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
--     callback = function()
--         vim.highlight.on_yank()
--     end,
-- })
vim.api.nvim_create_autocmd('BufEnter', {
    desc = 'run the "Outline" when the buffer is opened autocmd',
    group = vim.api.nvim_create_augroup('kickstart-outline', { clear = true }),
    pattern = '*',
    callback = function()
        local excluded_buffers = {
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
            "alfa",
            ""
        }
        local current_buffer = vim.fn.expand('%:t')
        -- notify current buffer name
        print(current_buffer)
        if not vim.tbl_contains(excluded_buffers, current_buffer) then
            vim.cmd('OutlineOpen')
        end
    end,
})

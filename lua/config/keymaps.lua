-- Helper function for setting keymaps
local function Map(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.keymap.set(mode, lhs, rhs, options)
end

-- Diagnostic keymaps
Map('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
Map('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })


-- Window navigation using CTRL+<hjkl>
-- Map('n', '<C-h>', '<C-w>h', { desc = 'Move focus to the left window' })
Map('n', '<C-j>', '<C-w>j', { desc = 'Move focus to the lower window' })
Map('n', '<C-k>', '<C-w>k', { desc = 'Move focus to the upper window' })
-- Map('n', '<C-l>', '<C-w>l', { desc = 'Move focus to the right window' })

-- Buffer navigation
Map('n', '<leader>h', '<C-w>h', { desc = 'Move focus to the left window' })
Map('n', '<leader>j', '<C-w>j', { desc = 'Move focus to the lower window' })
Map('n', '<leader>k', '<C-w>k', { desc = 'Move focus to the upper window' })
Map('n', '<leader>l', '<C-w>l', { desc = 'Move focus to the right window' })

-- ctrl hjkl for bufferline
Map('n', '<C-h>', '<cmd>BufferLineCyclePrev<CR>', { desc = 'Move to previous buffer' })
Map('n', '<C-l>', '<cmd>BufferLineCycleNext<CR>', { desc = 'Move to next buffer' })

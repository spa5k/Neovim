-- Helper function for setting WhichKey keymaps
local function WhichKeyMap(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Diagnostic keymaps
WhichKeyMap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', { desc = 'Go to previous diagnostic message' })
WhichKeyMap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', { desc = 'Go to next diagnostic message' })

-- Window navigation using CTRL+<hjkl>
WhichKeyMap('n', '<C-h>', '<C-w>h', { desc = 'Move focus to the left window' })
WhichKeyMap('n', '<C-j>', '<C-w>j', { desc = 'Move focus to the lower window' })
WhichKeyMap('n', '<C-k>', '<C-w>k', { desc = 'Move focus to the upper window' })
WhichKeyMap('n', '<C-l>', '<C-w>l', { desc = 'Move focus to the right window' })

-- Buffer navigation
WhichKeyMap('n', '<leader>h', '<C-w>h', { desc = 'Move focus to the left window' })
WhichKeyMap('n', '<leader>j', '<C-w>j', { desc = 'Move focus to the lower window' })
WhichKeyMap('n', '<leader>k', '<C-w>k', { desc = 'Move focus to the upper window' })
WhichKeyMap('n', '<leader>l', '<C-w>l', { desc = 'Move focus to the right window' })

-- ctrl hjkl for moving between buffers
WhichKeyMap('n', '<C-h>', ':bprevious<CR>', { desc = 'Move to previous buffer' })
WhichKeyMap('n', '<C-l>', ':bnext<CR>', { desc = 'Move to next buffer' })

-- Close buffer
WhichKeyMap('n', '<leader>qq', ':bd<CR>', { desc = 'Close buffer' })

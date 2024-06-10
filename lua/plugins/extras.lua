return {
  { "wakatime/vim-wakatime", lazy = false },
  {
    "NStefan002/screenkey.nvim",
    cmd = "Screenkey",
    version = "*",
    config = true,
  },
  -- editor config support
  {
    "editorconfig/editorconfig-vim",
  },
  {
    "fedepujol/move.nvim",
    opts = {},
    keys = function()
      local keys = {
        -- Normal-mode commands
        { "<A-j>", ":MoveLine(1)<CR>", desc = "Move line down" },
        { "<A-k>", ":MoveLine(-1)<CR>", desc = "Move line up" },
        { "<A-h>", ":MoveHChar(-1)<CR>", desc = "Move character left" },
        { "<A-l>", ":MoveHChar(1)<CR>", desc = "Move character right" },
        { "<leader>wf", ":MoveWord(1)<CR>", desc = "Move word forward" },
        { "<leader>wb", ":MoveWord(-1)<CR>", desc = "Move word backward" },

        -- Visual-mode commands
        { "v", "<A-j>", ":MoveBlock(1)<CR>", desc = "Move block down" },
        { "v", "<A-k>", ":MoveBlock(-1)<CR>", desc = "Move block up" },
        { "v", "<A-h>", ":MoveHBlock(-1)<CR>", desc = "Move block left" },
        { "v", "<A-l>", ":MoveHBlock(1)<CR>", desc = "Move block right" },

        -- also make them work with arrow keys
        { "<A-Down>", ":MoveLine(1)<CR>", desc = "Move line down" },
        { "<A-Up>", ":MoveLine(-1)<CR>", desc = "Move line up" },
        { "<A-Left>", ":MoveHChar(-1)<CR>", desc = "Move character left" },
        { "<A-Right>", ":MoveHChar(1)<CR>", desc = "Move character right" },
        { "v", "<A-Down>", ":MoveBlock(1)<CR>", desc = "Move block down" },
        { "v", "<A-Up>", ":MoveBlock(-1)<CR>", desc = "Move block up" },
        { "v", "<A-Left>", ":MoveHBlock(-1)<CR>", desc = "Move block left" },
        { "v", "<A-Right>", ":MoveHBlock(1)<CR>", desc = "Move block right" },
      }
      return keys
    end,
  },
  { "wakatime/vim-wakatime", lazy = false },
}


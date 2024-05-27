return {
  {
    "vague2k/huez.nvim",
    import = "huez-manager.import",
    config = function()
      require("huez").setup({})
    end,
  },
  -- colorschemes area
  -- add gruvbox
  { "ellisonleao/gruvbox.nvim" },
  -- add kanagawa
  { "rebelot/kanagawa.nvim" },
  -- add tokyonight
  { "folke/tokyonight.nvim" },
  -- add habamax
  { "ntk148v/habamax.nvim",       dependencies = { "rktjmp/lush.nvim" } },
  -- add everforest
  { "sainnhe/everforest" },
  -- add nord
  { "shaunsingh/nord.nvim" },
  -- add onedark
  { "navarasu/onedark.nvim" },
  -- add sonokai
  { "sainnhe/sonokai" },
  -- add material
  { "marko-cerovac/material.nvim" },
  -- add catppuccino
  { "Pocco81/Catppuccino.nvim" },
  -- add iceberg
  { "cocopon/iceberg.vim" },
  -- add gruvbox-material
  { "sainnhe/gruvbox-material" },
  -- add rose-pine
  { "rose-pine/neovim",           name = "rose-pine" },
  -- add miasma
  { "xero/miasma.nvim" },


  { 'akinsho/bufferline.nvim',    version = "*",                        dependencies = 'nvim-tree/nvim-web-devicons' },
  {
    "hedyhli/outline.nvim",
    config = function()
      -- Example mapping to toggle outline
      vim.keymap.set("n", "<leader>o", "<cmd>Outline<CR>",
        { desc = "Toggle Outline" })

      local wk = require("which-key")

      wk.register({
        ["<leader>o"] = { "<cmd>Outline<CR>", "Toggle Outline" },
      }, { prefix = "" })

      require("outline").setup {
        -- Your setup opts here (leave empty to use defaults)
      }
    end,
  },
  {
    "wildfunctions/myeyeshurt",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {}
  },
  {
    'Bekaboo/dropbar.nvim',
    -- optional, but required for fuzzy finder support
    dependencies = {
      { 'nvim-telescope/telescope-fzf-native.nvim' }
    }
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {
      scope = { enabled = false },
    }
  }
}

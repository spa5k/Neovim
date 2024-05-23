return {
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
  {
    "JManch/sunset.nvim",
    lazy = false,
    priority = 1000,
    dependencies = {
      -- notify
      { "rcarriga/nvim-notify" },
    },
    config = function()
      require("sunset").setup({
        latitude = 25.84,  -- north is positive, south is negative
        longitude = 80.89, -- east is positive, west is negative
        day_callback = function()
          require("notify")("It's day time", "info")
          vim.cmd("colorscheme kanagawa")
        end, -- function that is called when day begins
        night_callback = function()
          require("notify")("It's night time", "info")
          vim.cmd("colorscheme kanagawa")
        end,
        update_interval = 60000, -- how frequently to check for sunrise/sunset changes in milliseconds
        time_format = "%H:%M",   -- sun time formatting using os.date https://www.lua.org/pil/22.1.html
      })
    end,
  },
  {
    "stevearc/dressing.nvim",
    lazy = true,
    opts = {},
  },
  { 'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons' },
  -- {
  --   'Theyashsawarkar/bufferline.nvim',
  --   dependencies = 'nvim-tree/nvim-web-devicons',
  --   config = function()
  --     require("bufferline").setup {
  --     }
  --   end
  -- },
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

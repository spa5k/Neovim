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
          vim.cmd("colorscheme miasma")
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

  {
    'Theyashsawarkar/bufferline.nvim',
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      require("bufferline").setup {
      }
    end
  },
  {
    "utilyre/barbecue.nvim",
    name = "barbecue",
    version = "*",
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons", -- optional dependency
    },
    opts = {
      -- configurations go here
    },
    config = function()
      require("barbecue").setup({
        create_autocmd = false, -- prevent barbecue from updating itself automatically
      })

      vim.api.nvim_create_autocmd({
        "WinScrolled", -- or WinResized on NVIM-v0.9 and higher
        "BufWinEnter",
        "CursorHold",
        "InsertLeave",
        "WinResized"
      }, {
        group = vim.api.nvim_create_augroup("barbecue.updater", {}),
        callback = function()
          require("barbecue.ui").update()
        end,
      })
    end,
  },
  {
    'CosmicNvim/cosmic-ui',
    requires = { 'MunifTanjim/nui.nvim', 'nvim-lua/plenary.nvim' },
    config = function()
      require('cosmic-ui').setup()
    end,
  }
}

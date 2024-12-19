-- Colorschemes

return {
  -- {
  --   "folke/tokyonight.nvim",
  --   lazy = true,
  --   opts = { style = "moon" },
  -- },

  -- {
  --   "rose-pine/neovim",
  --   name = "rose-pine",
  --   config = function()
  --     -- vim.cmd("colorscheme rose-pine")
  --     -- vim.cmd("colorscheme rose-pine-main")
  --     vim.cmd("colorscheme rose-pine-moon")
  --     -- vim.cmd("colorscheme rose-pine-dawn")
  --   end,
  -- },

  {
    "sainnhe/everforest",
    lazy = false,
    priority = 1000,
    config = function()
      -- Optionally configure and load the colorscheme
      -- directly inside the plugin declaration.
      vim.g.everforest_enable_italic = true
      vim.cmd.colorscheme("everforest")
    end,
  },
}

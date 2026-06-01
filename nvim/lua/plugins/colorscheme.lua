return {
  {
    'ellisonleao/gruvbox.nvim',
    priority = 1000,
    lazy = false,
    config = function()
      vim.cmd.colorscheme 'gruvbox'
    end,
  },
  {
    "j-hui/fidget.nvim",
    opts = {},
  },
  {
    "catgoose/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup({
        "*",
        user_default_options = {
          RGB = true,
          RRGGBB = true,
          names = true,
          RRGGBBAA = true,
          AARRGGBB = false,
          rgb_fn = true,
          hsl_fn = true,
          css = true,
          css_fn = true,
        },
      })
    end,
  }
}

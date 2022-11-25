local config = {
  options = {
    opt = {
      wrap = true, -- wrap long lines
    },
  },
  colorscheme = "catppuccin",
  plugins = {
    init = {
      {
        "catppuccin/nvim",
        as = "catppuccin",
        config = function()
          require("catppuccin").setup({
            flavour = "macchiato"
          })
        end,
      }
    }
  }
}

return config
